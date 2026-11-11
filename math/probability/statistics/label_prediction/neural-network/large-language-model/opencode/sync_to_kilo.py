#!/home/vvasuki/gitland/python_venv/bin/python
"""Sync OpenCode agent definitions to sibling ../kilo/agents/ as Kilo CLI agent files.

Skills are NOT synced: Kilo reads the canonical skills straight from
`AI/opencode/skills` via the `~/.kilo/skills` symlink and the `skills.paths`
entry in `~/.config/kilo/kilo.jsonc`.

Agents need conversion because OpenCode's frontmatter (name/title/mode/subagent
plus a list-of-mappings `permissions:` block) has no Kilo equivalent. Kilo wants
markdown files in `~/.config/kilo/agents/` (filename = agent name) with
`description` + `mode` frontmatter and the body as the system prompt. The
OpenCode `permissions:` entries describe OpenCode UI actions (e.g. `subagent`)
with no Kilo tool counterpart, so they are dropped; Kilo's own `[permission]`
keyed object can be added directly in the generated files if ever needed.

The `name`/`title` frontmatter keys are dropped too - the filename is the agent
name and Kilo shows no separate title.
"""

from pathlib import Path
import re


def convert_agent(content: str, source: Path) -> str:
    match = re.match(r"^---\n(.*?)\n---\n(.*)$", content, flags=re.DOTALL)
    if not match:
        raise ValueError(f"{source} has no YAML frontmatter")
    frontmatter, body = match.groups()

    description_match = re.search(r"^description:\s*(.*?)\s*$", frontmatter, flags=re.MULTILINE)
    mode_match = re.search(r"^mode:\s*(\S+)\s*$", frontmatter, flags=re.MULTILINE)
    if not description_match:
        raise ValueError(f"{source} must define a description")

    mode = mode_match.group(1) if mode_match else "subagent"
    if mode not in ("primary", "subagent", "all"):
        mode = "subagent"

    return f"---\ndescription: {description_match.group(1)}\nmode: {mode}\n---\n\n{body}"


def main() -> None:
    opencode_dir = Path(__file__).resolve().parent
    source_dir = opencode_dir / "agents"
    dest_dir = opencode_dir.parent / "kilo" / "agents"
    dest_dir.mkdir(parents=True, exist_ok=True)

    synced = []
    for source in sorted(source_dir.glob("*.md")):
        if source.name.startswith("_"):
            continue
        (dest_dir / source.name).write_text(
            convert_agent(source.read_text(encoding="utf-8"), source), encoding="utf-8"
        )
        synced.append(source.name)

    for dest in dest_dir.glob("*.md"):
        if not dest.name.startswith("_") and dest.name not in synced:
            dest.unlink()

    print(f"Synced {len(synced)} agents to {dest_dir}: {', '.join(synced)}")


if __name__ == "__main__":
    main()
