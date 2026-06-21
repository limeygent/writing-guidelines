#!/usr/bin/env bash
#
# consolidate.sh — the learning loop's compaction step.
#
# Code does the deterministic parts (trigger, count, verify, commit the audit
# trail). The model does the reasoning part (where each lesson belongs, dedupe).
# Run it on demand, on a threshold (the gate can nudge), or on a schedule.
#
# Flow:
#   1. Count `status: pending` lessons. If zero, exit — nothing to do.
#   2. Hand CONSOLIDATE.md + lessons.yaml + the rules to an agentic model session
#      that can EDIT files in place (it folds lessons in, flips status to
#      incorporated). This needs file-editing tools, so it uses an agent CLI, not
#      the single-output adapter that quality-loop.sh uses.
#   3. Verify pending dropped. Commit the change as the immutable history.
#
# ENV:
#   AGENT_CMD   agentic CLI invoked as: $AGENT_CMD "<instruction>"  (default: claude -p)
#               It must be able to read/edit files under this directory.
#               For Codex: AGENT_CMD="codex exec --skip-git-repo-check"
#   NO_COMMIT   set to 1 to skip the git commit.
#
# USAGE:  bash consolidate.sh

set -u
HERE="$(cd "$(dirname "$0")" && pwd)"
cd "$HERE"
LESSONS="$HERE/lessons.yaml"
AGENT_CMD="${AGENT_CMD:-claude -p}"

pending_count() { grep -c 'status: pending' "$LESSONS" 2>/dev/null || echo 0; }

BEFORE="$(pending_count)"
if [ "$BEFORE" -eq 0 ]; then
  echo "[consolidate] no pending lessons; nothing to do."
  exit 0
fi
echo "[consolidate] $BEFORE pending lesson(s). Pending ids:"
grep -B0 -A0 'id:' "$LESSONS" >/dev/null 2>&1
awk '/- id:/{id=$0} /status: pending/{print "  " id}' "$LESSONS"

# Build the instruction: the task prompt + a pointer to the working files.
INSTRUCTION="$(cat "$HERE/CONSOLIDATE.md")

Work in this directory: $HERE
Read lessons.yaml, core-rules.md, content-audit.md, the format-*.md guides, and overlays/.
Edit files in place per the procedure above. Do not touch unrelated content."

echo "[consolidate] invoking: $AGENT_CMD"
# shellcheck disable=SC2086
$AGENT_CMD "$INSTRUCTION"

AFTER="$(pending_count)"
echo "[consolidate] pending: $BEFORE -> $AFTER"

if [ "$AFTER" -ge "$BEFORE" ]; then
  echo "[consolidate] WARNING: pending count did not drop. Review the agent output before committing." >&2
  exit 1
fi

# Commit the result as the audit trail (code owns the history).
if [ "${NO_COMMIT:-0}" != "1" ] && command -v git >/dev/null 2>&1 && git -C "$HERE" rev-parse >/dev/null 2>&1; then
  git -C "$HERE" add -A
  git -C "$HERE" commit -q -m "consolidate: folded $((BEFORE - AFTER)) lesson(s) into the constitution" \
    && echo "[consolidate] committed." || echo "[consolidate] nothing to commit."
fi
