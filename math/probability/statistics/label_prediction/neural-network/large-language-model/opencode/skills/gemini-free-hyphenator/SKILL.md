---
name: gemini-free-hyphenator
description: Hyphenates Sanskrit Markdown and fixes doubtful readings in bulk using doc_curation's rotating free Gemini keys. Use when Sanskrit Markdown needs hyphenation plus correction of doubtful/erroneous readings, rather than hyphenation alone.
---

Hyphenate Sanskrit Markdown outside of मूलम्.* details blocks (when doubtful readings also need fixing) using the `llm/gemini` path with the `AI-prompt/Sanskrit_devanAgarI_markdown.md` prompt — it carries the same split rules (insert a space at separable word boundaries and a hyphen inside compounds without reverting sandhi), preserves `<details><summary>मूलम्</summary>` blocks untouched, and lets the model also suggest corrections to doubtful text:

```python
library.apply_function(fn=gemini.process_text_chunks_with_keys, dir_path=..., prompt=llm.get_prompt("~/gitland/sanskrit/sanskrit.github.io/content/groups/dyuganga/projects/text/proofreading/editing/AI-prompt/Sanskrit_devanAgarI_markdown.md"), dry_run=False)
```

followed by 

```python
library.apply_function(fn=MdFile.transform, dir_path="...", content_transformer=lambda x, *args, **kwargs: ocr_helper.fix_gemini_errors(x), dry_run=False)
```

## Final Report
Report what was hyphenated, and flag anything left ambiguous for a human by inserting [[??]].
