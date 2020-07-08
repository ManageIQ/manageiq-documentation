#### Using Authentication Tokens

  - Are associated with the user credential.

  - Provide the necessary identification for RBAC in subsequent REST
    calls.

  - Expire after a certain amount of time (10 minutes by default).

**Request.**

    $ curl --user username:password
            -i X GET -H "Accept: application/json"
            https://hostname/api/auth

**Response.**

    HTTP/1.1 200 OK
    Content-Type: application/json

    {
      "auth_token" : "af0245-238722-4d23db",
      "expires_on" : "2013-12-07T18:20:07Z"
    }

**Request using Token based authentication.**

    $ curl -i -X GET -H "Accept: application/json"
           -H "X-Auth-Token: af0245-238722-4d23db"
           https://hostname/api/services/1013

**Failed response due to invalid token.**

    HTTP/1.1 401 Unauthorized
    WWW-Authenticate: Basic realm="Application"
    ...

When a request fails due to an invalid token, the client must
re-authenticate with the user credentials to obtain a new Authentication
Token.
