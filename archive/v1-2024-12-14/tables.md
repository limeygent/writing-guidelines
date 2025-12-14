# Table-Based Output Style

Automatically insert tables when content structure benefits from tabular presentation. No user prompting required.

---

## What This Guide Covers

**This guide provides:**
- ✓ When to use tables (decision validation)
- ✓ When NOT to use tables (alternative elements)
- ✓ Table structure and formatting standards
- ✓ HTML and accessibility requirements
- ✓ Pattern recognition and examples

**This guide does NOT cover:**
- ✗ How to write paragraph prose (see paragraphs.md)
- ✗ YMYL language requirements (see ymyl.md)
- ✗ How to format lists (see lists.md)
- ✗ How to format FAQs (see faq.md)

---

## When to Use Tables ⭐

Use tables when readers need to scan and compare information quickly across multiple dimensions.

**Primary use cases:**
- ✓ **Comparing 3+ options** across multiple attributes (products, services, solutions)
- ✓ **Comparing 2 options** with 3+ attributes (detailed side-by-side analysis)
- ✓ **Technical specifications** requiring structured reference
- ✓ **Before/after scenarios** with multiple factors
- ✓ **Process variations** showing different methods with multiple properties
- ✓ **Multi-attribute data** where items have 2+ consistent properties

**Quick validation test:** If readers need to look back and forth between options to compare, use a table.

**Example situations:**
- "Epoxy vs polyurethane vs acrylic" across cost, durability, cure time, maintenance
- API endpoints with method, parameters, response, authentication requirements
- Three installation methods with steps, time, difficulty, best use case
- Product tiers with features, pricing, support level, user limits

---

## Automatic Table Triggers

Insert tables when detecting these patterns:

| Trigger Pattern | Example Phrases | Table Type |
|-----------------|-----------------|------------|
| **Comparisons** | "comparing X vs Y", "difference between", "pros and cons" | Comparison table |
| **Multiple Options** | "options include", "choose between", "alternatives are" | Options table |
| **Specifications** | "features include", "requirements are", "specifications" | Specs table |
| **Process Variants** | "different ways to", "methods for", "approaches to" | Process comparison |
| **Multi-attribute Lists** | Items with 2+ consistent properties | Information table |
| **Before/After** | "changes from", "improvements over", "evolution of" | Timeline table |

## Decision Matrix

| Data Structure | Format Choice | Reasoning |
|----------------|---------------|-----------|
| **3+ items with 2+ attributes** | Table | Enables scanning and comparison |
| **2 items with 3+ attributes** | Table | Cross-referencing needed |
| **Any items with 1 attribute** | Bullet list | Insufficient dimensions for table |
| **Sequential steps with details** | Table if 3+ columns needed | Otherwise numbered list |
| **Technical specifications** | Always table | Structure critical for reference |
| **Narrative content** | Never table | Prose with inline values |

## Mobile Constraints

**Hard limits for readability:**
- Maximum 4 columns
- Maximum 8 rows per table
- Split larger datasets into multiple focused tables

## Table Structure Standards

### Markdown Tables (Default)
```markdown
| **Factor** | Option A | Option B | Recommendation |
|------------|----------|----------|----------------|
| **Cost** | Low | High | A for budget |
| **Quality** | Good | Excellent | B for premium |
| **Speed** | Fast | Moderate | A for urgency |
```

### HTML Tables (Web/ADA Compliance)
```html
<table class="table table-striped table-bordered table-hover">
  <caption>Comparison of implementation approaches</caption>
  <thead>
    <tr>
      <th scope="col">Factor</th>
      <th scope="col">Approach A</th>
      <th scope="col">Approach B</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th scope="row">Timeline</th>
      <td>2 weeks</td>
      <td>6 weeks</td>
    </tr>
    <tr>
      <th scope="row">Resources</th>
      <td>2 developers</td>
      <td>4 developers</td>
    </tr>
  </tbody>
</table>
```

## Formatting Rules

### Headers
- Bold first column headers for row labels
- Use sentence case
- Include units in headers: "Cost ($)" not dollars in cells
- Maximum 3 words per header

### Alignment
- Left-align text (default)
- Right-align numbers (`---:`)
- Center single words/status (`:---:`)

