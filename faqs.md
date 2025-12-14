# FAQ Format Output Style

Automatically generate properly structured, accessible, and SEO-optimized FAQ sections for articles and web content.

---

## What This Guide Covers

**This guide provides:**
- ✓ When to use FAQ format (decision validation)
- ✓ When NOT to use FAQ format (alternative elements)
- ✓ FAQ structure and HTML implementation
- ✓ Accessibility and SEO standards
- ✓ Content guidelines and examples

**This guide does NOT cover:**
- ✗ How to write paragraph prose (see paragraphs.md)
- ✗ YMYL language requirements (see ymyl.md)
- ✗ How to format tables (see tables.md)
- ✗ How to format lists (see lists.md)

---

## When to Use FAQ Format ⭐

Use FAQ format when content naturally answers specific, discrete questions that users commonly ask.

**Primary use cases:**
- ✓ **Addressing specific user questions** that match "People Also Ask" boxes
- ✓ **Clarifying common misconceptions** about the topic
- ✓ **Answering objections or concerns** users have
- ✓ **Explaining technical terms** in simplified language
- ✓ **Covering edge cases** or special circumstances
- ✓ **YMYL content** where transparency builds trust

**Quick validation test:** If the content naturally frames as "question → direct answer" (2-4 sentences), use FAQ format.

**Example situations:**
- "How long does epoxy coating last?" → Direct 2-3 sentence answer
- "Do I need a permit for this work?" → Yes/no with brief explanation
- "Can this work in cold weather?" → Specific conditions and limitations
- "What's included in the service?" → Itemized brief response

**Typical volume:** 3-5 questions per article (optimal for engagement)

---

## When NOT to Use FAQ Format ⭐

Consider alternatives for:

**→ For sequential process explanations:**
Use ordered lists (see lists.md for step-by-step formatting)
*Example: Installation process requiring specific order - not naturally Q&A format*

**→ For comparison data across multiple attributes:**
Use tables (see tables.md for comparison formatting)
*Example: Comparing 3 coating types across 5 factors - table is more scannable*

**→ For feature/benefit lists without questions:**
Use unordered lists (see lists.md for list formatting)
*Example: "Benefits of epoxy flooring" - not phrased as questions*

**→ For concept explanations requiring depth:**
Use paragraphs (see paragraphs.md for prose standards)
*Example: Deep explanation of coating chemistry - too complex for brief FAQ*

**→ For narrative or storytelling content:**
Use paragraphs (see paragraphs.md)
*Example: Customer project story - not a Q&A situation*

**→ For content requiring extensive explanation:**
Use headed sections with paragraphs
*Example: Complex topics needing diagrams, multiple paragraphs, context*

---

## FAQ Redundancy Rule (CRITICAL) ⭐

**FAQs must provide NEW information not already covered in the article body.**

### The No-Redundancy Principle

Before adding any FAQ, ask: "Has this question already been answered in the main content?"

- **YES → Skip this FAQ.** Don't repeat information readers already encountered.
- **NO → Include it.** FAQs should fill gaps, not rehash existing content.

### When to Skip FAQs Entirely

Skip the FAQ section if:

1. **Article already covers all common questions** in proper context
2. **Questions would repeat earlier content** in abbreviated form
3. **Main content is comprehensive** with tables, checklists, and callouts
4. **Article is short and focused** (under 1,000 words with clear answers)

### Acceptable FAQ Content

FAQs ARE appropriate for:

- **Edge cases** not covered in main content (special circumstances)
- **Objections/concerns** users might have after reading
- **Related questions** that don't fit article structure
- **Clarifications** on technical points mentioned but not fully explained
- **"People Also Ask"** questions that weren't the article's focus

### Anti-Pattern: Redundant FAQs

**Wrong:**
```
Article covers: temperature thresholds, when to run pump, emergency steps

FAQs include:
- "What temperature should I run my pump?" ← Already in article
- "What do I do if pipes freeze?" ← Already in article
- "How cold is too cold?" ← Already in article
```

**Right:**
```
Article covers: temperature thresholds, when to run pump, emergency steps

FAQs include:
- "Does pool insurance cover freeze damage?" ← New topic
- "Can I use a space heater near equipment?" ← Edge case not covered
- "Should I drain my above-ground pool?" ← Different pool type not addressed
```

