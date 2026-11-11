---
name: pdf-to-md
description: Converts PDFs to Markdown — extracts the text layer, OCRs when extraction yields garbage, proofreads, then hyphenates Sanskrit, and updates the source-to-site-page catalog. Use when a PDF must become a Markdown page.
---

Convert the PDF you are given to Markdown. Work in this order and skip a step when it is unnecessary.

1. **Text layer first.** Check the file with `pdfinfo`, then extract with `pdftotext`. If it yields clean prose in the right script, skip OCR.

2. **OCR only when extraction is garbage, or is helpful to decypher it** — no text layer, mojibake, one word per line, wrong script, or page after page of `...[[??]]`. (See the global instructions for preferences/ subagents.)

3. **Proofread, then hyphenate.** Hand the Markdown to the `proofreader` skill; it selects the house style prompt for the script, and hands Sanskrit text on to `hyphenator` once its own edits are settled.

4. **Update the spreadsheet upon conversion.** When the Markdown output lands under `~/gitland/vishvAsa` (it backs a Hugo site), if the pdf is within the granthsangrahaH directory, get pdf path relative to granthasangrahaH and update "source to site-page" catalog.


Report which steps ran, what was OCR'd, where the output landed, and the `source_path` → `site_path` row added/pushed (with sheet row number / `Pending=add` confirmation).
