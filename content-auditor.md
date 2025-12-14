# Content Auditor Protocol
## Systematic Verification for Writing Quality Assessment

**Purpose:** Eliminate hallucinated violations through tool-based verification

**Created:** 2025-10-31
**Lesson Learned:** Initial audit claimed "18+ em-dash violations" that didn't exist

---

## The Hallucination Problem

### What Happened
An audit claimed extensive style guide violations (em-dashes) that were **completely fabricated**. The auditor:
- Read the prohibition in the style guide
- Became hyper-vigilant looking for violations
- Visually "saw" problems that weren't there
- Generated specific false claims ("18+ instances")
- Created confident examples for nonexistent issues

### Why It Happened
1. **Priming Bias:** Reading "NEVER use em-dashes" primed expectation of finding them
2. **Visual Confusion:** Hyphens (-) misidentified as em-dashes (—) during rapid scanning
3. **Pattern Completion:** Generated "likely" errors based on common mistakes
4. **False Confidence:** Specified "18+ instances" without verification
5. **Confabulation:** Created plausible-sounding examples without checking actual text

### The Smoking Gun
Claimed to find violations and offered "improvements" like:
> ❌ Wrong: "remember the 2021 freeze?" (parentheses would work here)

**Reality:** Text ALREADY used parentheses: `(remember the 2021 freeze?)`

This reveals the auditor never verified the actual text—just assumed what "should" be there.

---

## Core Principle

> **Never claim a violation exists without quoting exact text and location.**

If you cannot copy-paste the exact text showing the violation, you cannot claim it exists.

---

## Systematic Verification Protocol

### Step 1: Search Before Claim

**For every claimed violation, run grep search FIRST:**

```bash
# Example: Checking for em-dashes
grep "—" filename.json

# Example: Checking for missing contractions
grep "\bdo not\b|\bcannot\b|\bwill not\b" filename.json

# Example: Checking for spelled numbers
grep -i "\b(one|two|three|four|five|six|seven|eight|nine|ten)\b" filename.json
```

**Rule:** If grep returns "No matches found" → You CANNOT claim the violation exists.

### Step 2: Quote Exact Text + Location

**Reporting Format:**
```markdown
**Finding:** [Issue description]
**Location:** Line X or Section ID
**Exact Text:** "[quoted text showing violation]"
**Issue:** [specific problem]
**Fix:** [specific correction]
```

**Example of Proper Reporting:**
```markdown
**Finding:** Missing Oxford comma
**Location:** Line 42, Introduction section
**Exact Text:** "Services include cleaning, repair and installation"
**Issue:** Missing comma before "and" in 3-item list
**Fix:** "Services include cleaning, repair, and installation"
```

### Step 3: Distinguish Verification Levels

Always indicate your confidence level:

- **✅ Verified:** Grep search confirms existence, can quote exact text
- **⚠️ Suspected:** Pattern suggests issue but not confirmed with search
- **❓ Cannot Verify:** Unable to search or insufficient data to determine

**Never present "suspected" as "verified"**

### Step 4: Test Your Claims

Before submitting audit, ask yourself:

1. ❓ Can I copy-paste the exact text showing this violation?
2. ❓ Can I provide the line number or location?
3. ❓ Did I actually USE grep/search tools or just visual scan?
4. ❓ If the client says "show me," can I point to it?

If you answer "no" to any question → **You're probably hallucinating**

---

## Category Taxonomy

### Violation
**Definition:** Rule explicitly broken with verifiable evidence
**Requirements:** Must quote exact text
**Example:** "Em-dash found at Line 42: 'The heater—installed in 2015—needs service'"

### Enhancement
**Definition:** Could improve but not wrong
**Requirements:** Explain why improvement helps
**Example:** "Article uses minimal contractions (1 found). Adding 20-30 more would improve conversational tone per style-guide.md"

### Preference
**Definition:** Stylistic choice, multiple valid approaches
**Requirements:** Note it's subjective
**Example:** "Paragraph is 4 sentences (guide suggests 2-3). Still readable but could split for better scannability"

---

## Audit Checklist by Category

### Style Guide Compliance

#### Em-Dashes (CRITICAL)
```bash
grep "—" filename.json
```
- ✅ If "No matches found" → COMPLIANT
- ❌ If matches found → Quote each instance with line number

