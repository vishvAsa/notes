+++
title = "Metering"
+++
Input and output tokens are measured and metered.  
Chain of thought/ reasoning is part of the output.  
On every prompt, the entire conversation is sent to the server. 

## Prefix caching
Each input prefix corresponds to some chain of thought output. (prefix, ouput) pair is cached. That reduces the model workload. So, metered less.  

Most servers evict cache in 1-5m. So cache is only useful for chain of thought continuation, quick conversation, fast tool calls, practically.

### Harness compliance
Some harnesses insert timestamps and other random nonsense in the system prompt and other prompts. They will even randomly compress the conversation. This causes cache invalidation and full input processing.

## Per API vs Subscription
Some like opencode advertize plainly - "you get 80$ worth of model x API usage with a 10$ subscription".  
Others don't - they're measured externally, leading to deductions like - "you get 599$ worth of model X API usage with 15$ subscription".

They give you accurate figures for API - not for subscriptions. They use an opaque "requests" model. This is why you are never sure with Claude how much time you have left.



## Token minimization
### SLP for sanskrit?

202610 metrics -  

```
model                                   dev in  slp1 in   delta   save%
-----------------------------------------------------------------------
opencode-go/muse-spark-1.3-contributor    8523     8508     -15    -0.2
opencode-go/step-5-preview-free           7108     7056     -52    -0.7
opencode-go/deepseek-v4.1-flash           6868      800   -6068   -88.4
opencode-go/longcat-2.5-preview-free      1376     1050    -326   -23.7
```

But that compression wouldn't be useful if the model is bad at reasoning with sanskrit.
