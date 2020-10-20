---
---

## Host Management

Management of Hosts adds support of the following actions:

| Action | Description |
| ------ | ----------- |
| edit   | Edit a Host |

  - [Querying Hosts](#querying-hosts)

  - [Editing a Host](#edit-hosts)

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

**Note:**

host can be referenced by **href** or **id**

</div>
