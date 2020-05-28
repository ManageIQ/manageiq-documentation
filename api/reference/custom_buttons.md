---
---

## Custom Button Management

Management of Custom Buttons is provided with the following collections:

``` data
/api/custom_button_sets
/api/custom_buttons
```

  - [Managing Custom Button Sets](#custom-button-sets)

      - [Querying Custom Button Sets](#querying-custom-button-sets)

      - [Creating Custom Button Sets](#creating-custom-button-sets)

      - [Editing Custom Button Sets](#editing-custom-button-sets)

      - [Deleting Custom Button Sets](#deleting-custom-button-sets)

  - [Managing Custom Buttons](#custom-buttons)

      - [Querying Custom Buttons](#querying-custom-buttons)

      - [Creating Custom Buttons](#creating-custom-buttons)

      - [Editing Custom Buttons](#editing-custom-buttons)

      - [Deleting Custom Buttons](#deleting-custom-buttons)

### Managing Custom Button Sets

#### Querying Custom Button Sets

Querying all available Custom Button Sets:

    GET /api/custom_button_sets

Getting details on a specific Custom Button Set:

    GET /api/custom_button_sets/:id

#### Creating Custom Button Sets

Custom Button Sets can be created as follows:

``` data
POST /api/custom_button_sets
```

``` json
{
  "name"        : "Generic Object Custom Button Group",
  "description" : "Generic Object Custom Button Group Description",
  "set_data"    : {
    "button_icon"      : "ff ff-view-expanded",
    "button_color"     : "#4727ff",
    "display"          : true,
    "applies_to_class" : "GenericObjectDefinition",
    "applies_to_id"    : "50"
  }
}
```

#### Editing Custom Button Sets

Updating Custom Button Sets can be done via the *edit* action as
follows:

``` data
POST /api/custom_button_sets/:id
```

``` json
{
  "action" : "edit",
  "resource" : {
    "name" : "Updated Custom Button Group",
    "description" : "Updated Custom Button Group Description",
    "set_data" : {
      "button_icon" : "ff ff-closed"
    }
  }
}
```

Custom Button Sets can also be updated in bulk:

``` data
POST /api/custom_button_sets
```

``` json
{
  "action" : "edit",
  "resources" : [
    { "id" : "11", "set_data" : { "button_icon" : "ff ff-closed" } },
    { "id" : "12", "set_data" : { "button_icon" : "ff ff-closed" } },
    { "id" : "13", "set_data" : { "button_icon" : "ff ff-closed" } }
  ]
}
```

Custom button sets can also be updated with the PUT method as follows:

``` data
PUT /api/custom_button_sets/:id
```

``` json
{
  "name" : "Updated Custom Button Group",
  "description" : "Updated Custom Button Group Description",
  "set_data" : {
    "button_icon" : "ff ff-closed"
  }
}
```

#### Deleting Custom Button Sets

Custom Button Sets can be deleted via the *delete* action as follows:

``` data
POST /api/custom_button_sets/:id
```

``` json
{
  "action" : "delete"
}
```

and in bulk as follows:

``` data
POST /api/custom_button_sets
```

``` json
{
  "action" : "delete",
  "resources" : [
    { "href" : "http://localhost:3000/api/custom_button_sets/21" },
    { "href" : "http://localhost:3000/api/custom_button_sets/22" },
    { "id" : "23" }
  ]
}
```

A single Custom Button Set can also be deleted with the DELETE method as
follows:

``` data
DELETE /api/custom_button_sets/:id
```

### Managing Custom Buttons

#### Querying Custom Buttons

Querying all available Custom Buttons:

    GET /api/custom_buttons

Getting details on a specific Custom Button:

    GET /api/custom_buttons/:id

#### Creating Custom Buttons

Custom Buttons can be created as follows:

``` data
POST /api/custom_buttons
```

``` json
{
  "name"             : "Generic Object Custom Button",
  "description"      : "Generic Object Custom Button Description",
  "applies_to_class" : "GenericObjectDefinition",
  "options"          : {
    "button_icon"    : "ff ff-view-expanded",
    "button_color"   : "#4727ff",
    "display"        : true
  },
  "resource_action"  : {
    "ae_namespace"   : "SYSTEM",
    "ae_class"       : "PROCESS",
    "dialog_id"      : "1"
  },
  "visibility"       : {
    "roles"          : ["_ALL_"]
  }
}
```

#### Editing Custom Buttons

Updating Custom Buttons can be done via the *edit* action as follows:

``` data
POST /api/custom_buttons/:id
```

``` json
{
  "action" : "edit",
  "resource" : {
    "name" : "Updated Custom Button",
    "description" : "Updated Custom Button Description",
    "resource_action" : {
      "ae_namespace"  : "SYSTEM2"
    }
  }
}
```

Custom Buttons can also be updated in Bulk as follows:

``` data
POST /api/custom_buttons
```

``` json
{
  "action" : "edit",
  "resources" : [
    {
      "href" : "http://localhost:3000/api/custom_buttons/31",
      "options" :  { "display" : false }
    },
    {
      "href" : "http://localhost:3000/api/custom_buttons/32",
      "options" :  { "display" : false }
    },
    {
      "id"   : "33",
      "options" :  { "display" : false }
    }
  ]
}
```

#### Deleting Custom Buttons

Custom Buttons can be deleted via the *delete* action as follows:

``` data
POST /api/custom_buttons/:id
```

``` json
{
  "action" : "delete"
}
```

Multiple Custom Buttons can also be deleted in a single request as
follows:

``` data
POST /api/custom_buttons
```

``` json
{
  "action" : "delete",
  "resources" : [
    { "href" : "http://localhost:3000/api/custom_buttons/21" },
    { "id" : "22" },
    { "id" : "23" }
  ]
}
```

Single Custom Buttons can also be deleted with the DELETE method as
follows:

``` data
DELETE /api/custom_buttons/:id
```
