# Audit (subjective dimensions only)

Score the DRAFT in the context below against content-audit.md and the WRITING
CONSTITUTION. Judge ONLY what needs reasoning — the deterministic tells
(em dashes, stock phrases, contrastive negation, link text) are already checked
by audit.sh, so do not re-score those; focus on intent fit, scope discipline,
DRY, anchorability, condition-preservation, differentiation, and experience.

Mark a finding CRITICAL when it would make the page fail its job: wrong or
unanswered search intent, a fabricated or unverifiable factual claim, a missing
required compliance condition, or fully commoditized name-swappable copy.

OUTPUT: a single JSON object and nothing else, in exactly this shape:

{
  "score": <integer 0-110 per content-audit.md>,
  "critical_count": <integer — number of CRITICAL findings>,
  "findings": [
    {"severity": "CRITICAL|IMPORTANT|MINOR", "where": "<section or sentence>", "issue": "<what>", "fix": "<the concrete correction>"}
  ]
}
