---
---

### REST API Authorization

When authenticating to the appliance, the current group of the
authenticated user will be used for determining the authorization of
what the user can see and do using the REST API. While this is
acceptable when users only belong to a single group, this falls short
when users are authenticating using their External Authentication
credentials (IPA, LDAP or AD) where they may belong to multiple groups.

#### Specifying Authorization Group

This section describes how to specify an authorization group for the
user. The mechanism described here is honored for both methods of
authentication:

  - Basic Authentication

  - Token based Authentication

The user’s group is to be specified in the new HTTP Header:

``` data
X-MIQ-Group
```

and is to contain the user’s group name.

Example request using Basic Authentication:

``` sh
$ curl --user username:password
        -i -X GET -H "Accept: application/json"
        -H "X-MIQ-Group: auditors"
        http://localhost:3000/api/vms
```

Example request using Token based Authentication:

``` sh
$ curl -i -X GET -H "Accept: application/json"
       -H "X-Auth-Token: 93d98fd44cc5a401ff385ba87b21fd13"
       -H "X-MIQ-Group: auditors"
       http://localhost:3000/api/vms
```

The validated user's group will be in effect for the duration of the
REST API request. Multiple requests can be made as a particular user but
with different authorization groups concurrently.

#### Specifying an Invalid Authorization Group

In case an invalid authorization group is specified, a 401 Unauthorized
is returned:

``` data
HTTP/1.1 401 Unauthorized
X-Frame-Options: SAMEORIGIN
...

{
  "error" : {
    "kind" : "unauthorized",
    "message" : "Invalid Authorization Group <invalid_group_name> specified",
    "klass" : "ApiController::AuthenticationError"
  }
}
```
