+++
title = "+Application layer"
+++

## Content delivery network
Transferring large files to the consumer is faster when it is cached at a location close to the consumer (in terms of time). Large companies may use their own special content delivery network, or provide such a service to others, in order to get more patronage from consumers whose ISp's have slow links to distant servers.

Eg: Akamai.

## HTTP
This is a primitive protocol meant to transfer files from servers to clients, with annotation about meta-information.

## Web services architecture
### Broker, provider, consumer
There is a services broker/ directory, with which various service machines register details about their services, and which can be used by other machines to locate services fitting their needs. Having done that, the service consumer and provider interact directly.

Various protocols define format for transmitting objects (SOAP XML), service descriptions (Web Service Description Language) etc..

## Service oriented architecture (SOA)
The basic unit of communication is a message, rather than an operation. This is often implemented using web services.
