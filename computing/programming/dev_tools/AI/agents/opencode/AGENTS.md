# Global instructions

## Subagents

- Use subagents whenever possible to keep the main context small; delegate exploration, research, and multi-step work to subagents instead of doing it inline.
- `reviewer` — send any non-trivial change here before calling it done, instead of reviewing it yourself. It applies the house rules on function/module size and on externalising large data.
- `tesseract_ocr` — send all Tesseract OCR and other heavy batch work here; it keeps run scripts, dataset staging and a README inside the project, and runs on Kaggle or Colab.

## Model selection

- Be careful to use a free model on OpenCode Go whenever possible.
- For bulk, mechanical, or low-risk work (formatting, repetitive edits, simple searches, large-file scanning), prefer a zero-cost OpenCode Go model such as `opencode-go/beam-free` or `opencode-go/iceman-contributor-free`.
- Reserve stronger/paid models for judgment calls, verification of free-model output, and tasks where the free model is unsuitable.
- When delegating to a subagent, pass the free model explicitly via the `model` parameter, for example `opencode-go/beam-free#xhigh`.

## Proofreading scanned texts

- Never guess at illegible text: mark the smallest span (e.g. `…[[??]]`) and move on.
- Preserve existing headings and paragraphs; edit only what was asked.
- Check `[[Pnnn]]` page markers against the printed folio — PDF/book offsets drift between volumes and even within one volume.

## Compute

- Do NOT run CPU-heavy tasks on the local machine; offload them to Kaggle or Google Colab instead. Avoid grinding the local CPU.

