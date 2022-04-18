+++
title = "DNS"
+++

## Domain name
To connect to an application on a remote computer, one needs to know the IP address of that computer, which is often supplied to the application externally - by a user for example. Strings, called domain names, tend to be easier to remember than IP addresses. 

### Translation
So domain name resolution can be considered a sub-module used for translating domain names to IP addresses.

### Hierarchy
Domain names take the form A.B..C. C is called the top level domain (eg: com, in, ..). A.B is a subdomain of B etc..

For each (sub)domain, there is a universally agreed upon primary DNS (Doman name server), which has a table which contains entries which describe how a domain name is to be resolved to get an IP address.

These tables are often duplicated (and synchronized) in various locations for providing quick service accross the internet.

Types of entries include: A, which directly map a given domain to an IP address, CNAME which translates a domain to a url, and a type of entry which says that, for resolution, one ought to refer to a table maintained by another DNS (Domain delegation). 

## Registration
One registers with registrars, who often offer appropriate access to their DNS.

### Economics
There is much demand for certain domains, and they fetch high prices. To attract registration, registrars ask for deceptively low 'first year prices' or low prices for very short-term registration, which places the burden of frequent renewal.

### Whois
Using whois services, (usually) public contact details about the owner/ registration of a domain may be obtained.

