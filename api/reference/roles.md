---
---

## Role Management

Management of User Roles is provided via the following collection:

``` data
/api/roles
```

as well as the associated product features via:

``` data
/api/features
```

Full CRUD actions on roles is available:

  - [Querying Roles](#querying-roles)

  - [Creating Roles](#creating-roles)

  - [Editing Roles](#editing-roles)

  - [Deleting Roles](#deleting-roles)

### Querying Roles

Querying all roles in the system is simply:

    GET /api/roles

Getting details on a specific role:

    GET /api/roles/:id

Including the features it entitles:

    GET /api/roles/:id?expand=features

Or simply querying the features entitled by the role:

    GET /api/roles/:id/features?expand=resources

Querying all product features of the system that can be assigned to a
role.

    GET /api/features

### Creating Roles

Roles can be created via a POST to the roles collection or via the
**create** action signature which also allows creation of multiple roles
in a single request.

    POST /api/roles

``` json
{
  "action" : "create",
  "resource" : {
    "name" : "sample_role",
    "settings" : { "restrictions" : { "vms" : "user" } },
    "features" : [
      { "identifier" : "vm_explorer" },
      { "identifier" : "ems_infra_tag" },
      { "identifier" : "miq_report_run" }
    ]
  }
}
```

**Note:**

*restrictions* for **vms** can be either *user* or *user\_or\_group*

features can be specified via **identifier**, **href**, or **id**

</div>

or creating multiple roles:

``` json
{
  "action" : "create",
  "resources" : [
    { "name" : "sample_role1", ... },
    { "name" : "sample_role2", ... },
    ...
  ]
}
```

**Note:**

Please refer to the [Resource
Attributes](../appendices/resource_attributes.html#roles) page for a
list of available attributes when creating Roles.

</div>

### Editing Roles

    POST /api/roles/:id

``` json
{
  "action" : "edit",
  "resource" : {
    "name" : "updated_sample_role",
    "settings" : { "restrictions" : { "vms" : "user_or_group" } }
  }
}
```

or editing multiple roles:

    POST /api/roles

``` json
{
  "action" : "edit",
  "resources" : [
    {
      "href" : "http://localhost:3000/api/roles/101",
      "name" : "updated_sample_role1"
    },
    {
      "href" : "http://localhost:3000/api/roles/102",
      "name" : "updated_sample_role2"
    },
    ...
  ]
}
```

#### Assigning features to a role

    POST /api/roles/:id/features

``` json
{
  "action" : "assign",
  "resource" : {
    "identifier" : "miq_request_view"
  }
}
```

or assigning multiple features:

``` json
{
  "action" : "assign",
  "resources" : [
    { "identifier" : "miq_request_view" },
    { "identifier" : "storage_manager_show_list" },
    ...
  ]
}
```

#### Unassigning features from a role

    POST /api/roles/:id/features

``` json
{
  "action" : "unassign",
  "resource" : {
    { "identifier" : "miq_request_view" }
  }
}
```

or unassigning multiple features:

``` json
{
  "action" : "unassign",
  "resources" : [
    { "identifier" : "miq_request_view" },
    { "identifier" : "storage_manager_show_list" },
    ...
  ]
}
```

### Deleting Roles

Non system roles (i.e. read\_only false) can be deleted via either the
**delete** POST action or via the DELETE HTTP method.

    POST /api/roles/101

``` json
{
  "action" : "delete"
}
```

or simply:

    DELETE /api/roles/101

Deleting multiple roles can be done as follows:

    POST /api/roles

``` json
{
  "action" : "delete",
  "resources" : [
    { "href" : "http://localhost:3000/api/roles/101" },
    { "href" : "http://localhost:3000/api/roles/102" },
    ...
  ]
}
```
