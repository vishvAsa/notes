# Global instructions

## Subagents

- Delegate to subagents whenever possible — exploration, research, multi-step work, or anything matching a listed agent's description — to keep the main context small.

## Model selection

- Be careful to use a free model on OpenCode Go whenever possible.
- For bulk, mechanical, or low-risk work (formatting, repetitive edits, simple searches, large-file scanning), prefer a zero-cost OpenCode Go model such as `opencode-go/beam-free` or `opencode-go/iceman-contributor-free`.
- Reserve stronger/paid models for judgment calls, verification of free-model output, and tasks where the free model is unsuitable.
- When delegating to a subagent, pass the free model explicitly via the `model` parameter, for example `opencode-go/beam-free#xhigh`.


## Proofreading scanned texts

- Never guess at illegible text: mark the smallest span (e.g. `…[[??]]`) and move on.
- Preserve existing headings and paragraphs; edit only what was asked.
- Check `[[Pnnn]]` page markers against the printed folio — PDF/book offsets drift between volumes and even within one volume.
- If you don't need to run special OCR tools (there's a subagent specified for that), use calls like drive_ocr.split_and_ocr_all( dir_path=..., small_pdf_pages=10, detext=False, file_pattern=r"(?!.*-double\.pdf$)[^_].*\.pdf") from /home/vvasuki/gitland/sanskrit-coders/doc_curation/doc_curation/pdf/drive_ocr.py to rapidly get Google OCR when needed.


## Compute

- Do NOT run CPU-heavy tasks on the local machine; offload them to Kaggle or Google Colab instead. Avoid grinding the local CPU.

