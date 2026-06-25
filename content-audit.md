# Content Audit Checklist

**When:** Run after writer submits content, before publishing
**Purpose:** Automated quality gate to catch bloat and violations

---

## Audit Process

```
Writer submits content
        │
        ▼
┌─────────────────────┐
│  Run audit checks   │
│  (5-10 minutes)     │
└─────────────────────┘
        │
        ▼
┌─────────────────────┐
│  Calculate score    │
└─────────────────────┘
        │
        ├── Score ≥88 ──→ ✅ PUBLISH
        │
        ├── Score 66-87 ─→ ⚠️ MINOR FIXES (return with flag list)
        │
        └── Score <66 ───→ ❌ REWRITE (run tightening protocol)
```

---

## 1. Word Count Check (20 points)

Score against the band for the page **TYPE** (reconciled with core-rules.md Section 15; a comparison page
or a demand-preserving merge legitimately runs longer than a short how-to, and must NOT be auto-failed for it).

| Page type | Full (20) | Good (15) | Review (10) | Needs cuts (5) | Over band (0) |
|---|---|---|---|---|---|
| **Blog / how-to** | ≤1,300 | 1,300-1,600 | 1,600-1,900 | 1,900-2,100 | >2,100 |
| **Service / location** | ≤1,500 | 1,500-1,800 | 1,800-2,000 | 2,000-2,300 | >2,300 |
| **Comparison / merge** | ≤2,200 | 2,200-2,500 | 2,500-2,800 | 2,800-3,200 | >3,200 |
| **Emergency** | ≤750 | 750-900 | 900-1,050 | 1,050-1,250 | >1,250 |

**How to check:** `wc -w` on the **visible body only** (exclude the HTML comment header and the `<style>` block).

**If over the band:** earlier sections are bloated; trim them, do not truncate the end. For a merge, trimming
the commodity sections also raises the substitution-test ratio (core-rules Section 5.3), so it fixes two
findings at once. Never inject brand name-drops into commodity copy to pass the substitution test; cut instead.

---

## 2. DRY Compliance (30 points)

### Concept Repetition Check

Identify the page's 3-5 key concepts/entities (whatever this page is actually about), then count each. The
concept names are niche-specific; the thresholds are not.

```bash
# Each of the page's key concepts should appear in ≤2 distinct locations (not restated section to section)
grep -in "<concept-1>" content.md | wc -l
grep -in "<concept-2>" content.md | wc -l

# Provider mentions (brand / practitioner / "the clinic" etc.) should total ≤3 outside the opener and CTA
grep -ic "<brand>\|<practitioner>\|the (clinic|practice|team)" content.md
```

| Check | Threshold | Points |
|-------|-----------|--------|
| Each key concept ≤2 locations | Pass all | 15 |
| Provider mentions ≤3 (outside opener/CTA) | Pass | 10 |
| No phrase 3+ times | Pass | 5 |

**Scoring:**
- All checks pass: 30 points
- 1 violation: 20 points
- 2 violations: 10 points
- 3+ violations: 0 points

### Stock Phrase Detection

```bash
# These should return 0
grep -ic "important to note" content.md
grep -ic "worth noting" content.md
grep -ic "as you may know" content.md
grep -ic "it goes without saying" content.md

# These should return ≤1
grep -ic "keep in mind" content.md
grep -ic "safety first" content.md
```

Deduct 5 points for each violation.

---

## 3. Structure Check (20 points)

### Section Length

**Check each H2 section word count:**
```bash
# Manual check: No H2 section should exceed 300 words
```

| All sections ≤300 words | 10 points |
| One section 300-400 | 7 points |
| Multiple sections >300 | 3 points |
| Any section >500 | 0 points |

### List Length

**Check all lists:**
- Numbered/bulleted lists should have ≤6 items
- Lists >10 items = automatic fail for this section

| All lists ≤6 items | 5 points |
| One list 7-10 items | 3 points |
| Any list >10 items | 0 points |

### Table/Prose Duplication

**Manual check:**
- Read prose before/after each table
- Prose should NOT restate table cell contents

| No duplication | 5 points |
| Minor duplication (1-2 cells) | 3 points |
| Major duplication | 0 points |

---

## 4. Banned Pattern Check (15 points)

