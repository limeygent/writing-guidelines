# Client Overlay: [CLIENT NAME]

This is a thin per-client overlay. It carries ONLY client-specifics. The global base for all writing is
`../core-rules.md` (the Writing Constitution): every overlay sits on top of it, never repeats it, and never
contradicts a global rule except where this file explicitly records a client-signed-off exception. Load
core-rules.md first, then this file. If a slot below is empty, the global default applies.

---

## 1. Brand voice notes

- Tone in one line: [e.g. doctor-to-patient, warm, educational, not too casual]
- Point of view: [we/our/your? any house style on "I" or first person?]
- Words/phrases this brand favors: [...]
- Words/phrases this brand avoids (style, not compliance): [...]

## 2. Compliance posture (what this client has signed off / what is forbidden)

- Regulatory context: [e.g. US FDA/FTC + state board / AU AHPRA+ACCC / UK ASA + GMC]
- Posture: [permissive: practitioner has approved specific claims  |  strict: hedge everything]
- **Approved claims (use plainly, do not hedge away):** [...]
- **Required disclaimers (never strip; mirror into the claim sentence):** [...]
- Sign-off source + date: [who approved, when]

## 3. Locked facts (verbatim; never paraphrase or invent)

- Practitioner(s) + credential/registration #: [Name, REG#### (state currency)]
- Business / legal entity name: [...]
- Phone: [...]   |   Text: [...]   |   Contact form URL: [...]   (no public email)
- Address: [...]
- Service area / geo nodes: [...]
- Licence / certification / insurance #s (with currency): [...]
- Hours / availability: [...]

## 4. Niche word-bans (compliance, not style)

- Forbidden titles/terms in this niche: [e.g. "specialist," "expert," reserved titles]
- Forbidden claim words: [e.g. "guarantee," "perfect," "cure"]
- Restricted/regulated terminology + the required hedge: [...]

## 5. Differentiators only this client can claim (the substitution-test ammo)

List the specifics that survive the substitution test (swap the brand for a competitor and the sentence
becomes false). Use these to de-commoditize sections.

- [...]
- [...]

## 6. Architecture (hub-and-spoke map for this client, if applicable)

| Asset | URL | Owns these queries |
|---|---|---|
| Hub | [/...] | [...] |
| Spoke | [/...] | [...] |
| Supporting / blog | n/a | [educational; links UP] |

## 7. HTML / CSS specifics (override the global "scoped CSS, body-only" defaults)

- Container/wrapper class: [.client-post]
- Brand colors (state the WCAG-passing pairs): [navy #... on white = X:1]
- Fonts: [...]
- Internal CTA target(s): [/contact-us/ etc.]
- Gold-standard worked example to copy structure/style from: [path]
