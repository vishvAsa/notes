#!/home/vvasuki/gitland/python_venv/bin/python
"""Sync OpenCode agent definitions to sibling ../vibe/agents/ as Mistral Vibe subagents.

Skills are NOT synced: Vibe reads the canonical skills from
`AI/opencode/skills` directly, via the `~/.vibe/skills` symlink.

Agents need conversion because OpenCode's frontmatter (name/title/mode/subagent
plus a list-of-mappings `permissions:` block) has no Vibe equivalent. Vibe wants
TOML files in `~/.vibe/agents/` (filename = agent name) with `description`,
`agent_type = "subagent"` and the prompt as the TOML `instructions` string.

Tool permissions are not converted: the OpenCode `permissions:` entries restrict
OpenCode UI actions (e.g. `subagent`), which have no Vibe tool counterpart. If a
Vibe-side restriction is ever needed, add `[tools.NAME]` rules to the generated
files (see `vibe config schema` / the Vibe docs).
"""

from pathlib import Path
import re


def toml_string(value: str) -> str:
    return '"""\n' + value + '"""'


def main() -> None:
    opencode_dir = Path(__file__).resolve().parent
    source_dir = opencode_dir / "agents"
    dest_dir = opencode_dir.parent / "vibe" / "agents"
    dest_dir.mkdir(parents=True, exist_ok=True)

    synced = []
    for source in sorted(source_dir.glob("*.md")):
        if source.name.startswith("_"):
            continue
        content = source.read_text(encoding="utf-8")
        match = re.match(r"^---\n(.*?)\n---\n(.*)$", content, flags=re.DOTALL)
        if not match:
            raise ValueError(f"{source} has no YAML frontmatter")
        frontmatter, body = match.groups()

        description_match = re.search(
            r"^description:\s*(.*?)\s*$", frontmatter, flags=re.MULTILINE
        )
        if not description_match:
            raise ValueError(f"{source} must define a description")

        name = source.stem
        lines = [
            f'description = """{description_match.group(1)}"""',
            "agent_type = 'subagent'",
            "instructions = '''",
            body.strip(),
            "'''",
            "",
        ]
        (dest_dir / f"{name}.toml").write_text("\n".join(lines), encoding="utf-8")
        synced.append(f"{name}.toml")

    for dest in dest_dir.glob("*.toml"):
        if dest.name not in synced:
            dest.unlink()

    print(f"Synced {len(synced)} agents to {dest_dir}: {', '.join(synced)}")


if __name__ == "__main__":
    main()
