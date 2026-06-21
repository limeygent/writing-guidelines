# Client Overlay: The Roc Foundation Repair

This is a thin per-client overlay. It carries ONLY ROC-specifics. The global base for all writing is
`../core-rules.md` (the Writing Constitution): this overlay sits on top of it, never repeats it, and never
contradicts a global rule except where this file explicitly records a client-signed-off exception. Load
core-rules.md first, then this file. If a slot below is empty, the global default applies. The full per-page
build spec lives in the ROC repo (`roc-foundation-repair/new-pages/MVP_BUILD_SPEC.md`); the gold-standard
worked examples are `new-pages/slab.html` (service page), `new-pages/about.html` (trust page), and
`new-pages/reviews.html` (testimonials usage).

---

## 1. Brand voice notes

- Tone in one line: confident, specific, trust-first. A 20-year family-owned DFW foundation company that
  diagnoses the cause before it sells a fix.
- Point of view: "we / our / your home." First person plural for the company. Person names are literal:
  owner Jay Vega is written as "Jay Vega" (never shortcoded, never anonymized).
- Words/phrases this brand favors: engineered plan, diagnose the cause first, measured / monitored lift,
  free lifetime transferable warranty, specific anchorable numbers (founded 2005, 4.8 stars from 91 Google
  reviews, BBB A+, 8 to 12 piers).
- Words/phrases this brand avoids (style, not compliance): vague reassurance with no number behind it,
  generic "best foundation company" boilerplate, anything that would read identically with a competitor's
  name swapped in.

## 2. Compliance posture (what this client has signed off / what is forbidden)

- Regulatory context: US FTC (truth-in-advertising). Texas does NOT license foundation repair specifically,
  so there is no state contractor licence to cite. Differentiate on engineered plans, the warranty, and
  independent engineer reports instead.
- Posture: standard hedging. No guaranteed outcomes. Cost and timeline figures use forward-looking / target
  language ("most DFW repairs run...", "a typical job is about..."), not measured-statistic claims.
- **Approved claims (use plainly, do not hedge away):** founded 2005 / 20+ years, family-owned, owner Jay
  Vega on every job, 4.8 stars from 91 Google reviews, BBB A+, ICC-ES ESR-4471 (steel push piers) and
  ESR-3559 (helical), ROC Solid / ROC Core / ROC Max pier systems, free lifetime transferable warranty (no
  transfer fee), Texas P.E. stamped designs.
- **Required disclaimers (never strip):** any specific number, credential, lender, APR, warranty term, or
  date that is not in hand is written "TO BE ANNOUNCED" (never invented). Insurance note when relevant:
  standard Texas homeowners policies usually exclude gradual soil movement (exception: sudden damage from a
  covered plumbing leak).
- Sign-off source + date: [VERIFY: who at ROC approved the claim list, and when.]

## 3. Locked facts (verbatim; never paraphrase or invent)

- Practitioner / owner: Jay Vega (literal name, on every job).
- Business / legal entity name: written ONLY as `[business_name]` in copy (never the literal name).
- **SHORTCODE NAP DISCIPLINE (mandatory):** never write the literal business name, phone, address,
  city/state/zip, website URL, or logo URL anywhere, including page copy, headings, FAQ text, schema text,
  alt text, and CTAs. Shortcodes DO expand inside `alt=""`, so use them there too. Use:
  - `[business_name]`: company name (plain mention).
  - `[business_phone]`: phone in body text; `[business_phone_link]` for a clickable link;
    `[business_phone_url]` ONLY inside `href="[business_phone_url]"`; `[lean_business_phone_button]` for an
    icon button.
  - `[business_full_address]`: address blocks / schema (or the component parts `[business_address]`,
    `[business_city]`, `[business_state]`, `[business_zip]`).
  - `[business_booking]`: primary CTA.
  - Full list and guidance: `roc-foundation-repair/SHORTCODES.md`.
- No public email anywhere (phone / contact form only).
- Hours: Mon to Fri 8 AM to 7 PM, Sat 8 AM to 5 PM, Sun closed.
- Service area / geo nodes: Dallas / DFW, Texas. [VERIFY: the full named-city list.]
- Credentials with currency: ICC-ES ESR-4471, ESR-3559; BBB A+; Texas P.E. stamped designs. [VERIFY:
  confirm each evaluation report number is current.]

## 4. Niche word-bans (compliance, not style)

- Em dashes (U+2014) are HARD-BANNED everywhere. Use commas, colons, or parentheses.
- "TO BE ANNOUNCED" is the required placeholder for any unknown specific (lender names, APRs, warranty
  coverage terms / durations, approval criteria, dates). Never fabricate these.
- No guaranteed-outcome language ("we guarantee your foundation will never move again", "permanent fix"
  stated as certainty).
- Differentiator swap-test (compliance-grade discipline): if replacing `[business_name]` with a
  competitor's name leaves a sentence equally true, the sentence is commoditized boilerplate and must be
  rewritten with a real ROC anchor.

## 5. Differentiators only this client can claim (the substitution-test ammo)

Use these to de-commoditize every section. They survive the substitution test:

- Founded 2005, 20+ years, family-owned; owner Jay Vega personally on every job.
- 4.8 stars from 91 Google reviews; BBB A+.
- ICC-ES ESR-4471 (steel push piers) and ESR-3559 (helical) evaluated systems.
- Proprietary ROC Solid / ROC Core / ROC Max pier systems.
- Free lifetime transferable warranty: life of the home, transfers to the next owner, no transfer fee.
- Licensed Texas Professional Engineer (P.E.) stamped designs plus independent engineer reports.
- Diagnose-the-cause-first ethos (engineered plan, not a default fix).

