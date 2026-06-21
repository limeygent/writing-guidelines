#!/usr/bin/env bash
#
# quality-loop.sh — the model-agnostic, CODE-driven write -> validate -> revise loop.
#
# This is the control flow your principle calls for: the loop runs a post-write
# audit and keeps revising until the quality gate passes or an escalation cap is
# hit. All branching and looping is code. The model is reached ONLY through an
# adapter, so the same loop drives Claude, Codex, or any CLI by swapping $ADAPTER.
#
#   write ──▶ [structural validate] ──▶ LLM audit ──▶ quality-gate.sh ──▶ decision
#     ▲                                                                     │
#     └──────────── REVISE / REWRITE (LLM) ◀────────────────────────────────┘
#                          PASS ──▶ done    cap hit ──▶ ESCALATE (human)
#
# ADAPTER CONTRACT (the only model-specific seam):
#   "$ADAPTER" <prompt_file> <context_file> <output_file>
#   It must run the model with (prompt + context) and write the result to output.
#   See adapters/claude.sh and adapters/codex.sh.
#
# REQUIRED ENV / ARGS:
#   SCOPE      path to scope/brief (intent + fan-out); the writer's input
#   OUTDIR     working dir for this article (draft.md, audit.json land here)
#   ADAPTER    path to a model adapter script (default: adapters/claude.sh)
#   PROMPTS    dir holding writer.md, audit.md, revise.md (default: ./prompts-default)
#   RULES      path to the constitution (default: ./core-rules.md), passed to every stage
#   CLIENT     client slug; loads overlays/<slug>.md ONLY, and only when set (else global-only)
#   OVERLAY    explicit overlay path (overrides CLIENT)
#   MAX_ITERS  escalation cap (default: 3)
#
# USAGE:
#   SCOPE=out/topic/scope.md OUTDIR=out/topic bash quality-loop.sh
#
# EXIT: 0 = PASS,  30 = ESCALATED (cap hit without passing),  2 = usage error.

set -u
HERE="$(cd "$(dirname "$0")" && pwd)"

SCOPE="${SCOPE:-}"
OUTDIR="${OUTDIR:-}"
ADAPTER="${ADAPTER:-$HERE/adapters/claude.sh}"
PROMPTS="${PROMPTS:-$HERE/prompts-default}"
RULES="${RULES:-$HERE/core-rules.md}"
CLIENT="${CLIENT:-}"
OVERLAY="${OVERLAY:-}"
MAX_ITERS="${MAX_ITERS:-3}"

# Resolve the client overlay. core-rules.md always loads; an overlay loads ONLY
# when a client is named, and ONLY that client's file. No client = global rules only.
if [ -z "$OVERLAY" ] && [ -n "$CLIENT" ]; then OVERLAY="$HERE/overlays/$CLIENT.md"; fi

if [ -z "$SCOPE" ] || [ ! -f "$SCOPE" ] || [ -z "$OUTDIR" ]; then
  echo "usage: SCOPE=<scope.md> OUTDIR=<dir> [CLIENT=slug] [ADAPTER=..] [PROMPTS=..] [MAX_ITERS=..] bash quality-loop.sh" >&2
  exit 2
fi
if [ -n "$OVERLAY" ] && [ ! -f "$OVERLAY" ]; then
  echo "[quality-loop] WARNING: overlay '$OVERLAY' not found; writing with global rules only." >&2
  OVERLAY=""
fi
mkdir -p "$OUTDIR"
DRAFT="$OUTDIR/draft.md"
AUDIT="$OUTDIR/audit.json"
CTX="$OUTDIR/.context.tmp"

log() { echo "[quality-loop] $*" >&2; }

# Build the shared context every stage sees: the rules + the scope (+ extra files).
build_ctx() { # build_ctx <extra_file...>
  { echo "===== WRITING CONSTITUTION (core-rules.md) ====="; cat "$RULES";
    if [ -n "$OVERLAY" ] && [ -f "$OVERLAY" ]; then
      echo; echo "===== CLIENT OVERLAY ($(basename "$OVERLAY")) (overrides global on conflict) ====="; cat "$OVERLAY";
    fi
    echo; echo "===== SCOPE / INTENT / FAN-OUT ====="; cat "$SCOPE";
    for f in "$@"; do echo; echo "===== $(basename "$f") ====="; cat "$f"; done
  } > "$CTX"
}

# --- Stage 0: first draft from scope ---
log "writing first draft via $ADAPTER"
build_ctx
"$ADAPTER" "$PROMPTS/writer.md" "$CTX" "$DRAFT" || { log "writer adapter failed"; exit 1; }

iter=0
while :; do
  iter=$((iter + 1))
  log "iteration $iter / $MAX_ITERS"

  # --- Optional structural validation (orchestrator-style, deterministic) ---
  if [ -n "${STRUCT_VALIDATOR:-}" ] && [ -x "${STRUCT_VALIDATOR:-}" ]; then
    if ! "$STRUCT_VALIDATOR" writer "$DRAFT"; then
      log "structural validation failed; treating as REVISE"
    fi
  fi

  # --- LLM audit (reasoning): score + critical_count as JSON ---
  log "running LLM audit"
  build_ctx "$DRAFT"
  "$ADAPTER" "$PROMPTS/audit.md" "$CTX" "$AUDIT" || { log "audit adapter failed"; exit 1; }

  # --- Coded decision gate: deterministic tells + audit verdict -> decision ---
  GATE_OUT="$("$HERE/quality-gate.sh" "$DRAFT" "$AUDIT")"
  CODE=$?
  log "gate: $GATE_OUT"

  case "$CODE" in
    0)  log "PASS on iteration $iter"; rm -f "$CTX"; echo "$GATE_OUT"; exit 0 ;;
    10) DECISION="REVISE" ;;
    20) DECISION="REWRITE" ;;
    *)  log "gate error"; rm -f "$CTX"; exit 1 ;;
  esac

  if [ "$iter" -ge "$MAX_ITERS" ]; then
    log "ESCALATE: hit cap of $MAX_ITERS without passing"
    rm -f "$CTX"
    echo "{\"decision\":\"ESCALATED\",\"iterations\":$iter,\"last_gate\":$GATE_OUT}"
    exit 30
  fi

  if [ "$DECISION" = "REVISE" ]; then
    log "revising against audit findings"
    build_ctx "$DRAFT" "$AUDIT"
    "$ADAPTER" "$PROMPTS/revise.md" "$CTX" "$DRAFT" || { log "revise adapter failed"; exit 1; }
  else
    log "rewriting from scratch (score below revise band)"
    build_ctx "$AUDIT"
    "$ADAPTER" "$PROMPTS/writer.md" "$CTX" "$DRAFT" || { log "writer adapter failed"; exit 1; }
  fi
done
