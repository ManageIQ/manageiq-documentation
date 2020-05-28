---
---

## Tenant Management

Tenant management including CRUD operations is available via the REST
API. Management of tenants is through:

``` data
/api/tenants
```

  - [Creating Tenants](#creating-tenants)

  - [Editing Tenants](#editing-tenants)

  - [Deleting Tenants](#deleting-tenants)

## Tenant Quota Management

Tenant Quota management is made available via the *quotas* subcollection
of tenant resources as follows:

``` data
/api/tenants/:id/quotas
```

  - [Creating Tenant Quotas](#creating-tenant-quotas)

  - [Editing Tenant Quotas](#editing-tenant-quotas)

  - [Deleting Tenant Quotas](#deleting-tenant-quotas)

### Creating Tenants

Creating a Tenant is done via the **create** action as follows:

    POST /api/tenants

``` data
{
  "action" : "create",
  "resource" : {
    # New Tenant JSON
  }
}
```

And like other **create** actions, the new tenant data can simply be
posted to the /api/tenants URL.

    POST /api/tenants

``` data
{
  # New Tenant JSON
}
```

For example, creating a new tenant:

    POST /api/tenants

``` json
{
  "name" : "Test Tenant",
  "description" : "Test Tenant Description",
  "parent" : { "href" : "http://localhost:3000/api/tenants/1" }
}
```

Parent can be specify by *id* or *href*

<div class="note">

Please refer to the [Resource
Attributes](../appendices/resource_attributes.html#tenants) page for a
list of available attributes when creating Tenants.

</div>

### Editing Tenants

Editing a Tenant is available via the **edit** action with the
**resource** specifying the attributes to update for that tenant.

    POST /api/tenants/:id

``` json
{
  "action" : "edit" ,
  "resource" : {
    "description" : "Updated Description for Tenant"
  }
}
```

<div class="note">

type is a restricted attribute and cannot be edited.

</div>

### Deleting Tenants

Deleting a Tenant is done via the delete method:

    DELETE /api/tenants/:id

or via the **delete** action as follows:

    POST /api/tenants/:id

``` json
{
  "action" : "delete"
}
```

or by href:

    POST /api/tenants

``` json
{
  "action" : "delete",
  "resources" : [
    { "href" : "http://localhost:3000/api/tenants/:id" }
  ]
}
```

### Creating Tenant Quotas

Creating a quota for a specific tenant is done as follows:

    POST /api/tenants/:id/quotas

``` json
{
  "name" : "cpu_allocated",
  "value" : 1
}
```

### Editing Tenant Quotas

    POST /api/tenants/:id/quotas/:quota_id

``` json
{
  "action" : "edit",
  "resource" : {
    "value" : 5
  }
}
```

Multiple quotas for a tenant can also be edited in a single request as
follows:

    POST /api/tenants/1/quotas

``` json
{
  "action" : "edit",
  "resources" : [
    {
      "href" : "http://localhost:3000/api/tenants/1/quotas/5",
      "value" : 11
    },
    { "href" : "http://localhost:3000/api/tenants/1/quotas/6",
      "value" : 12
    },
    ...
  ]
}
```

### Deleting Tenant Quotas

Quotas of a tenant can be deleted via the *delete* action as follows:

    POST /api/tenants/:id/quotas/:quota_id

``` json
{
  "action" : "delete"
}
```

or via the DELETE HTTP method

    DELETE /api/tenants/:id/quotas/:quota_id

Multiple quotas of a tenant can be deleted in a single request as shown
in the following example:

    POST /api/tenants/1/quotas

``` json
{
  "action" : "delete",
  "resources" : [
    { "href" : "http://localhost:3000/api/tenants/1/quotas/7" },
    { "href" : "http://localhost:3000/api/tenants/1/quotas/8" },
    ...
  ]
}
```
