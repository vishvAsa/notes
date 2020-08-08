+++
title = "Spoken dialog systems"
+++

## Problem
The problem is for the user to communicate a task to a machine through a verbal dialog. A dialog consists of several 'turns', with the user and the machine speaking alternately within each turn.

Since the machine's 'belief' (aka dialog state) about the user's task changes as the dialog proceeds, this problem is also called belief-tracking.

### Examples
Voice mail system. Bus route information system. Route system.

### Domain ontology
The set of concepts the interaction involves is often limited. For example, in the voice-mail system, the concepts may be limited to Name, Message, Action (having values 'record message', 'save message', 'delete message'). This naturally limits the language internally used by the machine, though to interact with the user a richer language may be used.

## Interaction graph
The chain of events involved in dialog-processing is as follows. First the user has a goal \\(S_u\\) he wants to communicate. Also, the dialog itself has a current state \\(S_d\\), based on what has already been uttered. \\(S_u, S_d\\) cannot be observed by the machine.

The user then speaks something - ie acts on an intention \\(A_u\\). This is transformed into speech/ percieved action \\(Y_u\\).

This is processed by the Automatic Speech Recognition (ASR) module, which provides a scored list of possible phrases the user has uttered.

The output of ASR is passed to a (usually domain specific) parser or natural language understanding (NLU) module. This outputs a scored list of utterences: \\(\set{(A'_u, c)}\\) in a certain well-defined language. \\(A'_u\\) is usually in a language specific to the domain, eg: (Bus = 40, start = StopA, end = StopB).

The output of the NLU is then passed to the belief tracking system, which then produces a scored list of beliefs, or a belief state \\(S_m\\) which is meant to approximate \\((S_u, S_d, A_u)\\).

A decision-making module (aka decision manager) considers \\(S_m\\) and chooses what action \\(A_m\\) to perform (including what to say to the user). \\(A_m\\) in-turn affects the dialog model/ belief state.

\\(A_m\\) is then used by the language generation modules to communicate with the user. Thence, speech/ action \\(Y_m\\) is produced, which is then decoded as representing \\(A'_m\\) by the user.

The above can be visualized as a directed graph with various components being represented by nodes and messages labelling arrows.

The ASR and NLU modules use Finite State Transducers for their functioning.