#### Contractions
```bash
# Check for formal constructions that should be contractions
grep "\bdo not\b|\bcannot\b|\bwill not\b|\bshould not\b|\bdoes not\b" filename.json

# Count contractions present
grep "you'll|we've|don't|can't|won't|it's|that's" filename.json -o | wc -l
```
- Report: "X contractions found. Style guide requires conversational tone."

#### Oxford Commas
```bash
# Search for lists without Oxford comma (pattern matching)
grep ", [a-z]+ and " filename.json
```
- Review each match to confirm it's a 3+ item list
- Quote instances missing Oxford comma

#### Numerals vs Spelled Numbers
```bash
grep -i "\b(one|two|three|four|five|six|seven|eight|nine|ten)\b" filename.json
```
- Review each match for context
- Exceptions: "day one" (idiomatic), "one-on-one" (compound)
- Only flag violations in countable contexts

---

### HTML Structure

#### H1 Tags (WordPress)
```bash
grep "<h1>" filename.json
```
- ✅ "No matches found" → CORRECT (WordPress generates from post_title)
- ❌ If found → VIOLATION (duplicates WordPress H1)

#### Section Elements
```bash
grep "<section" filename.json | wc -l
```
- Count sections
- Verify each H2 has corresponding section wrapper
- Check for proper ID and class attributes

#### Accessibility
```bash
# Tables must have captions
grep "<caption>" filename.json

# Headers must have scope
grep 'scope="col"' filename.json
grep 'scope="row"' filename.json
```
- Report missing accessibility markup with specific table location

---

### Content Quality

#### Internal Links
```bash
# Count <a href tags
grep '<a href' filename.json | wc -l
```
- Should find exactly 1 link in first 2-3 paragraphs
- ❌ If 0 links → Missing required link
- ⚠️ If 2+ links → Violates single-link rule

#### Specificity Check
Look for vague phrases (manual review required):
- "various factors"
- "many benefits"
- "regular maintenance"
- "several reasons"

**Must verify by reading actual context**—grep alone insufficient

---

## Search Tool Usage Guide

### Basic Grep Patterns

**Exact string search:**
```bash
grep "exact phrase" filename.json
```

**Word boundary search (avoid partial matches):**
```bash
grep "\bdo not\b" filename.json
```

**Multiple pattern search (OR):**
```bash
grep "pattern1|pattern2|pattern3" filename.json
```

**Case-insensitive search:**
```bash
grep -i "pattern" filename.json
```

**Count matches:**
```bash
grep "pattern" filename.json | wc -l
```

**Show line numbers:**
```bash
grep -n "pattern" filename.json
```

**Show context (lines before/after):**
```bash
grep -B 2 -A 2 "pattern" filename.json
```

### Common False Positives

#### Em-Dash vs Hyphen
- **Hyphen:** `-` (used correctly for ranges, compounds)
- **Em-dash:** `—` (prohibited)
- **Visual Confusion:** They look similar when scanning quickly

**Solution:** Grep for the actual character `—` not `-`

#### Contractions in Brand Names
- "can't" might appear in "You Can't Miss This Deal"
- Don't count brand names or headings as style compliance

**Solution:** Review context of each match

#### Numbers in Idioms
- "day one" (idiomatic expression)
- "one-on-one" (compound adjective)
- "one" in company names

**Solution:** Only flag numbers in countable contexts like "Replace every three years"

---

## Reporting Template

### Article Summary
```markdown
**File:** [Full path]
**Audit Date:** [Date]
**Methodology:** Tool-based verification using Grep
**Overall Score:** X/10

### Audit Method
- ✅ Grep searches performed for all violations
- ✅ Exact text quoted for all findings
- ✅ Line numbers provided where applicable
- ✅ Verification level indicated (Verified/Suspected/Unknown)
```

### Category Findings
```markdown
### [Category Name] - Score: X/10

#### [Specific Check]
**Grep Command:** `grep "pattern" filename.json`
**Result:** [matches found/no matches]
**Status:** ✅ COMPLIANT / ❌ VIOLATION / ⚠️ ENHANCEMENT

[If violation:]
**Location:** Line X
**Exact Text:** "[quoted text]"
**Issue:** [problem description]
**Fix:** [specific correction]
```

