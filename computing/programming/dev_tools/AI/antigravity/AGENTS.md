+++
title = "Antigravity global instructions"
+++

# Global instructions

## Subagents

- Delegate to subagents (`invoke_subagent`) whenever possible — exploration (`research`), multi-step work, or anything matching a listed custom agent's description (`hyphenator`, `interleaver`, `pdf_to_md`, `proofreader`, `reviewer`, `tesseract_ocr`, `meta-tui`, `opencode-tui`, `antigravity-tui`) — to keep the main context small.

## Model selection

- Be mindful of model cost/quota when delegating work.
- For bulk, mechanical, or low-risk subagent work (formatting, repetitive edits, simple searches, large-file scanning, headless TUI delegation), prefer lighter subagent model tiers (`Model: "flash_lite"` or `Model: "flash"` in `invoke_subagent`) or delegate to `opencode-tui` (which uses zero-cost OpenCode Go models such as `opencode-go/beam-free`).
- Reserve stronger models (`Model: "pro"` or `Model: "inherit"` on Gemini 4 Argon High) for judgment calls, verification of lighter-model output, and complex tasks.

## Compute

- Do NOT run CPU-heavy tasks on the local machine; offload them to Kaggle or Google Colab instead. Avoid grinding the local CPU.

## Existing code

Use and maintain existing code where possible — it is installed in the venv at `~/gitland/python_venv`, so invoke `~/gitland/python_venv/bin/python` (**not** the default `python3`). 

### doc_curation
Before writing text-processing code, check these in `~/gitland/sanskrit-coders/doc_curation`:

- `doc_curation.md.library` has `apply_function` which is especially useful for bulk processing Markdown files within a path. Use it in combination with other functions as needed.
- OCR (preferred): `pdf/drive_ocr` — especially use calls like drive_ocr.split_and_ocr_all( dir_path=..., small_pdf_pages=10, detext=False, file_pattern=r"(?!.*-double\.pdf$)[^_].*\.pdf") to rapidly get Google Drive OCR when needed.
  - Hand heavy Tesseract/ custom ocr work to the `tesseract_ocr` subagent.
- `pdf/splitter` for splitting two-up scanned PDFs into single pages.
- `md/` has much code for processing Markdown files: `md/content_processor/details` for details blocks, `md/content_processor/footnote` for footnotes, `md/content_processor/commentary` for commentary.
- Splitting md files - `/home/vvasuki/gitland/sanskrit-coders/doc_curation/doc_curation_projects/general_tasks/splitter.py`
- `ebook/` for producing epubs and pdf-s from markdown.
- Bulk LLM proofreading/editing with rotating free keys — `llm/gemini`: gemini.process_text_chunks_with_keys or gemini.process_details_with_keys with `prompt=llm.get_prompt("~/gitland/sanskrit/sanskrit.github.io/content/groups/dyuganga/projects/text/proofreading/editing/AI-prompt/<style prompt>.md")`. 

### Other libraries 
For interacting with archive.org, there is the `ia` command line (configured). Also, there is `curation_utils.archive_utility`.

For transliteration, there is `indic_transliteration`; for meters, there is `chandas`. Both import from the same `~/gitland/python_venv` venv, as does `curation_utils`.
