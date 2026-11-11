---
name: hyphenator
description: Hyphenates Sanskrit Markdown at separable word and stem boundaries without reverting sandhi. Use when Sanskrit prose needs word separation (a space at word joints, a hyphen inside compounds) or a doubtful-reading pass over Sanskrit text.
---

Hyphenate Sanskrit Markdown outside of मूलम्.* details blocks:  
insert a space at word boundaries and a hyphen inside compounds, but only at boundaries that are *separable*.

**Never revert sandhi** — split the *result* of the sandhi, do not undo it. Non-separable mergers (dIrgha, guNa, vRddhi — `dharmArtha`, `mahotsava`, `sadaiva`) must stay joined, even inside a samAsa.

More rules are in the AI prompt at `~/gitland/sanskrit/sanskrit.github.io/content/groups/dyuganga/projects/text/proofreading/editing/AI-prompt/Sanskrit_devanAgarI_markdown.md`.

## Special tools
If explicitly directed, use these special tools.  


### Gemini free flash hyphenator
This does a non-thorough job, and is to be used for cursory sanskrit-only processing.

```python
from doc_curation import llm
from doc_curation.llm import gemini
from doc_curation.md import library

library.apply_function(fn=gemini.process_text_chunks_with_keys, dir_path=..., prompt=llm.get_prompt("~/gitland/sanskrit/sanskrit.github.io/content/groups/dyuganga/projects/text/proofreading/editing/AI-prompt/Sanskrit_devanAgarI_markdown.md"), dry_run=False)
```

To process details blocks only, you'd use `gemini.process_details_with_keys` above.

### Heuristic hyphenator
This works approximately, and with some errors.

```python
from doc_curation.sanskrit.hyphenator import hyphene
```

`hyphene(text)` implements those rules without an LLM: a space for word joints, a hyphen for samAsa joints. Apply it to prose blocks only — not headings, frontmatter, or `<details><summary>मूलम्</summary>` content — via `MdFile.transform` with a `content_transformer`, or `library.apply_function` over a directory:

```python
from doc_curation.md import library

library.apply_function(fn=MdFile.transform, dir_path=dir_path, content_transformer=lambda c, *args, **kwargs: hyphene(c))
```

Importing it loads a 57 MB wordlist and took over two minutes in a cold process here, so hyphenate a whole batch in one run rather than one file at a time.



## Final Report
Report what was hyphenated, and flag anything left ambiguous for a human by inserting [[??]].
