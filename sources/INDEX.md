# Sources — provenance index

External material that informed rules in this writing system. When a rule cites outside data ("HubSpot's
+642% test," "semantic triples"), this folder is where the original lives so the claim can be traced and
re-verified. Companion to `lessons.yaml`: lessons record *what* a rule says; this records *where it came
from*.

**Convention:** filename `YYYY-MM-DD-slug.ext` (date = published or retrieved). Save a frozen copy (PDF, or
extracted `.md` for live web pages that can change). Add a row below and list which rule sections it informed.

| File | Title / Author | URL | Retrieved | Informed |
|------|----------------|-----|-----------|----------|
| `2025-sizemore-brand-triples.md` | "How & Why to Create a List of Semantic Triples for Your Brand Voice" — Everett Sizemore (LinkedIn) | https://www.linkedin.com/pulse/how-why-create-list-semantic-triples-your-brand-voice-sizemore-8pjbc/ | 2026-06-24 | `overlays/_TEMPLATE.md` §8 + `overlays/rwlc.md` §8 (brand triple bank, four categories, generation prompt); `core-rules.md` §5.1 (triple-bank pointer) |
| `2026-06-23-ainotebook-triples.pdf` | "Semantic Triples: Why Standalone Mentions Don't Cut It in AI Search" — Steve Toth / SEO Notebook (email + Notion) | https://seonotebook.notion.site/Semantic-Triples-Why-Standalone-Mentions-Don-t-Cut-it-in-AI-Search-3848c368519180f786beca07efa09506 | 2026-06-24 | `core-rules.md` §5.3a (mention-vs-triple, entity co-occurrence, answer-first phrasing, one-triple-per-concept, one-source-for-humans-and-bots, HubSpot +58%/+642% before/after example) |

## Key claims and where they trace to

- **"+58% AI mentions, +642% AI citations"** — HubSpot (Amanda Sellers' team), reported in the SEO Notebook
  email (`2026-06-23-ainotebook-triples.pdf`, citing HubSpot's own published blog post). Second-hand figure;
  if used in client-facing copy, verify against HubSpot's primary source first (core-rules §5.4).
- **HubSpot's 5 writing tips** (a-little-goes-a-long-way, same-content-for-humans-and-bots, answer-first
  phrasing, don't-bury-the-lede, mid/bottom-funnel co-occurrence) — `2026-06-23-ainotebook-triples.pdf` p.14–16.
- **Triples ↔ Schema.org JSON-LD / Knowledge Graph mapping** — both sources; basis for the deferred
  `triples-to-schema.sh` exporter.
