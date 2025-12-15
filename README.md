# Writing Guidelines for LLM Content Generation

## Why These Guidelines Exist

### The Problem
When LLMs write blog content without constraints, they produce:
- **Bloated articles** (6,800-8,200 words instead of target ~1,500)
- **DRY violations** (same concept explained 2-3 times per article)
- **Scope creep** (financing options in troubleshooting articles, prevention tips in repair guides)
- **Generic filler** ("you're not alone", "don't worry", "it's important to note")
- **Fake authority** (LLMs claiming personal experience they don't have)

### The Solution
A tiered guideline system that:
- Loads only what's needed for each content type
- Enforces word budgets by intent type
- Provides specific patterns to follow (and anti-patterns to avoid)
- Keeps LLMs focused on answering the search query - nothing more

---

## Design Philosophy

### 1. Answer the Query, Then Stop
Every word must serve the reader's goal. If content doesn't help them solve their problem or make their decision, it doesn't belong.

### 2. Intent Determines Structure
Different search intents need different approaches:
- **Troubleshooting** ("won't work"): 4-5 causes, DIY fixes, when to call. 750-1,100 words.
- **Identification** ("making noise"): Reference table first, 6-10 options, urgency column. 800-1,350 words.
- **Comparison** ("vs", "or"): Table-first, quick recommendation. 600-875 words.
- **Educational** ("how does", "what is"): Concept-focused, why it matters. 550-800 words.

### 3. Tables Contain Data, Prose Introduces
Never explain table contents in surrounding paragraphs. The table IS the explanation. Prose should only add context not in the table.

### 4. Authority Through Specificity, Not Claims
Good: "Furnaces in North Texas often sit idle 8-9 months, causing dust buildup on burners."
Bad: "We're the best HVAC company with great service and competitive prices."

### 5. Company Voice, Not Personal Claims
LLMs shouldn't fabricate personal experience. Use company voice ("Our technicians have found...") or qualified language ("HVAC professionals typically report...") instead of personal claims ("In my 20 years...").

### 6. YMYL Caution
For health, medical, finance, legal, and safety content: stick to facts and credentials. No experience narratives that could wander into ethical gray areas.

---

## Tiered Loading System

### Tier 1: `core-rules.md` (Always Load)
Universal rules that apply to ALL content:
- Word budgets by intent type
- DRY enforcement (each concept once)
- Authority signal requirements
- Banned patterns and phrases
- Pre-flight and pre-publish checklists

**~650 lines. Load for every content task.**

### Tier 2: Format Guides (Auto-Load by Content Type)
Load when content includes that format:

| File | Load When |
|------|-----------|
| `format-tables.md` | Comparisons, specifications, multi-attribute data |
| `format-lists.md` | Procedures, steps, collections |
| `format-faqs.md` | FAQ sections needed |

### Tier 3: `ymyl-overlay.md` (Load for Sensitive Topics)
Additional constraints for Your Money or Your Life content:
- Health and safety topics
- Financial decisions
- Legal considerations

Adds qualified language requirements, cost disclaimers, and credential emphasis.

### Post-Write: `content-audit.md`
Quality gate checklist with:
- Automated grep checks for repetition
- Scoring system (publish / fix / rewrite)
- Quick audit command block

---

## File Overview

| File | Purpose | Lines |
|------|---------|-------|
| `core-rules.md` | Prime directive, word budgets, intent templates, authority signals, banned patterns | ~650 |
| `format-tables.md` | Bootstrap 5 table structure, when to use tables, accessibility requirements | ~200 |
| `format-lists.md` | List formatting, numbered vs bulleted, nesting rules | ~200 |
| `format-faqs.md` | When to include FAQs, structure, what to avoid | ~200 |
| `ymyl-overlay.md` | YMYL constraints, qualified language, cost disclaimers | ~200 |
| `content-audit.md` | Post-write checklist, grep commands, scoring | ~150 |

---

## How to Use These Guidelines

### For LLM Content Writers

1. **Always start with `core-rules.md`**
2. **Identify the search intent** (troubleshooting, identification, comparison, educational)
3. **Follow the word budget** for that intent type
4. **Load format guides** as needed (tables, lists, FAQs)
5. **Load `ymyl-overlay.md`** if topic involves health/safety/finance/legal
6. **Run `content-audit.md` checks** before submission

### For Humans Managing These Guidelines

- **Tier 1 changes** affect all content - edit carefully
- **Tier 2 changes** affect specific formats only
- **Add examples** when patterns aren't being followed
- **Add anti-patterns** when bad habits emerge

---

## Revision History

- **v1 (Dec 2024)**: Initial 9-file system (~5,500 lines total)
- **v2 (Dec 2024)**: Consolidated to tiered system (~1,400 lines total)
  - Problem: v1 was too scattered, LLMs lost focus on key rules
  - Solution: Single core-rules file + modular format guides
- **v2.1 (Dec 2024)**: Added Section 6.6 (Experience Demonstration)
  - Problem: Google HCU audits flagged missing expertise signals
  - Solution: Company voice + qualified language patterns (without fabricating personal claims)

---

## Key Metrics

Target outputs after applying these guidelines:
- **Troubleshooting articles**: 750-1,100 words (not 6,000+)
- **Identification articles**: 800-1,350 words
- **Comparison articles**: 600-875 words
- **Educational articles**: 550-800 words
- **Concept repetition**: Each concept explained exactly once
- **Professional mentions**: Maximum 3 per article
