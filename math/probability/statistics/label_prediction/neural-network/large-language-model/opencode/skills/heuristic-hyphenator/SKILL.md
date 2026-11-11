---
name: heuristic-hyphenator
description: Approximately, and with some errors, Hyphenates Sanskrit Markdown at separable word and stem boundaries using the local doc_curation wordlist hyphenator, without LLMs. Use only when explicitly requested.
---

```python
from doc_curation.sanskrit.hyphenator import hyphene
```

`hyphene(text)` implements those rules without an LLM: a space for word joints, a hyphen for samAsa joints. Apply it to prose blocks only — not headings, frontmatter, or `<details><summary>मूलम्</summary>` content — via `MdFile.transform` with a `content_transformer` (eg. `details.helper.transform_details_with_soup`), or `library.apply_function` over a directory.

Importing it loads a 57 MB wordlist and took over two minutes in a cold process here, so hyphenate a whole batch in one run rather than one file at a time.

