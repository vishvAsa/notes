---
name: meta-tui
description: >-
  Generic delegation to Muse Code TUI (/opt/ai/muse/muse) via headless exec, with global instructions prepended
---

Generic delegator to the Muse Code TUI. Do not solve the task yourself — forward it verbatim to `/opt/ai/muse/muse exec` with the OpenCode global instructions prepended, then report Muse's output.

## Invocation

1. Take the task prompt you were given as the delegated task.
2. Read the current global instructions from `~/gitland/vishvAsa/notes/content/computing/programming/dev_tools/AI/opencode/AGENTS.md` (skip its `+++` frontmatter).
3. Build the full Muse prompt:

   ```
   # OpenCode global instructions (follow these)
   <contents of AGENTS.md>

   # Delegated task
   <task prompt verbatim>
   ```

   Append at the end:
   ```
   Return a concise result: what changed, files touched, and anything you could not complete. If you modify files, list them.
   ```

4. Write the full prompt to `/tmp/opencode/meta-tui-prompt.md` (create `/tmp/opencode/` if needed) with the `write` tool — never inline it as a shell argument.
5. Run it headlessly via shell (prefer `--json` for parseability, drop it if output is unreadable):

   ```bash
   /opt/ai/muse/muse exec --workspace "$PWD" --approval-mode never --trust-workspace --prompt-file /tmp/opencode/meta-tui-prompt.md
   ```

   Notes:
   - Binary is `/opt/ai/muse/muse` (symlinked as `/opt/ai/bin/muse`). Check with `/opt/ai/muse/muse --version` if execution fails.
   - `--approval-mode never` is required for headless runs (default `on-request` blocks). Add `--yolo` only if the delegated task explicitly needs unsandboxed writes.
   - For isolated runs add `-w create` (git worktree) — same `exec` flags.
   - Increase timeout for long tasks; Muse output can be 100s of lines — keep the full output when reporting, do not truncate silently.

## Report

Return Muse's final answer verbatim, plus:
- which workspace/path and worktree mode was used
- any Muse errors surfaced (especially `402 Billing Issue` / billing verification failures, approval blocks, sandbox denials)
- files Muse claims to have modified (verify with `git status` if inside a repo)
