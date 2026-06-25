# Page-Optimization SOP

Niche-agnostic, repeatable pipeline for turning a client's **existing** web pages into optimized,
publish-ready copy. This is the process refined on the RWLC weight-loss spokes (2026-06). The operator
points at the pages; the agent runs the rest.

**Single source of truth for the rules stays in:** `core-rules.md` (the Constitution), the client overlay
`overlays/<client>.md` (voice, locked facts, triple bank, architecture), and `content-audit.md` (the scored
/110 rubric). This SOP only orchestrates them — it does NOT restate the rules.

---

## Inputs the operator provides

1. **Client** (→ which `overlays/<client>.md` to load).
2. **The pages** — live URLs (fetch each), local files, or pasted content.
3. **Page type** per page (service / blog / comparison / location) → sets the word band in `content-audit.md`.

## Prerequisite gate — architecture + facts (do NOT skip for a new cluster)

The page-level pipeline is niche-agnostic, but the *facts* are not. Before optimizing pages in a **service
cluster the overlay does not yet cover**:

- **Define the hub-and-spoke** (overlay §6 style): one hub URL + treatment spokes, each owning its queries.
- **Extend the overlay** with that cluster's **locked facts, differentiators, approved claims, and triple-bank
  rows.** Without these, agents either write commodity copy (fails the substitution test) or fabricate.
- Map each page's **search intent** (live SERP / People-Also-Ask, GSC if the URL exists). Skip only for merges
  whose intent a prior bulk audit already resolved.

If the cluster IS already in the overlay, go straight to the pipeline.

---

## The pipeline

Fan out **one agent per page, in parallel** at each phase (pages are independent files → no edit conflicts).
The coordinator (main loop) holds the synthesis; agents return reports, not file dumps.

### Phase 1 — Audit (validator agent per page) — MANDATORY, never skipped
Each validator reads core-rules + overlay + content-audit, then for its page produces:
- **Scored /110** with per-category justification + band verdict (≥88 publish / 66-87 minor / <66 rewrite).
- **Stale-fact / E-E-A-T check** vs. the overlay's §3 locked facts + §8 triple bank (catches outdated numbers,
  wrong/placeholder credentials, missing trust signals).
- **§5.3a triple deployment** (answer-first phrasing, brand-category association, triples drawn from §8).
- **Page-specific compliance** (the overlay's guardrails; e.g. FDA framing, availability VERIFYs).
- **Overlay rules** (city-name ban, HTML conventions, CTA routing).
- A **prioritized, copy-pasteable patch list**: {exact quote} → {replacement} → {rule}.

The coordinator separates **systemic findings** (repeat across pages — usually template-stamped) from
**page-specific** ones.

### Phase 2 — Systemic fixes (fix agent per page)
Apply the cross-page defects in one pass, using **overlay-verified facts VERBATIM** (never invented):
credential/locked-fact corrections, CTA routing, differentiator/trust triples, stale-VERIFY removal. One
agent per file; each reports old→new diffs.

### Phase 3 — Finalize (fix agent per page)
Page-specific fixes: word band, DRY, scope leaks, banned patterns (em-dashes → 0), sentence-case headings,
table/prose dedup. **Re-score** to confirm publish band.

### Phase 4 — Opener pass
Make the main opener AND each section opener **answer-first** (core-rules §4 / §5.1 / §5.3a): sentence 1
answers the intent and names the entity. Leave openers that already lead answer-first.

### Phase 5 — VERIFY checklist
Extract every `<mark class="verify">` / `[VERIFY]`, **dedupe** (the same questionnaire item is often marked in
several spots), and produce a **client-ready question list** grouped by page. Save it next to the pages.

### Phase 6 — Fold-back (when the client answers)
**Overlay first, then pages.** Put confirmed answers into `overlays/<client>.md` (§3 / §8), THEN replace the
matching `[VERIFY]` marks across the pages, THEN re-audit any page that changed materially.

---

## Quality rules (non-negotiable)

- **Separate validator agent** runs the scored audit (per the RWLC CLAUDE.md pipeline) — the writer never
  grades itself.
- **No fabrication.** Anything not in the overlay or verifiable stays a `[VERIFY]` placeholder; never ship a
  guessed fact, especially on YMYL/medical pages.
- **Overlay facts verbatim** when threading locked facts/triples — consistency across pages.
- **Source-of-truth-first** on every fact change: overlay → pages, never the reverse.
- **Parallel per-page, one file per agent** — avoids edit collisions; batch the agent calls.

## Scoring bands (`content-audit.md`)
≥88 = PUBLISH · 66-87 = MINOR FIXES · <66 = REWRITE. Page-type word bands live in the rubric; do not
auto-fail a comparison/merge for legitimately running longer than a how-to.

## Pre-publish
If pages are styled standalone previews, **strip the chrome before paste** (`<h1>`, `<style>` block,
DOCTYPE/head/body, topbar/hero/footer) — output body-content only for the CMS code tab (overlay §7). If
content is being pasted into an existing live page, reuse that page's existing buttons/CTAs rather than the
preview's.
