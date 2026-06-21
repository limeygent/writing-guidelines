#!/usr/bin/env bash
#
# log-lesson.sh — append one pending lesson to lessons.yaml.
#
# The cheap capture end of the learning loop. Safe to run any time: it only
# appends, never edits existing entries. consolidate.sh later folds pending
# lessons into the constitution.
#
# USAGE (flags or interactive):
#   bash log-lesson.sh \
#     --rule "Ban X" \
#     --why "one phrase" \
#     [--section banned-patterns] [--project global] \
#     [--example "bad -> good"] [--source "user correction"]
#
# Section hints: banned-patterns | voice | structure | format-tables |
#   format-lists | format-faqs | ymyl | accessibility | intent | scope

set -u
HERE="$(cd "$(dirname "$0")" && pwd)"
LESSONS="$HERE/lessons.yaml"

RULE="" ; WHY="" ; SECTION="banned-patterns" ; PROJECT="global" ; EXAMPLE="" ; SOURCE="user correction"
while [ $# -gt 0 ]; do
  case "$1" in
    --rule) RULE="$2"; shift 2 ;;
    --why) WHY="$2"; shift 2 ;;
    --section) SECTION="$2"; shift 2 ;;
    --project) PROJECT="$2"; shift 2 ;;
    --example) EXAMPLE="$2"; shift 2 ;;
    --source) SOURCE="$2"; shift 2 ;;
    *) echo "unknown arg: $1" >&2; exit 2 ;;
  esac
done

if [ -z "$RULE" ] || [ -z "$WHY" ]; then
  echo "usage: bash log-lesson.sh --rule \"...\" --why \"...\" [--section ..] [--project ..] [--example ..] [--source ..]" >&2
  exit 2
fi

# Date-prefixed slug from the rule text. No Date.now() reliance: use `date`.
DAY="$(date +%Y-%m-%d)"
SLUG="$(printf '%s' "$RULE" | tr '[:upper:]' '[:lower:]' | tr -cs 'a-z0-9' '-' | sed 's/^-//;s/-$//' | cut -c1-40)"
ID="$DAY-$SLUG"

esc() { printf '%s' "$1" | sed 's/"/\\"/g'; }

{
  echo "  - id: $ID"
  echo "    project: $(esc "$PROJECT")"
  echo "    rule: \"$(esc "$RULE")\""
  echo "    why: \"$(esc "$WHY")\""
  echo "    section: $SECTION"
  [ -n "$EXAMPLE" ] && echo "    example: \"$(esc "$EXAMPLE")\""
  echo "    status: pending"
  echo "    source: \"$(esc "$SOURCE")\""
} >> "$LESSONS"

echo "[log-lesson] appended $ID (status: pending). Run consolidate.sh to fold it in."
