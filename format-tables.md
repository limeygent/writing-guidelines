# Table Formatting Guide (Tier 2)

**Load:** Auto-loads when content contains comparisons or multi-attribute data
**Purpose:** How to build effective, scannable tables

---

## When to Use Tables

Tables are the DEFAULT format for:

- **Comparisons** between 2+ options (products, services, systems)
- **Specifications** with multiple attributes
- **Feature matrices** showing what's included
- **Pricing tiers** or cost breakdowns
- **Decision criteria** with multiple factors
- **Any data with 2+ dimensions**

**Rule:** If content CAN be a table, it SHOULD be a table. Prose is fallback.

---

## Table Structure Rules

### Required Elements
- Header row (always)
- Left column = item being compared or category
- Consistent data types per column
- Units specified in header (not repeated in cells)

### Prohibited
- Merged cells (break mobile rendering)
- Empty cells without explanation
- Inconsistent formatting across rows
- Tables with only 1 data column (use a list instead)

### Size Limits
| Dimension | Limit | Reason |
|-----------|-------|--------|
| Rows | 5-8 max | More = overwhelming |
| Columns | 4 max | Mobile readability |
| Cell content | 2-3 words ideal | Scannability |

---

## Mobile Optimization

### 4+ Columns: Transpose or Split
If you need more than 4 columns, either:
1. **Transpose:** Make rows into columns
2. **Split:** Create 2 smaller tables
3. **Prioritize:** Show most important columns, link to full comparison

### Long Cell Content
- Keep cells to 2-3 words when possible
- Use abbreviations defined in a key
- Move detailed explanations to prose AFTER the table

---

## Prose + Table Integration

### CRITICAL: No Duplication

**Wrong:**
```
Heat pumps cost $4,000-7,000 and work best above 35°F.
Furnaces cost $3,000-5,000 and work best below 35°F.

| System | Cost | Best Climate |
|--------|------|--------------|
| Heat pump | $4,000-7,000 | Above 35°F |
| Furnace | $3,000-5,000 | Below 35°F |
```

**Right:**
```
Compare your options:

| System | Cost | Best Climate |
|--------|------|--------------|
| Heat pump | $4,000-7,000 | Above 35°F |
| Furnace | $3,000-5,000 | Below 35°F |

For North Texas, heat pumps handle most winter days efficiently.
```

### Table Introduction Rules
- 1-2 sentences max before table
- Introduce what the table shows, not the data itself
- Never restate table cell values in prose

### Table Follow-up Rules
- Add context not present in table
- Provide recommendation or next step
- Maximum 2-3 sentences after table

---

## HTML Structure

### Standard Table Template (Bootstrap 5)
```html
<table class="table table-striped table-bordered table-hover mt-5 mb-5">
    <caption>Descriptive Table Title</caption>
    <thead>
        <tr>
            <th scope="col">Factor</th>
            <th scope="col">Option A</th>
            <th scope="col">Option B</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <th scope="row">Cost</th>
            <td>$X,XXX</td>
            <td>$X,XXX</td>
        </tr>
        <tr>
            <th scope="row">Efficiency</th>
            <td>XX SEER</td>
            <td>XX AFUE</td>
        </tr>
    </tbody>
</table>
```

### Required Classes
- `table` - Base Bootstrap table styling
- `table-striped` - Alternating row colors for readability
- `table-bordered` - Cell borders
- `table-hover` - Row highlight on hover
- `mt-5 mb-5` - Vertical spacing (margin top/bottom)

### Required Elements
- `<caption>` - Descriptive title (accessibility + context)
- `<thead>` with `<th scope="col">` - Column headers
- `<th scope="row">` - Row headers in first column (accessibility)

### Responsive Wrapper (for wide tables)
```html
<div class="table-responsive">
    <table class="table table-striped table-bordered table-hover mt-5 mb-5">
        ...
    </table>
</div>
```

