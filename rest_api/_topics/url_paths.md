#### URL Paths

The recommended convention for URLs is to use alternative collection or
resource path segments, relative to the API entry point as described in
the following example:

| URL                                 | Description                                                |
| ----------------------------------- | ---------------------------------------------------------- |
| /api                                | The REST API Entrypoint                                    |
| /api/v**Version**                   | The REST Entrypoint for a specific version of the REST API |
| /api/:collection                    | A top-level collection                                     |
| /api/:collection/:id                | A specific resource of that collection                     |
| /api/:collection/:id/:subcollection | Sub-collection under the specific resource                 |
