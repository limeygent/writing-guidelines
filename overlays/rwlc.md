# Client Overlay: Rapid Weight Loss Centers (RWLC)

Thin per-client overlay. Carries ONLY RWLC-specifics. The global base is `../core-rules.md` (the Writing
Constitution): load it first, then this file. Everything global (intent contract, scope ledger, fan-out
gate, AI-tell registry, chunk isolation, accessibility, on-page SEO) lives there and is NOT repeated here.
The gold-standard worked examples are in the RWLC repo:
`research/blog-intent-audit/rewrites/beyond-the-diet-consolidated.html` (medically-supervised pillar) and
`research/blog-intent-audit/rewrites/cut-sugar-consolidated.html` (sugar cluster). Blog consolidation
strategy and per-cluster intent: `research/blog-intent-audit/FINDINGS-AND-REWRITE-STRATEGY.md`.

---

## 1. Brand voice notes

- Tone: doctor-to-patient. A physician explaining clearly to a frustrated patient who wants real help.
  Conversational, caring, educational, but not too casual. Warm, plain, confident. Never slangy, hypey, salesy.
- POV: the practice ("we / our / your physician"). No authorial "I". FAQ questions in the searcher's voice
  ("Can I combine...") are fine.
- Brief, specific empathy is welcome ("If you have tried to lose weight on your own and watched it come
  back..."); no filler-empathy tropes.

## 2. Compliance posture (signed off by the doctor)

- Regulatory context: US: FDA / FTC / SC medical board (NOT AHPRA, NOT ACCC).
- Posture: **permissive.** Compliance is NOT a blocker on RWLC copy unless the client says otherwise.
- **Approved claims (use plainly, do NOT hedge away):** "10 to 30 pounds a month eating real food from a
  local supermarket," "10 to 20 in the first month, 30+," belly-fat language, HCG, and the FDA-disfavored
  medication language. The doctor has signed these off.
- **Required:** still never fabricate a fact that is not approved or verifiable (see Locked facts and the
  global Section 5.4). Permissive posture covers the approved-claim list, not invented numbers.
- Sign-off: Dr. Kevin Sattele (per RWLC SOP Section 9).
- **Medical-content guardrails (weight loss):** no guaranteed results, and never frame a medication as right
  for everyone. Mention medical supervision whenever a prescription treatment is discussed. For each
  treatment, explain what it does, who may be a candidate, and how follow-up and monitoring work. Use careful
  verbs on the claim ("may help," "may be appropriate," "a provider determines"), but keep the sentence an
  authoritative subject-action-result statement (core-rules Section 13); do not stack qualifiers.

## 3. Locked facts (verbatim; never paraphrase or invent)

- Practitioner: **Dr. Kevin M. Sattele, MD** — board-certified internal medicine physician (American Board
  of Internal Medicine; certified 1998, recertified 2008 and 2018).
  - **CANONICAL CREDENTIAL CLAIM (state with confidence; doctor-approved):** *"Dr. Kevin M. Sattele is a
    board-certified internal medicine physician with more than 20 years of clinical bariatric experience."*
    This is the precise, defensible framing — **internal medicine = the board certification (ABIM); bariatric
    = his clinical experience, NOT a certification.** NEVER write "board-certified bariatric physician,"
    "board-certified in bariatric medicine," or "board-certified in obesity medicine" (the recurring error in
    the Jun-10 spoke drafts). Use the canonical sentence where one clean credential line is needed.
  - **SC medical license #18841** (full Medicine & Surgery) — active and in good standing, valid through
    **2027**. **NPI 1174565766** (Internal Medicine). [Re-verify license status in 2027.]
  - Education/training: **MD, University of South Carolina School of Medicine, Columbia, 1995**; Internal
    Medicine residency at Richland Memorial Hospital (now Prisma Health), Columbia SC, 1995–1998 (**Chief
    Resident, 1998**); undergraduate Biology/Chemistry, Francis Marion University, 1990; prior U.S. Air Force
    Medical Laboratory Specialist.
  - Practicing medicine since **1998**; shifted focus to medical weight loss and aesthetics in **2007**;
    **more than 20 years of clinical bariatric experience** (doctor-approved framing — see canonical claim
    above). Pair the board certification (internal medicine) with the bariatric *experience*; never merge them
    into a single "bariatric board certification."
  - Has helped **more than 18,000 patients** across the Pee Dee and Grand Strand (client-confirmed; some
    clinic pages may still display the older "15,000+").
  - **No public board actions, disciplinary history, complaints, or sanctions** found.
  - Verification source: SC Board of Medical Examiners license lookup —
    https://verify.llronline.com/LicLookup/Med/Med.aspx?div=16 (search "Sattele" or license 18841).
  - **Clinic cities are Florence, Murrells Inlet, and North Myrtle Beach / Little River — REFERENCE /
    VERIFICATION ONLY. The city-name ban below still applies: never name these cities in copy; use "three SC
    locations across the Pee Dee and Grand Strand."**
- **License status (atomic fact): ACTIVE / in good standing** (SC #18841, valid through 2027). State plainly.
- Prescribing & dispensing authority: as a fully licensed SC physician (license #18841, active), Dr. Sattele
  is authorized to **prescribe AND dispense the program medications on-site** within a bona-fide
  physician-patient relationship — **phentermine** (Schedule IV appetite suppressant; prescribed and
  dispensed on-site), **B12 / lipotropic injections**, **HCG injections** (prescription injectable, physician-
  supervised), and **compounded semaglutide (GLP-1)**. SC permits licensed physicians to dispense from their
  own practice; medications are included in the program price and dispensed on-site under medical supervision.
  Compliance guardrails: HCG is **not FDA-approved for weight loss** (legitimate physician off-label use under
  supervision — never imply FDA-approved-for-weight-loss); compounded semaglutide availability tracks
  post-shortage FDA enforcement (tightened through 2025), so `[VERIFY current availability before publishing]`.
- Business: Rapid Weight Loss Centers (medical weight loss + esthetics).
- Service area: the **Pee Dee and Grand Strand areas of South Carolina**. **Do NOT name individual cities in
  copy** (not Florence, Little River, Murrells Inlet, North Myrtle Beach, or any other): the center city
  labels drift and conflict between sources, so use only the two regional area names. "Three South Carolina
  locations across the Pee Dee and Grand Strand" (the count, no city names) is fine.
- Contact: booking via `/contact-us/`. (No public email; global rule.) [VERIFY phone/address, placeholder]
- Anything not verifiable from the client or a live page = `<mark class="verify">[VERIFY: ...]</mark>` or
  `[NEEDS FROM CLIENT: ...]`, listed in an HTML comment at the file bottom.

## 4. Niche word-bans (compliance, not style)

- None beyond the global AI-tell registry and the no-fabrication rule. RWLC's posture is permissive (see 2);
  the FDA-disfavored medication language is explicitly approved, not banned. (This is the inverse of the
  AHPRA dental clients, where "specialist/expert/guarantee" are hard-banned, which does NOT apply here.)

## 5. Differentiators only RWLC can claim (substitution-test ammo)

Use these to de-commoditize every section; they are true and specific:

- Labs-first sequencing: testing for the medical reasons weight will not move BEFORE any prescription.
- Prescription only after physician review.
- Body-composition testing (fat lost vs muscle kept, not just the scale).
- Bi-weekly vitals monitoring.
- "10 to 30 pounds a month eating real food from a local supermarket."
- Named tests to anchor claims: thyroid, fasting insulin, cortisol, metabolic panel.
- Named conditions: PCOS, insulin resistance, metabolic syndrome.
- Three SC locations across the Pee Dee and Grand Strand (the count, never the city names; see Section 3), led
  by **Dr. Kevin M. Sattele, MD** — a board-certified internal medicine physician with **more than 20 years of
  clinical bariatric experience** (ABIM; active SC license #18841), who prescribes **and dispenses** the
  weight-loss medications on-site under his own license.

## 6. Architecture (hub-and-spoke map)

| Asset | URL | Owns these queries |
|---|---|---|
| **Hub** | `/weight-loss-service/` | program options, Rapid vs Standard tiers, pricing/cost, what's included, how to start / first visit / onboarding, insurance, booking, "medical weight loss program near me," "is it worth it" |
| **Spoke** | `/phentermine/` | phentermine mechanism, dosing, side effects, eligibility, cost |
| **Spoke** | `/compounded-semaglutide-glp-1-medication/` | semaglutide / GLP-1 mechanism, dosing, side effects, eligibility, cost |
| **Spoke** | `/b12-lipotropic-injections/` | B12 / lipotropic mechanism, eligibility, cost |
| **Spoke** | `/hcg-diet/` | HCG mechanism, eligibility, cost |
| **Supporting blog** | n/a | definitions, why/how it works, comparisons vs dieting/fad diets/quick-fixes, root causes, conditions, results-as-proof, who-it-is-for. Links UP; never hosts pricing/tiers/onboarding/insurance/per-drug mechanism |

When a medication comes up on a blog, name it and link to its spoke; never describe drug mechanism on the blog.

### Internal-linking discipline (RWLC-specific)

**The hub-and-spoke is the MONEY-PAGE layer only.** Hub = `/weight-loss-service/`; spokes = the treatment
service pages (`/phentermine/`, `/compounded-semaglutide-glp-1-medication/`, `/b12-lipotropic-injections/`,
`/hcg-diet/`). **Blog posts are NOT hubs or spokes** — they are a separate *supporting-content* layer that
feeds the money pages. So linking rules differ by what you are writing:

- **Rewriting a spoke (a service/money page):** it may link to related/sibling spokes and the hub. This is
  normal hub-and-spoke interlinking among money pages, and is encouraged where relevant.
- **Writing a supporting blog post:** link manually ONLY to money/service pages, never blog-to-blog.
  - **Hub link: exactly one, in or near the opening paragraph,** on a topical anchor (never the brand name;
    core-rules Section 11). Do not duplicate the hub link further down the page. **A CTA button that points at
    the hub (or any money page) COUNTS as that one hub link.** So a mid-page conversion CTA must point to
    `/contact-us/` (booking), never to the hub: only the single opener text link goes to `/weight-loss-service/`.
  - **Spoke link: only where the post specifically names/discusses that treatment** (e.g. it names phentermine
    or HCG), not by default. A post with no specific-medication content links to the hub only.
  - **Never hand-insert blog-to-blog (post-to-post) links.** Same-category cross-linking is generated
    automatically on the site; manual post-to-post links duplicate it. State the cross-reference in plain text
    and let the related-posts module handle discovery.
- The closing booking CTA to `/contact-us/` is a conversion action, not a money-page body link, and is always allowed.

## 7. HTML / CSS specifics

Output BODY CONTENT ONLY for the WP Code tab: no `<!DOCTYPE>/<html>/<head>/<body>`, **no `<h1>`** (the WP
page title supplies it), **no `.rwlc-post` wrapper div, and NO `<style>` block at all** (client decision,
2026-06-21). All the CSS already lives in the theme's customizer, so output plain semantic HTML using the
classes the theme styles (`.table-scroll`, `table`/`thead`/`th[scope]`, `details.faq-item`, `.inline-cta`,
`.btn`/`.btn-primary`, `.sr-only`, `mark.verify`) and let the theme render them. Do NOT inline or re-paste a
style block. This overrides the global "scope under a container class" default in core-rules Section 11.

- Brand: navy `#2e3577` (H2 + table headers), teal `#005464` (H3 + links), body `#5a5150`. [Verify each
  pair clears WCAG AA on its background (global rule; do not eyeball).]
- Fonts: Work Sans / Zilla Slab.
- FAQ accordions: live-homepage style (orange `Q)` questions, `+`/`−` toggle, bottom-border rows). Native
  `details/summary`; slug = first sentence of the question. Styling lives in the theme (no inline CSS).
  **The orange `#f60` FAQ question color is an ACCEPTED, client-approved brand exception to WCAG AA contrast
  (sitewide). Do NOT flag it as an audit finding or try to darken it.**
- Tables: WCAG 2.2 pattern (`.table-scroll role="region" tabindex="0"`, first cell of every data row
  `<th scope="row">`, `id="table-SLUG"`). A supporting blog rarely needs a pricing/program table; route to hub.
- Internal CTA: `<div class="inline-cta">` with a navy `.btn-primary` button to `/contact-us/` (booking).
  Per Section 6, CTA buttons go to `/contact-us/`, NOT the hub; the single hub link is the topical text link
  in the opening paragraph.
- Gold-standard worked examples to copy structure/voice/HTML from (no style block):
  `research/blog-intent-audit/rewrites/beyond-the-diet-consolidated.html` and `cut-sugar-consolidated.html`.
- Note redirects for any merged source URLs.

## 8. Brand triple bank (RWLC source-of-truth facts)

Pre-vetted **Subject → Predicate → Object** facts (core-rules §5.1 / §5.3a). Draw anchorable statements from
this bank before inventing new claims; reuse the same clean facts across pages for consistency. All rows are
sourced from §3 (Locked facts) and §5 (Differentiators) above, so `Verified? = yes` (Dr. Sattele's license is
now resolved: SC #18841, active). **City-name ban applies: region names only, never individual cities (§3).**
Approved-claim rows are tagged so the permissive posture (§2) stays visible.

| Subject | Predicate | Object | Category | Verified? |
|---|---|---|---|---|
| Rapid Weight Loss Centers | provides | physician-supervised medical weight loss | Services/Offerings | yes |
| Rapid Weight Loss Centers | provides | esthetics services | Services/Offerings | yes |
| Rapid Weight Loss Centers | prescribes | phentermine | Services/Offerings | yes |
| Rapid Weight Loss Centers | prescribes | compounded semaglutide (GLP-1 medication) | Services/Offerings | yes |
| Rapid Weight Loss Centers | offers | B12 / lipotropic injections | Services/Offerings | yes |
| Rapid Weight Loss Centers | offers | the HCG diet program | Services/Offerings | yes |
| Rapid Weight Loss Centers | serves | the Pee Dee and Grand Strand areas of South Carolina | Target Audience | yes |
| Rapid Weight Loss Centers | operates | three South Carolina locations | Target Audience | yes |
| Rapid Weight Loss Centers | helps | people for whom diet and exercise alone have not worked | Target Audience | yes |
| Rapid Weight Loss Centers | treats patients with | PCOS, insulin resistance, and metabolic syndrome | Target Audience | yes |
| Rapid Weight Loss Centers | helps patients lose | 10 to 30 pounds a month eating real food from a local supermarket | Value Propositions | yes (doctor-approved claim) |
| Rapid Weight Loss Centers | targets | belly fat | Value Propositions | yes (doctor-approved claim) |
| Rapid Weight Loss Centers | enables | weight loss without fad dieting or quick fixes | Value Propositions | yes |
| Rapid Weight Loss Centers | sequences | lab testing before any prescription | Differentiators | yes |
| Rapid Weight Loss Centers | prescribes medication only after | physician review | Differentiators | yes |
| Rapid Weight Loss Centers | measures | body composition (fat lost vs muscle kept, not just the scale) | Differentiators | yes |
| Rapid Weight Loss Centers | monitors | patient vitals every two weeks | Differentiators | yes |
| Rapid Weight Loss Centers | tests | thyroid, fasting insulin, cortisol, and a metabolic panel | Differentiators | yes |
| Rapid Weight Loss Centers | is led by | Dr. Kevin M. Sattele, MD | Differentiators | yes |
| Rapid Weight Loss Centers | has helped | more than 18,000 patients | Value Propositions | yes (client-confirmed) |
| Rapid Weight Loss Centers | dispenses on-site | phentermine, B12/lipotropic, HCG, and compounded semaglutide under medical supervision | Differentiators | yes |
| Dr. Kevin M. Sattele, MD | is board-certified in | internal medicine (American Board of Internal Medicine) | Differentiators | yes |
| Dr. Kevin M. Sattele, MD | has | more than 20 years of clinical bariatric experience | Differentiators | yes (doctor-approved) |
| Dr. Kevin M. Sattele, MD | holds | an active SC medical license (#18841, valid through 2027) | Differentiators | yes |
| Dr. Kevin M. Sattele, MD | is licensed to | prescribe and dispense the weight-loss medications on-site | Differentiators | yes |
| Dr. Kevin M. Sattele, MD | earned his MD from | the University of South Carolina School of Medicine (1995) | Differentiators | yes |
| Dr. Kevin M. Sattele, MD | completed | an internal medicine residency at Richland Memorial Hospital / Prisma Health (Chief Resident, 1998) | Differentiators | yes |
| Dr. Kevin M. Sattele, MD | has | 20+ years' experience in medical weight loss and aesthetics | Differentiators | yes (clinic-stated) |

*Provenance: triple-bank format from Sizemore + SEO Notebook (`../sources/INDEX.md`); every fact above is sourced from §3 (Locked facts) and §5 (Differentiators) of this overlay.*

---

## 9. Medspa / esthetics cluster (SEPARATE from the weight-loss hub-and-spoke)

RWLC also runs a **medical spa** (esthetics). This is a distinct content cluster with its own hub-and-spoke;
it does NOT share the weight-loss hub (§6). All global rules + the brand voice (§1), compliance posture (§2),
HTML/CSS conventions (§7), and city-name ban (§3) apply identically. The de-commoditizing angle for the whole
cluster: **physician-administered injectables at a medical clinic** (an MD performs/oversees the injections),
not tech/aesthetician-run treatments like most medspas.

### 9.1 Medspa architecture (hub-and-spoke)

| Role | URL | Owns |
|---|---|---|
| **Medspa hub** | `/medspa/` | esthetics overview, why-choose-us, cross-links to each treatment, booking. Covers Botox, fillers, mesotherapy. **Latisse is OUT of scope (client decision) — do not feature it.** |
| **Spoke** | `/botox/` | Botox mechanism, treatment areas, duration, safety/candidacy, cost |
| **Spoke** | `/restylane-juvederm-radiesse/` | dermal fillers (Restylane, Juvederm, Radiesse), areas, longevity, safety, cost |
| **Spoke** | `/mesotherapy/` | mesotherapy for spot fat / cellulite, mechanism, sessions, safety, cost |

Same internal-linking discipline as §6 (spokes may interlink to the medspa hub and sibling medspa spokes;
booking CTAs → `/contact-us/`, not the hub).

### 9.2 Medspa providers (locked facts)

- **Dr. Kevin M. Sattele, MD** — SAME canonical credential as §3 (board-certified internal medicine physician
  with 20+ years' clinical bariatric experience; active SC license #18841). The live medspa pages mislabel him
  "**Bariatric Physician**" — that is the recurring wrong credential; replace it everywhere.
- **Becky Harlan, NP** — nurse practitioner at the practice (new locked fact). `[VERIFY exact title/credential
  and scope]`.
- Botox and filler pages state **Dr. Sattele performs the injections**; mesotherapy administrator is unstated.
  `[VERIFY: who administers each treatment — Dr. Sattele vs NP Harlan, and under what supervision]`.

### 9.3 Medspa differentiators (substitution-test ammo)

- **Physician-administered / physician-supervised injectables** — the headline differentiator vs. medspas that
  use technicians or aestheticians.
- Treatments delivered in a **medical-clinic setting** (the same trusted practice as the weight-loss program).
- **Free consultation** before treatment.
- NP support (Becky Harlan) alongside the physician.

### 9.4 Medspa compliance guardrails (CRITICAL — read before writing mesotherapy)

- **Mesotherapy is NOT FDA-approved for fat or cellulite reduction.** Do NOT state or imply the *procedure* is
  FDA-approved. The live page's "injecting FDA-approved medications" is misleading and must be reframed (any
  individual ingredient approved for another use does not make mesotherapy-for-fat an approved use). Frame it
  like HCG: a physician-supervised, off-label cosmetic treatment. `[VERIFY: exact injected ingredients — the
  page lists "hormones," which needs confirmation and is omitted unless verified.]`
- Mesotherapy efficacy verbs: the live claims "**melt fat cells**," "**inches can be lost**," "**breaks down
  fat**" must soften to careful, non-guaranteeing verbs ("may help reduce," "many patients see") and are
  `[VERIFY: Dr. Sattele sign-off]` until approved. No guaranteed results (§2).
- **Botox and dermal fillers ARE FDA-approved** for cosmetic use — those approval claims are fine to state.
- The "**~90% of patients rated improvement**" Botox figure is from the manufacturer's clinical trials —
  attribute it (answer-first, source trailing), do not present it as an RWLC outcome.
- Every injectable page must state **candidacy + common side effects** (the live pages omit these); injectables
  are physician-supervised.

### 9.5 Known defects on the live medspa pages (fix on rewrite)

- Replace the "**Bariatric Physician**" credential with the §3 canonical claim on all 4 pages.
- Fillers page currently shows "**Common Questions About Botox®**" FAQs → replace with filler-specific FAQs.
- A stray **compounded-semaglutide "not FDA-approved" disclaimer** bleeds onto the mesotherapy page → remove
  (it belongs on the GLP-1 spoke, not here).
- Reconcile contradictory numbers `[VERIFY]`: mesotherapy sessions (hub "6–8 / 4 weeks apart" vs page "4–6 /
  1–2 weeks apart"); Botox duration ("up to 4 months" vs "3–4 months"); filler longevity ("4–6" vs "6–12 mo").
- Apply the **city-name ban** + **CTA routing** to the "3 Convenient Locations" / `#consultOC` patterns.

### 9.6 Medspa triple bank (additions; tag claims needing sign-off)

| Subject | Predicate | Object | Category | Verified? |
|---|---|---|---|---|
| Rapid Weight Loss Centers | operates | a medical spa (esthetics) | Services/Offerings | yes |
| Rapid Weight Loss Centers | offers | Botox, dermal fillers (Restylane/Juvederm/Radiesse), and mesotherapy | Services/Offerings | yes |
| Rapid Weight Loss Centers | delivers | physician-administered injectable treatments in a medical-clinic setting | Differentiators | yes |
| Dr. Kevin M. Sattele, MD | performs | the Botox and dermal-filler injections | Differentiators | yes (who-administers per-treatment [VERIFY]) |
| Becky Harlan, NP | supports | medspa care as a nurse practitioner | Differentiators | yes ([VERIFY title/scope]) |
| Botox | is | an FDA-approved cosmetic injectable that relaxes muscles to smooth wrinkles | Services/Offerings | yes |
| Dermal fillers | restore | facial volume and smooth wrinkles (FDA-approved) | Services/Offerings | yes |
| Mesotherapy | is | a physician-supervised, off-label injectable for spot fat and cellulite (NOT FDA-approved for this use) | Services/Offerings | yes (efficacy specifics [VERIFY sign-off]) |
