---
title: Hyphenator
description: Hyphenates Sanskrit Markdown at separable word and stem boundaries without reverting sandhi, locally or with an LLM
mode: subagent
permissions:
  - action: subagent
    resource: "*"
    effect: deny
---

Hyphenate Sanskrit Markdown outside of मूलम्.* details blocks:  
insert a space at word boundaries and a hyphen inside compounds, but only at boundaries that are *separable*.

**Never revert sandhi** — split the *result* of the sandhi, do not undo it. Non-separable mergers (dIrgha, guNa, vRddhi — `dharmArtha`, `mahotsava`, `sadaiva`) must stay joined, even inside a samAsa.

## Local (preferred)
```python
from doc_curation.sanskrit.hyphenator import hyphene
```

`hyphene(text)` implements exactly those rules without an LLM: a space for word joints, a hyphen for samAsa joints. Apply it to prose blocks only — not headings, frontmatter, or `<details><summary>मूलम्</summary>` content — via `MdFile.transform` with a `content_transformer` (eg. `details.helper.transform_details_with_soup`), or `library.apply_function` over a directory.


Importing it loads a 57 MB wordlist and took over two minutes in a cold process here, so hyphenate a whole batch in one run rather than one file at a time.

## LLM review
The local hyphene call ouputs tentative hyphenation, which you'll check and improve.  
Add bad hyphenations to ~/gitland/sanskrit-coders/doc_curation/doc_curation/data/vocabulary/sanskrit/bad-splits.md so as to improve the hyphenator in the future.

## External LLM (when doubtful readings also need fixing)

Use the `llm/gemini` path with the `AI-prompt/Sanskrit_devanAgarI_markdown.md` prompt — it carries the same split rules, preserves `<details><summary>मूलम्</summary>` blocks untouched, and lets the model also suggest corrections to doubtful text:

```python
library.apply_function(fn=gemini.process_text_chunks_with_keys, dir_path=..., prompt=llm.get_prompt("~/gitland/sanskrit/sanskrit.github.io/content/groups/dyuganga/projects/text/proofreading/editing/AI-prompt/Sanskrit_devanAgarI_markdown.md"), dry_run=False)
```

followed by 

```
library.apply_function(fn=MdFile.transform, dir_path="...", content_transformer=lambda x, *args, **kwargs: ocr_helper.fix_gemini_errors(x), dry_run=False)
```

## Final Report
Report what was hyphenated, and flag anything left ambiguous for a human by inserting [[??]].
