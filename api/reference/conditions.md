---
---

## Conditions

Management of conditions is provided via the following collection:

``` data
/api/conditions
```

Full CRUD actions on conditions is available:

  - [Querying Conditions](#querying-conditions)

  - [Creating Conditions](#creating-conditions)

  - [Editing Conditions](#editing-conditions)

  - [Deleting Conditions](#deleting-conditions)

### Querying Conditions

Querying all conditions in the system is simply:

    GET /api/conditions

Getting details on a specific Condition:

    GET /api/conditions/:id

### Creating Conditions

Conditions can be created via a POST to the conditions collection or via
the **create** action signature which also allows creation of multiple
conditions in a single request.

    POST /api/conditions

``` json
{
  "name" : "sample_condition",
  "description" : "Sample Condition",
  "expression" : { "=" : { "field" : "ExtManagementSystem.container_images-architecture", "value" : "dsa" } },
  "towhat" : "ExtManagementSystem",
  "modifier" : "allow"
}
```

or creating multiple conditions:

``` json
{
  "action" : "create",
  "resources" : [
    { "name" : "condition_1", "description" : "Condition 1", ... },
    { "name" : "condition_2", "description" : "Condition 2", ... },
    ...
  ]
}
```

**Note:**

Please refer to the [Resource
Attributes](../appendices/resource_attributes.html#conditions) page for
a list of available attributes when creating conditions.

</div>

### Editing Conditions

    POST /api/conditions/:id

``` json
{
  "action" : "edit",
  "resource" : {
    "description" : "Updated Condition Description"
  }
}
```

or editing multiple conditions:

    POST /api/conditions

``` json
{
  "action" : "edit",
  "resources" : [
    {
      "href" : "http://localhost:3000/api/conditions/101",
      "description" : "Updated Condition Description 1"
    },
    {
      "href" : "http://localhost:3000/api/conditions/102",
      "description" : "Updated Condition Description 2"
    },
    ...
  ]
}
```

### Deleting Conditions

Conditions can be deleted via either the **delete** POST action or via
the DELETE HTTP method.

    POST /api/conditions/101

``` json
{
  "action" : "delete"
}
```

or simply:

    DELETE /api/conditions/101

Deleting multiple conditions can be done as follows:

    POST /api/conditions

``` json
{
  "action" : "delete",
  "resources" : [
    { "href" : "http://localhost:3000/api/conditions/101" },
    { "href" : "http://localhost:3000/api/conditions/102" },
    ...
  ]
}
```
