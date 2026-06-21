#!/usr/bin/env bash
#
# resolve-client.sh — resolve which client a content task is for, and where its
# config lives. Read-only. The single source of truth both engines use (the
# Claude orchestrator and the portable quality-loop.sh).
#
# WHY: content gets written from many different folders, most with no project
# CLAUDE.md. This script answers "which client, and where are its files" from
# wherever it is called, so the writing brain + the right client overlay load
# automatically.
#
# USAGE:
#   resolve-client.sh [--client <slug>] [--cwd <dir>] [--json]
#     --client <slug>  explicit override (also accepted as a bare first arg)
#     --cwd <dir>      directory to resolve from (default: $PWD)
#     --json           emit JSON (default). Reserved for future human format.
#
# RESOLUTION PRECEDENCE (first hit wins):
#   1. explicit --client / positional slug
#   2. a .client marker file in --cwd or any ancestor up to $HOME
#   3. ~/.claude/config/client-index.json  [{path_prefix, slug}]  longest prefix wins
#   4. else status=ASK (never guess)
#
# OUTPUT: one JSON object (see emit_resolved). EXIT: 0 RESOLVED, 3 ASK, 2 usage.

set -u
HERE="$(cd "$(dirname "$0")" && pwd)"
HOME_DIR="${HOME:-/Users/$(id -un)}"

CONFIG_DIR="${CLAUDE_CONFIG_DIR:-$HOME_DIR/.claude/config}"
INDEX="$CONFIG_DIR/client-index.json"
CLIENTS_JSON="${CLIENTS_JSON:-$HOME_DIR/Desktop/codeprojects/writer-orchestrator/clients.json}"

CLIENT="" ; CWD="$PWD"
while [ $# -gt 0 ]; do
  case "$1" in
    --client) CLIENT="$2"; shift 2 ;;
    --cwd) CWD="$2"; shift 2 ;;
    --json) shift ;;
    -* ) echo "unknown flag: $1" >&2; exit 2 ;;
    * ) [ -z "$CLIENT" ] && CLIENT="$1"; shift ;;
  esac
done
# normalize CWD to an absolute path
CWD="$(cd "$CWD" 2>/dev/null && pwd || echo "$CWD")"

have() { command -v "$1" >/dev/null 2>&1; }

SLUG="$CLIENT" ; VIA="flag"

# 2. .client marker, walking up to $HOME
if [ -z "$SLUG" ]; then
  dir="$CWD"
  while : ; do
    if [ -f "$dir/.client" ]; then
      SLUG="$(head -1 "$dir/.client" | tr -d '[:space:]')"; VIA="marker"; break
    fi
    [ "$dir" = "/" ] && break
    [ "$dir" = "$HOME_DIR" ] && break
    dir="$(dirname "$dir")"
  done
fi

# 3. central path -> slug index, longest matching prefix
if [ -z "$SLUG" ] && [ -f "$INDEX" ] && have jq; then
  SLUG="$(jq -r --arg p "$CWD" \
    '[.[] | select(($p|startswith(.path_prefix)))] | sort_by(.path_prefix|length) | last | .slug // empty' \
    "$INDEX" 2>/dev/null)"
  [ -n "$SLUG" ] && VIA="index"
fi

# 4. ASK
if [ -z "$SLUG" ]; then
  echo '{"status":"ASK","reason":"no --client, no .client marker, no index match"}'
  exit 3
fi

CLIENT_DIR="$CONFIG_DIR/clients/$SLUG"
PROFILE="$CLIENT_DIR/profile.json"
BACKGROUND="$CLIENT_DIR/background.md"
TOPICS="$CLIENT_DIR/topics.md"
OVERLAY="$HERE/overlays/$SLUG.md"
CORE_RULES="$HERE/core-rules.md"

# publish target (optional; never fails resolution)
REGISTERED=false ; WP_URL="" ; SEO_FIELDS="{}"
if [ -f "$CLIENTS_JSON" ] && have jq; then
  if jq -e --arg s "$SLUG" 'has($s)' "$CLIENTS_JSON" >/dev/null 2>&1; then
    REGISTERED=true
    WP_URL="$(jq -r --arg s "$SLUG" '.[$s].wordpress.url // ""' "$CLIENTS_JSON" 2>/dev/null)"
    SEO_FIELDS="$(jq -c --arg s "$SLUG" '.[$s].seo_fields // {}' "$CLIENTS_JSON" 2>/dev/null)"
  fi
fi

if have jq; then
  jq -n \
    --arg slug "$SLUG" --arg via "$VIA" \
    --arg client_dir "$CLIENT_DIR" --arg profile "$PROFILE" --arg background "$BACKGROUND" \
    --arg topics "$TOPICS" --arg overlay "$OVERLAY" --arg core_rules "$CORE_RULES" \
    --arg registry "$CLIENTS_JSON" --argjson registered "$REGISTERED" \
    --arg wp_url "$WP_URL" --argjson seo_fields "$SEO_FIELDS" \
    '{status:"RESOLVED", slug:$slug, via:$via,
      paths:{client_dir:$client_dir, profile:$profile, background:$background,
             topics:$topics, overlay:$overlay, core_rules:$core_rules},
      publish:{registry:$registry, registered:$registered, wp_url:$wp_url, seo_fields:$seo_fields}}'
else
  # jq-less fallback: core paths only (no index/publish lookup above)
  printf '{"status":"RESOLVED","slug":"%s","via":"%s","paths":{"client_dir":"%s","profile":"%s","background":"%s","topics":"%s","overlay":"%s","core_rules":"%s"},"publish":{"registry":"%s","registered":false,"wp_url":"","seo_fields":{}}}\n' \
    "$SLUG" "$VIA" "$CLIENT_DIR" "$PROFILE" "$BACKGROUND" "$TOPICS" "$OVERLAY" "$CORE_RULES" "$CLIENTS_JSON"
fi
exit 0
