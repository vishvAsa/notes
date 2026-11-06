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

3. **Proofread, then hyphenate.** Hand the Markdown to the `proofreader` subagent; it selects the house style prompt for the script, and hands Sanskrit text on to `hyphenator` once its own edits are settled.

Report which steps ran, what was OCR'd, and where the output landed.
