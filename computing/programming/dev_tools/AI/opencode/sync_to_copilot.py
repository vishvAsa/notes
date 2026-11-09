#!/home/vvasuki/gitland/python_venv/bin/python
"""Convert OpenCode agent profiles to GitHub Copilot CLI profiles."""

from pathlib import Path
import re


def convert_agent(content: str, source: Path) -> str:
    match = re.match(r"^---\n(.*?)\n---\n(.*)$", content, flags=re.DOTALL)
    if not match:
        raise ValueError(f"{source} has no YAML frontmatter")

    frontmatter, body = match.groups()
    name_match = re.search(r"^name:\s*(.*?)\s*$", frontmatter, flags=re.MULTILINE)
    description_match = re.search(
        r"^description:\s*(.*?)\s*$", frontmatter, flags=re.MULTILINE
    )
    if not name_match or not description_match:
        raise ValueError(f"{source} must define name and description")

    name = name_match.group(1)
    description = description_match.group(1)
    return (
        "---\n"
        f"name: {name}\n"
        "description: >-\n"
        f"  {description}\n"
        "---\n"
        f"{body}"
    )


def main() -> None:
    opencode_dir = Path(__file__).resolve().parent
    source_dir = opencode_dir / "agents"
    destination_dir = opencode_dir.parent / "copilot" / "agents"
    destination_dir.mkdir(parents=True, exist_ok=True)

    synced = []
    for source in sorted(source_dir.glob("*.md")):
        if source.name.startswith("_"):
            continue
        destination = destination_dir / f"{source.stem}.agent.md"
        destination.write_text(
            convert_agent(source.read_text(encoding="utf-8"), source),
            encoding="utf-8",
        )
        synced.append(destination.name)

    for destination in destination_dir.glob("*.agent.md"):
        if not destination.name.startswith("_") and destination.name not in synced:
            destination.unlink()

    print(f"Synced {len(synced)} agents to {destination_dir}: {', '.join(synced)}")


if __name__ == "__main__":
    main()
