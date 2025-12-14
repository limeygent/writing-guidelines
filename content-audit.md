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
        ├── Score ≥80 ──→ ✅ PUBLISH
        │
        ├── Score 60-79 ─→ ⚠️ MINOR FIXES (return with flag list)
        │
        └── Score <60 ───→ ❌ REWRITE (run tightening protocol)
```

---

## 1. Word Count Check (20 points)

| Word Count | Points | Status |
|------------|--------|--------|
| Under 1,200 | 20 | ✅ Ideal |
| 1,200-1,500 | 18 | ✅ Good |
| 1,500-1,800 | 12 | ⚠️ Review |
| 1,800-2,000 | 5 | ⚠️ Needs cuts |
| Over 2,000 | 0 | ❌ Fail |

**How to check:**
```bash
wc -w content.md
```

**If over 1,500:** Earlier sections are likely bloated. Don't truncate the end.

---

## 2. DRY Compliance (30 points)

### Concept Repetition Check

Run these grep commands and record occurrence counts:

```bash
# Key concepts (should appear ≤2 times each)
grep -in "filter" content.md | wc -l
grep -in "thermostat" content.md | wc -l
grep -in "vent" content.md | wc -l
grep -in "pilot" content.md | wc -l

# Professional mentions (should be ≤3)
grep -ic "professional\|technician\|hvac tech\|contractor" content.md
```

| Check | Threshold | Points |
|-------|-----------|--------|
| Each concept ≤2 locations | Pass all | 15 |
| Professional mentions ≤3 | Pass | 10 |
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

**Manual review - check for content that doesn't serve search intent:**

- [ ] Financing/payment plans mentioned in non-cost article? (-5)
- [ ] Regional content >3 sentences? (-5)
- [ ] Preventive maintenance in troubleshooting article? (-5)
- [ ] Service expectations >100 words? (-5)
- [ ] Causes listed >5 for troubleshooting intent? (-5)

| No scope issues | 15 points |
| 1 issue | 10 points |
| 2 issues | 5 points |
| 3+ issues | 0 points |

---

## Score Calculation

| Category | Points | Your Score |
|----------|--------|------------|
| Word count | /20 | ___ |
| DRY compliance | /30 | ___ |
| Structure | /20 | ___ |
| Banned patterns | /15 | ___ |
| Scope | /15 | ___ |
| **TOTAL** | **/100** | **___** |

---

## Results & Actions

### Score ≥80: PUBLISH ✅

Content passes quality gate. Proceed to formatting and publishing.

### Score 60-79: MINOR FIXES ⚠️

Return to writer with specific violation list:
- "Word count is 1,850 - identify 300 words to cut"
- "Filter mentioned 4 times - consolidate to 2 locations"
- "Section 3 is 420 words - reduce to under 300"

Writer fixes flagged issues only, re-submits for quick re-check.

### Score <60: REWRITE ❌

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
- **TOTAL: ___/100**

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
