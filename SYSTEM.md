# The Writing System — architecture

One canonical rule-set, a deterministic validator, a code-driven quality loop,
and a learning loop that keeps the rules current. Model-agnostic by design: the
only model-specific file is a one-line adapter.

## Why this exists

Writing kept needing rewrites because the rules lived in five drifted copies and
were only enforced *after* a draft existed. This system puts one rule-set at the
*front* (the spec a writer obeys) and the *back* (the audit), makes the
pass/fail decision deterministic code, and feeds every new lesson back into the
one rule-set so the next first draft already knows it.

## Three layers (only the loader is ever model-specific)

| Layer | Files | Model-specific? |
|---|---|---|
| **Brain** (rules) | `core-rules.md`, `content-audit.md`, `format-*.md`, `ymyl-overlay.md`, `overlays/*.md` (incl. each client's §8 brand triple bank — the source-of-truth fact list a writer draws anchorable statements from), `lessons.yaml` | No — plain markdown/yaml |
| **Validator + control** (code) | `audit.sh`, `quality-gate.sh`, `quality-loop.sh`, `consolidate.sh`, `log-lesson.sh` | No — POSIX shell |
| **Loader / model seam** | `adapters/claude.sh`, `adapters/codex.sh` | Yes — one invocation line each |

## The quality loop (code drives, model writes)

`quality-loop.sh` runs: write → (structural validate) → LLM audit → `quality-gate.sh` → branch.

- **Code, no reasoning:** the loop, `audit.sh` (deterministic tells), and
  `quality-gate.sh` (PASS/REVISE/REWRITE against `content-audit.md` thresholds,
  signalled by exit code 0/10/20).
- **Model, reasoning only:** writing the draft, scoring the subjective audit
  dimensions, and revising. Reached only through an adapter.
- **Always loops until quality is met** or `MAX_ITERS` is hit, then ESCALATE
  (exit 30) for a human. There is no "done" without a passing gate.

Swap the model: `ADAPTER=adapters/codex.sh bash quality-loop.sh`. Nothing else changes.

## The learning loop (lessons never re-surface as corrections)

```
correction/audit finding ─▶ log-lesson.sh ─▶ lessons.yaml (status: pending)
                                                     │
                          consolidate.sh (code: trigger, verify, git-commit)
                                                     │
                          CONSOLIDATE.md (model: dedupe, place each lesson)
                                                     ▼
                          core-rules.md updated ─▶ every future writer reads it
```

`lessons.yaml` is the append-only write-ahead log; `core-rules.md` is the
compacted store. A lesson learned in any project lands in one file that every
project and every model reads.

## Integration

- **writer-orchestrator** (Claude Code pipeline): point each stage prompt at the
  brain instead of inlining rules — `prompts/writer-agent.md` and
  `prompts/audit-agent.md` reference `core-rules.md` / `content-audit.md`;
  `PMSI/writing-standards.md` becomes a thin `overlays/<client>.md`. Add the
  `audit.sh` tell-checks to `scripts/validate-output.sh` so deterministic tells
  are caught before the LLM audit stage.
- **Any harness** (Claude Code, Codex, Cursor, CI): the loader is one line that
  tells the model to read `core-rules.md` first, then `overlays/<client>.md` ONLY
  when writing for that client (never another client's overlay), and to run
  `audit.sh` before returning. Claude points there from `CLAUDE.md`; Codex from
  `AGENTS.md`; Cursor from `.cursorrules`. Same target, different pointer.
- **Universal enforcement** without a model-specific hook: a git pre-commit hook
  that runs `audit.sh` on changed content files blocks tells regardless of which
  model wrote them.

## Quick start

```bash
# one article through the loop (global rules only)
SCOPE=out/topic/scope.md OUTDIR=out/topic bash quality-loop.sh

# writing for a client: loads core-rules.md + overlays/rwlc.md, and no other overlay
CLIENT=rwlc SCOPE=out/topic/scope.md OUTDIR=out/topic bash quality-loop.sh

# capture a lesson, then fold it in
bash log-lesson.sh --rule "Ban X" --why "reads as machine cadence" --section banned-patterns
bash consolidate.sh
```
