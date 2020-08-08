+++
title = "Layers"
+++

Given a computer network, suppose that we want to get any $k$ given computers to communicate accurately and easily in order to provide a variety of services to the users. This involves many common/ separate tasks which can be implemented as separate modules, which inturn can be arranged as a stack or hierarchy of layers. For details, see software architecture survey.

Common layers are described below, with TCP/IP protocol stack as a specific common instantiation, which dominated other standards due to it being open-source.

## Physical layer
At this lowest layer, one can place point to point communication protocols for transmitting certain messages across a single hop using electromagnetic waves/ currents.

## Network layer
Protocols/ software at this layer are responsible for discovery, maintenance, utilization of routes between computers in the network.

### IP protocol
#### Hierarchy of networks
A beautiful way to deal with a huge network, for the purposes of routing, is to consider it as a network of networks, which may inturn contain subnetworks etc.. The biggest hierarchical network, consisting of computers from all over the  world and beyond, is the internet.

##### Addressing
A natural way of specifying a hierarchy of networks is to use bit-strings. Suppose that one uses an n-bit string to denote the address of any computer in the Internet. Then, fixing $k$ higher order bits is equivalent to fixing a subnetwork, individual computers in which can then be addressed by specifying the remaining $n-k$ bits.

##### Routing
The hierarchical structure of networks can be exploited in routing. For every sub-network, there is atleast one gateway - a computer which is also linked to another computer outside the subnetwork, which is generally connected to the rest of the internet. Rather than record routes to every possible computer, a router can determine the route to the gateway in a subnetwork, and rely on it to route the packet within its subnetwork.

#### IPv4 addresses
These are 4 bytes long. Certain addresses are reserved for local/ special use (Eg: 127.0.0.1 for local host, 192.168.124.* for computers within a subnetwork where using it would be unambiguous etc..). All of these addresses have already been assigned to various entities, hence the shift to IPv6 addresses.

#### IPv6
These addresses are 6 bytes long.

### External link speed
Internet service providers (ISP's), when they advertise their service speed/ bandwidth, usually include bits taken up by the link and network layers (eg: ATM).

### Mobile networks
#### Standards
Standards compare capabilities of protocols - particularly data-transfer rate in highly mobile (bus or train) and low mobility settings. 3G guarantees 200kbps, while 4G provides 100Mbps in highly mobile settings and 1Gbps in low mobility settings.

In 2011, LTE was the protocol most capable of achieving 4G.

## Transport layer
This layer is responsible for routing the packet to the right application, in the right order, after sufficient efforts at ensuring accuracy and security. Includes TCP for sending an arbitrarily long packet stream, UDP (sending single packet).

Applications of various types usually listen at certain predetermined 'ports' - 4 byte numbers, of which there exists a conventional mapping of ports to application types which need not be followed.

