# FAQ Formatting Guide (Tier 2)

**Load:** Auto-loads when content includes FAQ section
**Purpose:** When and how to include FAQs that add value

---

## The Cardinal Rule

**FAQs must provide NEW information not already covered in the article.**

If your FAQ answer restates content from above, delete the FAQ. Redundant FAQs waste reader time and violate DRY principles.

---

## When to Include FAQs

### Include FAQs When:
- Questions address related concerns not covered in main content
- Schema markup will benefit search visibility
- Questions represent actual search queries (check "People Also Ask")
- Answers are self-contained (reader doesn't need article context)

### Skip FAQs When:
- Main article is already comprehensive
- Questions would duplicate article sections
- You're adding FAQs just for SEO (forced, not useful)
- Answers require reading the article first

---

## FAQ Limits

| Element | Limit | Rationale |
|---------|-------|-----------|
| Total FAQs | 3-5 | More = diminishing value |
| Answer length | 2-3 sentences | 4 sentences max |
| Questions | From real searches | Not invented |

---

## Question Quality

### Good Questions
- Come from "People Also Ask" or keyword research
- Are genuinely asked by searchers
- Address adjacent concerns to the main topic
- Can be answered concisely

### Bad Questions
- Invented to stuff keywords
- Restate the article's main topic
- Require lengthy explanations
- Are too narrow or technical

### Question Format
- Write as the searcher would ask
- Use natural language (not keyword-stuffed)
- Include question mark
- Start with: How, What, Why, When, Can, Should, Is, Does

---

## Answer Quality

### Good Answers
- Self-contained (no "as mentioned above")
- Direct (answer in first sentence)
- Concise (2-3 sentences)
- Actionable when appropriate

### Bad Answers
- Start with "Great question!" or similar
- Reference other parts of the article
- Are vague or hedge excessively
- Exceed 4 sentences

### Answer Structure
1. **Direct answer** (first sentence)
2. **Brief explanation** (if needed)
3. **Next step or qualifier** (if needed)

---

## FAQ vs. Article Content

### Main Article Should Cover:
- Primary search intent
- Core information everyone needs
- Step-by-step procedures
- Main decision factors

### FAQs Should Cover:
- Secondary questions related to topic
- Edge cases or exceptions
- "What about..." scenarios
- Quick clarifications

### Example Split

**Article topic:** "Furnace blowing cold air"

**Main article covers:**
- Common causes (4-5)
- DIY troubleshooting steps
- When to call a professional
- Safety concerns

**FAQs cover:**
- "How long should I wait before calling for service?"
- "Is it safe to keep running my furnace?"
- "Will this be covered by my warranty?"
- "How much does a typical repair cost?"

These are related but distinct from the core troubleshooting content.

---

## Schema Markup

FAQ schema can be a **separate script block** from other page schema (Article, LocalBusiness, etc.). Google parses multiple JSON-LD blocks on a page and associates them with the same URL.

### Basic FAQ Schema
```html
<script type="application/ld+json">
{
  "@context": "https://schema.org",
  "@type": "FAQPage",
  "mainEntity": [
    {
      "@type": "Question",
      "name": "Question text here?",
      "acceptedAnswer": {
        "@type": "Answer",
        "text": "Answer text here."
      }
    }
  ]
}
</script>
```

### HTML Structure (Bootstrap 5 Accordion)

```html
<section class="faq">
  <h2>Frequently Asked Questions</h2>

  <details class="faq-item border rounded mb-3 p-3">
    <summary id="faq-question-1" class="mb-2" aria-controls="faq-answer-1">
      Question text here? (Natural language, how the searcher would ask)
    </summary>
    <div id="faq-answer-1" class="faq-body" aria-labelledby="faq-question-1">
      <h3>Question text here?</h3>
      Answer text here. Keep to 2-3 sentences. Be direct - answer in the first sentence,
      then add brief context or next steps if needed. Make answers self-contained so
      readers don't need to read the full article.
    </div>
  </details>

  <details class="faq-item border rounded mb-3 p-3">
    <summary id="faq-question-2" class="mb-2" aria-controls="faq-answer-2">
      Second question here?
    </summary>
    <div id="faq-answer-2" class="faq-body" aria-labelledby="faq-question-2">
      <h3>Second question here?</h3>
      Second answer here. Include local/specific context when relevant (e.g., regional
      conditions, specific equipment, local regulations). This differentiates your
      content from generic answers.
    </div>
  </details>

</section>
```

**Required elements:**
- `<details>` wrapper with `faq-item border rounded mb-3 p-3` classes
- `<summary>` with unique `id` and `aria-controls` matching the answer div
- `<div>` answer with matching `id` and `aria-labelledby` for accessibility
- `<h3>` repeating the question inside the answer div
- Increment IDs for each FAQ (faq-question-1, faq-question-2, etc.)

---

## Examples

### Good: FAQs Add New Information
**Article:** "Why is my furnace blowing cold air" (covers causes and DIY fixes)

> **Frequently Asked Questions**
>
> **How long should I troubleshoot before calling a technician?**
> If basic checks (filter, thermostat, pilot) don't resolve the issue within 30 minutes, call for service. Continuing to run a malfunctioning furnace can cause additional damage.
>
> **Is it safe to keep my furnace running while it blows cold air?**
> Generally yes, unless you smell gas or hear unusual noises. The blower running with cold air isn't dangerous, but it's wasting energy. Turn the system to OFF until you can diagnose or get service.
>
> **Will a cold air repair be covered by my warranty?**
> Parts warranties typically last 5-10 years, labor warranties 1-2 years. Check your paperwork. Most causes of cold air (filter, thermostat) aren't warranty issues, but component failures like ignitors or limit switches often are.

**Why it works:**
- None of these duplicate article content
- All are genuinely asked questions
- Answers are self-contained
- Each is 2-3 sentences

---

### Bad: FAQs Duplicate Article
**Article:** Already covered dirty filters, thermostat issues, pilot lights

> **Frequently Asked Questions**
>
> **What causes a furnace to blow cold air?**
> The most common causes are dirty air filters, thermostat issues, and pilot light problems. Check your filter first, then verify thermostat settings, then inspect the pilot.
>
> **How do I check my furnace filter?**
> Locate the filter in the return air duct or furnace cabinet. Remove it and hold up to light. If you can't see through it, replace it.

**Why it fails:**
- Q1 restates the entire article premise
- Q2 duplicates a procedure already in the article
- Reader gains nothing new

**Fix:** Delete these FAQs entirely, or replace with adjacent questions not covered.

---

### Bad: Forced/Invented FAQs
> **Frequently Asked Questions**
>
> **What is the best HVAC company in Dallas for furnace repair?**
> [Company name] has served the Dallas area for 20 years with certified technicians...
>
> **Why should I choose professional furnace repair?**
> Professional technicians have the training and tools to diagnose issues quickly and safely...

**Why it fails:**
- Q1 is self-promotional, not a real user question
- Q2 is generic filler, not topic-specific
- Neither adds value for the reader

---

### Good: Concise Answers
> **How much does furnace repair typically cost?**
> Most repairs range from $150-500 for common issues like ignitors, flame sensors, or limit switches. Major repairs (blower motor, control board) can reach $500-1,000. Get a diagnosis before authorizing repair.

**Why it works:** Direct cost range, context, actionable advice. 3 sentences.

---

### Bad: Overly Long Answer
> **How much does furnace repair typically cost?**
> The cost of furnace repair can vary significantly depending on several factors. First, you need to consider the type of repair needed. Simple repairs like replacing a flame sensor might cost around $150-200, while more complex repairs could be much more expensive. The age of your furnace also matters, as older units may have parts that are harder to find. Labor rates vary by company and region, with most technicians charging $75-150 per hour. Additionally, emergency or after-hours service calls typically cost more. It's always a good idea to get multiple quotes...

**Why it fails:** 100+ words for a simple question. Buries the answer in caveats.

---

## When to Skip FAQs Entirely

Skip the FAQ section if:

1. **Article is short** (<800 words) - FAQs would be proportionally too long
2. **Article is comprehensive** - Nothing useful left to add
3. **No real questions exist** - "People Also Ask" is empty or irrelevant
4. **FAQs would duplicate** - Every question restates article content
5. **Forcing it** - You're adding FAQs because "articles should have FAQs"

**It's better to have no FAQs than redundant FAQs.**

---

## Checklist Before Publishing

- [ ] Each FAQ provides NEW information not in the article
- [ ] Questions come from real searches (PAA, keyword research)
- [ ] Answers are 2-3 sentences (4 max)
- [ ] Answers are self-contained (no "as mentioned above")
- [ ] Total FAQs: 3-5 (not more)
- [ ] Schema markup included
- [ ] No promotional or self-serving questions
- [ ] FAQs would pass the "would I delete this?" test