### Enhancement Opportunities
```markdown
## Enhancement Opportunities (Not Violations)

### 1. [Enhancement Name]
**Current State:** [what exists now]
**Recommendation:** [specific improvement]
**Benefit:** [why it would help]
**Priority:** High/Medium/Low
```

---

## Quality Assurance Checklist

Before submitting audit:

- [ ] Every violation includes grep search result
- [ ] Every violation includes exact quoted text
- [ ] Every violation includes line number or section ID
- [ ] Verification level indicated (✅⚠️❓)
- [ ] Violations distinguished from enhancements
- [ ] No claims about violations I couldn't verify with tools
- [ ] Tested: "Can I show the client exactly where this is?"

---

## Common Audit Mistakes to Avoid

### 1. Visual Scanning Without Verification
❌ **Wrong:** "I see em-dashes throughout the article"
✅ **Right:** "Grep search for em-dash character '—' returns: No matches found"

### 2. Generating Confident Specifics
❌ **Wrong:** "18+ instances of em-dashes found"
✅ **Right:** "Grep found 3 instances: Line 42, Line 67, Line 103"

### 3. Creating Examples for Nonexistent Problems
❌ **Wrong:** "Fix: Change 'the heater—installed in 2015—needs service' to use parentheses"
✅ **Right:** [Only provide fixes after verifying the violation exists]

### 4. Assuming Common Mistakes Exist
❌ **Wrong:** "Articles commonly use em-dashes, so I'll check for them... yep, found them"
✅ **Right:** "Style guide prohibits em-dashes. Grep search: No matches found. ✅ Compliant"

### 5. Conflating Similar Characters
❌ **Wrong:** Seeing hyphens (-) and reporting them as em-dashes (—)
✅ **Right:** Search for the actual character code, not visually similar characters

### 6. False Confidence Without Evidence
❌ **Wrong:** "Minimal contractions used" [without counting]
✅ **Right:** "Grep found 1 contraction. Style guide recommends conversational tone with frequent contractions."

---

## Competitive Auditing Standards

### What Makes Professional-Grade Auditing

**Accuracy:**
- Zero false positives (no hallucinated violations)
- All findings verifiable by client
- Clear distinction between violations and preferences

**Transparency:**
- Methodology documented
- Search commands provided
- Exact text quoted
- Line numbers given

**Actionability:**
- Client can CMD+F to find exact location
- Specific corrections provided
- Priority levels indicated
- Enhancement opportunities separated from violations

**Trust:**
- When you say something is wrong, it IS wrong
- When you can't verify, you say so
- No made-up confidence metrics
- Admit limitations

---

## Workflow: Step-by-Step Audit Process

### Phase 1: Preparation
1. Read all relevant writing guides
2. Note prohibited patterns and requirements
3. Prepare grep commands for each check
4. Set up reporting template

### Phase 2: Automated Checks
Run grep searches for:
1. Prohibited punctuation (em-dashes, etc.)
2. Missing contractions (formal constructions)
3. Spelled numbers in countable contexts
4. HTML structure issues (H1 tags, missing sections)
5. Accessibility markup (captions, scope attributes)
6. Internal link count

### Phase 3: Manual Review
Verify findings requiring context:
1. Oxford comma usage in lists
2. Paragraph structure (2-3 sentences)
3. Topic sentence formula compliance
4. Content specificity (vague vs concrete)
5. Local context integration
6. SEO metadata quality

### Phase 4: Documentation
For each finding:
1. Quote exact text
2. Provide location
3. Classify (violation/enhancement/preference)
4. Assign verification level (✅⚠️❓)
5. Suggest specific fix

### Phase 5: Quality Control
Review your own audit:
1. Test each claim: "Can I show exact location?"
2. Verify no hallucinated violations
3. Check all grep commands ran successfully
4. Ensure findings are actionable
5. Confirm professional tone

---

## Case Study: The Em-Dash Hallucination

### The Failure
**Claimed:** "18+ em-dash violations found throughout article"
**Reality:** Zero em-dashes existed
**Verification:** `grep "—" filename.json` → No matches found

### Root Causes
1. Read prohibition: "NEVER use em-dashes"
2. Became primed to expect violations
3. Visually scanned and "saw" hyphens as em-dashes
4. Generated confident specifics without verification
5. Created example fixes for nonexistent problems

