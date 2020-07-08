---
---

## Orchestration Support

Support for orchestration is provided by the following:

  - [Orchestration Templates](#orchestration-templates)

### Orchestration Templates ===

Management of orchestration templates is provided with the following
collection:

``` data
/api/orchestration_templates
```

Full CRUD actions on orchestration templates is available:

  - [Querying Orchestration
    Templates](#querying-orchestration-templates)

  - [Creating Orchestration
    Templates](#creating-orchestration-templates)

  - [Editing Orchestration Templates](#editing-orchestration-templates)

  - [Copying Orchestration Templates](#copying-orchestration-templates)

  - [Deleting Orchestration
    Templates](#deleting-orchestration-templates)

### Querying Orchestration Templates

Querying all orchestration templates in the system:

    GET /api/orchestration_templates

Getting details on a specific orchestration template:

    GET /api/orchestration_templates/:id

### Creating Orchestration Templates

Orchestration templates can be created via a POST to the orchestration
templates collection or via the **create** action signature which also
allows creation of multiple orchestration templates in a single request.

    POST /api/orchestration_templates

``` json
{
  "name" : "azure-single-vm-from-user-image",
  "type" : "OrchestrationTemplateAzure",
  "description" : "Create a single VM from a user image",
  "content" : " ... ",
  "orderable" : true,
  ...
}
```

or creating multiple orchestration templates:

``` json
{
  "action" : "create",
  "resources" : [
    { "description" : "sample_orchestration_template1", ... },
    { "description" : "sample_orchestration_template2", ... },
    ...
  ]
}
```

<div class="note">

Please refer to the [Resource
Attributes](../appendices/resource_attributes.html#orchestration_templates)
page for a list of available attributes when creating orchestration
templates.

</div>

### Editing Orchestration Templates

    POST /api/orchestration_templates/:id

``` json
{
  "action" : "edit",
  "resource" : {
    "description" : "updated_sample_orchestration_template",
  }
}
```

or editing multiple orchestration templates:

    POST /api/orchestration_templates

``` json
{
  "action" : "edit",
  "resources" : [
    {
      "href" : "http://localhost:3000/api/orchestration_templates/101",
      "description" : "updated_sample_orchestration_template1"
    },
    {
      "href" : "http://localhost:3000/api/orchestration_templates/102",
      "description" : "updated_sample_orchestration_template2"
    },
    ...
  ]
}
```

### Copying Orchestration Templates

This capability allows orchestration templates to be copied onto new
orchestration templates with updated content via the *copy* action as
follows:

    POST /api/orchestration_templates/:id

``` json
{
  "action" : "copy",
  "resource" : {
    "content" : "{ 'Description' : 'Copied Test Content' }"
  }
}
```

or copying multiple orchestration templates:

    POST /api/orchestration_templates

``` json
{
  "action" : "copy",
  "resources" : [
    {
      "href" : "http://localhost:3000/api/orchestration_templates/101",
      "content" : "{ 'Description' : 'Copied Test Content 1' }"
    },
    {
      "href" : "http://localhost:3000/api/orchestration_templates/102",
      "content" : "{ 'Description' : 'Copied Test Content 2' }"
    },
    ...
  ]
}
```

### Deleting Orchestration Templates

Orchestration templates can be deleted via either the **delete** POST
action or via the DELETE HTTP method.

    POST /api/orchestration_templates/101

``` json
{
  "action" : "delete"
}
```

or simply:

    DELETE /api/orchestration_templates/101

Deleting multiple orchestration templates can be done as follows:

    POST /api/orchestration_templates

``` json
{
  "action" : "delete",
  "resources" : [
    { "href" : "http://localhost:3000/api/orchestration_templates/101" },
    { "href" : "http://localhost:3000/api/orchestration_templates/102" },
    ...
  ]
}
```
