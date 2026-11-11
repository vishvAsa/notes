---
name: pdf-to-md
description: Converts PDFs to Markdown — extracts the text layer, OCRs when extraction yields garbage (via the ocr skill), proofreads, then hyphenates Sanskrit, and updates the source-to-site-page catalog. Use when a PDF must become a Markdown page.
---

Convert the PDF you are given to Markdown. Work in this order and skip a step when it is unnecessary.

1. **Text layer first.** Check the file with `pdfinfo`, then extract with `pdftotext`. If it yields clean prose in the right script, skip OCR.

2. **OCR only when extraction is garbage, or is helpful to decipher it** — no text layer, mojibake, one word per line, wrong script, or page after page of `...[[??]]`. Hand the OCR to the `ocr` skill (drive OCR by default) rather than doing it here.

3. **Proofread, then hyphenate.** Hand the Markdown to the `proofreader` skill; it selects the house style prompt for the script, and hands Sanskrit text on to `hyphenator` once its own edits are settled.

4. **Update the spreadsheet catalog upon conversion.** When the output Markdown lands under `~/gitland/vishvAsa` (it backs a Hugo site) and the PDF is within granthasangrahaH, compute the PDF's path relative to granthasangrahaH and update the "source to site-page" catalog:

```python
from doc_curation.hugo_site import md_to_site_path
from doc_curation.hugo_site.appscript_client import post_append_rows

site_path = md_to_site_path(md_path_relative_to_vishvAsa)
post_append_rows(sheet_url, [{"source_path": ..., "site_path": site_path, ...}])
```

Column and sheet details are in the global AGENTS.md ("source to site-page" instructions).


Report which steps ran, what was OCR'd, where the output landed, and the `source_path` → `site_path` row added/pushed (with sheet row number / `Pending=add` confirmation).
