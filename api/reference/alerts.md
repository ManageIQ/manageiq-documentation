---
---

## Alert Management

Management of alerts, alert actions and alert definitions is provided
via the following collections and subcollections:

``` data
/api/alerts
/api/alerts/:id/alert_actions

/api/alert_definitions
```

Queries of alerts:

  - [Querying Alerts](#querying-alerts)

Queries and creation of alert actions:

  - [Querying Alert Actions](#querying-alert-actions)

  - [Creating Alert Actions](#creating-alert-actions)

Full CRUD actions on alert definitions:

  - [Querying Alert Definitions](#querying-alert-definitions)

  - [Creating Alert Definitions](#creating-alert-definitions)

  - [Editing Alert Definitions](#editing-alert-definitions)

  - [Deleting Alert Definitions](#deleting-alert-definitions)

### Querying Alerts

Querying all alerts in the system is simply:

    GET /api/alerts

Getting details on a specific alert:

    GET /api/alerts/:id

### Querying Alert Actions

Querying all alert actions of a specific alert is done via the
subcollection as follows:

    GET /api/alerts/:alert_id/alert_actions

Querying an alert action of a specific alert is done via the
subcollection resource as follows:

    GET /api/alerts/:alert_id/alert_actions/:alert_action_id

### Creating Alert Actions

Creating an alert action for a specific alert can be done by the
following POST:

    POST /api/alerts/:alert_id/alert_actions

``` json
{
  "action_type" : "custom_automation",
  "comment" : "Comment about the Alert Action"
}
```

### Querying Alert Definitions

Querying all alert definitions in the system is simply:

    GET /api/alert_definitions

Getting details on a specific alert definition:

    GET /api/alert_definitions/:id

### Creating Alert Definitions

Alert definitions can be created via a POST to the alert definitions
collection or via the **create** action signature which also allows
creation of multiple alert definitions in a single request.

    POST /api/alert_definitions

``` json
{
  "description" : "Test Alert Definition",
  "db" : "ContainerNode",
  "expression" : { "eval_method" : "dwh_generic", "mode" : "internal", "options" : {} },
  "options"    : { "notifications" : { "delay_next_evaluation" : 600, "evm_event" : {} } },
  "enabled"    : true
}
```

or creating multiple alert definitions:

``` json
{
  "action" : "create",
  "resources" : [
    { "description" : "Sample Alert Definition 1", ... },
    { "description" : "Sample Alert Definition 2", ... },
    ...
  ]
}
```

**Note:**

Please refer to the [Resource Attributes](../appendices/resource_attributes.html#alert-definitions)
page for a list of available attributes when creating alert definitions.

### Editing Alert Definitions

    POST /api/alert_definitions/:id

``` json
{
  "action" : "edit",
  "resource" : {
    "options" : { "notifications" : { "delay_next_evaluation" : 1200, "evm:event" : {} } }
  }
}
```

or editing multiple alert definitions:

    POST /api/alert_definitions

``` json
{
  "action" : "edit",
  "resources" : [
    {
      "href" : "http://localhost:3000/api/alert_definitions/101",
      "options" : { "notifications" : { "delay_next_evaluation" : 1200, "evm:event" : {} } }
    },
    {
      "href" : "http://localhost:3000/api/alert_definitions/102",
      "options" : { "notifications" : { "delay_next_evaluation" : 1200, "evm:event" : {} } }
    },
    ...
  ]
}
```

### Deleting Alert Definitions

Alert definitions can be deleted via either the **delete** POST action
or via the DELETE HTTP method.

    POST /api/alert_definitions/101

``` json
{
  "action" : "delete"
}
```

or simply:

    DELETE /api/alert_definitions/101

Deleting multiple alert definitions can be done as follows:

    POST /api/alert_definitions

``` json
{
  "action" : "delete",
  "resources" : [
    { "href" : "http://localhost:3000/api/alert_definitions/101" },
    { "href" : "http://localhost:3000/api/alert_definitions/102" },
    ...
  ]
}
```
