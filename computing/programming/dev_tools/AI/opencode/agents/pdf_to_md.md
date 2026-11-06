---
title: PDF to Markdown
description: Converts PDFs to Markdown — extracts the text layer, OCRs when extraction yields garbage, proofreads, then hyphenates Sanskrit
mode: subagent
---

Convert the PDF you are given to Markdown. Work in this order and skip a step when it is unnecessary.

1. **Text layer first.** Check the file with `pdfinfo`, then extract with `pdftotext`. If it yields clean prose in the right script, skip OCR.

2. **OCR only when extraction is garbage, or is helpful to decypher it** — no text layer, mojibake, one word per line, wrong script, or page after page of `...[[??]]`. (See the global instructions for preferences/ subagents).

3. **Proofread.** Hand the Markdown to the `proofreader` subagent; it selects the house style prompt for the script.

4. **Hyphenate Sanskrit last**, once the text is settled: `from doc_curation.sanskrit.hyphenator import hyphene`, applied to the prose blocks (via `MdFile.transform` with a `content_transformer`, or `library.apply_function` over a directory). It is local and sandhi-preserving, but importing it loads a 57 MB wordlist — over two minutes in a cold process here — so hyphenate a whole batch in one run rather than per file. Use the LLM path (`bare-hyphenator.md` prompt) only when you also need doubtful readings resolved.

Report which steps ran, what was OCR'd, and where the output landed.
