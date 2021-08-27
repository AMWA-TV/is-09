# APIs: Client Side Implementation Notes

_(c) AMWA 2018, CC Attribution-NoDerivatives 4.0 International (CC BY-ND 4.0)_

## DNS-SD Bridging

For clients which need to discover the services of a System API, but operate in software such as web browsers where DNS-SD is unsupported, it is suggested that a bridging service is employed to present the DNS-SD data via an HTTP service (or similar).

## Empty Request Bodies

A number of API resources specify HTTP requests with no request body (headers only). These commonly include HTTP GET, HEAD, OPTIONS and DELETE operations, but may include other HTTP methods in some circumstances. When performing API requests which have no specified request body schema, clients SHOULD NOT send any body payload and SHOULD NOT set the HTTP `Content-Type` header. Clients MAY set the `Content-Length` header to a value of `0` to indicate this empty body, but this is not mandated.
