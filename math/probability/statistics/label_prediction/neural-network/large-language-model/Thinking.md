+++
title = "Thinking"
+++
Thinking too is pattern completion only. LLMs are a one trick pony. They can predict the next token.

> <|user|>What is the capital of France?<|thinking|>The user is asking for the capital of France.\nFrance.\nParis.\nProvide a clear and direct answer.<|response|>The capital of France is **Paris**.

Those <|...|> tags are critical. They are what allow for Q&A. You can convert a non-thinking model to a thinkign model this way. By training it on loads of thinking prompts

## Control plane
Typical message includes parameters other than the message (actual input to the transformer).

```
{
  "model": "muse-spark-1.1",
  "messages": [{"role": "user", "content": "Explain TCP"}],
  "reasoning_effort": "low",
  "temperature": 0.7,
  "max_tokens": 1024
}
```

temperature, top_p, top_k - how to sample from the logits.  
max_tokens, stop sequences - when to stop  
seed, logit_bias - reproducibility / steering  
seed, logit_bias - reproducibility / steering

### Max token enforcement
reasoning_effort = low -> backend translates to thinking_budget = ∼1k tokens  
reasoning_effort = max -> thinking_budget = ∼20k+ tokens

A prompt gets injected.
```

if reached_budget:
    # force transition
    inject_token(END_OF_THINKING)
    inject_prompt("Now produce final answer based on your thinking...")
```