### Decision Matrix

| Article Type | FAQ Recommendation |
|--------------|-------------------|
| Comprehensive guide with tables/checklists | Skip or minimal (1-2 edge cases) |
| Focused single-topic article | Skip if topic fully covered |
| Complex topic with many angles | Include for uncovered angles |
| YMYL content | Include for trust-building clarifications |
| Emergency/action content | Skip - users need action, not Q&A |

**Core principle:** FAQs add value by answering questions the main content couldn't address, not by summarizing what was already said.

---

## When to Include FAQs

### Automatic Triggers
Include FAQ section when detecting:
- Multiple related questions in the topic
- "People Also Ask" opportunities from search results
- Complex topics needing clarification
- Common misconceptions to address
- Technical subjects requiring simplified explanations

### Intent-Based Inclusion

| User Intent | FAQ Priority | Reasoning |
|-------------|--------------|-----------|
| **Emergency** | Optional | Users need immediate action, not Q&A |
| **Research** | Important | Users exploring topic deeply |
| **Transactional** | Minimal | Users ready to act, not research |
| **Problem-Solving** | Helpful | Common follow-up questions likely |
| **Comparison** | Helpful | Clarifies decision factors |
| **YMYL Topics** | Important | Builds trust through transparency |

## FAQ Structure Standards

### HTML Implementation
```html
<section id="common-questions">
    <h2>Common Questions About [Topic]</h2>
    
    <details class="faq-item border rounded mb-3 p-3">
        <summary class="mb-2" id="faq-question-[N]" aria-controls="faq-answer-[N]">
            [Question text without question mark]?
        </summary>
        <div class="faq-body" id="faq-answer-[N]" aria-labelledby="faq-question-[N]">
            <h3>[Exact same question text with question mark]?</h3>
            <p>[Answer text - 2-3 sentences typical, 4 max]</p>
        </div>
    </details>
</section>
```

### Critical Structure Rules

1. **Question Duplication**: The question MUST appear twice:
   - In `<summary>` for the collapsible trigger
   - In `<h3>` for SEO value (search engines index this)

2. **ID Pattern**: Use sequential numbering:
   - `faq-question-1`, `faq-question-2`, etc.
   - `faq-answer-1`, `faq-answer-2`, etc.

3. **ARIA Labels**: Required for accessibility:
   - `aria-controls` on summary links to answer div
   - `aria-labelledby` on answer div links to question summary

4. **Classes**: 
   - `faq-item border rounded mb-3 p-3` for consistent styling
   - `mb-2` on summary for spacing
   - `faq-body` for answer container

## Content Guidelines

### Question Selection
- **3-5 questions per article** (optimal for engagement)
- Target "People Also Ask" boxes from search results
- Address objections or concerns
- Clarify technical terms
- Cover edge cases or exceptions

### Question Format
- Start with interrogative words (How, What, When, Why, Can, Will, Does)
- Keep questions concise (5-12 words ideal)
- Use natural language, not keyword-stuffed
- Match user search intent and phrasing

### Answer Format
- **Length**: 2-3 sentences typical, 4 sentences maximum
- **Style**: Direct and informative
- **Structure**: Answer first, then explain why/how
- **Voice**: Match article tone but slightly more conversational
- **Lists**: Rarely use unless answer has multiple distinct parts
- Keep answers focused and scannable

### What NOT to Include in Answers
- Links (FAQs should be self-contained)
- Promotional content or hard sells
- Complex technical explanations requiring visuals
- Information that contradicts main article
- Vague or non-committal responses

## SEO Optimization

### Schema Markup Compatibility
The structure is designed for easy FAQ schema implementation:
```html
<!-- Can be enhanced with JSON-LD structured data -->
<script type="application/ld+json">
{
  "@context": "https://schema.org",
  "@type": "FAQPage",
  "mainEntity": [{
    "@type": "Question",
    "name": "[Question text]",
    "acceptedAnswer": {
      "@type": "Answer",
      "text": "[Answer text]"
    }
  }]
}
</script>
```

