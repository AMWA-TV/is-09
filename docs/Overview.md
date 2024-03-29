# AMWA NMOS System Parameters Specification: Overview

_(c) AMWA 2018, CC Attribution-NoDerivatives 4.0 International (CC BY-ND 4.0)_

## Documentation

The documents included in this directory provide additional details and recommendations for implementations of the defined API, and its consumers.

## Introduction

The purpose of this document is to explain the NMOS System API and how an NMOS Node can use this to obtain global configuration parameters that are common across the system.

The terms 'Node', 'Device', 'Sender' and 'Receiver' will be used extensively throughout this document. Please refer to the core [NMOS Technical Overview](https://github.com/AMWA-TV/nmos/blob/master/NMOS%20Technical%20Overview.md) for definitions of these.

## API Definition

The System API provides a single 'global configuration resource' via the path `/global`. This resource contains global configuration parameters which apply to the system in which Nodes are deployed.

### System ID

The System ID is exposed via the `id` attribute of the `/global` resource. This is the ID of the system and is expected to be constant for the "life" of the system. This ID MUST be assigned uniquely in each facility which deploys a System API.

## API Interaction

The System API is provided in order that Nodes can obtain configuration parameters at start-up.
The [Discovery](Discovery.md) and [Behaviour](Behaviour.md) documentation describes the procedure that Nodes should use.
