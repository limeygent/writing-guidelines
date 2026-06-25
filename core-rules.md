# Writing Constitution: Core Rules (Tier 1)

**Load:** ALWAYS, on every content-generation task (page, post, service page, landing page, any copy).
**Purpose:** The single global source of truth. Niche-agnostic. A writer who reads this file plus the
relevant per-client overlay produces copy that passes the post-write audit (`content-audit.md`) on the
first try.

**No em dashes anywhere.** (—) is the #1 lexical AI tell. Use commas, colons, periods, or parentheses.
Hyphens in compound modifiers (long-term, body-composition) are fine.

**This file is global only.** Anything client-specific (brand voice notes, compliance posture, locked
facts like phone/address/license numbers, niche word-bans, claimable differentiators) lives in a thin
per-client overlay in `overlays/`. Core rules state the PRINCIPLE; the overlay supplies the literal.

---

## 0. ORDER OF OPERATIONS (do not skip steps)

This is positive generation procedure, not just a list of bans. Follow the sequence.

1. **Triangulate the intent** (Section 1). Extract observable / inferred / hidden intent for the page.
2. **Lock ONE search intent.** State it as a real query. One page, one primary intent (one secondary at
   most). Multiple intents = split into multiple pages.
3. **Know your hub-and-spoke role** (Section 2) and stay in lane.
4. **Produce the scope ledger** (Section 3) BEFORE any prose. Tag every planned section WRITE / ROUTE /
   CUT. Run each through the fan-out gate. **The ledger overrides any brief or audit.**
5. **Outline query-matchable H2s** from WRITE-tagged sections only, ordered as the searcher's journey
   (Section 6 blueprints).
6. **Open by answering the intent in sentence 1** (Section 4): self-contained, citable, entity-anchored.
7. **Write only on-intent sections.** Benefits before mechanism. Max density and E-E-A-T (Section 5).
8. **Apply the voice** (Section 7), then **strip AI tells** (Section 8), then **dedupe** (Section 9, DRY).
9. **Format with variety** (Section 10): mix prose, lists, tables, FAQ. Never every section a bullet dump.
10. **Output paste-ready HTML** (Section 11) with placeholders for unverified facts (Section 5.4).
11. **Run the pre-publish checklist** (Section 14), then `content-audit.md`. **The LLM audit (`content-audit.md`,
    scored, ideally by a separate validator agent) is a MANDATORY non-skippable gate, not an optional finish.**
    `audit.sh` catches only mechanical tells; it cannot judge intent satisfaction, the substitution test, scope
    drift, DRY, or claim honesty. A draft that has not passed the scored audit is not done. *The deterministic
    scan is necessary but never sufficient.*

**Intent step, when it can be skipped:** Step 1 (triangulate intent) may be skipped ONLY when an upstream
audit already resolved this exact page's intent from real demand (e.g. a bulk search-intent audit that set the
canonical + redirects). For a net-new or never-analyzed page, intent must be DISCOVERED FROM EVIDENCE (live
SERP + People Also Ask, plus GSC query data if the URL exists) before writing, never assumed from the topic
label. Skipping the intent step is never a license to skip the LLM audit (step 11).

**Build process (when producing many pages):** pilot the HARDEST page first, get it approved, then batch
using the approved page as the gold-standard example. Pair a builder with a separate validator/audit agent
plus external fact-check. Bar = zero critical findings; cap fix iterations at ~2 (more than that means the
spec is wrong, not the draft). Rebuild from scratch; never iterate an old skeleton. *Why: from-scratch beats
patching a flawed structure, and a fresh validator catches what the writer is blind to.*

---

## 1. INTENT CONTRACT (triangulate before you redesign)

Before writing, extract three layers. Use them as a contract every section must serve.

| Layer | What it is | What it sets |
|---|---|---|
| **Observable** | The 3-7 word query a user types | Literal H1 + title target |
| **Inferred** | Intent type: informational / transactional / commercial-investigation / navigational | Content type + primary objective verb |
| **Hidden driver** | The emotion underneath: fear / hope / frustration / urgency | The persuasion arc and where to lean |

- Write the **Primary Objective** as one sentence: *"This page exists to [verb] for [reader] who [state]."*
  Every section must serve it. *Why: a stated objective is the test that kills drift sections.*
- **Target reader = the reader's intent, not the business's.** Keep sections that anchor the intent;
  cut, fold, or repurpose sections that drift from it.
- **Mode:** single intent, or primary + ONE secondary. If a page has author-intent only (no real query),
  invent the reader it should serve. Low/medium confidence = a shakier anchor; flag it.

