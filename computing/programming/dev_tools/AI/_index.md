+++
title = "+AI"
+++


## End to end use

### Workflow
USER -> prompt -> HARNESS -> |payload| -> ORCHESTRATOR -> MODEL -> CoT+response -> ORCHESTRATOR -> |encrypt(CoT)+summarize(CoT)+plain(response)| -> HARNESS

<details><summary>Example</summary>

User: What is the capital of France?
Harness: <|user|>What is the capital of France?
Orchestrator: tokenize("<|user|>What is the capital of France?") => 72459 38972 109782 385 4920 ...

Model is fed those tokens and returns other tokens.

So orchestrator converts back to: <|user|>What is the capital of France?<|thinking|>The user is asking for the capital of France.\nFrance.\nParis.\nProvide a clear and direct answer.<|response|>The capital of France is **Paris**.
</details>



### On-computer remote calls
We use harnesses, so we rarely notice how the info travels on the wire.

This is what happens: <|sys|>system prompt<|user|>...<|thinking|>...<|tool-call|>...<|thinking|>...<|tool-call|>...<|response|>...<|user|>................

Free models on opencode tend to be good. 

## Metering
Input and output tokens are measured and metered.  
Chain of thought/ reasoning is part of the output.  
On every prompt, the entire conversation is sent to the server. 

### Prefix caching
Each input prefix corresponds to some chain of thought output. (prefix, ouput) pair is cached. That reduces the model workload. So, metered less.  

Most servers evict cache in 1-5m. So cache is only useful for chain of thought continuation, quick conversation, fast tool calls, practically.

#### Harness compliance
Some harnesses insert timestamps and other random nonsense in the system prompt and other prompts. They will even randomly compress the conversation. This causes cache invalidation and full input processing.

### Per API vs Subscription
Some like opencode advertize plainly - "you get 80$ worth of model x API usage with a 10$ subscription".  
Others don't - they're measured externally, leading to deductions like - "you get 599$ worth of model X API usage with 15$ subscription".

They give you accurate figures for API - not for subscriptions. They use an opaque "requests" model. This is why you are never sure with Claude how much time you have left.



### Token minimization
#### SLP for sanskrit?

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

## Models 
### Thinking 
Thinking too is pattern completion only. LLMs are a one trick pony. They can predict the next token.

> <|user|>What is the capital of France?<|thinking|>The user is asking for the capital of France.\nFrance.\nParis.\nProvide a clear and direct answer.<|response|>The capital of France is **Paris**.

Those <|...|> tags are critical. They are what allow for Q&A. You can convert a non-thinking model to a thinkign model this way. By training it on loads of thinking prompts

### Training
#### Distilling from other models
You can actually build small but fantastic local models by using frontier models as teachers - Train local model in this output. Including reasoning. You get a strong mini model that mimics the frontier model.

If you save all your pi sessions with DeepSeek and other open models, you will have tens of thousands of prompts for a model to train on.

if you start a conversation with a very strong model and continue with a dumb one, the dumb one will suddenly appear very intelligent.

##### Obfuscation
Gemini and Muse encrypt the CoT before sending it to you over the API. So, even if you only see a summary of the thinking, you are still charged for the whole thing. 

Claude, ChatGPT, Gemini do this. The Chinese don't. The Open western models like Mistral don't.

## Providers
### Overload problems
> The providers are under a lot of load. It causes timeouts and other similar issues. So what you see in the client depends very much on what the orchestrator/server that mediates between you and the model decides to present.  
DeepSeek increased prices nearly 5x last month for this very reason. People have been complaining about OpenCode on their reddit for the last couple of days ever since they introduced their Plus plans. - kArtik 202610

### OpenCode

#### Go plan limits (202610)
10 USD per month gets 60USD muse spark or x USD of some other models. Can mix and match models till the money is exhausted. Eg from 202610. The base is $10. Then multiplier applies. GLM53: 1.5x MS13: 6.0x. So can do MS13 $30/6 (= $5) + GLM53 $7.5/1.5 (= $5) = $10

- 5h - can use upto 25pc of your monthly quota  
- 1w - 50pc
- 1m - 100 pc.

Basically, you can use up your weekly quota in two 5h sessions. And your monthly quota in two weeks.