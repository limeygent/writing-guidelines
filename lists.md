# Lists Output Style

Automatic list format selection for optimal readability and content organization.

---

## What This Guide Covers

**This guide provides:**
- ✓ When to use ordered lists (decision validation)
- ✓ When to use unordered lists (decision validation)
- ✓ When NOT to use lists (alternative elements)
- ✓ List structure and formatting standards
- ✓ Parallel structure requirements
- ✓ Content-specific patterns and examples

**This guide does NOT cover:**
- ✗ How to write paragraph prose (see paragraphs.md)
- ✗ YMYL language requirements (see ymyl.md)
- ✗ How to format tables (see tables.md)
- ✗ How to format FAQs (see faq.md)

---

## When to Use Ordered Lists ⭐

Use ordered lists when sequence, priority, or ranking matters to the reader.

**Primary use cases:**
- ✓ **Step-by-step processes** where order must be followed
- ✓ **Ranked items** (best to worst, most to least important)
- ✓ **Priority sequences** where hierarchy matters
- ✓ **Chronological sequences** (first, second, third)
- ✓ **Instructions or procedures** with dependencies
- ✓ **"Top X" formats** (Top 5 Tips, Best 10 Tools)

**Quick validation test:** If changing the order changes the meaning or outcome, use ordered list.

**Example situations:**
- Installation steps that must be done in sequence
- Troubleshooting checklist from most likely to least likely cause
- Decision flowchart (try this first, if that fails try this)
- Recipe instructions or assembly directions
- Ranking of solutions by cost or effectiveness

**HTML structure:**
```html
<ol>
  <li><strong>Step name:</strong> Description with details.</li>
  <li><strong>Next step:</strong> Additional context if needed.</li>
</ol>
```

---

## When to Use Unordered Lists ⭐

Use unordered lists when items are equal in importance with no inherent sequence.

**Primary use cases:**
- ✓ **Feature lists** (product or service features)
- ✓ **Benefits** without ranking or priority
- ✓ **Multiple equal options** (different but not better/worse)
- ✓ **Signs or symptoms** (indicators without order)
- ✓ **Checklist items** that can be done in any order
- ✓ **Components or ingredients** (no assembly sequence)

**Quick validation test:** If items can be shuffled without losing meaning, use unordered list.

**Example situations:**
- Benefits of epoxy flooring (all good, no ranking)
- Services offered by a company (no priority implied)
- Signs you need a new roof (can appear in any combination)
- Features included in a package (all equal value)
- Ingredients needed (gather in any order before starting)

**HTML structure:**
```html
<ul>
  <li>Clear, concise point</li>
  <li><strong>Key term:</strong> Explanation if needed</li>
  <li>Another parallel item</li>
</ul>
```

---

## When NOT to Use Lists ⭐

Consider alternatives for:

**→ For comparison data across multiple attributes:**  
Use tables (see tables.md for comparison formatting)  
*Example: Comparing 3 coating types across cost, durability, cure time, maintenance - table shows all factors side-by-side*

**→ For questions and answers:**  
Use FAQ format (see faq.md for Q&A structure)  
*Example: "How long does it last?" "Can I DIY?" - naturally framed as questions*

**→ For storytelling, examples, or emotional content:**  
Use paragraphs (see paragraphs.md for prose standards)  
*Example: Customer testimonial, project narrative, explaining why quality matters*

**→ For single concept explanations:**  
Use paragraphs (see paragraphs.md)  
*Example: Explaining the chemistry of epoxy bonding - needs continuous explanation*

**→ For providing context or smooth transitions:**  
Use paragraphs (see paragraphs.md)  
*Example: Bridging between sections, setting up what comes next*

**→ For 1-2 items only:**  
Use inline text in paragraphs  
*Example: "You'll need two tools: a scraper and a mop" - not enough items for list*

**→ For complex technical specifications:**  
Use tables (see tables.md for structured data)  
*Example: API parameters with type, default, required status - table is clearer*

---

## Decision Matrix: Lists vs Other Formats

| Content Type | Format Choice | Reasoning |
|------------|---------------|-----------|
| **3+ related items** | List | Easier scanning than prose |
| **2 items only** | Inline text | "X and Y" more natural |
| **Steps with order** | Ordered list | Sequence matters |
| **Equal options** | Unordered list | No hierarchy implied |
| **Complex comparisons** | Table (see tables.md) | Multiple attributes |
| **Narrative flow** | Paragraphs | Story needs continuity |

## When to Use Ordered Lists (ol)

**Automatic triggers:**
- Step-by-step processes
- Ranked solutions (best to worst)
- Priority order matters
- Chronological sequences
- Hierarchical importance
- "Top 5" or "Best 10" formats
- Instructions or procedures
- Escalating severity levels

**HTML Structure:**
```html
<ol>
  <li><strong>Step name:</strong> Description with details.</li>
  <li><strong>Next step:</strong> Additional context if needed.</li>
</ol>
```

## When to Use Unordered Lists (ul)

**Automatic triggers:**
- Multiple equal options
- Feature lists
- Benefits without ranking
- "Signs you need help" scenarios
- Checklist items
- Ingredients or components
- Available services
- Pros and cons (separate lists)

**HTML Structure:**
```html
<ul>
  <li>Clear, concise point</li>
  <li><strong>Key term:</strong> Explanation if needed</li>
  <li>Another parallel item</li>
</ul>
```

## When NOT to Use Lists

