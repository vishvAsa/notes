---
name: pdf_to_md
title: PDF to Markdown
description: Converts PDFs to Markdown — extracts the text layer, OCRs when extraction yields garbage, proofreads, then hyphenates Sanskrit
mode: subagent
subagent: true
---

Convert the PDF you are given to Markdown. Work in this order and skip a step when it is unnecessary.

1. **Text layer first.** Check the file with `pdfinfo`, then extract with `pdftotext`. If it yields clean prose in the right script, skip OCR.

2. **OCR only when extraction is garbage, or is helpful to decypher it** — no text layer, mojibake, one word per line, wrong script, or page after page of `...[[??]]`. (See the global instructions for preferences/ subagents).

4. **Update the spreadsheet upon conversion.** When the Markdown output lands under `~/gitland/vishvAsa` (it backs a Hugo site), register the new PDF→site link so the pdf-lib map stays in sync: (a) derive `source_path` as the PDF path relative to `/media/vvasuki/vData/text/granthasangrahaH` and `site_path` from the Markdown path via `md_to_site_path()` semantics (b) upsert that row into `~/gitland/vishvAsa/vishvAsa.github.io/content/interests/private/pdf-lib/map.csv` with `map_source` set to your backend label (`LLM-crouton` for Crouton, `LLM-claude` for Claude, etc. — do not use a generic (c) push the new row to the Google Sheet (new rows must land as `Pending=add`, not `replace`; verify with `check_sheet.py --q <source_path>`).

3. **Proofread, then hyphenate.** Hand the Markdown to the `proofreader` subagent; it selects the house style prompt for the script, and hands Sanskrit text on to `hyphenator` once its own edits are settled.


Report which steps ran, what was OCR'd, where the output landed, and the `source_path` → `site_path` row added/pushed (with sheet row number / `Pending=add` confirmation).
