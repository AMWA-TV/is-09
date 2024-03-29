# Behaviour: Node Start-Up

_(c) AMWA 2020, CC Attribution-NoDerivatives 4.0 International (CC BY-ND 4.0)_

This document covers expected behaviour for interactions between a Node (the client) and the System API (the server) at start-up.

## Normal Operation

1. The Node performs a DNS-SD browse for services of type '\_nmos-system.\_tcp' as specified by the client interaction procedure in [Discovery: Operation](Discovery%20-%20Operation.md).
2. The Node fetches the global configuration resource (`/global`).
3. The Node should use the unique System ID and the version timestamp (`id` and `version`) to determine whether the system environment has changed since its last start-up, for example, by comparing against information held in non-volatile storage.
4. After successfully fetching the global configuration resource, the Node is not required by this specification to repeat this procedure, until its next restart.

If the Node determines a different System ID is being advertised or the version timestamp is newer, it may not be appropriate for the Node to restore its previous operating state without further checks.

If the Node is configured to only support unicast DNS and discovers that no System APIs are being advertised that support the Node's API requirements, the Node is not required by this specification to repeat this procedure, until its next restart.

External documents may specify additional requirements on Node behaviour when no System API is discovered or the system environment has changed.

## Error Conditions

In addition to the general guidance on Error Codes & Responses in the [APIs](APIs.md) documentation, the following error conditions describe scenarios that may be encountered by Nodes when interacting with a System API. It is expected that all Node implementations handle these in a sensible fashion as described below.

### Node Encounters HTTP 500 (or other 5xx), Inability To Connect, Or A Timeout

A 5xx error, inability to connect or a timeout indicates a server-side or connectivity issue. As this issue may affect just one System API instance, it is recommended that clients identify another System API to use from their discovered list.

Should an error be encountered when interacting with all discoverable System APIs it is recommended that clients implement an exponential backoff algorithm in their next attempts until a non-5xx response code is received.
