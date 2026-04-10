---
---

## Host Management

Management of Hosts adds support of the following actions:

| Action | Description     |
| ------ | --------------- |
| edit   | Edit a Host     |
| start  | Start a Host    |
| stop   | Stop a Host     |

  - [Querying Hosts](#querying-hosts)

  - [Editing a Host](#edit-hosts)

  - [Starting a Host](#start-host)

  - [Stopping a Host](#stop-host)

### Querying Hosts

Hosts are queried via the primary collection URL:

``` data
/api/hosts
```

### Editing a Host

Currently, only the host password can be edited via the API. All other
edit requests will be rejected.

The host password is provided by a *credentials* hash similar to the
signature supported for providers.

    POST /api/hosts/:id

``` json
{
  "action" : "edit",
  "resource" : {
    "credentials" : {
      "password" : "updated_password"
    }
  }
}
```

When not specified, the authentication type used for the password is
*default*:

    POST /api/hosts/:id

``` json
{
  "action" : "edit",
  "resource" : {
    "credentials" : {
      "auth_type" : "default",
      "password" : "updated_password"
    }
  }
}
```

Password for multiple hosts can also be updated with a single request as
follows:

    POST /api/hosts

``` json
{
  "action" : "edit",
  "resources" : [
    { "id" : "101", "credentials" : { "password" : "updated_password" } },
    { "id" : "102", "credentials" : { "password" : "updated_password" } },
    { "id" : "103", "credentials" : { "password" : "updated_password" } },
    ...
  ]
}
```

### Starting a Host

Hosts can be started by posting the following action:

    POST /api/hosts/:id

``` json
{
  "action" : "start"
}
```

Multiple hosts can also be started with a single request:

    POST /api/hosts

``` json
{
  "action" : "start",
  "resources" : [
    { "href" : "http://localhost:3000/api/hosts/101" },
    { "href" : "http://localhost:3000/api/hosts/102" },
    { "href" : "http://localhost:3000/api/hosts/103" }
  ]
}
```

### Stopping a Host

Hosts can be stopped by posting the following action:

    POST /api/hosts/:id

``` json
{
  "action" : "stop"
}
```

Multiple hosts can also be stopped with a single request:

    POST /api/hosts

``` json
{
  "action" : "stop",
  "resources" : [
    { "href" : "http://localhost:3000/api/hosts/101" },
    { "href" : "http://localhost:3000/api/hosts/102" },
    { "href" : "http://localhost:3000/api/hosts/103" }
  ]
}
```

**Note:**

host can be referenced by **href** or **id**
