# Client Overlay: Rapid Weight Loss Centers (RWLC)

Thin per-client overlay. Carries ONLY RWLC-specifics. The global base is `../core-rules.md` (the Writing
Constitution): load it first, then this file. Everything global (intent contract, scope ledger, fan-out
gate, AI-tell registry, chunk isolation, accessibility, on-page SEO) lives there and is NOT repeated here.
Full project SOP and the gold-standard worked example are in the RWLC repo
(`PMSI/RWLC/CONTENT-WRITING-RULES.md` and `research/blog-intent-audit/rewrites/beyond-the-diet-consolidated.html`).

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

- Practitioner: Dr. Kevin Sattele. [VERIFY exact credential/registration # before publishing; placeholder it]
- Business: Rapid Weight Loss Centers (medical weight loss + esthetics).
- Service area / geo nodes: Grand Strand / Pee Dee, South Carolina. Named nodes: Florence, Little River,
  Murrells Inlet. Three named SC locations.
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
- Three named SC locations; Dr. Kevin Sattele.

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

## 7. HTML / CSS specifics

Output BODY CONTENT ONLY for the WP Code tab: no `<!DOCTYPE>/<html>/<head>/<body>`, **no `<h1>`** (the WP
page title supplies it). Wrap everything in `<div class="rwlc-post">` with ONE scoped `<style>` block as the
first child (scoped under `.rwlc-post` so it cannot leak to the theme).

- Brand: navy `#2e3577` (H2 + table headers), teal `#005464` (H3 + links), body `#5a5150`. [Verify each
  pair clears WCAG AA on its background (global rule; do not eyeball).]
- Fonts: Work Sans / Zilla Slab.
- FAQ accordions: live-homepage style (orange `Q)` questions, `+`/`−` toggle, bottom-border rows). Native
  `details/summary`; slug = first sentence of the question. Paste the FAQ CSS block verbatim from the RWLC
  SOP / the gold-standard file.
- Tables: WCAG 2.2 pattern (`.table-scroll role="region" tabindex="0"`, first cell of every data row
  `<th scope="row">`, `id="table-SLUG"`). A supporting blog rarely needs a pricing/program table; route to hub.
- Internal CTA: `<div class="inline-cta">` with a navy button to `/contact-us/` (booking) and
  `/weight-loss-service/` (learn more / program options).
- Gold-standard worked example to copy structure/voice/HTML/style block from:
  `research/blog-intent-audit/rewrites/beyond-the-diet-consolidated.html`.
- Note redirects for any merged source URLs.