### Adding Detail to Row Headers
Use `<small>` for supplementary info:
```html
<th scope="row">
    Air filter check<br>
    <small>Located in return duct or furnace cabinet</small>
</th>
```

---

## Common Table Types

### Comparison Table
For "vs" or "which should I choose" queries.

| [Factor] | [Option A] | [Option B] |
|----------|------------|------------|
| Best for | [Use case] | [Use case] |
| Cost | [Range] | [Range] |
| Pros | [Key benefit] | [Key benefit] |
| Cons | [Key drawback] | [Key drawback] |

### Specification Table
For "what are the specs" or product detail queries.

| Specification | Value |
|---------------|-------|
| Capacity | X tons |
| Efficiency | XX SEER |
| Warranty | X years |

### Decision Matrix
For "how do I decide" queries.

| If you... | Then choose... | Because... |
|-----------|----------------|------------|
| [Situation A] | [Option] | [Reason] |
| [Situation B] | [Option] | [Reason] |

### Quick Reference Table
For "what does X mean" or lookup queries.

| Term | Meaning | Why It Matters |
|------|---------|----------------|
| SEER | Efficiency rating | Higher = lower bills |
| BTU | Heating capacity | Must match home size |

---

## Examples

### Good: Comparison Table
**Query:** "heat pump vs furnace"

> **Heat Pump vs. Gas Furnace**
>
> | Factor | Heat Pump | Gas Furnace |
> |--------|-----------|-------------|
> | Best climate | Above 35°F | Below 35°F |
> | Energy source | Electricity | Natural gas |
> | Upfront cost | $4,000-7,000 | $3,000-5,000 |
> | Lifespan | 15 years | 20 years |
>
> For North Texas homes, heat pumps handle most winter days. Add backup heat strips for the occasional deep freeze.

**Why it works:**
- 4 columns (mobile-friendly)
- 4 rows (scannable)
- Prose adds regional context not in table
- No duplication

---

### Good: Decision Matrix
**Query:** "should I repair or replace my furnace"

> **Repair vs. Replace Decision Guide**
>
> | If your furnace... | Recommendation | Why |
> |-------------------|----------------|-----|
> | Is under 10 years old | Repair | Still has 50%+ lifespan |
> | Repair costs >50% of new | Replace | Poor ROI on repair |
> | Needs 3+ repairs/year | Replace | Chronic failure pattern |
> | Uses R-22 refrigerant | Replace | Refrigerant phased out |
>
> When in doubt, get a repair estimate first. Most furnaces are worth repairing if under 15 years old.

---

### Bad: Over-Detailed Table
> | System | Cost | Climate | How It Works | Maintenance | Lifespan | Efficiency | Noise | Rebates |
> |--------|------|---------|--------------|-------------|----------|------------|-------|---------|
> | ... | ... | ... | ... | ... | ... | ... | ... | ... |

**Why it fails:**
- 9 columns (unreadable on mobile)
- Too much data at once
- "How It Works" doesn't belong in comparison table

**Fix:** Split into 2 tables or prioritize 4 most important factors.

---

### Bad: Prose Duplication
> Gas furnaces have an efficiency rating of 80-98% AFUE and cost $3,000-5,000 to install. Heat pumps have efficiency ratings of 14-22 SEER and cost $4,000-7,000 to install.
>
> | System | Efficiency | Cost |
> |--------|------------|------|
> | Gas Furnace | 80-98% AFUE | $3,000-5,000 |
> | Heat Pump | 14-22 SEER | $4,000-7,000 |

**Why it fails:** Every table cell is restated in the prose above.

**Fix:** Delete the prose paragraph. Let the table speak.

---

## Checklist Before Publishing

- [ ] Table has ≤4 columns
- [ ] Table has ≤8 rows
- [ ] Header row present
- [ ] Left column identifies what's being compared
- [ ] No cell content appears in surrounding prose
- [ ] Prose intro is ≤2 sentences
- [ ] Prose after table adds NEW context (not table data)
- [ ] Units in headers, not repeated in cells
- [ ] No merged cells
