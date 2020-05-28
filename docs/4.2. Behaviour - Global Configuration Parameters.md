# Behaviour: Global Configuration Parameters

_(c) AMWA 2020, CC Attribution-NoDerivatives 4.0 International (CC BY-ND 4.0)_

This document covers the global configuration parameters contained in the global configuration resource provided via the System API `/global` path.

## Definition of Parameters

A small number of parameters are directly defined in this specification.
Additional parameters may be defined via the [NMOS Parameter Registers](https://github.com/AMWA-TV/nmos-parameter-registers).
System API clients which are unaware of these external definitions should ignore the presence of the parameter(s).

## AMWA IS-04 NMOS Discovery and Registration Parameters

Constants related to the AMWA IS-04 Discovery and Registration Specification are contained in the `is04` object.

* `heartbeat_interval` defines how often Nodes should perform a heartbeat to maintain their resources in the Registration API

## PTP Parameters

Constants relating to PTP (IEEE 1588-2008 or later) are contained in the `ptp` object.

* `announce_receipt_timeout` defines the number of announce intervals that must pass before declaring timeout
* `domain_number` defines the PTP domain number

## Syslog Parameters

Constants relating to the syslog protocol (IETF [RFC 5424](https://tools.ietf.org/html/rfc5424)) are contained in two objects.

* `syslogv2` contains `hostname` and `port` for the system's syslog "version 2" server using the TLS transport (IETF [RFC 5245](https://tools.ietf.org/html/rfc5425))
* `syslog` contains `hostname` and `port` for the system's syslog "version 1" server using the UDP transport (IETF [RFC 5246](https://tools.ietf.org/html/rfc5426))
