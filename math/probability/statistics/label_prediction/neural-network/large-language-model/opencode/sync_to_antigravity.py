#!/home/vvasuki/gitland/python_venv/bin/python
"""Sync OpenCode agent definitions to sibling ../antigravity/agents/ with Antigravity full tool permissions.

Skills are NOT synced: all three tools read the canonical skills from
`AI/opencode/skills` directly, via these links:

- OpenCode:    ~/.config/opencode/skills -> AI/opencode/skills
- Antigravity: ~/.gemini/config/skills   -> AI/opencode/skills
- Copilot:     ~/.agents/skills          -> AI/opencode/skills

Agents still need conversion because OpenCode agent frontmatter (`mode`, `subagent`,
`permissions`) has no Antigravity equivalent, Antigravity wants an explicit `tools:`
list, and it resolves markdown links strictly, so `](~/...)` must be expanded.
"""

from pathlib import Path
import re

DEFAULT_AGY_TOOLS = [
    "send_message",
    "view_file",
    "search_web",
    "schedule",
    "generate_image",
    "write_file",
    "edit_file",
    "run_command",
    "manage_task",
    "define_subagent",
    "invoke_subagent",
    "manage_subagents",
]


def transform_for_antigravity(content: str, home_dir: str) -> str:
    match = re.match(r"^---\n(.*?\n)---\n(.*)$", content, flags=re.DOTALL)
    if not match:
        return content

    frontmatter, body = match.group(1), match.group(2)

    if not re.search(r"^tools\s*:", frontmatter, flags=re.MULTILINE):
        tools_yaml = "tools:\n" + "".join(f"  - {t}\n" for t in DEFAULT_AGY_TOOLS)
        frontmatter = frontmatter.rstrip("\n") + "\n" + tools_yaml

    # Antigravity resolves markdown links strictly; expand leading ~/ in links to absolute home path.
    body = re.sub(r"\]\(~/", f"]({home_dir}/", body)

    return f"---\n{frontmatter}---\n{body}"


def main() -> None:
    opencode_dir = Path(__file__).resolve().parent
    src_agents_dir = opencode_dir / "agents"
    dest_agents_dir = opencode_dir.parent / "antigravity" / "agents"
    dest_agents_dir.mkdir(parents=True, exist_ok=True)

    home_dir = str(Path.home())
    synced = []

    for src_file in sorted(src_agents_dir.glob("*.md")):
        if src_file.name.startswith("_"):
            continue
        transformed = transform_for_antigravity(src_file.read_text(encoding="utf-8"), home_dir)
        dest_file = dest_agents_dir / src_file.name
        dest_file.write_text(transformed, encoding="utf-8")
        synced.append(dest_file.name)

    # Remove stale agent files in destination that no longer exist in source
    for dest_file in dest_agents_dir.glob("*.md"):
        if not dest_file.name.startswith("_") and dest_file.name not in synced:
            dest_file.unlink()

    print(f"Synced {len(synced)} agents to {dest_agents_dir}: {', '.join(synced)}")


if __name__ == "__main__":
    main()
