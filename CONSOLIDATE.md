# Consolidation task — fold pending lessons into the constitution

You are the compaction step of the writing system's learning loop. The lessons
log (`lessons.yaml`) is a write-ahead log of things learned since the last
consolidation. Your job is to merge every `status: pending` lesson into the
canonical rules so that future first drafts already obey them, then mark each
lesson incorporated. `consolidate.sh` triggers you and commits the result; you
do the reasoning a script cannot.

## Inputs
- `lessons.yaml` — read every entry with `status: pending`.
- `core-rules.md` — the global constitution (the compiled artifact).
- `content-audit.md`, the `format-*.md` guides, `ymyl-overlay.md`, `overlays/*.md`.

## Procedure
1. For each pending lesson, decide its correct home from its `section:` hint:
   - global rule (applies to all clients/niches) → the right section of `core-rules.md`
   - a check that should also run post-write → add/adjust the matching line in `content-audit.md` (and `audit.sh` if it is deterministically detectable)
   - format-specific → the relevant `format-*.md`
   - client/niche/theme-specific → the relevant `overlays/<client>.md`, NEVER core-rules.md
2. **Dedupe before adding.** If the rule (or a near-duplicate) already exists, strengthen the existing line or add the missing example instead of creating a second copy. Five copies of a rule was the original problem; do not reintroduce it.
3. Preserve each rule's one-phrase **why** — it is what makes the rule reusable.
4. Keep `core-rules.md` terse and skimmable; it loads into every writer's context.
5. Obey the rules you are editing: no em dashes, sentence-case headings, plain words.

## After merging
6. In `lessons.yaml`, change each processed lesson's `status: pending` to
   `status: incorporated` and set `anchor:` to `file#heading` where it now lives.
   Do not delete lessons; the log is the permanent history.
7. Output a short changelog: one line per lesson — `id → file#heading (added | strengthened | already-present)`.

Do not touch anything not driven by a pending lesson.
