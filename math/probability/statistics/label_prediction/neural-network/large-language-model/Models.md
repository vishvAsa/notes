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
- Claude Opus 4.6 Thinking / Opus 5.5 / Fable 5.1 (est. ≥1.5T–2T+ total MoE, undisclosed active).
- Gemini 4 Argon (est. ≥1.2T+ total MoE, undisclosed active) - much better than DeepSeek 4.1 Flash on sanskrit OCR. Good with hyphenation.
- Gemini 2.5 (Pro est. ~1.0–1.2T+ total MoE; Flash est. ~200–250B total) was good with sanskrit hyphenation.
- Claude Sonnet 4.6 (est. ~400B–600B total MoE, undisclosed active).
- GPT-6.1 Terra (proprietary mid-tier MoE, undisclosed parameters).
- Crouton Alpha (est. ~800B+ total / ~40B+ active MoE) much better than Beam. (supposed to be next muse)
- Muse Spark 1.3 (est. ~816B total / ~42B active MoE, based on Muse Spark Open baseline) was good with sanskrit.
- GLM 5.3 (744B–753B total / 40B active MoE; Flash: 320B total / 18B active MoE).
- DeepSeek 4.1 Flash (763B total: 552B core + 196B Engram memory; 8B prefill / 16B decode active) was good with sanskrit commentary interleaving.
- Gemini 3.0, 3.5, 3.8 Flash (est. ~250–300B total, low active MoE) were worse with sanskrit hyphenation.
- Step 5 Preview Free (604B total / 27B active MoE).
- Beam Free 202611 (Reflection Beam 1.0: 501B total / 23.4B active MoE) was worse with sanskrit commentary interleaving; made overcomplications in programming. Stupider, but not too bad.
- Iceman Contributor Free (stealth OpenCode Go model, undisclosed parameters, 262K context).
- longcat 2.5 preview (1.6T total / 48B active MoE) - were quite bad at sanskrit.
- ling 3.1 flash free (560B total / 25B active MoE) - were quite bad at sanskrit.
- GPT-OSS 120B (`gpt-oss-120b-medium`: 116.8B total / 5.1B active MoE).
- Junie Lite (Qwen 3.6: 27B dense).