---

## 2. HUB-AND-SPOKE DISCIPLINE (stay in your lane)

Most content sits in a cluster. Know the page's role and do not compete with sibling pages. *Why: when two
pages of one site chase the same query, the site competes with itself (cross-page cannibalization).*

- **Hub** = the commercial/transactional page. Owns: program/service options, tiers, **pricing/cost**,
  what's included, **how to start / first visit / onboarding**, insurance, booking, "[service] near me."
- **Spokes** = per-product/treatment/sub-service detail pages. Own: that item's mechanism, options,
  eligibility, and its own cost.
- **Supporting blog/educational pages** = the why/how/what that makes the case and funnels up. They
  **link UP** to hub/spokes and never host pricing tables, tier comparisons, onboarding steps, insurance,
  or per-item mechanism. Route those with one sentence + an internal link, never a duplicated section.
- **Service/landing pages use ZERO city names** when separate location pages exist. *Why: city mentions on
  the service page cannibalize the location pages built to rank for them.* (Location pages are the exception.)
- When a named product/sub-service comes up on a supporting page, name it and link to its spoke; do not
  re-explain its mechanism.

---

## 3. SCOPE LEDGER + FAN-OUT GATE (the gate that stops scope creep)

Produce this BEFORE writing any prose. List every planned section; tag each. **Write only WRITE-tagged ones.**

| Planned section | Single sub-query it answers | Owner (hub / spoke / this page) | Verdict |
|---|---|---|---|
| e.g. "How much does it cost" | pricing | Hub | ROUTE (1 line + link) |
| e.g. "Why fad diets fail" | comparison vs dieting | This page | WRITE |
| e.g. "What happens at the first visit" | onboarding | Hub | CUT / ROUTE |

- **WRITE** only sections this page owns. **ROUTE** a hub/spoke-owned sub-query with one sentence + a link
  (never a full section). **CUT** anything that fits this page's intent nowhere.
- If you cannot name the single sub-query a section answers, it is drift. Cut it.
- **The ledger overrides the brief.** A content brief or upstream audit can be wrong about scope (it often
  adds cost / first-visit / insurance to pages that should not own them). Run every brief-recommended
  section through this ledger anyway.

**Fan-out gate (run on every candidate sub-query; all three filters must pass).** Build a fan-out tree of 8-14
sub-queries (4 for emergency intent) before drafting; confirm coverage after.

1. **Intent fit.** Is the sub-query an expansion of THIS page's exact intent (same underlying need)? Cost /
   onboarding / insurance are the fan-out of the *buying* intent (hub), not the *understand-and-compare*
   intent (educational). Different need = not this page's.
2. **Upstream DRY check (verify, do not assume).** Actually open the hub/spoke pages and check whether the
   sub-query is already answered there.
   - Already covered upstream -> ROUTE (one sentence + link).
   - Not covered anywhere, fits this page's intent -> WRITE it. This is a genuine gap; capture it.
   - Not covered anywhere, fits a sibling better -> note as a gap for that page; do not force it here.
3. **Cannibalization check (supporting/blog pages especially).** Even if a sub-query passes intent fit and is
   not yet covered upstream, ask whether the sibling commercial page is built to RANK for it. If yes, the blog
   answers it briefly (2-3 sentences) and links up; it does NOT write the deep, fully optimized version.
   *Why: a supporting page that out-optimizes the money page's own fan-out competes with the page it exists to
   feed.* The deep, click-winning treatment belongs on the page that should win the click. Duplication splits
   signals; out-optimizing actively demotes the money page.

Coverage rule: every high-value sub-query is answered in exactly ONE canonical chunk. Decision-critical
sub-queries get a body section, not just an FAQ.

---

## 4. THE OPENER + ZONE 1 (answer the intent immediately)

**Zone 1** = the first 20% of the body, capped at min(0.20 × chars, 2000 chars). It carries the answer.

- **Sentence 1 is a self-contained, citable answer** to the primary query: an LLM can lift it out of
  context and it still stands. Name the entity in it. *Why: the extractable answer is what gets cited.*
- For service/landing pages, sentence 1 follows: *"<brand> is a <niche> that offers <solution> for
  <user problem>."* Then anchor to the provider (named practitioner/credential where relevant + geo).
- Within Zone 1, hit the **4 differentiation signals** within ~3 consecutive sentences: **What** it is,
  **Who** provides it, **What job** it does, **What constraint** applies (eligibility / condition / scope).
- Mirror every decision-critical fact into Zone 1. **No decision-critical fact may be trapped only in a CTA
  block** (e.g. phone, service area, hours for an emergency page belong in Zone 1 prose too).
