# AMWA IS-09 NMOS System Parameters Specification

[![Lint Status](https://github.com/AMWA-TV/nmos-system/workflows/Lint/badge.svg)](https://github.com/AMWA-TV/nmos-system/actions?query=workflow%3ALint)
[![Render Status](https://github.com/AMWA-TV/nmos-system/workflows/Render/badge.svg)](https://github.com/AMWA-TV/nmos-system/actions?query=workflow%3ARender)

The NMOS System API allows an NMOS Node (also known as a "Media Node") to obtain global configuration parameters that are common across the system.
This enables the Node to start, or re-start, in a well defined way that is consistent with the environment it's running in.

## Getting started

Readers are advised to be familiar with:
* The [JT-NM Reference Architecture](http://jt-nm.org/RA-1.0/)
* The [overview of Networked Media Open Specifications](https://amwa-tv.github.io/nmos)

Readers should then read the [documentation](docs/), [APIs](APIs/) (RAML and JSON Schema), and [examples](examples/) (JSON) 

> HTML rendered versions of all NMOS Specifications are available on the [NMOS GitHub pages](https://amwa-tv.github.io/nmos)

## Releases

It is recommended that the tagged releases are used as a reference for development as opposed to the 'master' or development branches of this repository.

Each version of the specification is available under a v&lt;#MAJOR&gt;.&lt;#MINOR&gt; tag such as 'v1.0'. Once a specification has been released, any updates to its documentation and schemas which do not modify the specification will be made available via a v&lt;#MAJOR&gt;.&lt;#MINOR&gt;.&lt;#UPDATE&gt; tag such as 'v1.0.1'.

## Contents

* README.md -- This file
* [docs/](docs/) -- Documentation targeting those implementing APIs and clients.
* [APIs/](APIs/) -- Normative specifications of APIs
* [examples/](examples/) -- Example JSON requests and responses for APIs
* [LICENSE](LICENSE) -- Licenses for software and text documents
* [NOTICE](NOTICE) -- Disclaimer
