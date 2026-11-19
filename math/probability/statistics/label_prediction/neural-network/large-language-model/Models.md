+++
title = "Models"
+++
Model power increases with number of parameters. 

## Glossary
- **Dense model**: Every parameter in the network is activated for every token processed (e.g., a 27B dense model computes all 27B weights per token).
- **MoE (Mixture of Experts)**: Instead of one monolithic feed-forward network per layer, the layer is divided into many specialized sub-networks ("experts", e.g., 64 to 512), and a lightweight **router** activates only a few experts (e.g., top-8) for each token.
  - **Total parameters**: All weights across all experts stored in VRAM/memory. Determines total knowledge capacity and memory footprint. A large total can store more diverse expertise, but you only benefit from parts that get activated effectively.
  - **Active parameters**: The subset of weights actually computed per token forward pass. They’re often a better proxy for “how strong is each step of thinking/generation?”
- **Engram conditional memory**: Separate lookup-style memory parameters (used in DeepSeek 4.1) that store factual associations without adding to the core transformer compute per token.
- **Prefill vs. Decode**: **Prefill** ingests and processes the input prompt in parallel; **Decode** generates output (thinking + response) autoregressively one token at a time.

## Kilo → OpenCode Config Wiring

Kilo sessions reuse the OpenCode configuration from `opencode/`:

- **Global instructions**: `~/.config/kilo/AGENTS.md` → `opencode/AGENTS.md` (symlink)
- **Skills**: `~/.kilo/skills` → `opencode/skills` (symlink), plus `skills.paths` in `kilo.jsonc`
- **Agents/subagents**: `~/.config/kilo/agents` → `opencode/agents` (symlink), with `markdown_source` permission in `kilo.jsonc`

See `~/.config/kilo/kilo.jsonc` for the active config.

## Mistral Vibe → OpenCode Config Wiring

Mistral Vibe (`vibe` CLI, v3.1.2) sessions reuse the OpenCode configuration from `opencode/`:

- **Global instructions**: `~/.vibe/AGENTS.md` → `opencode/AGENTS.md` (symlink, pre-existing)
- **Skills**: `~/.vibe/skills` → `opencode/skills` (symlink), plus `skill_paths` in `~/.vibe/config.toml`
- **Agents/subagents**: `~/.vibe/agents` → `opencode/agents` (symlink)

See `~/.vibe/config.toml` for the active config.

## Review
Ranked roughly in decreasing order of intelligence

### 1T+
- **Claude Opus 4.6 Thinking / Opus 5.5 / Fable 5.1** (est. ≥1.5T–2T+ total MoE, undisclosed active).
- **Gemini 4 Argon** (est. ≥1.2T+ total MoE, undisclosed active) - much better than DeepSeek 4.1 Flash on sanskrit OCR. Good with hyphenation.
- **Gemini Carbon** (est. ~1.0–1.2T+ total MoE, undisclosed active; speculative, unconfirmed).
- **Gemini 2.5** (Pro est. ~1.0–1.2T+ total MoE) was good with sanskrit hyphenation. Gemini 2.5 scored 72.4 on Sanskrit and 80.3 on Sanskrit-English code-mixed text.
- **Mistral Large 3.5** (est. ~1.0–1.2T+ total MoE, undisclosed active).
- **longcat 2.5 preview** (1.6T total / 48B active MoE) - were quite bad at sanskrit.

### 500B+
- **Muse Spark 1.3** (est. ~816B total / ~42B active MoE, based on Muse Spark Open baseline) was good with sanskrit.
- **DeepSeek 4.1 Flash** (763B total: 552B core + 196B Engram memory; 8B prefill / 16B decode active) was good with sanskrit commentary interleaving.
- **Particle AI Particle-1 Free** (`openrouter/particle-ai/particle-1:free`): rank-64 LoRA post-train of DeepSeek V4.1 Flash (~1.25% params trained), inheriting base backbone 552B core + 196B Engram memory / 8B prefill, 16B decode active; 1M context.
- **Iceman Contributor Free** (stealth OpenCode Go model; parameters undisclosed, no credible public estimate; 262K context). Contributor variant: `opencode-go/iceman-contributor-free`. Seems smarter than Nemotron 3 Ultra
- **Crouton Alpha** (est. ~800B+ total / ~40B+ active MoE) much better than Beam. (supposed to be next muse)
- **GLM 5.3** (744B–753B total / 40B active MoE; Flash: 320B total / 18B active MoE) - good with structured tasks and coding.
- **Step 5 Preview Free** (604B total / 27B active MoE).
- **Claude Sonnet 4.6** (est. ~400B–600B total MoE, undisclosed active).
- **Thinking Machines Inkling 2 Small** (`thinkingmachines/inkling-2-small:free`): 17B active / 594B total multimodal MoE reasoning; ~1M context.
- **NVIDIA Nemotron 3 Ultra** (`nvidia/nemotron-3-ultra-550b-a55b:free`): 55B active / 550B total hybrid Transformer–Mamba MoE; frontier reasoning/orchestration; 1M context. Trial use only — no personal/confidential data. Free in Kilo.
- **InclusionAI Ling 3.2 Flash Free** (`openrouter/inclusionai/ling-3.2-flash:free`): Ling 3.2 Flash; 560B total / 25B active MoE; 1M context (native multimodal).
- **ling 3.1 flash free** (560B total / 25B active MoE) - were quite bad at sanskrit.
- **Beam Free 202611** (Reflection Beam 1.0: 501B total / 23.4B active MoE) was worse with sanskrit commentary interleaving; made overcomplications in programming. Stupider, but not too bad.
- **GPT-6.1 Terra** (proprietary mid-tier MoE, undisclosed parameters).

