#!/usr/bin/env bash
#
# quality-gate.sh — the CODED decision path. Contains zero reasoning.
#
# Given a draft plus the LLM audit's numeric verdict, it decides PASS / REVISE /
# REWRITE by combining two signals against fixed thresholds:
#   1. Deterministic writing-tell violations  (from audit.sh — code)
#   2. The subjective audit score + critical count (from the LLM audit stage)
#
# The LLM judges; this script decides. The loop branches on the exit code.
# Thresholds mirror content-audit.md (>=88 publish, 66-87 minor fixes, <66 rewrite).
#
# USAGE:
#   bash quality-gate.sh <draft_file> [audit_json]
#     draft_file : the markdown/HTML draft to gate
#     audit_json : optional JSON from the LLM audit stage with fields:
#                    .score          number 0-110  (content-audit.md total)
#                    .critical_count number        (count of CRITICAL findings)
#                  If omitted, the gate gives a deterministic-only verdict.
#
# OUTPUT (stdout): one JSON line — {decision, reason, hard_violations, score, critical_count}
# EXIT CODES:  0 = PASS   10 = REVISE   20 = REWRITE   2 = usage error
#   (distinct codes so a loop can branch with a case statement, no parsing needed)

set -u
HERE="$(cd "$(dirname "$0")" && pwd)"

DRAFT="${1:-}"
AUDIT_JSON="${2:-}"
if [ -z "$DRAFT" ] || [ ! -f "$DRAFT" ]; then
  echo '{"decision":"ERROR","reason":"draft file not found"}'
  echo "usage: bash quality-gate.sh <draft_file> [audit_json]" >&2
  exit 2
fi

# --- Signal 1: deterministic tells (code) ---
HARD=$(bash "$HERE/audit.sh" --json "$DRAFT" 2>/dev/null | sed -n 's/.*"hard_violations":\([0-9]*\).*/\1/p')
[ -z "$HARD" ] && HARD=0

# --- Signal 2: subjective audit verdict (from the LLM stage, optional) ---
SCORE="null"
CRIT="null"
if [ -n "$AUDIT_JSON" ] && [ -f "$AUDIT_JSON" ]; then
  if command -v jq >/dev/null 2>&1; then
    SCORE=$(jq -r '.score // "null"' "$AUDIT_JSON" 2>/dev/null)
    CRIT=$(jq -r '.critical_count // "null"' "$AUDIT_JSON" 2>/dev/null)
  else
    SCORE=$(sed -n 's/.*"score":[[:space:]]*\([0-9]*\).*/\1/p' "$AUDIT_JSON" | head -1)
    CRIT=$(sed -n 's/.*"critical_count":[[:space:]]*\([0-9]*\).*/\1/p' "$AUDIT_JSON" | head -1)
    [ -z "$SCORE" ] && SCORE="null"
    [ -z "$CRIT" ] && CRIT="null"
  fi
fi

emit() { # emit <decision> <reason> <exit_code>
  printf '{"decision":"%s","reason":"%s","hard_violations":%s,"score":%s,"critical_count":%s}\n' \
    "$1" "$2" "$HARD" "$SCORE" "$CRIT"
  exit "$3"
}

# --- Decision path (pure thresholds, top-to-bottom; first match wins) ---

# 1. Any deterministic tell is a hard stop: cheap to fix, must be zero.
if [ "$HARD" -gt 0 ]; then
  emit "REVISE" "deterministic writing tells present ($HARD); fix before re-audit" 10
fi

# 2. No LLM audit supplied -> deterministic-only pass (loop should still run the audit).
if [ "$SCORE" = "null" ]; then
  emit "PASS_DETERMINISTIC_ONLY" "no LLM audit json supplied; deterministic checks clean" 0
fi

# 3. CRITICAL findings block publish regardless of score.
if [ "$CRIT" != "null" ] && [ "$CRIT" -gt 0 ]; then
  if [ "$SCORE" -lt 66 ]; then
    emit "REWRITE" "critical findings ($CRIT) and low score ($SCORE)" 20
  fi
  emit "REVISE" "critical findings present ($CRIT)" 10
fi

# 4. Score thresholds (content-audit.md).
if [ "$SCORE" -ge 88 ]; then
  emit "PASS" "score $SCORE >= 88 and no critical findings or tells" 0
elif [ "$SCORE" -ge 66 ]; then
  emit "REVISE" "score $SCORE in 66-87 minor-fix band" 10
else
  emit "REWRITE" "score $SCORE < 66" 20
fi
