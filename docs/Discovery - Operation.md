# Discovery: Operation

_(c) AMWA 2020, CC Attribution-NoDerivatives 4.0 International (CC BY-ND 4.0)_

This document describes usage of DNS-SD records for discovery in more detail.

## System API

### DNS-SD Advertisement

The preferred method of System API advertisement is via unicast DNS-SD advertisement of the type \_nmos-system.\_tcp. System APIs MUST additionally be capable of producing an mDNS advertisement. This MAY be disabled via a user-configurable method.

The IP address and port of the System API MUST be identified via the DNS-SD advertisement, with the full HTTP path then being resolved via the standard NMOS API path documentation.

Multiple DNS-SD advertisements for the same API are permitted where the API is exposed via multiple ports and/or protocols.

### DNS-SD TXT Records

**api\_proto**

The DNS-SD advertisement MUST be accompanied by a TXT record of name 'api\_proto' with a value of either 'http' or 'https' dependent on the protocol in use by the Registration API web server.

**api\_ver**

The DNS-SD advertisement MUST be accompanied by a TXT record of name 'api\_ver'. The value of this TXT record is a comma separated list of API versions supported by the server. For example: 'v1.0,v1.1,v2.0'. There should be no whitespace between commas, and versions should be listed in ascending order.

**pri**

The DNS-SD advertisement MUST include a TXT record with key 'pri' and an integer value. Servers MAY additionally represent a matching priority via the DNS-SD SRV record 'priority' and 'weight' as defined in RFC 2782. The TXT record should be used in favour to the SRV priority and weight where these values differ in order to overcome issues in the Bonjour and Avahi implementations.
Values 0 to 99 correspond to an active NMOS System API (zero being the highest priority). Values 100+ are reserved for development work to avoid colliding with a live system.

### Client Interaction Procedure

1. Node comes online
2. Node scans for an active System API on the network using unicast and/or multicast DNS service discovery (type '\_nmos-system.\_tcp') as described in the [Discovery](Discovery.md#unicast-vs-multicast-dns-sd) document.
3. Given multiple returned System APIs, the Node orders these based on their advertised priority (TXT pri), filtering out any APIs which do not support its required API version and protocol (TXT api_ver and api_proto).
4. The Node selects a System API to use based on the priority, and a random selection if multiple System APIs of the same API version with the same priority are identified.
5. Node proceeds to fetch the global configuration resource.

If the chosen System API does not respond correctly, another System API should be selected from the discovered list. Should no further System APIs be available or TTLs on advertised services expired, a re-query may be performed.
