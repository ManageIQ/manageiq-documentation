#### Using Basic Authentication

The following example demonstrates how to use basic authentication:

    $ curl --user username:password
          -i -X GET -H "Accept: application/json"
          https://hostname/api/services/1013

Red Hat recommends token-based authentication for multiple REST API
calls.