- **First body section after the opener = benefits before mechanism.** Lead with what the reader gets.
- Do NOT open with a generic hook ("losing weight is hard," "in today's world"), and do NOT include a
  "this page covers X, Y, Z" roadmap. *Why: zero information gain, and the roadmap goes stale when a section
  is cut.*

---

## 5. DENSITY, E-E-A-T, AND CLAIM HONESTY (what makes it rank and get cited)

Goal: content an LLM categorizes as a high-signal, localized authority and can extract clean atomic facts
from. Generic = discarded.

### 5.1 Anchorable statements

Distribute atomic facts across the WHOLE page, not just the FAQ. Every section carries at least one atomic
fact mappable as **entity -> attribute -> value**. Every anchorable statement passes four binary tests:

1. **Names the entity** (the specific brand/product/provider, not "the service").
2. **Makes a specific claim** (a number, named test, named technology, named insurer, stated condition).
3. **Is self-contained** (pronouns resolve; no "as mentioned above"; survives extraction as a chunk).
4. **Passes the substitution test** (Section 5.3).

- Every sentence carries subject-verb-object plus a NEW fact. The first sentence of each section has ≥2 of:
  {named entity not already in the heading, specific data point, stated condition}.
- **Categorical precision:** "single-tooth titanium implant," not "implant." Promote the specific to the
  main clause; do not bury it in a subordinate phrase.
- Do not oversimplify into a bare data point that misleads ("$49/month" with no statement of what it
  includes). *Why: a bare number without its qualifier is a false claim.*
- No unresolved coreference. No elegant variation (do not cycle synonyms for the same entity to sound varied).
- **If the client overlay carries a triple bank (overlay §8), draw anchorable statements from it before
  inventing new ones** — the bank's rows are pre-vetted entity → attribute → value facts. Never generate
  brand triples unvetted: every triple obeys claim honesty (Section 5.4), and an unverifiable one stays a
  `[VERIFY]` placeholder rather than shipping.

### 5.2 Chunk isolation for RAG (critical)

Every bullet lead-in and every short, context-dependent paragraph must stand alone when extracted as a
~500-token chunk: name the subject, the specific topic, and where/who. *Why: retrieval chunks the page;
an orphaned lead-in becomes uncitable.*

- Good: "Common signs of gum disease to watch for:"
- Bad: "Common signs to watch for:"

### 5.3 Differentiation (the substitution test)

Mentally swap the brand for a competitor. If the sentence still reads true, it is commodity: rewrite it with
a specific only this provider can claim. Run it section by section, not on one line.

- Keep name-swappable content under 40% of body words.
- Unique-data density: ≥3 provider-specific sentences per 1000 body words.
- Include ≥1 unique angle that 5+ competitors would not state, and ≥3 externally verifiable trust signals.

### 5.3a Triple deployment and entity co-occurrence

A semantic triple is the smallest fact a machine reads cleanly: **Subject → Predicate → Object**, fixed
order ("Rapid Weight Loss Centers prescribes compounded semaglutide"). A bare brand *mention* makes the
model guess the relationship from surrounding text; a mention wrapped in a triple hands it the entity *and*
the relationship at once. Mention plus triple beats mention alone — one gets you named, the other gets you
understood well enough to be cited. How to deploy them in prose:

- **Associate the brand with its category and adjacent/competitor entities (new).** Place the brand in
  explicit relationships with the category and the named things a reader searches, so an LLM learns the
  category membership and "would be remiss not to mention us in the same breath" as a competitor. Strongest
  on mid/bottom-funnel pages — comparisons, "X vs Y", reviews, best-of/listicles. *Why: an entity an LLM
  never filed under a category cannot surface in that category's answers.*
- **Answer-first sentence phrasing (new).** Lead the sentence with the claim, not the attribution: "Phentermine
  suppresses appetite, according to the prescribing guidance," NOT "According to the prescribing guidance,
  phentermine suppresses appetite." Editors hate it; do it anyway — both humans and LLMs skim the front of
  the sentence.
- **One clean triple per core concept, not a wall of them.** Heuristic: "would reading this make a human throw
  their phone in the pool?" This is the DRY rule and the cohesion guardrail (Section 5, end) restated for
  triples — define a fact once in its canonical chunk; do not stack dictionary entries.
- **Put the triple early in the paragraph** so an extracted ~500-token chunk still represents the idea
  (Section 5.2). Order sentences so the lead is the fact, not the wind-up.
