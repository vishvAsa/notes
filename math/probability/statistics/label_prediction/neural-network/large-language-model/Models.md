+++
title = "Models"
+++
Model power increases with number of parameters. 

## Glossary
- **Dense model**: Every parameter in the network is activated for every token processed (e.g., a 27B dense model computes all 27B weights per token).
- **MoE (Mixture of Experts)**: Instead of one monolithic feed-forward network per layer, the layer is divided into many specialized sub-networks ("experts", e.g., 64 to 512), and a lightweight **router** activates only a few experts (e.g., top-8) for each token.
  - **Total parameters**: All weights across all experts stored in VRAM/memory. Determines total knowledge capacity and memory footprint.
  - **Active parameters**: The subset of weights actually computed per token forward pass. Determines inference speed, cost, and per-token compute.
- **Engram conditional memory**: Separate lookup-style memory parameters (used in DeepSeek 4.1) that store factual associations without adding to the core transformer compute per token.
- **Prefill vs. Decode**: **Prefill** ingests and processes the input prompt in parallel; **Decode** generates output (thinking + response) autoregressively one token at a time.

## Review
Ranked roughly in decreasing order of intelligence

- Claude Opus 4.6 Thinking / Opus 5.5 / Fable 5.1 (est. ≥1.5T–2T+ total MoE, undisclosed active).
- Gemini 4 Argon (est. ≥1.2T+ total MoE, undisclosed active) - much better than DeepSeek 4.1 Flash on sanskrit OCR. Good with hyphenation.
- Gemini 2.5 (Pro est. ~1.0–1.2T+ total MoE; Flash est. ~200–250B total) was good with sanskrit hyphenation. Gemini 2.5 scored 72.4 on Sanskrit and 80.3 on Sanskrit-English code-mixed text.
- Mistral Large 3.5 (est. ~1.0–1.2T+ total MoE, undisclosed active).
- **NVIDIA Nemotron 3 Ultra** (`nvidia/nemotron-3-ultra-550b-a55b:free`): 55B active / 550B total hybrid Transformer–Mamba MoE; frontier reasoning/orchestration; 1M context. Trial use only — no personal/confidential data.
- Claude Sonnet 4.6 (est. ~400B–600B total MoE, undisclosed active).
- GPT-6.1 Terra (proprietary mid-tier MoE, undisclosed parameters).
- Crouton Alpha (est. ~800B+ total / ~40B+ active MoE) much better than Beam. (supposed to be next muse)
- Muse Spark 1.3 (est. ~816B total / ~42B active MoE, based on Muse Spark Open baseline) was good with sanskrit.
- GLM 5.3 (744B–753B total / 40B active MoE; Flash: 320B total / 18B active MoE) - good with structured tasks and coding.
- GLM 5.3 Flash (320B total / 18B active MoE).
- **Cursor free account models**: GPT-4o, GPT-4o mini, Claude 3.5 Sonnet, Claude 3.7 Sonnet, Llama 3.2 (110B+), Mistral Large 2, CodeLlama 70B, Phind CodeLlama 34B.
- DeepSeek 4.1 Flash (763B total: 552B core + 196B Engram memory; 8B prefill / 16B decode active) was good with sanskrit commentary interleaving.
- **Thinking Machines Inkling 2 Small** (`thinkingmachines/inkling-2-small:free`): 17B active / 594B total multimodal MoE reasoning; ~1M context.
- **Baidu ERNIE-5.5-Flash-Preview** (`baidu/ernie-5.5-flash-preview:free`): ~280B total; coding, agentic, deep research; ~1M context.
- **Dots Studio Dots3-Note Preview** (`dots-studio/dots-3-note-preview:free`): 16B active / 280B total MoE; 512K context.
- Gemini 3.0, 3.5, 3.8 Flash (est. ~250–300B total, low active MoE) were worse with sanskrit hyphenation.
- Step 5 Preview Free (604B total / 27B active MoE).
- Beam Free 202611 (Reflection Beam 1.0: 501B total / 23.4B active MoE) was worse with sanskrit commentary interleaving; made overcomplications in programming. Stupider, but not too bad.
- **NVIDIA Nemotron 3 Nano Omni** (`nvidia/nemotron-3-nano-omni-30b-a3b-reasoning:free`): 30B-A3B multimodal perception/context sub-agent; 256K context.
- Iceman Contributor Free (stealth OpenCode Go model, undisclosed parameters, 262K context).
- Mistral Medium 3.5 (est. ~200–250B total MoE, undisclosed active).
- longcat 2.5 preview (1.6T total / 48B active MoE) - were quite bad at sanskrit.
- ling 3.1 flash free (560B total / 25B active MoE) - were quite bad at sanskrit.
- **Stealth Glyph Cluster** (`stealth/glyph-cluster`): reasoning model for coding and long-context analysis via Vercel AI Gateway; 256K context; prompts may be retained for training.
- GPT-OSS 120B (`gpt-oss-120b-medium`: 116.8B total / 5.1B active MoE).
- Junie Lite (Qwen 3.6: 27B dense).
- **NVIDIA Nemotron 3.5 Super VL** (`nvidia/nemotron-3.5-super-vl:free`): 12B active / 120B total multimodal MoE; 1M context. Trial use only — no personal/confidential data.
- **Cohere North Mini Code** (`cohere/north-mini-code:free`): 3B active / 30B total sparse MoE; agentic coding; 256K context.
- **NVIDIA Nemotron 3.5 Lightning** (`nvidia/nemotron-3.5-lightning:free`): 3B active / 30B total MoE; high-throughput agentic; 1M context.
- **LiquidAI LFM3-1.7B** (`liquid/lfm-3-1.7b:free`): 1.7B dense; 256K context; agents/tool calling/structured outputs.
- Auto Small free fallback (no balance): `google/gemma-4-26b-a4b-it:free`.

