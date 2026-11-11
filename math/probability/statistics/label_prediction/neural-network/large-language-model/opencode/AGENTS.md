+++
title = "OpenCode global instructions"
+++

# Global instructions

## Subagents

- Delegate to subagents whenever possible — exploration, research, multi-step work, or anything matching a listed agent's description — to keep the main context small.
- When running in JetBrains Air (which does not render background wakeups after a turn ends), poll active subagents periodically within the turn (using synchronous waits and `manage_subagents` checks) rather than ending the turn, and resume polling after handling any new user messages while subagents remain active.

### Model selection

- Be careful to use a free/lightweight model whenever possible.
- For bulk, mechanical, or low-risk work (formatting, repetitive edits, simple searches, large-file scanning), prefer a zero-cost model such or low-cost model (eg. `opencode/beam-free`, "flash_lite"). You can even use *-tui subagents for accessing such models.
- When delegating to a subagent, pass the model explicitly via the `model` parameter, e.g. `opencode-go/beam-free#xhigh`.
- Reserve stronger/paid models for judgment calls, verification of free/lighter-model output, and tasks where the lighter model is unsuitable.


## Compute

- Do NOT run CPU-heavy tasks on the local machine; offload them to Kaggle or Google Colab instead. Avoid grinding the local CPU.

## Existing code

Use and maintain existing code where possible — it is installed in the venv at `~/gitland/python_venv`, so invoke `~/gitland/python_venv/bin/python` (**not** the default `python3`). 

### doc_curation
Before writing text-processing code, check these in `~/gitland/sanskrit-coders/doc_curation`:

- `doc_curation.md.library` has `apply_function` which is especially useful for bulk processing Markdown files within a path. Use it in combination with other functions as needed.
- OCR (preferred): `pdf/drive_ocr` — especially use calls like drive_ocr.split_and_ocr_all( dir_path=..., small_pdf_pages=10, detext=False, file_pattern=r"(?!.*-double\.pdf$)[^_].*\.pdf") to rapidly get Google Drive OCR when needed.
  - Hand heavy Tesseract/ custom ocr work to the `tesseract-ocr` skill.
- `pdf/splitter` for splitting two-up scanned PDFs into single pages.
- `ebook/` for producing epubs and pdf-s from markdown.

### Transliteration

For transliteration, there is `indic_transliteration`, with the following -
- `aksharamukha_helper.transliterate_tamil` for tamil, sanscript.transliterate for others.
- `indic_transliteration/sanscript/schemes/brahmic/accent.py` has to_US_accents() to convert to udAtta(᳓)-svarita(᳙) accent scheme .

Particularly, for files with sanskrit names you outupt, use something like curation_utils.file_helper.get_storage_name(SANSKRIT_TEXT, source_script=sanscript.IAST)


### Other libraries 
For interacting with archive.org, there is the `ia` command line (configured). Also, there is `curation_utils.archive_utility`.

For meters, there is `chandas`. 

Both import from the same `~/gitland/python_venv` venv, as does `curation_utils`.

For "source to site-page" map updates, use doc_curation.hugo_site - figure out destination page with `md_to_site_path()` and then `appscript_client.post_append_rows()`.
