---
---

## Setting Ownership

Setting ownership of resources is provided with the **set\_ownership**
action. This action is available for the following resources:

|                        |
| ---------------------- |
| /api/auth_key_pairs    |
| /api/cloud_templates   |
| /api/instances         |
| /api/service_templates |
| /api/services          |
| /api/templates         |
| /api/vms               |

  - [Specifying Ownership](#specifying-ownership)

  - [Setting Ownership to single
    resource](#set-ownership-single-resource)

  - [Setting Ownership to multiple
    resources](#set-ownership-multiple-resources)

### Specifying Ownership

Specifying ownership in requests is done via the **owner** and **group**
specification.

``` json
{
  "owner" : { "href" : "http://localhost:3000/api/users/:id"  },
  "group" : { "href" : "http://localhost:3000/api/groups/:id" }
}
```

**Note:**

Specifying an owner can be done via **href**, **id**, **name** or **userid**

**Note:**

Specifying a group can be done via **href**, **id** or **description**

Setting ownership can be done on a specific resource or multiple resources in a single request:

### Setting Ownership to single resource

Example setting ownership to a single resource:

#### Request:

    POST /api/vms/320

``` json
{
  "action" : "set_ownership",
  "resource" : {
    "owner" : { "userid" : "jdoe" },
    "group" : { "description" : "TestGroup" }
  }
}
```

#### Response:

``` json
{
  "success": true,
  "message": "setting ownership of vms id 320 to owner: jdoe, group: TestGroup",
  "href": "http://localhost:3000/api/vms/320"
}
```

### Setting Ownership to multiple resources

Example setting ownership to multiple resources with a single request:

#### Request:

    POST /api/services

``` json
{
  "action" : "set_ownership",
  "resources" : [
    { "href" : "http://localhost:3000/api/services/104", "owner" : { "name" : "John Doe" } },
    { "href" : "http://localhost:3000/api/services/105", "owner" : { "name" : "John Doe" } },
    { "href" : "http://localhost:3000/api/services/106", "owner" : { "name" : "John Doe" } }
  ]
}
```

#### Response:

``` json
{
  "results": [
    {
      "success": true,
      "message": "setting ownership of services id 104 to owner: John Doe",
      "href": "http://localhost:3000/api/services/104"
    },
    {
      "success": true,
      "message": "setting ownership of services id 105 to owner: John Doe",
      "href": "http://localhost:3000/api/services/105"
    },
    {
      "success": true,
      "message": "setting ownership of services id 106 to owner: John Doe",
      "href": "http://localhost:3000/api/services/106"
    }
}
```