### 200B+
- **GLM 5.3 Flash** (320B total / 18B active MoE).
- **Xiaomi Mimo v2.6 Flash Free** (`opencode/mimo-v2.6-flash-free`): MiMo-V2.6-Flash; 309B total / 15B active MoE; 1M context.
- **Baidu ERNIE-5.5-Flash-Preview** (`baidu/ernie-5.5-flash-preview:free`): ~280B total; coding, agentic, deep research; ~1M context.
- **Dots Studio Dots3-Note Preview** (`dots-studio/dots-3-note-preview:free`): 16B active / 280B total MoE; 512K context. Free in Kilo.
- **Gemini 3.0, 3.5, 3.8 Flash** (est. ~250–300B total, low active MoE) were worse with sanskrit hyphenation.
- **Mistral Medium 3.5** (est. ~200–250B total MoE, undisclosed active).
- **HY4 Flash Free** (`opencode/hy4-flash-free`, `opencode-go/hy4-flash-free`): Tencent Hy4-flash; ~220B total (incl. ~64B Engram) / ~12B active per token; 1M context.
- **Stealth Glyph Cluster** (`stealth/glyph-cluster`): reasoning model for coding and long-context analysis via Vercel AI Gateway; parameters undisclosed, no credible public estimate; 256K context; prompts may be retained for training.

### Rest
- **GPT-OSS 120B** (`gpt-oss-120b-medium`: 116.8B total / 5.1B active MoE).
- **NVIDIA Nemotron 3.5 Super VL** (`nvidia/nemotron-3.5-super-vl:free`): 12B active / 120B total multimodal MoE; 1M context. Trial use only — no personal/confidential data. Free in Kilo.
- **Junie Lite** (Qwen 3.6: 27B dense).
- **Flint 40B Free** (`opencode/flint-40b-free`): 40B dense; recursive variant (`openrouter/recursive/flint-v1.0:free`) also available.
- **Google Gemma 4 31B IT** (`google/gemma-4-31b-it:free`): 31B dense; instruction-tuned.
- **NVIDIA Nemotron 3 Nano Omni** (`nvidia/nemotron-3-nano-omni-30b-a3b-reasoning:free`): 30B-A3B multimodal perception/context sub-agent; 256K context.
- **Cohere North Mini Code** (`cohere/north-mini-code:free`): 3B active / 30B total sparse MoE; agentic coding; 256K context.
- **NVIDIA Nemotron 3.5 Lightning** (`nvidia/nemotron-3.5-lightning:free`): 3B active / 30B total MoE; high-throughput agentic; 1M context.
- **Tidepool Alpha Free** (`opencode/tidepool-alpha-free`): experimental alpha model; parameters undisclosed, no credible public estimate.
- **LiquidAI LFM3-1.7B** (`liquid/lfm-3-1.7b:free`): 1.7B dense; 256K context; agents/tool calling/structured outputs.
- **Auto Small free fallback** (no balance): `google/gemma-4-26b-a4b-it:free`.

## Frontier Model Size Estimates (from Anpaure)

| Model | Estimated total parameters |
|-------|-----------------------------|
| Claude Fable 5 | 4.5T |
| GPT‑5.6 Sol | 3.1T |
| Claude Opus 5 | 3.0T |
| Kimi K3 | 2.8T |
| Claude Opus 4.8 | 2.7T |
| GPT‑5.5 | 2.3T |
| GPT‑5.6 Terra | 2.1T |
| Claude Sonnet 5 | 1.6T |
| Grok 4.5 | 1.5T |
| GPT‑5.6 Luna | 1.5T |