### Keyword Strategy
- Include natural keyword variations in questions
- Don't force primary keyword into every question
- Use long-tail keywords and conversational phrases
- Match "People Also Ask" phrasing when relevant

## Examples by Industry

### Home Services Example
```html
<details class="faq-item border rounded mb-3 p-3">
    <summary class="mb-2" id="faq-question-1" aria-controls="faq-answer-1">
        How long does epoxy coating last on a garage floor?
    </summary>
    <div class="faq-body" id="faq-answer-1" aria-labelledby="faq-question-1">
        <h3>How long does epoxy coating last on a garage floor?</h3>
        <p>Professional epoxy coatings typically last 15-20 years when properly installed and maintained. Factors like UV exposure, chemical spills, and heavy traffic can affect longevity, but quality installation with proper surface preparation makes the biggest difference in lifespan.</p>
    </div>
</details>
```

### Professional Services Example
```html
<details class="faq-item border rounded mb-3 p-3">
    <summary class="mb-2" id="faq-question-1" aria-controls="faq-answer-1">
        Do I need a lawyer for a minor car accident?
    </summary>
    <div class="faq-body" id="faq-answer-1" aria-labelledby="faq-question-1">
        <h3>Do I need a lawyer for a minor car accident?</h3>
        <p>While not always necessary for truly minor accidents with no injuries, consulting a lawyer can help protect your rights if injuries appear later or if there are disputes about fault. Many attorneys offer free consultations to evaluate whether legal representation would benefit your specific situation.</p>
    </div>
</details>
```

### Technical/Software Example
```html
<details class="faq-item border rounded mb-3 p-3">
    <summary class="mb-2" id="faq-question-1" aria-controls="faq-answer-1">
        Can I migrate from WordPress to this platform?
    </summary>
    <div class="faq-body" id="faq-answer-1" aria-labelledby="faq-question-1">
        <h3>Can I migrate from WordPress to this platform?</h3>
        <p>Yes, the platform includes built-in migration tools that preserve your content, URLs, and SEO settings. The process typically takes 2-4 hours depending on site size, and technical support is available to assist with the migration.</p>
    </div>
</details>
```

## Mobile Considerations

The collapsible `<details>` element is mobile-friendly by default:
- Saves vertical space on small screens
- Native browser support (no JavaScript required)
- Touch-friendly tap targets
- Progressive enhancement compatible

## Accessibility Features

Built-in accessibility with:
- Semantic HTML5 elements
- ARIA labels for screen readers
- Keyboard navigation support
- No JavaScript dependencies
- Clear visual focus indicators

## Quality Checklist

Before finalizing FAQ section:
- [ ] 3-5 questions addressing real user needs
- [ ] Questions match search intent and phrasing
- [ ] Each answer is 2-4 sentences maximum
- [ ] Question appears in both summary and H3
- [ ] Proper ID numbering (sequential)
- [ ] ARIA attributes properly connected
- [ ] No promotional content in answers
- [ ] Consistent tone with main article
- [ ] Mobile-friendly collapsible structure

## Common Mistakes to Avoid

1. **Missing H3 duplication** - Loses SEO value
2. **Broken ARIA connections** - Accessibility failure  
3. **Too many questions** - Overwhelming (max 5)
4. **Too long answers** - Defeats quick-scan purpose
5. **Keyword stuffing** - Unnatural and penalized
6. **Generic questions** - Not specific to content
7. **Promotional answers** - Breaks trust
8. **Complex formatting** - Keep answers simple

## Implementation Priority

1. **Always include FAQs for:** Research content, YMYL topics, complex tutorials — *but only for NEW information*
2. **Usually include for:** Problem-solving articles, comparison content — *if gaps remain*
3. **Consider for:** Local service pages, product descriptions — *for edge cases*
4. **Skip for:** Emergency content, simple definitions, pure transactional pages, comprehensive guides that already answer all common questions

**Core principle:** FAQs provide quick answers to specific questions *that aren't already covered in the article*. They fill gaps and address edge cases — they don't summarize or repeat existing content. If the article comprehensively covers the topic with tables, checklists, and callouts, FAQs may not be needed at all.