#!/usr/bin/env bash
#
# codex.sh — model adapter for the OpenAI Codex CLI.
#
# CONTRACT (identical for every adapter):
#   codex.sh <prompt_file> <context_file> <output_file>
#   Run the model with (prompt_file + context_file) as input, write result to output_file.
#
# Proof that the writing system is model-agnostic: this adapter and adapters/claude.sh
# are interchangeable behind quality-loop.sh. Only this invocation line differs.
# `codex exec` reads the instruction from stdin; --skip-git-repo-check avoids the
# home-rooted-repo hang. Verify flags against your installed `codex` version.

set -eu
PROMPT="$1"; CTX="$2"; OUT="$3"

{ cat "$PROMPT"; printf '\n\n'; cat "$CTX"; } | codex exec --skip-git-repo-check > "$OUT"
