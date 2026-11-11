+++
title = "Providers"
+++
## Overload problems
> The providers are under a lot of load. It causes timeouts and other similar issues. So what you see in the client depends very much on what the orchestrator/server that mediates between you and the model decides to present.  
DeepSeek increased prices nearly 5x last month for this very reason. People have been complaining about OpenCode on their reddit for the last couple of days ever since they introduced their Plus plans. - kArtik 202610

## OpenCode

### Go plan limits
10 USD per month gets 100USD DeepSeek or x USD of some other models (202611). Some models are even free. 

Can mix and match models till the money is exhausted. Eg from 202610. The base is $10. Then multiplier applies. GLM53: 1.5x MS13: 6.0x. So can do MS13 $30/6 (= $5) + GLM53 $7.5/1.5 (= $5) = $10

- 5h - can use upto 25pc of your monthly quota  
- 1w - 50pc
- 1m - 100 pc.

Basically, you can use up your weekly quota in two 5h sessions. And your monthly quota in two weeks.

Once the monthly quota is exhausted, you can't use even free models anymore.

## OpenDesign
Source: [TW](https://open-design.ai/pricing/)

Slightly cheaper than OpenCode as of 202611, but no free models.

## Cursor
**Cursor free account models**: GPT-4o, GPT-4o mini, Claude 3.5 Sonnet, Claude 3.7 Sonnet, Llama 3.2 (110B+), Mistral Large 2, CodeLlama 70B, Phind CodeLlama 34B.

## Openrouter
- **OpenRouter Free Models Router** (`openrouter/free`): random free models from OpenRouter's catalog (Qwen3 Coder, GLM 4.5 Air, DeepSeek R1 0528); requires OpenRouter account keyed into Kilo.


## GitHub Copilot auto
GitHub Copilot coding agent in intellij runs `auto` mode usually selecting `mai-code-1.1-flash` [Microsoft MAI-1 coder MoE variant: est. ~500B total, ~15–20B active MoE / 128K context]. Quite stupid at even hindI proofreading. Refuses pdf to md jobs for copyright reasons. Smarter options - `gpt-6-luna` ~1.5T; or user-selectable `claude-sonnet-5`, `claude-opus-5`, `gpt-5.6-sol`, etc.) are selected sometimes (eg. for hyphenation.)

## Kilo
Free models available through the Kilo Gateway (no credits required; subject to rate limits — 200 requests/hour per IP for anonymous users). Availability shifts; check `kilo.ai/models` for the live catalog.

- **Auto Free** (`kilo-auto/free`): rotates dynamically through a curated set of free models per session (currently incl. Nemotron 3.5 Super VL, Nemotron 3 Ultra, Glyph Cluster, Dots3-Note, ERNIE-5.5-Flash, Inkling 2 Small); 256K context; limited capability. Prompts may be logged by upstream providers and used to improve services — not for sensitive data.
