+++
title = "End to end use"
+++

## Workflow
USER -> prompt -> HARNESS -> |payload| -> ORCHESTRATOR -> MODEL -> CoT+response -> ORCHESTRATOR -> |encrypt(CoT)+summarize(CoT)+plain(response)| -> HARNESS

<details><summary>Example</summary>

User: What is the capital of France?
Harness: <|user|>What is the capital of France?
Orchestrator: tokenize("<|user|>What is the capital of France?") => 72459 38972 109782 385 4920 ...

Model is fed those tokens and returns other tokens.

So orchestrator converts back to: <|user|>What is the capital of France?<|thinking|>The user is asking for the capital of France.\nFrance.\nParis.\nProvide a clear and direct answer.<|response|>The capital of France is **Paris**.
</details>


## Instruction assembly
instruction assembly order on opencode harness: agent prompt → Code Mode guidance → MCP/skill/reference → global and project AGENTS.md → date/env → session entries

## On-computer remote calls
We use harnesses, so we rarely notice how the info travels on the wire.

This is what happens: <|sys|>system prompt<|user|>...<|thinking|>...<|tool-call|>...<|thinking|>...<|tool-call|>...<|response|>...<|user|>................

