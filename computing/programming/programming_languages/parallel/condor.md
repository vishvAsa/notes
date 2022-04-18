+++
title = "Condor"
+++

This is a common job-scheduler. Once you specify the job in a certain file, condor tries to execute it on some processor (in a cluster) and retrieve the result.

## Priority and restarts
Commonly jobs dispatched by condor are low priority - so if a higher priority process comes in, the condor job is stopped and moved to a different processor. If the program has checkpointing facilites, the job simply continues from where it stopped : Eg: Compiled languages. But if checkpointing is not available, the process restarts when moved to a different node: Eg: most interpreted languages.