- **One source for humans and bots (new, anti-pattern).** Never write a separate machine-only copy of a page:
  near-duplicate human/bot versions risk a similarity penalty, and a human who hits the bot version remembers
  the brand as low-quality. Feed two birds with one scone.

Worked example — plain prose rewritten as triples (from HubSpot's published +58% AI mentions / +642% AI
citations test):

- Prose: "With drag-and-drop functionality and an intuitive interface, this tool makes it easier than ever to
  build beautiful campaigns, automate follow-ups, and analyze performance — no coding necessary."
- Triples: "HubSpot offers an email marketing tool that supports drag-and-drop campaign creation." /
  "Marketers can automate follow-ups using built-in workflows." / "HubSpot's email analytics provide insights
  on open rates, click-throughs, and engagement trends." / "No coding is required to design personalized emails."

Triples are also the native format of Google's Knowledge Graph and map ~1:1 onto Schema.org JSON-LD, so the
same work that earns LLM citations strengthens classic search. Triples are *necessary* for AEO, *beneficial*
for SEO — but never sufficient alone (they ride alongside schema, links, and the rest of the stack).

*Provenance: this subsection and the +58%/+642% example derive from Sizemore and SEO Notebook (Steve Toth /
HubSpot). Originals + the trace for every figure: `sources/INDEX.md`.*

### 5.4 Claim honesty (never fabricate)

