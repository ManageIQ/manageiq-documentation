---
---

## Authentications

Management of authentications is provided via the following collection:

``` data
/api/authentications
```

Full CRUD actions on authentications is available:

  - [Querying Authentications](#querying-authentications)

  - [Creating Authentications](#creating-authentications)

  - [Editing Authentications](#editing-authentications)

  - [Refreshing Authentications](#refreshing-authentications)

  - [Deleting Authentications](#deleting-authentications)

### Querying Authentications

Querying all authentications in the system is simply:

    GET /api/authentications

Getting details on a specific authentication:

    GET /api/authentications/:id

One can also query authentications of a configuration script payload’s
manager as follows:

    GET /api/configuration_script_payloads/:id/authentications

Or getting details on a specific authentication:

    GET /api/configuration_script_payloads/:id/authentications/:authentication_id

### Creating Authentications

Authentications can be created via a POST to the authentications
collection or via the **create** action signature which also allows
creation of multiple authentications in a single request.

    POST /api/authentications

``` json
{
  "description" : "Authentication Description",
  "name" : "SomeCredentials",
  "related" : {},
  "type" : "ManageIQ::Providers::AnsibleTower::AutomationManager::Credential",
  "manager_resource" : { "href" : "http://localhost:3000/api/providers/7" }
}
```

or creating multiple authentications:

``` json
{
  "action" : "create",
  "resources" : [
    { "description" : "System Credentials", "name" : "SystemCreds", ... },
    { "description" : "Admin Credentials",  "name" : "AdminCreds", ... },
    ...
  ]
}
```

Optionally, authentications can be created for a provider of a specific
configuration script payload, thus eliminating the need of specifying a
provider.

    POST /api/configuration_script_payloads/:id/authentications

``` json
{
  "description" : "Authentication Description",
  "name" : "SomeCredentials",
  "related" : {},
  "type" : "ManageIQ::Providers::AnsibleTower::AutomationManager::Credential"
}
```

Also supporting bulk creates:

``` json
{
  "action" : "create",
  "resources" : [
    { "description" : "System Credentials", "name" : "SystemCreds", ... },
    { "description" : "Admin Credentials",  "name" : "AdminCreds", ... },
    ...
  ]
}
```

<div class="note">

Please refer to the [Resource
Attributes](../appendices/resource_attributes.html#authentications) page
for a list of available attributes when creating authentications.

</div>

### Editing Authentications

    POST /api/authentications/:id

``` json
{
  "action" : "edit",
  "resource" : {
    "name" : "UpdatedCredentials"
  }
}
```

or editing multiple authentications:

    POST /api/authentications

``` json
{
  "action" : "edit",
  "resources" : [
    {
      "href" : "http://localhost:3000/api/authentications/101",
      "description" : "Updated Sample Credentials 1",
      "name" : "UpdatedCredentials1"
    },
    {
      "href" : "http://localhost:3000/api/authentications/102",
      "description" : "Updated Sample Credentials 2",
      "name" : "UpdatedCredentials2"
    },
    ...
  ]
}
```

### Refreshing Authentications

Authentications can be refreshed by posting a **refresh** action to a
single resource or to multiple resources in bulk by targeting the
collection.

    POST /api/authentications/:id

``` json
{
  "action" : "refresh"
}
```

or refreshing multiple authentications:

    POST /api/authentications

``` json
{
  "action" : "refresh",
  "resources" : [
    { "id" : "51" },
    { "id" : "52" }
  ]
}
```

Example:

    POST /api/authentications/51

``` json
{
  "action" : "refresh"
}
```

Response:

``` json
{
  "success" : true,
  "message" : "Refreshing Authentication id:51 name:'SampleCredentials'",
  "task_id" : "8",
  "task_href" : "http://localhost:3000/api/tasks/8",
  "tasks" : [
    {
      "id" : "8",
      "href" : "http://localhost:3000/api/tasks/8"
    }
  ]
}
```

### Deleting Authentications

Authentications can be deleted via either the **delete** POST action or
via the DELETE HTTP method.

    POST /api/authentications/101

``` json
{
  "action" : "delete"
}
```

or simply:

    DELETE /api/authentications/101

Deleting multiple authentications can be done as follows:

    POST /api/authentications

``` json
{
  "action" : "delete",
  "resources" : [
    { "href" : "http://localhost:3000/api/authentications/101" },
    { "href" : "http://localhost:3000/api/authentications/102" },
    ...
  ]
}
```