## 6. Architecture (hub-and-spoke map + internal-link allowlist)

| Asset | URL | Owns these queries |
|---|---|---|
| Cluster hub | `/foundation-repair/` | "foundation repair Dallas Fort Worth" overview; routes to repair types |
| Spoke | `/foundation-repair/slab/` | slab foundation repair (service-page gold standard) |
| Spoke | `/foundation-repair/pier-and-beam/` | pier and beam repair (crawlspace, bouncy/sloping floors) |
| Spoke | `/foundation-repair/house-leveling/` | house leveling / uneven floor repair |
| Spoke | `/foundation-repair/crack-and-wall-repair/` | foundation crack diagnostics + bowing-wall repair |
| Methods | `/foundation-repair/repair-methods/` | ROC pier systems, ESR-4471/3559 |
| Cost | `/foundation-repair-cost/` | "foundation repair cost Dallas" price research |
| Trust | `/reviews/`, `/about/`, `/warranty/`, `/financing/`, `/contact/` | trust, reassurance, conversion |

**Internal-link allowlist (link ONLY to these live pages):** `/`, `/foundation-repair/`,
`/foundation-repair/slab/`, `/foundation-repair/pier-and-beam/`, `/foundation-repair/house-leveling/`,
`/foundation-repair/crack-and-wall-repair/`, `/foundation-repair/repair-methods/`, `/foundation-repair-cost/`,
`/reviews/`, `/about/`, `/contact/`, `/warranty/`, `/financing/`, and the on-page anchor `#schedule`.
Do NOT link to drainage, commercial, gutters, under-slab-tunneling, areas-we-serve, maintenance,
root-barriers, concrete-leveling, retaining-walls, inspection, gallery, faq, foundation-tips, french-drains,
or mudjacking (drafted / offline).

## 7. HTML / CSS specifics (override the global "scoped CSS, body-only" defaults)

- Lean-theme GLOBAL classes ONLY; do NOT invent a class. Confirmed global classes: `hero`, `hero-bg`,
  `hero-overlay`, `hero-content`, `badge-trust`, `trust-strip`, `strip-row`, `strip-item`, `label-sub`,
  `section`, `symptom-card`, `symptom-icon`, `why-feature`, `icon-circle`, `process-step`, `step-number`,
  `callout`, `stat-row`, `stat-cell`, `num`, `label`, `review-card`, `platform-row`, `platform-badge`,
  `credential-tile`, `cred-icon`, `cred-name`, `cred-detail`, `compare-table`, `brand-band`,
  `service-area-band`, `faq-list`, `faq-item`, `faq-body`, plus Bootstrap 5 utilities and
  `btn btn-warning` / `btn-primary` / `btn-outline-light` / `btn-outline-primary`. If you genuinely need
  another, use inline styles (as slab.html does for figures). No page `<style>` block and do NOT re-link the
  theme CSS (the theme enqueues it).
- Brand color: `#071783`, set in THEME SETTINGS (injected as `:root` vars in `<head>`), never hardcoded in
  CSS or page content. White text only on brand/dark backgrounds; body copy `#444` on white/tinted; links
  `var(--brand)`. Verify each `#071783` pair clears WCAG AA (do not eyeball).
- Icons: use ONLY this confirmed bi-* subset (others render blank): `bi-shield-fill-check`, `bi-shield-check`,
  `bi-award-fill`, `bi-google`, `bi-house-heart-fill`, `bi-patch-check-fill`, `bi-mortarboard-fill`,
  `bi-bricks`, `bi-arrow-down-up`, `bi-door-closed-fill`, `bi-border-width`, `bi-rulers`,
  `bi-grid-3x3-gap-fill`, `bi-globe-americas`, `bi-diagram-3-fill`, `bi-search`, `bi-telephone-fill`,
  `bi-calendar-check`, `bi-bar-chart-fill`, `bi-building-fill`, `bi-building`, `bi-people-fill`, `bi-hammer`,
  `bi-clipboard-check-fill`, `bi-trophy-fill`, `bi-tools`, `bi-info-circle`, `bi-droplet-fill`, `bi-droplet`,
  `bi-arrow-right`, `bi-geo-alt-fill`, `bi-fire`, `bi-moisture`, `bi-water`, `bi-tree`, `bi-clock-history`,
  `bi-check-circle-fill`, `bi-exclamation-triangle`, `bi-wrench`, `bi-graph-up-arrow`. Pick the closest if
  your ideal icon is not listed.
- FAQ pattern (exact, from slab.html): `<details class="faq-item border rounded mb-3 p-3" id="faq-SLUG">`
  with a `<summary ... id="faq-SLUG-question" aria-controls="faq-SLUG-answer">`, then a
  `<div class="faq-body pt-2" id="faq-SLUG-answer" aria-labelledby="faq-SLUG-question">` containing an inner
  `<h3>` (repeat the question) then `<p>`. 6 to 12 Q&As.
- Page flow: hero (badge-trust, H1, lead `<p>`, two CTAs: `[business_phone_url]` warning button +
  `#schedule` outline button) → trust-strip → intent-serving sections → process / comparison → cost teaser
  where relevant → FAQ → `brand-band` CTA (`id="schedule"`) → `service-area-band`.
- Reviews row where it strengthens trust:
  `[testimonials category="foundation-repair" num_reviews="3" orderby="rand" layout="cards"]` inside a
  tinted section.
- Gold-standard worked examples to copy structure / style from: `new-pages/slab.html`, `new-pages/about.html`,
  `new-pages/reviews.html`.
