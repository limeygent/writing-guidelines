#!/usr/bin/env bash
#
# audit.sh — portable, model-agnostic deterministic writing validator.
#
# WHY THIS IS A SCRIPT, NOT A PROMPT:
#   The deterministic half of the writing audit (banned phrases, em-dashes,
#   AI-tell vocabulary, link text, word/section budgets) must run identically
#   no matter which model or harness produced the draft — Claude Code, Codex,
#   Cursor, a CI job. A shell script is the portable closed loop. Each harness
#   wires its own trigger (Claude hook, git pre-commit, manual call); the CHECK
#   itself is code and therefore guaranteed and identical everywhere.
#
#   Subjective checks (does the opening answer the query? is scope disciplined?
#   does it demonstrate experience?) stay in content-audit.md for the model to
#   judge. This script covers ONLY what can be checked deterministically.
#
# USAGE:
#   bash audit.sh path/to/draft.md            # human-readable report
#   bash audit.sh --json path/to/draft.md     # machine-readable for agents
#   bash audit.sh path/to/draft.md || echo "FAILED"   # nonzero exit on hard violations
#
# EXIT CODES: 0 = clean, 1 = hard violations found, 2 = usage error.

set -u

JSON=0
if [ "${1:-}" = "--json" ]; then JSON=1; shift; fi
FILE="${1:-}"
if [ -z "$FILE" ] || [ ! -f "$FILE" ]; then
  echo "usage: bash audit.sh [--json] <file.md>" >&2
  exit 2
fi

# count_occurrences <regex> -> total matches across the file (case-insensitive)
count_occurrences() { grep -ioE "$1" "$FILE" 2>/dev/null | grep -c . ; }

VIOLATIONS=0
REPORT=""
add() { # add <severity> <label> <count>
  local sev="$1" label="$2" n="$3"
  if [ "$n" -gt 0 ]; then
    REPORT="${REPORT}  [${sev}] ${label}: ${n}\n"
    if [ "$sev" = "HARD" ]; then VIOLATIONS=$((VIOLATIONS + n)); fi
  fi
}

# --- 1. Word count (budget guidance, soft) ---
WORDS=$(wc -w < "$FILE" | tr -d ' ')

# --- 2. Em / en dashes (HARD — top AI tell) ---
DASHES=$(grep -oE '—|–' "$FILE" 2>/dev/null | grep -c .)
add HARD "Em/en dashes (use comma, colon, period, parens)" "$DASHES"

# --- 3. Banned stock / filler phrases (HARD) ---
STOCK='important to note|worth noting|as you may know|it goes without saying|needless to say|in this article|in this guide|in this blog|let'\''s dive in|let'\''s delve|dive into|when it comes to|that being said|at the end of the day|in today'\''s (world|landscape|fast-paced)|first and foremost|last but not least|in conclusion|to sum up|rest assured'
add HARD "Stock/filler phrases" "$(count_occurrences "$STOCK")"

# --- 4. Empathy fluff (HARD) ---
FLUFF='you'\''re not alone|don'\''t worry|we understand how|we know how (hard|difficult|stressful)|rest assured|peace of mind'
add HARD "Empathy fluff" "$(count_occurrences "$FLUFF")"

# --- 5. AI-tell vocabulary (HARD) ---
AIVOCAB='delve|tapestry|testament to|navigating the|the realm of|in the realm|landscape of|ever-evolving|ever-changing|seamless(ly)?|robust|leverage|elevate your|unlock(ing)? (the|your)|boast(s|ing)?|nestled|bustling|vibrant|game-?changer|cutting-edge|state-of-the-art|unparalleled|unwavering|meticulous|plethora|myriad|underscore(s|d)?|paramount|pivotal|crucial to|a wide array of|whether you'\''re a'
add HARD "AI-tell vocabulary" "$(count_occurrences "$AIVOCAB")"

# --- 6. Contrastive negation ("not X, but Y" / "isn't X, it's Y") (HARD) ---
CONTRAST='\bit'\''?s not (just )?[a-z ]{2,30}, it'\''?s|isn'\''?t (just )?[a-z ]{2,30}, it'\''?s|not (just|only) [a-z ]{2,40} but (also )?'
add HARD "Contrastive negation pattern" "$(count_occurrences "$CONTRAST")"