### The Lesson
Reading a prohibition makes you expect to find violations. This expectation can cause you to "see" problems that aren't there. **Always verify with tools before claiming.**

### The Fix
```markdown
✅ Correct Audit Process:
1. Read prohibition: "Never use em-dashes"
2. Run grep: `grep "—" filename.json`
3. Result: "No matches found"
4. Report: "✅ No em-dashes found (compliant with style guide)"

❌ Failed Audit Process:
1. Read prohibition: "Never use em-dashes"
2. Visual scan of article
3. "See" what looks like em-dashes
4. Report: "❌ Found 18+ em-dash violations"
5. [All violations are hallucinated]
```

---

## Advanced Verification Techniques

### Pattern Matching for Oxford Commas

**Weak approach:**
```bash
grep ", and " filename.json
```
Problem: Also matches 2-item constructions like "A, and B"

**Better approach:**
```bash
grep ", [a-z]+, and " filename.json
```
Matches: "word, word, and word" (3+ items)

**Best approach:**
Review each match in context to confirm it's a list

### Contraction Density Analysis

**Count contractions:**
```bash
grep -o "you'll|we've|don't|can't|won't|it's|that's|they're|hasn't|haven't" filename.json | wc -l
```

**Count total words (approximate):**
```bash
wc -w filename.json
```

**Calculate density:**
- Target: 1-2% of words should be contractions for conversational tone
- Example: 3,000 word article should have 30-60 contractions

### Section Structure Validation

**Count sections:**
```bash
grep '<section' filename.json | wc -l
```

**Count H2 headings:**
```bash
grep '<h2>' filename.json | wc -l
```

**Validation:**
- Section count should be H2 count + 1 (introduction)
- Each H2 should be wrapped in its own section element

---

## Emergency Protocol: When You Catch Yourself Hallucinating

**Symptoms:**
- Can't find text you "remember" seeing
- Grep returns "No matches" for violation you're reporting
- Creating examples without checking source material
- Feeling confident about specifics you haven't verified

**Immediate Actions:**
1. ⚠️ STOP writing audit
2. Re-run ALL grep searches
3. Delete any findings you can't verify
4. Quote exact text for every remaining finding
5. Admit if you need to start over

**Self-Check Questions:**
- Did I actually see this or did I assume it?
- Can I copy-paste the exact text right now?
- Would grep find what I'm claiming exists?
- Am I pattern-matching based on common mistakes?
- Is my confidence level appropriate to my evidence?

---

## Summary: The Golden Rule

> **If you can't grep it, you can't claim it.**

Every violation must be:
- ✅ Searchable with grep
- ✅ Quotable with exact text
- ✅ Locatable with line number
- ✅ Verifiable by anyone

**No exceptions.**

---

## Appendix: Quick Reference Grep Commands

### Style Guide Checks
```bash
# Em-dashes (prohibited)
grep "—" filename.json

# Missing contractions
grep "\bdo not\b|\bcannot\b|\bwill not\b" filename.json

# Spelled numbers
grep -i "\b(one|two|three|four|five)\b" filename.json

# Oxford commas (look for missing)
grep ", [a-z]+ and " filename.json
```

### HTML Structure Checks
```bash
# H1 tags (should be zero for WordPress)
grep "<h1>" filename.json

# Section elements count
grep "<section" filename.json | wc -l

# H2 headings count
grep "<h2>" filename.json | wc -l

# Class attributes
grep 'class="ebp-section"' filename.json
```

### Content Checks
```bash
# Internal links
grep '<a href' filename.json

# Contractions present
grep "you'll|we've|don't|can't|won't" filename.json | wc -l

# Table captions (accessibility)
grep "<caption>" filename.json

# Scope attributes (accessibility)
grep 'scope="col"' filename.json
```

### SEO Checks
```bash
# Meta title length
grep '"meta_title"' filename.json | sed 's/.*: "\(.*\)".*/\1/' | wc -c

# Meta description length
grep '"meta_description"' filename.json | sed 's/.*: "\(.*\)".*/\1/' | wc -c
```

---

**Version:** 1.0
**Created:** 2025-10-31
**Purpose:** Eliminate hallucinated violations through systematic verification
**Lesson:** Trust tools, not assumptions

