---
---

## Service Dialogs

Management of Service Dialogs is provided via the collection:

``` data
/api/service_dialogs
```

The following actions are provided on service\_dialogs resources:

  - [Creating Service Dialogs](#creating-service-dialogs)

  - [Editing Service Dialogs](#editing-service-dialogs)

  - [Copying Service Dialogs](#copying-service-dialogs)

  - [Refreshing Dialog Fields of Service
    Dialogs](#refreshing-dialog-fields-service-dialogs)

  - [Deleting Service Dialogs](#deleting-service-dialogs)

### Creating Service Dialogs

Service Dialogs can be created via a POST to the *service\_dialogs*
collection or via the **create** action signature which also allows
creation of multiple service\_dialogs in a single request.

``` data
POST /api/service_dialogs
```

``` json
{
  "description" : "Dialog",
  "label" : "dialog_label",
  "dialog_tabs" : [
    {
      "description" : "Dialog Tab",
      "position"    : 0,
      "label"       : "dialog_tab_label",
      "dialog_groups" : [
        {
          "description" : "Dialog Group",
          "label"       : "group_label",
          "dialog_fields" : [
            {
              "name"  : "A Dialog Field",
              "label" : "dialog_field_label"
            }
          ]
        }
      ]
    }
  ]
}
```

or creating multiple Service Dialogs:

``` json
{
  "action" : "create",
  "resources" : [
    { "description" : "Dialog 1", "label" : "dialog_1_label", ... },
    { "description" : "Dialog 2", "label" : "dialog_2_label", ... },
    ...
  ]
}
```

**Note:**

Please refer to the [Resource Attributes](../appendices/resource_attributes.html#service_dialogs) page
for a list of available attributes when creating Service Dialogs.

### Editing Service Dialogs

Service Dialogs can be updated via the *edit* action as follows:

``` data
POST /api/service_dialogs/:id
```

``` json
{
  "action" : "edit",
  "resource" : {
    "label" : "updated_label",
    "content" : {
      "dialog_tabs" : [
        "id" : "11",
        "label" : "updated_tab_label",
        "dialogs_groups" : [
          {
            "id" : "31",
            "dialog_fields" : [
               { "id" : "41" }
            ]
          }
        ]
      ]
    }
  }
}
```

or editing multiple Service Dialogs in a single request as follows:

``` data
POST /api/service_dialogs
```

``` json
{
  "action" : "edit",
  "resources" : [
    {
      "href" : "http://localhost:3000/api/service_dialogs/21",
      "label" : "updated_label_1",
      "content" : ...
    },
    {
      "href" : "http://localhost:3000/api/service_dialogs/22",
      "label" : "updated_label_2",
      "content" : ...
    },
    ...
  ]
}
```

### Copying Service Dialogs

Service Dialogs can be copied to create new Service Dialogs via the
*copy* action as follows:

``` data
POST /api/service_dialogs/:id
```

``` json
{
  "action" : "copy"
}
```

When a label is not specified, the new Service Dialog will be named
**Copy of …​** the name of the Service Dialog being copied

Optionally, the label of the new Service Dialog can also be specified as
follows:

``` json
{
  "action" : "copy"
  "resource" : {
    "label" : "test_service_dialog_label"
  }
}
```

Multiple Service Dialogs can also be copied in a single request as
follows:

    POST /api/service_dialogs

``` json
{
  "action" : "copy",
  "resources" : [
    {
      "href" : "http://localhost:3000/api/service_dialogs/11",
      "label" : "test_service_dialog_label_1"
    },
    {
      "href" : "http://localhost:3000/api/service_dialogs/12",
      "label" : "test_service_dialog_label_2"
    },
    ...
  ]
}
```

### Refreshing Dialog Fields of Service Dialogs

Refreshing dialog fields for a Service Dialog is done as follows:

    POST /api/service_dialogs/:id

``` json
{
  "action" : "refresh_dialog_fields",
  "resource" : {
    "resource_action_id" : "6",
    "target_id" : "12",
    "target_type" : "service_template_ansible_tower",
    "dialog_fields" : {
      "my_field1" : "my field1 value",
      "my_field2" : "my field2 value",
      "my_field3" : "my field3 value",
      ...
    },
    "fields" : [ "my_field1", "my_field3" ]
  }
}
```

### Deleting Service Dialogs

Deleting a Service Dialog can be done via the *delete* action as
follows:

``` data
POST /api/service_dialogs/:id
```

``` json
{
  "action" : "delete"
}
```

or via the DELETE HTTP method as follows:

``` data
DELETE /api/service_dialogs/:id
```

One can also delete multiple Service Dialogs via the *delete* action on
the collection with references to the service dialogs to delete as
follows:

``` data
POST /api/service_dialogs
```

``` json
{
  "action" : "delete",
  "resources" : [
    { "href" : "http://localhost:3000/api/service_dialogs/101" },
    { "href" : "http://localhost:3000/api/service_dialogs/102" },
    { "href" : "http://localhost:3000/api/service_dialogs/103" },
    ...
  ]
}
```
