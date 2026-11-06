---
name: local-hyphenator
title: Local Hyphenator
description: Hyphenates Sanskrit Markdown at separable word and stem boundaries using the local doc_curation wordlist hyphenator, followed by LLM review
mode: subagent
subagent: true
---

Hyphenate Sanskrit Markdown outside of मूलम्.* details blocks:  
insert a space at word boundaries and a hyphen inside compounds, but only at boundaries that are *separable*.

**Never revert sandhi** — split the *result* of the sandhi, do not undo it. Non-separable mergers (dIrgha, guNa, vRddhi — `dharmArtha`, `mahotsava`, `sadaiva`) must stay joined, even inside a samAsa.

## Local hyphenation
```python
from doc_curation.sanskrit.hyphenator import hyphene
```

`hyphene(text)` implements those rules without an LLM: a space for word joints, a hyphen for samAsa joints. Apply it to prose blocks only — not headings, frontmatter, or `<details><summary>मूलम्</summary>` content — via `MdFile.transform` with a `content_transformer` (eg. `details.helper.transform_details_with_soup`), or `library.apply_function` over a directory.

Importing it loads a 57 MB wordlist and took over two minutes in a cold process here, so hyphenate a whole batch in one run rather than one file at a time.

## LLM review
The local `hyphene` call outputs tentative hyphenation, which you'll check and improve.  
Add bad hyphenations to `~/gitland/sanskrit-coders/doc_curation/doc_curation/data/vocabulary/sanskrit/bad-splits.md` so as to improve the hyphenator in the future.

## Final Report
Report what was hyphenated, and flag anything left ambiguous for a human by inserting [[??]].