- **Target vs measured language.** Placeholder or aspirational numbers use forward-looking language ("we
  aim to," "we typically"), never measured-statistic language ("the average was X in 2024"). *Why: measured
  phrasing falsely asserts an audit trail.*
- **Credential currency in the same sentence.** State that a licence/registration/insurance/warranty is
  active / in force / currently registered INSIDE the sentence that mentions it. *Why: an LLM extracting the
  chunk will not infer "still valid" from context.*
- **Quote statutes/regulations verbatim;** never paraphrase a legal requirement.
- **Verify before publish** any number, "first/only" claim, success rate, or comparison.
- **Never invent facts.** Anything not verifiable from the client or a live page becomes a visible
  placeholder (e.g. `<mark class="verify">[VERIFY: ...]</mark>` or `[NEEDS FROM CLIENT: ...]`) so it cannot
  ship by accident. List every placeholder in an HTML comment at the bottom of the file. Never fabricate
  credentials, registration numbers, pricing, success rates, testimonials, addresses, or phone numbers.

### 5.5 Trust signals

Named author with registration/licence number, credentials, named external sources (cited, not
paraphrased), years in operation, named technology, named insurers/partners, honest failure/risk rates,
named address. The specific differentiators a given client may claim live in that client's overlay.

---

## 6. STRUCTURE: ORDER SECTIONS AS THE SEARCHER'S JOURNEY

One fan-out sub-query = one section = one persuasion job. Order serves the human arc, not the business's.
Mark CTA placements explicitly. Pick the blueprint by page type:

| Page type | Section order |
|---|---|
| **Service** | Zone 1 answer + credibility -> mechanism / does-it-work -> options + pricing (CTA) -> process / de-risk -> proof (CTA) -> eligibility + objections (FAQ) -> location (final CTA) |
| **Emergency** | phone + availability + service area in Zone 1 (the CTA IS the answer) -> response time -> pricing basis -> trust -> FAQ. Credibility and education come AFTER the immediate answer |
| **Comparison** | Zone 1 verdict + table -> per-option detail -> decision criteria ("choose X if") -> proof -> FAQ -> CTA |
| **Blog / educational** | Zone 1 definition -> mechanism -> implications -> what to do (soft CTA) -> FAQ |
| **Location** | am-I-in-the-right-place -> what's offered -> why this provider -> next step |

**Service-page archetypes & conditional blocks.** Emergency (urgency, act now) and general/planning
(research) need different block order: phone-only CTA for urgent, form for planning, hybrid for general.
Page modifiers (high-stakes / regulated / high-ticket / recurring) switch on conditional blocks. **Prefer
suppressing a block over filling it with generic content: missing beats generic.**

**MECLABS conversion weighting** (high-motivation service visitors): C = 4m + 3v + 2(i − f) − 2a. Motivation
(4×) > Value (3×) > Anxiety / Friction / Incentive (2×). On a high-motivation page, do not sell the problem
the reader already has: pivot to value clarity, anxiety reduction, friction reduction, urgency. Minimize any
form to 2-3 fields. Put 2+ local references per page. Quantify-or-kill every claim (run a falsifiability
test on every sentence). Progressive CTAs: never repeat the same CTA verbatim.

**Trust hierarchy for local pages** (weak to strong): star ratings < licence # + named insurance <
hyperlocal data < code versions / ordinance numbers. Reach for the strongest signal you can verify.

### Heading hygiene

- Exactly **one H1**: primary query + qualifier, entity-scoped.
- H2s are **query-matchable** (read like a real search), **sentence case**, **no colons**.
- No category-label, filler-framing, or clever/copywriter headings: ban "Understanding the Role of," "A
  Comprehensive Guide to," gerund + abstract-noun ("Restoring Confidence"), rhetorical/CTA headings, and
  "Challenges and Future Prospects." Use the reader's actual question.
- Semantic hierarchy, no skipped levels, no fragmented headers.

### Section integrity

- Every section belongs to the fan-out set. One section answers one question. Re-anchor the entity (no "as
  mentioned above").
- An in-set section over **250 words AND over 40% of body** must be split. An out-of-set section over 250
  words becomes its own page.

---

## 7. VOICE

One consistent voice for the whole page: the business talking to the customer (we / our / your). Never the
LLM talking to the operator. No authorial "I" ("I want you to know," "I'd be cautious"). FAQ questions in
the searcher's voice ("Can I combine...") are fine: that is the user speaking.

- Conversational, not academic. Contractions fine. Warm, plain, confident. Never hypey, slangy, or salesy.
- **Frontload the takeaway:** the H2 and the first sentence are the answer.
- **Vary sentence AND paragraph length.** Three back-to-back 13-15 word sentences is the most reliable AI
  tell. Mix one-line punches with longer explanatory sentences. Add soul: have a specific opinion, be concrete.
- Brief empathy is allowed; filler empathy is not (Section 8).

**Audience registers** (apply the one that fits):

- **Non-technical client UI / dashboard copy:** lead with the scenario, not a definition. No
  troubleshooting. Reference only what the user can already see. Cut analyst-speak ("fires when," "KPI,"
  "ratio"). Trim every pass.
- **Distressed-consumer copy:** direct second person, short paragraphs, question-form H2s, explain any
  jargon in parentheses.
- **High-motivation service visitor:** they already have the problem; do not sell it. Pivot to clarity,
  anxiety reduction, friction reduction, urgency.

**Business vs licensed-individual attribution.** The *business* provides / offers / accepts / is a preferred
provider. The *licensed individual* assesses / examines / performs / plans. *Why: registries and funds
register the business entity, not the practitioner, for commercial actions.*

**Self-critique honesty.** When asked whether the draft violated rules, name specific violations with rule
+ instance + severity. No generic reassurance.

---

## 8. AI-TELL REGISTRY (one canonical list; strip every one)

The durable, high-signal tells are **structural** (the first block). The lexical/punctuation list is a
weaker signal now (models suppress it, humans use it), so remove obvious instances but never rely on it as
the primary detector. *Why each is banned: it reads as machine-generated and erodes trust + extractability.*

### Structural tells (highest signal)

1. **Contrastive-negation pile-ups (the #1 tell).** "not X, it's Y" / "not just X, but Y" / "works with your
   body, not against it." **Max once per page; zero is better.** To prevent the tic: lead with what something
   IS; delete defensive framing that preempts an objection nobody raised; if you must contrast, do it in one
   clause ("X, not Y"); avoid "more than" and "not just." No tailing negations.
2. **Rule-of-three pile-ups.** Stop making every list a tidy "X, Y, and Z." Vary the count (one, two, four).
3. **Formulaic section skeleton.** Every section running claim -> bullets -> moralizing wrap, with uniform
   paragraph and sentence length. Vary structure across sections.
4. **Inflated-significance / puffery.** "stands as a testament," "plays a vital / crucial / pivotal role,"
   "game-changer," "cutting-edge," "state-of-the-art," "world-class," "comprehensive solution,"
   "life-changing." Replace with a concrete fact.
5. **Superficial trailing -ing analysis clauses.** "..., highlighting the importance of," "..., underscoring
   the need for," "..., ensuring the best outcomes," "..., making it a great choice." Cut or replace with a
   real consequence.
6. **Vague attribution.** "studies show," "research suggests," "experts agree," "it is well known." Name the
   source or drop the claim.
7. **Promotional / travel-brochure language.** "boasts," "nestled," "in the heart of," "renowned." Cut it.
8. **Performative honesty / narrator throat-clearing.** "Let's start with the truth most pages skip," "Here
   is the honest part," "An Honest Answer," "The good news is," "You now know more than most clinics tell you."
   This is a CONSTRUCTION FAMILY, not three fixed strings: ban "the honest answer/part/truth/framing/caveat
   (is/to)…" and "here is/here's the honest…" in any phrasing. State the fact directly without announcing you
   are being honest. Same family: the **significance-inflation flag** ("X deserves extra/special weight/
   attention," "two patterns deserve extra weight regardless of width") and the **disclaimer-pivot** ("None of
   this replaces a professional/measured evaluation, but…," "…tells you which lane you are in"). Give the point
   or the caveat plainly; drop the "none of this replaces… but" scaffolding and "which lane you are in" filler.
9. **Throat-clearing intros.** "It's important to understand," "When it comes to," "Prior to," "A short word
   on X, because…," "A quick note on X." Just say the thing; do not announce that you are about to say it.
10. **AI-signature transitions.** "That said," "What's more," "Furthermore," "Moreover," "Additionally," "In
    essence," "Ultimately," "Here's the thing:," "It's worth noting that," "In conclusion." Start the next
    sentence with its content instead.
11. **Filler tropes / generic behavioral fluff.** "eat less, move more," "in today's fast-paced world,"
    "now more than ever," "take control of your health," "losing weight is a journey." Zero info gain.
12. **Empathy fluff.** "You're not alone," "Don't worry," "We understand." (Brief, specific empathy is fine.)
13. **Colon-splice subheadings.** "Slab vs Pier-and-Beam: Which Signs Apply to Your Home," "Drainage: What to
    Check First." The "Topic: explainer" subheading is an AI heading tic. Reword H2/H3 to a plain phrase or a
    real question ("Which signs point to slab vs pier-and-beam?"). The H1/title may keep a colon subtitle.

### Lexical / punctuation tells (weaker signal; still clean obvious cases)

- **No em dashes and no en dashes anywhere.** Use comma / colon / period / parentheses.
- **Inflated vocabulary -> plain word:** utilize -> use, leverage -> use, myriad -> many, prior to ->
  before, facilitate -> help, initiate -> start, in order to -> to. The "delve / tapestry / underscore /
  pivotal / landscape / vibrant" list is now a WEAK signal: remove obvious instances, do not chase it.
- **Use simple copulas.** Don't avoid is/are to sound sophisticated.
- No exclamation marks unless genuinely urgent. No emojis. No mechanical boldface, no inline-header vertical
  lists. Straight quotes, not curly. Sentence-case headings. Do not over-hyphenate. No false ranges.
- No chatbot artifacts ("Certainly!", "I hope this helps"), no knowledge-cutoff disclaimers, no sycophancy,
  no excessive hedging, no generic positive conclusions, no needless passive or subjectless fragments.
- No persuasive-authority tropes ("the real question is," "at its core") and no signposting ("Let's dive in").

**Target:** fewer than 5 AI-fingerprint markers across the whole page.

---

## 9. DRY: SAY IT ONCE

Same information twice is an instant rejection. *Why: duplication wastes the reader's time, dilutes the
canonical chunk, and bloats the page.*

- Table + prose restating the table = REJECT. Concept in the overview and again in a later section = REJECT.
  Same step repeated across symptoms = REJECT.
- **Cross-page DRY:** never duplicate a section the hub/spoke already owns (Section 2). Route + link instead.
- No claim restatement across intro / body / conclusion. No summary padding. No transitional filler.
- Re-anchor the entity only when it adds a NEW attribute, not for rhythm.
- A repeated stock phrase (any phrase 3+ times unchanged) = REJECT. Vary it, link it, or consolidate to one
  "when to act" section. Cross-reference with one sentence: "As covered in [section]..."
- **Cohesion guardrail.** Self-contained chunks must still form one logical narrative journey, not a stack of
  pasted dictionary entries. Define a foundational term ONCE in its canonical chunk, then build on it; do not
  re-define the same term in consecutive headers. Standalone does not mean disconnected or repetitive. *Why:
  over-applying chunk-isolation produces pages that re-explain the basics every section and never progress.*

---

## 10. FORMAT WITH VARIETY (break walls of text, but not into all-bullets)

Mix prose, short lists, tables, and FAQ accordions. Making every section a bullet list is its own AI tell.

| Use a... | When |
|---|---|
| **Table** | 2+ entities compared across the same attributes; specs; pricing tiers; decision matrices |
| **Numbered list** | A sequence / procedure / steps |
| **Bulleted list** | 3+ parallel items |
| **Paragraph** | Relational or explanatory content, nuance, transitions (the FALLBACK) |

- Wide tables (4+ columns) get a horizontal-scroll wrapper for mobile.
- Paragraphs: 2-3 sentences ideal, 4 max, one idea each, topic sentence after every H2.
- Tables and FAQs: tier-2 format guides (`format-tables.md`, `format-lists.md`, `format-faqs.md`) carry the
  full markup. Headlines: every table's first data-row cell is `<th scope="row">`; FAQs use native
  `details/summary` with the slug = first sentence of the question (apostrophes stripped before hyphenating,
  never `faq-1`); table id = slug of the nearest H2.

---

## 11. ACCESSIBILITY & HTML OUTPUT (global baseline)

- **WCAG AA contrast on every text/background pair:** 4.5:1 normal text, 3:1 large text + UI. Check the
  math; do not eyeball saturated brand mid-tones (they almost always fail on white). Fix by darkening the
  text, not lightening the background. Check every interactive state.
- **Descriptive link text:** every anchor describes its destination's TOPIC in isolation. Ban "Learn more,"
  "Click here," "Read more," "Here," and icon-only links. **Never anchor an internal link on the
  brand/business/practitioner name when it points to a topic page** (a name is navigational, not topical):
  keep the brand as a plain-text entity mention and put the link on a phrase that names the destination's
  subject, e.g. link "medical weight loss program" -> the service hub, not "Acme Weight Loss Centers."
  Phone CTAs spell out the number. Vary internal anchor text across the page. *Why: fails WCAG 2.4.4 and
  zeroes out the anchor-text signal for SEO and LLM crawlers; a brand-anchored link wastes the topical
  signal the linked money page needs to rank.*
- **Page-level WCAG:** skip link, a `main` landmark, `focus-visible` (3px outline), `scroll-padding-top` so
  a sticky header doesn't obscure focused elements, muted text ≥4.5:1.
- `role="doc-biblioentry"` is deprecated: strip it from reference `<li>` (keep `doc-bibliography` +
  `doc-biblioref`).
- **Scoped CSS, no leakage:** one `<style>` block scoped under a single container class. For WordPress body
  content output BODY ONLY (no `<!DOCTYPE>` / `<html>` / `<head>` / `<body>`, and **no `<h1>`** when the
  CMS title supplies it).
- **No public email** on any service-business site (no `mailto:`). Contact triad = call / text / form.
  *Why: mailto is a spam vector with near-zero conversion upside.*

The container class name, brand colors, fonts, and any client-specific CSS are in the client overlay, not here.

---

## 12. ON-PAGE SEO (authorable elements)

- **Title:** front-load the primary keyword in the first ~5 words; brand after a separator; 30-130 chars.
- **Meta description:** a value-first click CTA, not a summary; ~155 visible chars (70-160 total).
- **Slug:** descriptive, ≤5 words / 60 chars, lowercase, hyphenated.
- Exactly one H1; intent satisfied above the fold; content type matches intent; depth the intent demands
  without keyword stuffing.
- Canonical self-referential; robots not noindex; charset + viewport present.
- Outbound links to authoritative sources with the correct `rel`. Image `alt` specific (not stuffed),
  decorative images `alt=""`, descriptive filenames.
- Schema present (Organization / LocalBusiness / Service / FAQPage) as hygiene, not as a citation lever.
- OG core tags present.

---

## 13. COMPLIANCE POSTURE (match the client's signed-off stance; never invent claims)

There is no single global compliance posture. **Match the compliance posture the client has signed off, as
recorded in that client's overlay.** Some clients are permissive (the practitioner has approved specific
claims); some are tightly regulated. Either way:

- **Never strip required compliance text** (regulator hedging, "results vary," therapeutic disclaimers).
  Hedged language in a regulated niche is required, not filler.
- **If a required condition lives only in a compliance block, duplicate it into the sentence that makes the
  claim** (Section 5.1). *Why: a chunk extracted without the disclaimer becomes a non-compliant claim.*
- **Use the client's approved claims; do not hedge them away.** If the overlay says a claim is signed off,
  state it plainly.
- **Compliant language stays authoritative.** Required hedging belongs on the claim, not on the sentence's
  structure. Keep subject-action-result: "A provider determines whether semaglutide is appropriate based on
  your medical history," not "semaglutide might potentially be something a provider could look at." Do not
  stack qualifiers ("may possibly help some patients in certain cases"); one qualifier on the verb is enough.
  *Why: stacked hedges destroy extractability and authority while adding no compliance value.*
- **Never invent a claim** the client has not approved, and never assert a credential without stating its
  currency (Section 5.4).
- Regulated-niche restricted terminology and word-bans are client-specific: see the overlay.

For YMYL topics (health / finance / legal / safety) load `ymyl-overlay.md` for the qualified-language and
conditional-claim constraints on top of this section.

---

## 14. PRE-PUBLISH CHECKLIST

Run before handing the file over, then run `content-audit.md` for scoring.

- [ ] One search intent locked; intent contract (observable / inferred / hidden) written.
- [ ] Hub-and-spoke role known; nothing a sibling page owns slipped in; service pages carry zero city names
      (location pages excepted).
- [ ] **Scope ledger produced; every shipped section is WRITE-tagged** and names its single sub-query.
      Fan-out gate run (hub/spoke actually read; duplicates routed + linked).
- [ ] Sentence 1 answers the intent, self-contained and citable, entity-anchored. Zone 1 carries the 4
      differentiation signals and every decision-critical fact (none trapped only in a CTA).
- [ ] Benefits before mechanism. Every section carries ≥1 atomic fact; chunk lead-ins self-contained.
- [ ] Substitution test passes section by section; <40% name-swappable body; ≥3 provider-specific
      sentences per 1000 words; ≥1 unique angle; ≥3 verifiable trust signals.
- [ ] Claim honesty: target-vs-measured language correct; credential currency stated in-sentence; statutes
      verbatim; every unverified fact a visible placeholder; nothing fabricated.
- [ ] One H1 (or none if CMS supplies it); all H2s query-matchable, sentence case, no colons; semantic
      hierarchy intact.
- [ ] **AI-tell sweep complete:** 0 em/en dashes; contrastive-negation ≤1; no rule-of-three rhythm; no
      formulaic claim->bullets->wrap; no puffery; no trailing -ing analysis; no vague attribution; no AI
      transitions; <5 fingerprint markers total.
- [ ] One consistent voice (business -> customer), no authorial "I"; sentence AND paragraph length varied.
- [ ] DRY: each concept once; no cross-page duplication; no phrase 3+ times.
- [ ] Format varied (prose + lists + tables + FAQ), not every section a bullet dump; wide tables wrapped.
- [ ] Accessibility: WCAG AA contrast checked (math, not eyeball); descriptive link text; skip link / main
      landmark / focus-visible; scoped CSS; no public email.
- [ ] On-page SEO: title front-loads keyword (30-130); meta is a CTA (70-160); slug ≤5 words; schema + OG
      present; image alts specific.
- [ ] Compliance posture matches the client overlay; required disclaimers intact and mirrored into claims.

---

## 15. THRESHOLDS (quick reference)

| Metric | Value |
|---|---|
| Zone 1 size | min(0.20 × chars, 2000 chars) |
| Page length: blog | 2,000-8,000 chars |
| Page length: service / location | 3,000-10,000 chars |
| Page length: comparison | 5,000-15,000 chars |
| Page length: emergency | 1,500-5,000 chars |
| Section split | in-set >250 words AND >40% body -> rebalance; out-of-set >250 words -> own page |
| Fan-out sub-queries | 8-14 (emergency 4) |
| Differentiation | 4 signals within ≤3 consecutive sentences = PASS |
| Unique-data density | ≥3 provider-specific sentences / 1000 body words |
| Name-swappable body | <40% |
| AI fingerprint markers | <5 across page |
| Commoditization 5-test | 0 = clean, 1-2 = partial, 3-4 = commoditized, 5 = full AI slop |
| Title / meta | title 30-130 chars; meta 70-160 chars |
| Slug | ≤5 words / 60 chars |
| Audit score (`content-audit.md`) | ≥88 publish, 66-87 minor fixes, <66 rewrite |

**Commoditization 5-test (each is a strike):** ≥40% body swappable / unique-data <3 per 1000 / no unique
angle / <3 trust signals / ≥5 AI markers.

---

## Quick Reference Card

```
BEFORE WRITING
  - Triangulate intent (observable / inferred / hidden); lock ONE query
  - Know hub-and-spoke role; stay in lane
  - Scope ledger (WRITE / ROUTE / CUT) + fan-out gate  <- THE GATE
  - Pick the page-type blueprint

WHILE WRITING
  - Sentence 1 = self-contained, citable, entity-anchored answer
  - Benefits before mechanism; 4 differentiation signals in Zone 1
  - >=1 atomic fact per section; chunk lead-ins self-contained
  - Substitution test every section; vary sentence + paragraph length
  - Each concept ONCE; tables hold data, prose introduces

AFTER WRITING
  - AI-tell sweep (0 em dashes, contrastive-negation <=1, <5 markers)
  - Claim honesty (target-vs-measured, credential currency in-sentence)
  - WCAG AA contrast + descriptive links; scoped CSS; no public email
  - Title/meta/slug; placeholders for unverified facts
  - Pre-publish checklist -> content-audit.md
```