```bash
# Em-dashes (should be 0)
grep -c "—" content.md

# Empathy fluff (should be 0)
grep -ic "you're not alone" content.md
grep -ic "don't worry" content.md
grep -ic "we understand" content.md

# Filler phrases (should be 0)
grep -ic "in this article" content.md
grep -ic "in this guide" content.md
grep -ic "let's dive in" content.md
```

| No banned patterns | 15 points |
| 1-2 violations | 10 points |
| 3-4 violations | 5 points |
| 5+ violations | 0 points |

---

## 5. Scope Check (15 points)

**Manual review - check for content that doesn't serve THIS page's search intent (hub-and-spoke discipline,
core-rules Section 2-3):**

- [ ] Pricing / tiers / cost on a page the hub owns? (-5)
- [ ] Onboarding / first-visit / insurance / booking detail a supporting page should route up, not host? (-5)
- [ ] Per-product/treatment mechanism a spoke owns, written out here instead of linked? (-5)
- [ ] A whole section that answers a different intent (off-topic drift, no single sub-query it serves)? (-5)
- [ ] City/location names on a service page that has separate location pages? (-5)

| No scope issues | 15 points |
| 1 issue | 10 points |
| 2 issues | 5 points |
| 3+ issues | 0 points |

---

## 6. Helpful Content Check (10 points)

Quick self-assessment before publishing:

| Question | Yes | No |
|----------|:---:|:---:|
| Does the opening directly answer the search query? | | |
| Would a reader bookmark or share this? | | |
| Does it demonstrate expertise beyond summarizing others? | | |
| Would the reader achieve their goal without searching again? | | |
| Is this written for people, not search engines? | | |

**Scoring:**
- All "Yes": 10 points
- 1-2 "No": 5 points
- 3+ "No": 0 points (content needs review)

**If scoring 0:** Review against core-rules.md Section 3 warning signs.

---

## Score Calculation

| Category | Points | Your Score |
|----------|--------|------------|
| Word count | /20 | ___ |
| DRY compliance | /30 | ___ |
| Structure | /20 | ___ |
| Banned patterns | /15 | ___ |
| Scope | /15 | ___ |
| Helpful content | /10 | ___ |
| **TOTAL** | **/110** | **___** |

---

## Results & Actions

### Score ≥88: PUBLISH ✅

Content passes quality gate. Proceed to formatting and publishing.

### Score 66-87: MINOR FIXES ⚠️

Return to writer with specific violation list:
- "Word count is 1,850 - identify 300 words to cut"
- "Filter mentioned 4 times - consolidate to 2 locations"
- "Section 3 is 420 words - reduce to under 300"

Writer fixes flagged issues only, re-submits for quick re-check.

### Score <66: REWRITE ❌

Content has structural problems. Return to writer with:
1. This audit report
2. Instruction to run Content Tightening Protocol (Tier 1, Section 9)
3. Focus areas based on lowest-scoring categories

Writer performs full revision, re-submits for complete re-audit.

---

## Quick Audit Commands

Copy-paste this block to run all grep checks at once:

```bash
echo "=== WORD COUNT ==="
wc -w content.md

echo "=== CONCEPT REPETITION ==="
echo "filter:" && grep -ic "filter" content.md
echo "thermostat:" && grep -ic "thermostat" content.md
echo "professional/technician:" && grep -ic "professional\|technician" content.md

echo "=== BANNED PHRASES ==="
echo "important to note:" && grep -ic "important to note" content.md
echo "worth noting:" && grep -ic "worth noting" content.md
echo "em-dashes:" && grep -c "—" content.md

echo "=== EMPATHY FLUFF ==="
echo "you're not alone:" && grep -ic "you're not alone" content.md
echo "don't worry:" && grep -ic "don't worry" content.md
```

---

## Audit Log Template

```markdown
## Content Audit: [Article Title]
**Date:** [Date]
**Auditor:** [Name/System]

### Scores
- Word count: ___/20 ([X] words)
- DRY compliance: ___/30
- Structure: ___/20
- Banned patterns: ___/15
- Scope: ___/15
- Helpful content: ___/10
- **TOTAL: ___/110**

### Violations Found
1. [Specific violation]
2. [Specific violation]

### Result
[ ] ✅ PUBLISH
[ ] ⚠️ MINOR FIXES - [list items to fix]
[ ] ❌ REWRITE - run tightening protocol

### Notes
[Any additional observations]
```
