---
---

### REST API Authentication

There are two methods of authentication for the REST API, these are:

  - Basic Authentication (without a challenge)

  - Token based Authentication

With Basic Authentication, the user and password credentials are passed
in with each HTTP request as follows:

#### Request using Basic Authentication

``` sh
$ curl --user username:password
        -i -X GET -H "Accept: application/json"
        http://localhost:3000/api/services/1013
```

Note: our version of HTTP Basic does NOT send a WWW-Authenticate challenge. Any clients which autodetect HTTP Basic from a server challenge may fail to send the necessary credentials. This can be worked around by either forcing HTTP Basic authentication if possible, or by manually creating the header:

``` sh
# base64-encode a (ascii or utf-8) string of "username:password", without a trailing newline
$ echo -n 'username:password' | base64
dXNlcm5hbWU6cGFzc3dvcmQ=

# use it in the header
$ wget -SO- --header 'Authorization: Basic dXNlcm5hbWU6cGFzc3dvcmQ=' http://localhost:3000/api
```

However, for multiple REST API calls to the Appliance, it is recommended
to use the Token based Authentication. In this approach, the client
requests a token for the username/password credentials specified. Then
the token is used in lieu of the username/password for each subsequent
API call.

Authentication tokens:

  - Are associated with the user credentials

  - Provide the necessary identity for RBAC in subsequent REST API calls

  - Expire after a certain amount of time with no REST API activity - 10
    minutes by default.

#### Requesting an authentication token

``` sh
$ curl --user username:password
        -i -X GET -H "Accept: application/json"
        http://localhost:3000/api/auth
```

Response for the Authentication Token Request:

``` data
HTTP/1.1 200 OK
Content-Type: application/json

{
  "auth_token": "93d98fd44cc5a401ff385ba87b21fd13",
  "token_ttl": 600,
  "expires_on": "2015-11-02T21:50:16Z"
}
```

#### Request using Token based authentication

``` sh
$ curl -i -X GET -H "Accept: application/json"
       -H "X-Auth-Token: 93d98fd44cc5a401ff385ba87b21fd13"
       http://localhost:3000/api/services/1013
```

Failed response due to invalid token

``` data
HTTP/1.1 401 Unauthorized
WWW-Authenticate: Basic realm="Application"
...
```

When a request fails due to an invalid token, the client would then need
to re-authenticate with the user credentials to obtain a new
Authentication Token.

#### Requesting an authentication token for a UI client

While the default duration for a REST API token is 10 minutes, it is not
sufficient for UI type clients where the token is needed for sessions
that time-out much later.

For such environments, it is possible to request a REST API token to
leverage the administrative UI session timeout. This is requested with
the **requester\_type** parameter with the value **ui** as follows:

``` sh
$ curl --user username:password
        -i -X GET -H "Accept: application/json"
        http://localhost:3000/api/auth?requester_type=ui
```

Response for the Authentication Token Request:

``` data
HTTP/1.1 200 OK
Content-Type: application/json

{
  "auth_token": "8789bcd6562beacbaf9f77927c2825e2",
  "token_ttl": 3600,
  "expires_on": "2015-11-02T23:24:03Z"
}
```

#### Deleting one’s own authentication token

When UI based tokens are used in UI sessions, it is common for the UI to
need to invalidate an authentication token upon logout. This is made
available via the DELETE HTTP method on the token authenticated
/api/auth as follows:

``` sh
$ curl -i -X DELETE -H "Accept: application/json"
       -H "X-Auth-Token: 93d98fd44cc5a401ff385ba87b21fd13"
       http://localhost:3000/api/auth
```

Response for the token DELETE request:

``` data
HTTP/1.1 204 No Content
```

#### Configuring the REST API Token Duration

| Requester Type                   | Default Value                 |
| -------------------------------- | ----------------------------- |
| Configure→Configuration→Advanced | Default                       |
| 10 minutes                       | api: → token\_ttl: 10.minutes |
| ui                               | 1 hour                        |