**Use paragraphs instead for:**
- Storytelling or examples
- Explaining single concepts
- Building emotional connection
- Providing context
- Smooth transitions
- Fewer than 3 items
- When flow matters more than scanning

**Use tables instead for:**
- Comparing 3+ items with multiple attributes
- Technical specifications
- Price/feature matrices
- Before/after comparisons

## List Formatting Rules

### Length Guidelines
- **Minimum:** 3 items (use prose for 1-2 items)
- **Maximum:** 10 items (split longer lists)
- **Sweet spot:** 5-7 items for engagement

### Parallel Structure
All items must follow same grammatical pattern:

**✅ Good - Parallel verbs:**
```html
<ul>
  <li>Remove old coating</li>
  <li>Clean the surface</li>
  <li>Apply primer</li>
</ul>
```

**❌ Bad - Mixed structure:**
```html
<ul>
  <li>Remove old coating</li>
  <li>Surface cleaning</li>
  <li>You should apply primer</li>
</ul>
```

### Item Length
- **Brief:** 1-2 lines ideal
- **Detailed:** Use bold lead-in for longer items
- **Maximum:** 3 sentences per item
- **Nested:** Avoid

### Punctuation
- **Short items:** No ending punctuation
- **Complete sentences:** Period at end
- **Lead-ins:** Colon after bold text
- **Consistency:** All items follow same pattern

## Content-Specific Patterns

### Process Steps
```html
<ol>
  <li><strong>Preparation (Day 1):</strong> Clear the area and gather materials. This includes removing all furniture and covering fixtures.</li>
  
  <li><strong>Application (Day 2-3):</strong> Apply base coat following manufacturer specifications. Temperature must remain between 50-90°F.</li>
  
  <li><strong>Curing (Day 4-7):</strong> Allow full cure time before use. Avoid water exposure for 72 hours minimum.</li>
</ol>
```

### Feature List
```html
<ul>
  <li><strong>24/7 availability:</strong> Round-the-clock emergency service</li>
  <li><strong>Licensed professionals:</strong> Fully certified and insured team</li>
  <li><strong>Warranty included:</strong> 5-year coverage on all work</li>
  <li><strong>Free estimates:</strong> No-obligation consultations</li>
</ul>
```

### Decision Criteria
```html
<h3>Choose Option A if:</h3>
<ul>
  <li>Budget is your primary concern</li>
  <li>You need a temporary solution</li>
  <li>Access is limited to the area</li>
  <li>Timeline is flexible</li>
</ul>

<h3>Choose Option B if:</h3>
<ul>
  <li>Long-term durability is essential</li>
  <li>You want premium aesthetics</li>
  <li>Professional installation is preferred</li>
  <li>Warranty coverage matters</li>
</ul>
```

### Problem Indicators
```html
<h3>Signs You Need Professional Help:</h3>
<ul>
  <li>Water pooling that doesn't drain</li>
  <li>Visible cracks wider than 1/4 inch</li>
  <li>Mold or mildew growth</li>
  <li>Unusual odors from the basement</li>
  <li>Foundation walls showing moisture</li>
</ul>
```

## Section-Specific Usage

### Opening Sections
- Rarely use lists (too early for complexity)
- Exception: Quick emergency steps

### Comparison Sections
- Use lists for "when to choose" scenarios
- Separate lists for each option
- Keep items parallel between options

### Process Sections
- Ordered lists for sequential steps
- Include timing and context
- Bold the action verb or phase name

### Problem/Solution Sections
- Unordered for symptoms/signs
- Ordered for prioritized solutions
- Brief items for quick scanning

### Cost Sections
- Unordered for factors affecting price
- Avoid specific prices in lists
- Include ranges or relative terms

### FAQ Sections
- Avoid lists in answers unless essential
- Keep to prose for better flow
- See faqs.md for structure

## Accessibility Considerations

- Screen readers announce list type and count
- Parallel structure aids comprehension
- Bold lead-ins help scanning
- Avoid empty list items
- Don't use lists for layout only

## Mobile Optimization

- Items wrap naturally on small screens
- Avoid horizontal scrolling
- Keep items concise for mobile scanning
- Test nested lists on mobile (often problematic)

## Common Mistakes to Avoid

1. **Using lists for 1-2 items** - Use inline text instead
2. **Mixing grammatical structures** - Keep parallel
3. **Creating 15+ item lists** - Split or reorganize
4. **Nesting** - Restructure content
5. **Using lists for layout** - Lists are for content
6. **Inconsistent punctuation** - Pick pattern and stick
7. **Wall of text in items** - Keep scannable
8. **Forcing lists where prose flows better** - Consider context

## Quality Checklist

Before finalizing lists:
- [ ] 3+ items (or use prose)
- [ ] Parallel grammatical structure
- [ ] Consistent punctuation pattern
- [ ] Items are scannable (not paragraphs)
- [ ] Ordered vs unordered choice is correct
- [ ] Bold lead-ins used where helpful
- [ ] No nesting
- [ ] Mobile-friendly length

## Quick Reference

**Ordered lists for:** Steps, rankings, priorities, sequences, "top X" formats
**Unordered lists for:** Features, benefits, equal options, signs/symptoms, services
**Skip lists for:** 1-2 items, narrative content, complex comparisons (use tables)

**Core principle:** Lists reduce cognitive load by organizing related items visually. Use them when scanning efficiency matters more than narrative flow.