### Content
- Keep cells concise (1-5 words ideal)
- Use bullet points within cells sparingly
- Never use paragraphs in cells
- Status indicators: 🟢 Good, 🟡 Warning, 🔴 Critical

## Common Patterns

### Comparison Table
When detecting comparison need (3+ options OR 2+ attributes):
```markdown
| **Criteria** | Solution A | Solution B | Solution C |
|--------------|------------|------------|------------|
| **Setup** | Simple | Complex | Moderate |
| **Cost** | Low | High | Medium |
| **Support** | Community | Enterprise | Both |
```

### Process Variations
When showing different approaches:
```markdown
| **Method** | Steps | Time | Difficulty | Best For |
|------------|-------|------|------------|----------|
| **Automated** | 3 | 5 min | Easy | Large batches |
| **Manual** | 8 | 30 min | Hard | Fine control |
| **Hybrid** | 5 | 15 min | Medium | Balanced needs |
```

### Step Table
When process has multiple components per step:
```markdown
| Step | Action | Tools Needed | Duration | Notes |
|------|--------|--------------|----------|-------|
| 1 | **Prepare** | Config file | 5 min | Validate first |
| 2 | **Execute** | Script, API key | 20 min | Monitor logs |
| 3 | **Verify** | Test suite | 10 min | Document results |
```

### Specification Table
For technical details, parameters, requirements:
```markdown
| Parameter | Type | Default | Required | Description |
|-----------|------|---------|----------|-------------|
| `timeout` | int | 30 | No | Seconds to wait |
| `retries` | int | 3 | No | Retry attempts |
| `api_key` | string | - | Yes | Authentication |
```

## Auto-Conversion Examples

### Input Text
"We have three database options. PostgreSQL is open-source, highly reliable, and costs nothing but requires expertise. MongoDB is document-based, scalable, and has a commercial option. MySQL is widely supported, simple, and has good performance."

### Automatic Output
| **Database** | Type | Cost | Strength | Consideration |
|--------------|------|------|----------|---------------|
| **PostgreSQL** | Relational | Free | Highly reliable | Requires expertise |
| **MongoDB** | Document | Freemium | Scalable | Commercial option |
| **MySQL** | Relational | Free | Wide support | Simple setup |

## When NOT to Use Tables

**Never use tables for:**
- Single data points or comparisons (2 items with 1-2 attributes only)
- Pure narrative content
- Lists with only names/titles
- Emotional or story-driven content
- Content requiring extensive explanation per item

**Use instead:**

**→ For sequential steps in specific order:**  
Use ordered lists (see lists.md for ordered list formatting)  
*Example: Installation process steps 1-8 that must be followed in sequence*

**→ For feature/benefit lists without comparison:**  
Use unordered lists (see lists.md for unordered list formatting)  
*Example: Benefits of epoxy flooring (single product, no comparison)*

**→ For concept explanations or providing context:**  
Use paragraphs (see paragraphs.md for prose standards)  
*Example: Why surface preparation affects coating longevity*

**→ For questions and answers:**  
Use FAQ format (see faq.md for FAQ structure)  
*Example: "How long does coating last?" "Can I install it myself?"*

**→ For simple two-option comparisons with 1-2 factors:**  
Use paragraph or simple unordered list (see paragraphs.md)  
*Example: "Clear coat preserves concrete's natural look, while colored epoxy adds pigmented finishes"*

**→ For narrative, stories, or customer experiences:**  
Use paragraphs (see paragraphs.md)  
*Example: Customer testimonial or project story*

## Quality Checklist

Before creating table, verify:
- [ ] Content has 2+ attributes to compare
- [ ] Table improves scannability vs prose
- [ ] Mobile limits respected (≤4 columns, ≤8 rows)
- [ ] Headers are concise and descriptive
- [ ] Alignment matches content type
- [ ] ADA compliance for HTML tables (caption, scope)

## Implementation Priority

1. **Always table**: Technical specs, API docs, feature comparisons
2. **Usually table**: Process variations, multi-option analysis, before/after
3. **Consider table**: Step-by-step with details, pro/con lists
4. **Avoid table**: Stories, single comparisons, simple lists

**Core principle**: Tables reduce cognitive load. Use them when readers need to scan, compare, or reference structured information quickly.