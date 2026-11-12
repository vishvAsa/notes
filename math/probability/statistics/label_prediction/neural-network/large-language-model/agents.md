+++
title = "Agents"
+++

(sub)agent/process/worker/thread/task/(and workflow in the case of MuseCode) etc normally refer to the harness running models in a separate process/thread in a manager-subordiate relationship.

Only certain harnesses like pi-dev/opencode / antigravity / copilot allow you to write skill-cum-extensions. Some don't, like MuseCode.

## Harness configuration

Global rules, agent (subagent) definitions and skills for all the harnesses live in one place: `~/gitland/sanskrit-coders/doc_curation/doc_curation/llm/configurer/data` (the `doc_curation.llm.configurer` package). `data/opencode/` is canonical; the other harness copies are generated. From that package run:

```bash
python -m doc_curation.llm.configurer sync      # regenerate each harness's agent files
python -m doc_curation.llm.configurer symlinks  # create/repair the ~/.config/... links
python -m doc_curation.llm.configurer all       # both
```