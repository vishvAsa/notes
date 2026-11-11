---
name: hyphenator
description: Hyphenates Sanskrit Markdown at separable word and stem boundaries without reverting sandhi. Use when Sanskrit prose needs word separation (a space at word joints, a hyphen inside compounds) or a doubtful-reading pass over Sanskrit text.
---

Hyphenate Sanskrit Markdown outside of मूलम्.* details blocks:  
insert a space at word boundaries and a hyphen inside compounds, but only at boundaries that are *separable*.

**Never revert sandhi** — split the *result* of the sandhi, do not undo it. Non-separable mergers (dIrgha, guNa, vRddhi — `dharmArtha`, `mahotsava`, `sadaiva`) must stay joined, even inside a samAsa.

More rules are in the AI prompt at `~/gitland/sanskrit/sanskrit.github.io/content/groups/dyuganga/projects/text/proofreading/editing/AI-prompt/Sanskrit_devanAgarI_markdown.md`.

## Final Report
Report what was hyphenated, and flag anything left ambiguous for a human by inserting [[??]].
