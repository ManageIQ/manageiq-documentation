---
---

## Group Management

Management of User Groups is provided via the following collection:

``` data
/api/groups
```

Full CRUD actions on groups is available:

  - [Querying Groups](#querying-groups)

  - [Creating Groups](#creating-groups)

  - [Editing Groups](#editing-groups)

  - [Deleting Groups](#deleting-groups)

### Querying Groups

Querying all groups in the system:

    GET /api/groups

Getting details on a specific group:

    GET /api/groups/:id

### Creating Groups

Groups can be created via a POST to the groups collection or via the
**create** action signature which also allows creation of multiple
groups in a single request.

    POST /api/groups

``` json
{
  "description" : "sample_group",
  "role" : { "id" : "2" },
  "tenant" : { "href" : "http://localhost:3000/api/tenants/1" },
  "filters" : {
    "belongsto" : [ "/managed/area/1", "/managed/area/2" ],
    "managed" : [[ "/managed/infra/1", "/managed/infra/2" ]]
  }
}
```

<div class="note">

role can be specified via **name**, **href**, or **id**

tenant can be specified via **href** or **id**

</div>

or creating multiple groups:

``` json
{
  "action" : "create",
  "resources" : [
    { "description" : "sample_group1", ... },
    { "description" : "sample_group2", ... },
    ...
  ]
}
```

<div class="note">

Please refer to the [Resource
Attributes](../appendices/resource_attributes.html#groups) page for a
list of available attributes when creating Groups.

</div>

### Editing Groups

    POST /api/groups/:id

``` json
{
  "action" : "edit",
  "resource" : {
    "description" : "updated_sample_group",
    "filters" : {
      "belongsto" : [ "/managed/area/1", "/managed/area/2", "/managed/area/3" ],
      "managed" : [[ "/managed/infra/1", "/managed/infra/2"], ["/managed/other/3"]]
    }
  }
}
```

or editing multiple groups:

    POST /api/groups

``` json
{
  "action" : "edit",
  "resources" : [
    {
      "href" : "http://localhost:3000/api/groups/101",
      "description" : "updated_sample_group1"
    },
    {
      "href" : "http://localhost:3000/api/groups/102",
      "description" : "updated_sample_group2"
    },
    ...
  ]
}
```

### Deleting Groups

groups can be deleted via either the **delete** POST action or via the
DELETE HTTP method.

    POST /api/groups/101

``` json
{
  "action" : "delete"
}
```

or simply:

    DELETE /api/groups/101

Deleting multiple groups can be done as follows:

    POST /api/groups

``` json
{
  "action" : "delete",
  "resources" : [
    { "href" : "http://localhost:3000/api/groups/101" },
    { "href" : "http://localhost:3000/api/groups/102" },
    ...
  ]
}
```