## Frontier Model Size Estimates (from Anpaure)

| Model | Estimated total parameters |
|-------|-----------------------------|
| Claude Fable 5 | 4.5 T |
| GPT‑5.6 Sol | 3.1 T |
| Claude Opus 5 | 3.0 T |
| Kimi K3 | 2.8 T |
| Claude Opus 4.8 | 2.7 T |
| GPT‑5.5 | 2.3 T |
| GPT‑5.6 Terra | 2.1 T |
| Claude Sonnet 5 | 1.6 T |
| Grok 4.5 | 1.5 T |
| GPT‑5.6 Luna | 1.5 T |

## Auto routing
### Openrouter
- **OpenRouter Free Models Router** (`openrouter/free`): random free models from OpenRouter's catalog (Qwen3 Coder, GLM 4.5 Air, DeepSeek R1 0528); requires OpenRouter account keyed into Kilo.


### GitHub Copilot auto
GitHub Copilot coding agent in intellij runs `auto` mode usually selecting `mai-code-1.1-flash` [Microsoft MAI-1 coder MoE variant: est. ~500B total, ~15–20B active MoE / 128K context]. Quite stupid at even hindI proofreading. Refuses pdf to md jobs for copyright reasons. Smarter options - `gpt-6-luna` ~1.5T; or user-selectable `claude-sonnet-5`, `claude-opus-5`, `gpt-5.6-sol`, etc.) are selected sometimes (eg. for hyphenation.)

### Kilo
Free models available through the Kilo Gateway (no credits required; subject to rate limits — 200 requests/hour per IP for anonymous users). Availability shifts; check `kilo.ai/models` for the live catalog.

- **Auto Free** (`kilo-auto/free`): rotates dynamically through a curated set of free models per session (currently incl. Nemotron 3.5 Super VL, Nemotron 3 Ultra, Glyph Cluster, Dots3-Note, ERNIE-5.5-Flash, Inkling 2 Small); 256K context; limited capability. Prompts may be logged by upstream providers and used to improve services — not for sensitive data.
