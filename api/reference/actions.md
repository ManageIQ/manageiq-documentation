---
---

## Actions

Management of actions is provided via the following collection:

``` data
/api/actions
```

Full CRUD actions on resources is available:

  - [Querying Actions](#querying-actions)

  - [Creating Actions](#creating-actions)

  - [Editing Actions](#editing-actions)

  - [Deleting Actions](#deleting-actions)

### Querying Actions

Querying all actions in the system is simply:

    GET /api/actions

Getting details on a specific Action:

    GET /api/actions/:id

### Creating Actions

Actions can be created via a POST to the actions collection or via the
**create** action signature which also allows creation of multiple
actions in a single request.

    POST /api/actions

``` json
{
  "name" : "sample_action",
  "description" : "Sample Action",
  "action_type" : "custom_automation",
  "options" : {
    "ae_message" : "message",
    "ae_request" : "request",
    "ae_hash" : { "sample_key" : "sample_value" }
  }
}
```

or creating multiple actions:

``` json
{
  "action" : "create",
  "resources" : [
    { "name" : "action_1", "description" : "Action 1", ... },
    { "name" : "action_2", "description" : "Action 2", ... },
    ...
  ]
}
```

<div class="note">

Please refer to the [Resource
Attributes](../appendices/resource_attributes.html#actions) page for a
list of available attributes when creating actions.

</div>

### Editing Actions

    POST /api/actions/:id

``` json
{
  "action" : "edit",
  "resource" : {
    "description" : "Updated Description"
  }
}
```

or editing multiple actions:

    POST /api/actions

``` json
{
  "action" : "edit",
  "resources" : [
    {
      "href" : "http://localhost:3000/api/actions/101",
      "description" : "Updated Description 1"
    },
    {
      "href" : "http://localhost:3000/api/actions/102",
      "description" : "Updated Description 2"
    },
    ...
  ]
}
```

### Deleting Actions

Actions can be deleted via either the **delete** POST action or via the
DELETE HTTP method.

    POST /api/actions/101

``` json
{
  "action" : "delete"
}
```

or simply:

    DELETE /api/actions/101

Deleting multiple actions can be done as follows:

    POST /api/actions

``` json
{
  "action" : "delete",
  "resources" : [
    { "href" : "http://localhost:3000/api/actions/101" },
    { "href" : "http://localhost:3000/api/actions/102" },
    ...
  ]
}
```
