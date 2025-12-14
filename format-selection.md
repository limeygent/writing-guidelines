# Format Selection Guide

Standards for choosing the correct content format (tables, lists, paragraphs, callouts) based on content type. This guide takes precedence over default prose writing.

**Key principle:** Tables and lists are the default for actionable content. Paragraphs are the fallback when structured formats don't apply. Readers scan, they don't read linearly.

---

## H1 Requirement (CRITICAL)

Every blog post MUST begin with an `<h1>` tag that:
1. Summarizes the intent of the content
2. Contains keywords users would search for
3. Is NOT the same as the WordPress post title (the template doesn't use post title as H1)

**H1 Formula:**
```
[Primary Keyword] + [Content Type/Promise] + [Location or Specificity]
```

**Examples:**
```html
<h1>Pool Freeze Protection Guide for North Texas: Checklists, Temperature Thresholds, and Emergency Steps</h1>

<h1>Should You Run Your Pool Pump During a Freeze? Temperature Guidelines for DFW Homeowners</h1>

<h1>Frozen Pool Pipes: 15-Minute Emergency Action Plan for North Texas</h1>
```

**H1 Placement:** First element in the HTML output, before the introduction section.

---

## The Format Decision Tree

Before writing ANY section, ask these questions in order:

```
1. Does this compare multiple items with shared attributes?
   YES → TABLE

2. Does this describe steps, actions, or procedures?
   YES → NUMBERED LIST

3. Does this list items without required sequence?
   YES → BULLET LIST

4. Does this warn against mistakes or dangers?
   YES → CALLOUT BOX (with bullets inside)

5. None of the above?
   → PARAGRAPHS (2-3 sentences max per paragraph)
```

---

## When to Use Tables (REQUIRED)

Tables are REQUIRED when content has ANY of these characteristics:

### 1. Comparison Data
Multiple items with shared attributes that readers will compare.

**Examples:**
- Temperature thresholds with corresponding actions
- Equipment types with costs, vulnerabilities, protection methods
- Service options with features and pricing
- Product specifications side-by-side

**Pattern:**
```html
<table>
<thead>
<tr><th>Item</th><th>Attribute 1</th><th>Attribute 2</th><th>Attribute 3</th></tr>
</thead>
<tbody>
<tr><td>Option A</td><td>Value</td><td>Value</td><td>Value</td></tr>
<tr><td>Option B</td><td>Value</td><td>Value</td><td>Value</td></tr>
</tbody>
</table>
```

### 2. Reference Information
Data readers will scan repeatedly or need to find quickly.

**Examples:**
- Quick-reference summaries
- Decision matrices (situation → action)
- Specifications, measurements, thresholds
- Cost breakdowns by component

### 3. If-Then Relationships
Conditions that trigger specific actions or outcomes.

**Examples:**
- "At X temperature, do Y"
- "If this symptom, take this action"
- "This situation = this urgency level"
- "This equipment type = this protection method"

### Table Placement Rule

**Put summary tables at the TOP of sections, not buried after paragraphs.**

Readers scan tables first. A table after 4 paragraphs of explanation will be missed by 80% of readers.

### Table HTML Format (REQUIRED)

**Always use Bootstrap classes for HTML tables.** Reference `tables.md` for full specifications.

```html
<table class="table table-striped table-bordered">
<thead class="thead-dark">
<tr>
<th scope="col">Column Header</th>
<th scope="col">Column Header</th>
</tr>
</thead>
<tbody>
<tr>
<th scope="row">Row Label</th>
<td>Cell content</td>
</tr>
</tbody>
</table>
```

**Required classes:**
- `table` — Base Bootstrap table styling
- `table-striped` — Alternating row colors for scannability
- `table-bordered` — Cell borders for clarity

**Required accessibility:**
- `scope="col"` on header cells
- `scope="row"` on first column cells (if row labels)
- `thead` with `thead-dark` class for header row

**Wrong:**
```
<h2>Equipment protection</h2>
<p>Paragraph explaining pumps...</p>
<p>Paragraph explaining filters...</p>
<p>Paragraph explaining heaters...</p>
<p>Paragraph explaining salt cells...</p>
<table>Summary of all equipment</table>  ← Too late, readers already left
```

**Right:**
```
<h2>Equipment protection</h2>
<p>Brief intro sentence.</p>
<table>Summary of all equipment</table>  ← Scannable overview first
<h3>Pump details</h3>
<p>Additional detail if needed...</p>
```

---

## When to Use Numbered Lists (REQUIRED)

Numbered/ordered lists are REQUIRED when:

### 1. Steps Must Happen in Sequence
Procedures, protocols, checklists where order matters.

**Examples:**
- Pre-event preparation steps
- Emergency response procedures
- Installation or setup instructions
- Troubleshooting sequences

### 2. Actions Are Discrete and Countable
When content answers "what do I do?" with specific actions.

**Examples:**
- "Complete these 8 tasks before the freeze"
- "Follow these 5 steps to restart equipment"
- "Check these 10 items during inspection"

### The Checklist Rule (CRITICAL)

**If a section describes "what to do before X" or "steps to accomplish Y," it MUST be a numbered list, NOT paragraphs.**

**Wrong:**
```
<h3>48 hours before the freeze</h3>
<p>Monitor weather forecasts for freeze warnings. You should also
test all equipment at full speed. Make sure to add water to the pool
if levels are low. Check that your phone is charged...</p>
```

**Right:**
```
<h3>48 hours before the freeze</h3>
<ol>
<li>Monitor weather forecasts for freeze warnings and expected lows</li>
<li>Test all equipment at full speed for 15-30 minutes</li>
<li>Add 1-2 inches to pool water level if currently at normal</li>
<li>Charge phone and portable charger fully</li>
</ol>
```

---

## When to Use Bullet Lists (REQUIRED)

Bullet/unordered lists are REQUIRED when:

### 1. Items Have No Required Sequence
Collections where order doesn't matter.

**Examples:**
- Supplies needed
- Features included
- Examples of a category
- Options available

### 2. Warnings or Things to Avoid
"Don't do these things" content (often inside a callout box).

**Examples:**
- Common mistakes
- Dangerous practices
- Things that void warranties

### 3. Options or Alternatives
Multiple valid choices where reader picks one.

**Examples:**
- Monitoring options (professional, smart system, neighbor)
- Protection methods (insulation types, covering approaches)
- Service tiers

---

## When to Use Callout Boxes (REQUIRED)

Callout boxes with special styling are REQUIRED for:

### 1. Warnings and Dangers
Content about what NOT to do or serious risks.

```html
<div class="callout callout-warning">
<p><strong>Warning heading:</strong></p>
<ul>
<li><strong>Don't do X</strong> — Consequence explanation</li>
<li><strong>Don't do Y</strong> — Consequence explanation</li>
</ul>
</div>
```

### 2. Emergency Procedures
Critical steps that must stand out visually.

```html
<div class="callout callout-danger">
<p><strong>Emergency steps (in order):</strong></p>
<ol>
<li><strong>First action</strong> — Brief explanation</li>
<li><strong>Second action</strong> — Brief explanation</li>
</ol>
</div>
```

### 3. Key Takeaways or Tips
Important information that deserves visual emphasis.

```html
<div class="callout callout-info">
<p><strong>Key point:</strong> The essential information the reader
must remember from this section.</p>
</div>
```

---

## When to Use Paragraphs

Paragraphs are the FALLBACK format, not the default. Use paragraphs ONLY when:

### 1. Explaining Concepts
Why something works, background context, theory.

**Example:** Explaining why moving water doesn't freeze (physics explanation).

### 2. Narrative Content
Stories, case studies, testimonials, examples with context.

**Example:** Describing a specific customer's freeze damage experience.

### 3. Brief Introductions
Setting up a section before the actionable content.

**Limit:** 1-2 sentences maximum before transitioning to table/list.

### 4. Transitions
Connecting ideas between sections.

**Limit:** 1 sentence maximum.

---

## Format Ratio Targets

For how-to guides, service pages, and actionable content:

| Format | Target % | Purpose |
|--------|----------|---------|
| Tables | 15-25% | Comparisons, reference data, decisions |
| Numbered lists | 20-30% | Procedures, steps, checklists |
| Bullet lists | 15-20% | Supplies, options, warnings |
| Callout boxes | 5-10% | Warnings, emergencies, key points |
| Paragraphs | 25-35% | Context, explanations, transitions |

**Anti-pattern to detect:** If an article is 80%+ paragraphs, it's almost certainly formatted incorrectly for web reading.

---

## Section Architecture Pattern

For how-to and guide content, structure each section this way:

```
1. SUMMARY TABLE (if comparing items)
   └── Scannable overview of section content

2. BRIEF INTRO (1-2 sentences)
   └── Context for what follows

3. ACTIONABLE CONTENT
   └── Numbered list for procedures
   └── Bullet list for options/supplies
   └── Subsections with short paragraphs for details

4. CALLOUT BOX (if warnings exist)
   └── Dangers, don'ts, critical notes
```

**Never:** Multiple consecutive paragraphs describing actions the reader should take.

**Always:** Convert action descriptions to numbered lists.

---

## Common Anti-Patterns to Avoid

### Anti-Pattern 1: Paragraph Actions

**Wrong:**
```
You should first check the equipment. Then verify the automation
is working. After that, gather your supplies. Make sure to also
test the freeze guard before the cold arrives.
```

**Right:**
```
<ol>
<li>Check equipment operation</li>
<li>Verify automation settings</li>
<li>Gather insulation supplies</li>
<li>Test freeze guard activation</li>
</ol>
```

### Anti-Pattern 2: Buried Tables

**Wrong:** Table appears after 4+ paragraphs of explanation.

**Right:** Table appears immediately after section heading with 1-sentence intro.

### Anti-Pattern 3: Verbose Warnings

**Wrong:**
```
<h3>Don't drain your pool</h3>
<p>Draining the pool is a mistake because... [3 sentences]</p>
<p>The reason this causes damage is... [3 sentences]</p>

<h3>Don't turn off equipment</h3>
<p>Turning off equipment seems logical but... [3 sentences]</p>
```

**Right:**
```
<div class="callout callout-warning">
<ul>
<li><strong>Don't drain pool</strong> — Causes structural damage from groundwater pressure</li>
<li><strong>Don't turn off equipment</strong> — $5 electricity vs $3,000 repairs</li>
</ul>
</div>
```

### Anti-Pattern 4: Missing Quick Reference

**Wrong:** Important thresholds/actions only appear deep in article.

**Right:** Summary table near top of article for quick scanning.

---

## Integration With Other Guides

This guide works alongside:

- **paragraphs.md** — How to write paragraphs when paragraphs are the right choice
- **tables.md** — How to format tables correctly
- **lists.md** — How to format lists correctly
- **style-guide.md** — Punctuation, voice, and tone for all formats
- **faqs.md** — When and how to use FAQ sections (includes redundancy rules)

**Hierarchy:** format-selection.md determines WHICH format to use. Other guides determine HOW to execute that format.

**FAQ Note:** FAQs should only include NEW information not covered in the article body. If comprehensive content with tables/checklists already answers common questions, skip FAQs entirely. See faqs.md for the full redundancy rule.

---

## Quality Checklist

Before publishing, verify:

**Format Selection:**
- [ ] Every comparison uses a table
- [ ] Every procedure uses a numbered list
- [ ] Every collection uses a bullet list
- [ ] Warnings use callout boxes
- [ ] Tables appear before explanatory paragraphs
- [ ] No section has 4+ consecutive paragraphs describing actions

**Ratio Check:**
- [ ] Article is not 80%+ paragraphs
- [ ] At least 2-3 tables in comprehensive guides
- [ ] At least 2-3 numbered lists in how-to content
- [ ] Callout boxes used for all warnings/emergencies

**Quick Reference:**
- [ ] Key thresholds/decisions appear in scannable format near top
- [ ] Reader can find "what to do" within 5 seconds of scanning

**FAQs (if included):**
- [ ] Each FAQ answers a question NOT already covered in article body
- [ ] FAQs address edge cases, objections, or related topics
- [ ] If article is comprehensive, consider skipping FAQs entirely

---

## Summary

**Default assumption:** If content CAN be a table or list, it SHOULD be.

**Paragraphs are fallback:** Only use for explanations, context, and transitions.

**Tables first:** Put summary tables at the top of sections, not after paragraphs.

**Actions = Lists:** Any content describing what the reader should DO becomes a numbered list.

**Warnings = Callouts:** Any content about dangers or don'ts goes in a callout box.

Follow this guide to create scannable, actionable content that serves readers who won't read every word.