# --- 7. Non-descriptive link text (HARD — WCAG 2.4.4 + lost anchor signal) ---
LINKTEXT='>(click here|read more|learn more|here|this|more|read on|find out more)<\/a>'
add HARD "Non-descriptive link text (>click here<, >learn more<)" "$(count_occurrences "$LINKTEXT")"

# --- 8. Public email address on a service site (HARD per project rule) ---
add HARD "mailto: link (no public email on service sites)" "$(count_occurrences 'mailto:')"

# --- 9. Vague attribution (HARD — name the source or drop the claim; core-rules 8.6) ---
VAGUEATTR='studies show|research suggests|experts (agree|say)|it'\''?s well known|it is well known|many believe|a common (target|recommendation|guideline|practice|starting)|commonly recommended'
add HARD "Vague attribution (name the source or cut it)" "$(count_occurrences "$VAGUEATTR")"

# --- 10. Performative honesty / narrator throat-clearing (HARD — core-rules 8.8) ---
PERFORMATIVE='the (part|truth|thing) (that )?most [a-z ]{2,30}(skip|skips|miss|misses)|most [a-z ]{2,20}advice (skips|stops|misses)|here ?(is|'\''?s) the (honest|hard|real) (truth|part|answer|framing|caveat|reality)|the honest (truth|answer|part|framing|caveat|reality)|what (most|nobody) [a-z ]{2,30}(won'\''t|don'\''t|doesn'\''t) tell'
add HARD "Performative honesty / narrator throat-clearing" "$(count_occurrences "$PERFORMATIVE")"

# --- 10b. Colon-splice subheadings (SOFT — AI heading tic; reword the H2/H3, not the H1 title) ---
COLONHEAD=$(grep -cE '^#{2,6} .+: .+' "$FILE" 2>/dev/null)
add SOFT "Colon-splice subheadings (## Topic: explainer) — AI heading tic, reword to a plain phrase or question" "$COLONHEAD"

# --- 10c. Editorializing / significance-inflation / disclaimer-pivot tells (HARD — core-rules 8.8/8.1) ---
EDITORIAL='deserves? (extra|special|particular|added) (weight|attention|mention|consideration|scrutiny|care)|none of this replaces|which lane (you'\''?re|you are) in|tells you which lane'
add HARD "Editorializing / significance-inflation / disclaimer-pivot" "$(count_occurrences "$EDITORIAL")"

# --- 11. Rule-of-three / triad commas (SOFT heuristic, model should review) ---
TRIAD='[a-z]+, [a-z]+, and [a-z]+'
add SOFT "Possible rule-of-three triads (review for cadence)" "$(count_occurrences "$TRIAD")"

# --- 12. Long bulleted/numbered lists (SOFT — >6 items per list is a smell) ---
BULLETS=$(grep -cE '^\s*([-*]|[0-9]+\.) ' "$FILE" 2>/dev/null)
add SOFT "Total list items (check no single list exceeds ~6)" "$BULLETS"

# ---------- OUTPUT ----------
if [ "$JSON" -eq 1 ]; then
  printf '{"file":"%s","words":%s,"hard_violations":%s}\n' "$FILE" "$WORDS" "$VIOLATIONS"
else
  echo "=== Writing audit: $FILE ==="
  echo "Words: $WORDS"
  if [ -n "$REPORT" ]; then
    echo "Findings:"
    printf "%b" "$REPORT"
  else
    echo "No deterministic violations found."
  fi
  echo "Hard violations: $VIOLATIONS"
  echo ""
  echo "NOTE: deterministic checks only. Still judge by hand (content-audit.md):"
  echo "  - opening answers the search query in the first sentence"
  echo "  - scope discipline (no drift beyond the intent)"
  echo "  - each concept explained once (DRY)"
  echo "  - claims honest (target vs measured; credential currency stated)"
  echo "  - experience shown via specificity, not fabricated personal claims"
fi

[ "$VIOLATIONS" -gt 0 ] && exit 1
exit 0
