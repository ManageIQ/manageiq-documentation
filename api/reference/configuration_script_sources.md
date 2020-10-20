---
---

## Configuration Script Sources

Management of configuration script sources is provided via the following
collection:

``` data
/api/configuration_script_sources
```

Full CRUD actions on configuration script sources is available:

  - [Querying Configuration Script
    Sources](#querying-configuration-script-sources)

  - [Creating Configuration Script
    Sources](#creating-configuration-script-sources)

  - [Editing Configuration Script
    Sources](#editing-configuration-script-sources)

  - [Refreshing Configuration Script
    Sources](#refreshing-configuration-script-sources)

  - [Deleting Configuration Script
    Sources](#deleting-configuration-script-sources)

### Querying Configuration Script Sources

Querying all configuration script sources in the system is simply:

    GET /api/configuration_script_sources

Getting details on a specific configuration script source:

    GET /api/configuration_script_sources/:id

Querying configuration script payloads of a particular configuration
script source:

    GET /api/configuration_script_sources/:id/configuration_script_payloads?expand=resources

Querying the configuration script payloads of a particular configuration
script source that belong to a specific region:

    GET /api/configuration_script_sources/:id/configuration_script_payloads?expand=resources&filter[]=region_number=10

### Creating Configuration Script Sources

Configuration script sources can be created via a POST to the
configuration script sources collection or via the **create** action
signature which also allows creation of multiple configuration script
sources in a single request.

    POST /api/configuration_script_sources

``` json
{
  "name" : "My Project",
  "description" : "My Project's Description",
  "manager_resource" : { "href" : "http://localhost:3000/api/providers/7" },
  "related" : {}
}
```

or creating multiple configuration script sources:

``` json
{
  "action" : "create",
  "resources" : [
    { "name" : "My First Project", "description" : "My First Project Description", ... },
    { "name" : "My Second Project", "description" : "My Second Project Description", ... },
    ...
  ]
}
```

**Note:**

Please refer to the [Resource
Attributes](../appendices/resource_attributes.html#configuration-script-sources)
page for a list of available attributes when creating configuration
script sources.

</div>

### Editing Configuration Script Sources

    POST /api/configuration_script_sources/:id

``` json
{
  "action" : "edit",
  "resource" : {
    "description" : "Updated Project Description"
  }
}
```

or editing multiple configuration script sources:

    POST /api/configuration_script_sources

``` json
{
  "action" : "edit",
  "resources" : [
    {
      "href" : "http://localhost:3000/api/configuration_script_sources/101",
      "description" : "Updated Project Description 1"
    },
    {
      "href" : "http://localhost:3000/api/configuration_script_sources/102",
      "description" : "Updated Project Description 2"
    },
    ...
  ]
}
```

### Refreshing Configuration Script Sources

Configuration script sources can be refreshed by posting a **refresh**
action to a single resource or to multiple resources in bulk by
targeting the collection.

    POST /api/configuration_script_sources/:id

``` json
{
  "action" : "refresh"
}
```

or refreshing multiple configuration script sources:

    POST /api/configuration_script_sources

``` json
{
  "action" : "refresh",
  "resources" : [
    { "id" : "101" },
    { "id" : "102" }
  ]
}
```

Example:

### Request:

    POST /api/configuration_script_sources/101

``` json
{
  "action" : "refresh"
}
```

### Response:

``` json
{
  "success" : true,
  "message" : "Refreshing ConfigurationScriptSource id:101 name:'Test Configuration Script Source'",
  "task_id" : "7",
  "task_href" : "http://localhost:3000/api/tasks/7",
  "tasks" : [
    {
      "id" : "7",
      "href" : "http://localhost:3000/api/tasks/7"
    }
  ]
}
```

### Deleting Configuration Script Sources

Configuration script sources can be deleted via either the **delete**
POST action or via the DELETE HTTP method.

    POST /api/configuration_script_sources/101

``` json
{
  "action" : "delete"
}
```

or simply:

    DELETE /api/configuration_script_sources/101

Deleting multiple configuration script sources can be done as follows:

    POST /api/configuration_script_sources

``` json
{
  "action" : "delete",
  "resources" : [
    { "href" : "http://localhost:3000/api/configuration_script_sources/101" },
    { "href" : "http://localhost:3000/api/configuration_script_sources/102" },
    ...
  ]
}
```
