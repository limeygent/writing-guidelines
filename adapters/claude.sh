#!/usr/bin/env bash
#
# claude.sh — model adapter for Claude Code (headless).
#
# CONTRACT (identical for every adapter):
#   claude.sh <prompt_file> <context_file> <output_file>
#   Run the model with (prompt_file + context_file) as input, write result to output_file.
#
# This is the ONLY Claude-specific file in the writing system. To drive the same
# loop with another model, copy this file and change the one invocation line.
# Verify the CLI flags against your installed `claude` version before relying on it.

set -eu
PROMPT="$1"; CTX="$2"; OUT="$3"

{ cat "$PROMPT"; printf '\n\n'; cat "$CTX"; } | claude -p --output-format text > "$OUT"
