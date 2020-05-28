---
---

## Generic Object Management

Management of Generic Objects is provided with the following
collections:

``` data
/api/generic_object_definitions
/api/generic_objects
```

  - [Managing Generic Object Definitions](#generic-object-definitions)

      - [Querying Generic Object
        Definitions](#querying-generic-object-definitions)

      - [Creating Generic Object
        Definitions](#creating-generic-object-definitions)

      - [Editing Generic Object
        Definitions](#editing-generic-object-definitions)

      - [Deleting Generic Object
        Definitions](#deleting-generic-object-definitions)

  - [Managing Generic Objects](#generic-objects)

      - [Querying Generic Objects](#querying-generic-objects)

      - [Creating Generic Objects](#creating-generic-objects)

      - [Editing Generic Objects](#editing-generic-objects)

      - [Calling Generic Object
        Methods](#calling-generic-object-methods)

      - [Deleting Generic Objects](#deleting-generic-objects)

### Generic Object Definitions

#### Querying Generic Object Definitions

Querying all available Generic Object Definitions:

    GET /api/generic_object_definitions

Getting details on a specific Generic Object Definition:

    GET /api/generic_object_definitions/:id

Getting details on a specific Generic Object Definition by name:

    GET /api/generic_object_definitions/:name

Querying all the Generic Objects defined for a specific Generic Object
Definition:

    GET /api/generic_object_definitions/:id/generic_objects

Getting a specific Generic Object defined for a Generic Object
Definition:

    GET /api/generic_object_definitions/:id/generic_objects/:generic_object_id

Fetching the vms associations for a specific Generic Object:

    GET /api/generic_object_definitions/:id/generic_objects/:generic_object_id?associations=vms

#### Creating Generic Object Definitions

Generic Object Definitions can be created as follows:

``` data
POST /api/generic_object_definitions
```

``` json
{
  "name"        : "LoadBalancer",
  "description" : "LoadBalancer description",
  "properties"  : {
    "attributes"  : {
      "address"      : "string",
      "last_restart" : "datetime"
    },
    "associations" : {
      "vms"      : "Vm",
      "services" : "Service"
    },
    "methods" : [
      "add_vm",
      "remove_vm"
    ]
  },
  "picture"     : {
    "extension" : "png",
    "content"   : "iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAYAAAAfFcSJAAAABGdBTUEAALGP"\
      "C/xhBQAAACBjSFJNAAB6JgAAgIQAAPoAAACA6AAAdTAAAOpgAAA6mAAAF3Cc"\
      "ulE8AAAACXBIWXMAAAsTAAALEwEAmpwYAAABWWlUWHRYTUw6Y29tLmFkb2Jl"\
      "LnhtcAAAAAAAPHg6eG1wbWV0YSB4bWxuczp4PSJhZG9iZTpuczptZXRhLyIg"\
      "eDp4bXB0az0iWE1QIENvcmUgNS40LjAiPgogICA8cmRmOlJERiB4bWxuczpy"\
      "ZGY9Imh0dHA6Ly93d3cudzMub3JnLzE5OTkvMDIvMjItcmRmLXN5bnRheC1u"\
      "cyMiPgogICAgICA8cmRmOkRlc2NyaXB0aW9uIHJkZjphYm91dD0iIgogICAg"\
      "ICAgICAgICB4bWxuczp0aWZmPSJodHRwOi8vbnMuYWRvYmUuY29tL3RpZmYv"\
      "MS4wLyI+CiAgICAgICAgIDx0aWZmOk9yaWVudGF0aW9uPjE8L3RpZmY6T3Jp"\
      "ZW50YXRpb24+CiAgICAgIDwvcmRmOkRlc2NyaXB0aW9uPgogICA8L3JkZjpS"\
      "REY+CjwveDp4bXBtZXRhPgpMwidZAAAADUlEQVQIHWNgYGCwBQAAQgA+3N0+"\
      "xQAAAABJRU5ErkJggg=="
  }
}
```

Example of creating a Generic Object Definition with a picture
reference:

``` json
{
  "name"        : "LoadBalancer",
  "description" : "LoadBalancer description",
  "properties"  : {
    "attributes"  : {
      "address"      : "string",
      "last_restart" : "datetime"
    },
    "associations" : {
      "vms"      : "Vm",
      "services" : "Service"
    },
    "methods" : [
      "add_vm",
      "remove_vm"
    ]
  },
  "picture"     : {
    "href" : "http://localhost:3000/api/pictures/11"
  }
}
```

*Note:* picture references can be by *href* or *id*.

#### Editing Generic Object Definitions

Updating Generic Object Definitions can be done via the *edit* action as
follows:

``` data
POST /api/generic_object_definitions/:id
```

or by name:

``` data
POST /api/generic_object_definitions/:name
```

``` json
{
  "action" : "edit",
  "resource" : {
    "description" : "Latest LoadBalancer Description"
  }
}
```

Generic object definitions can also be updated with the PUT method as
follows:

``` data
PUT /api/generic_object_definitions/:id
```

``` json
{
  "name" : "New LoadBalancer Name",
  "description" : "New LoadBalancer Description"
}
```

Pictures can be removed from Generic Object Definitions by sending in an
empty picture reference via any of the edit methods, for example:

``` data
POST /api/generic_object_definitions/:name
```

``` json
{
  "action" : "edit",
  "resource" : {
    "picture" : {}
  }
}
```

Generic Object Definitions can be edited by href, id or name in bulk as
in the following example:

``` data
POST /api/generic_object_definitions
```

``` json
{
  "action" : "edit",
  "resources" : [
    {
      "name" : "Load Balancer",
      "resource" : {
        "name" : "Enhanced Load Balancer",
        "description" : "Description for Enhanced Load Balancer",
        "picture" : { "id" : "16" }
      }
    },
    {
      "href" : "http://localhost:3000/api/generic_object_definitions/12",
      "resource" : {
        "name" : "NetworkScanner",
        "description" : "Description for Network Scanner"
      }
    },
    {
      "id" : "13",
      "resource" : {
        "name" : "NetworkFirewall",
        "description" : "Description for Network Firewall"
      }
    }
  ]
}
```

Editing Generic Object Definitions can also be done by using one of the
following actions for updating *attributes*, *methods* and
*associations*:

  - [add\_attributes](#add-attributes)

  - [remove\_attributes](#remove-attributes)

  - [add\_methods](#add-methods)

  - [remove\_methods](#remove-methods)

  - [add\_associations](#add-associations)

  - [remove\_associations](#remove-associations)

##### Add Attributes

``` data
POST /api/generic_object_definitions/:id
```

``` json
{
  "action" : "add_attributes",
  "resource" : {
    "attributes" : {
      "optional_attribute1" : "string",
      "optional_attribute2" : "boolean"
    }
  }
}
```

##### Remove Attributes

``` data
POST /api/generic_object_definitions/:id
```

``` json
{
  "action" : "remove_attributes",
  "resource" : {
    "attributes" : {
      "unused_attribute9" : "string"
    }
  }
}
```

##### Add Methods

``` data
POST /api/generic_object_definitions/:id
```

``` json
{
  "action" : "add_methods",
  "resource" : {
    "methods" : [ "go_method1", "go_method2" ]
  }
}
```

##### Remove Methods

``` data
POST /api/generic_object_definitions/:id
```

``` json
{
  "action" : "remove_methods",
  "resource" : {
    "methods" : [ "go_method3" ]
  }
}
```

##### Add Associations

``` data
POST /api/generic_object_definitions/:id
```

``` json
{
  "action" : "add_associations",
  "resource" : {
    "associations" : {
      "az" : "AvailabilityZone",
      "chargeback" : "ChargebackVm"
    }
  }
}
```

##### Remove Associations

``` data
POST /api/generic_object_definitions/:id
```

``` json
{
  "action" : "remove_associations",
  "resource" : {
    "associations" : {
      "chargeback" : "ChargebackVm"
    }
  }
}
```

#### Deleting Generic Object Definitions

Generic Object Definitions can be deleted via the *delete* action as
follows:

``` data
POST /api/generic_object_definitions/:id
```

or by name:

``` data
POST /api/generic_object_definitions/:name
```

``` json
{
  "action" : "delete"
}
```

Multiple Generic Object Definitions can also be deleted in a single
request as follows:

``` data
POST /api/generic_object_definitions
```

``` json
{
  "action" : "delete",
  "resources" : [
    { "href" : "http://localhost:3000/api/generic_object_definitions/11" },
    { "id" : "12" }
  ]
}
```

Single Generic Object Definitions can also be deleted with the DELETE
method as follows:

``` data
DELETE /api/generic_object_definitions/:id
```

or by name:

``` data
DELETE /api/generic_object_definitions/:name
```

### Generic Objects

#### Querying Generic Objects

Querying all available Generic Objects:

    GET /api/generic_objects

Getting details on a specific Generic Object:

    GET /api/generic_objects/:id

Querying all the Generic Objects defined for a specific Service:

    GET /api/services/:id/generic_objects

Querying Generic Objects and related picture and image\_href for a
specific Service:

##### Request:

    GET /api/services/:id?expand=generic_objects&attributes=generic_objects.picture

##### Response:

``` json
{
  "href" : "http://localhost:3000/api/services/645",
  "id" : "645",
  "name" : "Test Azure Service",
  "description" : "Azure",
  "guid" : "6ce8f6c2-7f93-4a7e-b618-da9acab470ac",
  "options": {  },
  "display": false,
  "created_at" : "2017-08-07T16:52:46Z",
  "updated_at" : "2017-08-07T16:52:46Z",
  "miq_group_id" : "1",
  "retired": false,
  "tenant_id" : "1",
  "initiator" : "user",
  "generic_objects": [
    {
      "href" : "http://localhost:3000/api/services/645/generic_objects/1",
      "id" : "1",
      "name" : "generic_object_1",
      "generic_object_definition_id" : "1",
      "created_at" : "2017-08-15T17:35:08Z",
      "updated_at" : "2017-09-07T12:05:14Z",
      "properties": {
         "vms" : [ 615 ],
         "start" : true
      },
      "picture" : {
        "href" : "http://localhost:3000/api/picture/1",
        "id" : "1",
        "resource_id" : "1",
        "resource_type" : "GenericObjectDefinition",
        "image_href" : "http://localhost:3000/pictures/1.png",
        "extension" : "png"
      }
    }
  ],
  "actions" : {
    ...
  }
}
```

#### Creating Generic Objects

Generic Objects can be created as follows:

``` data
POST /api/generic_objects
```

``` json
{
  "generic_object_definition" : { "href" : "http://localhost:3000/api/generic_object_definitions/11" },
  "name" : "go1_name",
  "uid" : "optional_uid",
  "property_attributes" : {
    "widget" : "widget value",
    "supports_feature_a" : false
  },
  "associations" : {
    "vms" : [
      { "href" : "http://localhost:3000/api/vms/11" },
      { "id" : "12 }
    ]
  }
}
```

Generic Objects can also be directly created for a specific Generic
Object Definition type as follows:

``` data
POST /api/generic_object_definitions/:id/generic_objects
```

``` json
{
  "name" : "go1_name",
  "uid" : "optional_uid",
  "property_attributes" : {
    "widget" : "widget value",
    "supports_feature_a" : false
  },
  "associations" : {
    "vms" : [
      { "href" : "http://localhost:3000/api/vms/11" },
      { "id" : "12 }
    ]
  }
}
```

In which case, the generic\_object\_definition reference is not needed.

#### Editing Generic Objects

Updating Generic Objects can be done via the *edit* action as follows:

``` data
POST /api/generic_objects/:id
```

``` json
{
  "action" : "edit",
  "resource" : {
    "name" : "updated_name",
    "property_attributes" : {
      "widget" : "updated_widget"
    }
  }
}
```

#### Calling Generic Object Methods

When generic objects have methods defined in their definitions, those
methods are exposed with the generic objects as actions.

The following example shows a generic object with two methods
*method\_a* and *method\_b*:

``` data
GET /api/generic_objects/101
```

``` json
{
  "href" : "http://localhost:3000/api/generic_objects/101",
  "id"   : "101",
  "name" : "sample_object",
  "generic_object_definition_id" : "5",
  "property_attributes" : {
    "widget" : "a sample widget",
    "object_flag" : true
  },
  "actions" : [
    {
      "name" : "edit",
      "method" : "post",
      "href" : "http://localhost:3000/api/generic_objects/101"
    },
    {
      "name" : "delete",
      "method" : "post",
      "href" : "http://localhost:3000/api/generic_objects/101"
    },
    {
      "name" : "delete",
      "method" : "delete",
      "href" : "http://localhost:3000/api/generic_objects/101"
    },
    {
      "name" : "method_a",
      "method" : "post",
      "href" : "http://localhost:3000/api/generic_objects/101"
    },
    {
      "name" : "method_b",
      "method" : "post",
      "href" : "http://localhost:3000/api/generic_objects/101"
    }
  ]
}
```

With the above sample generic object, the custom methods can be invoked
like any other action as follows:

``` data
POST /api/generic_objects/101
```

``` json
{
  "action" : "method_a",
  "resource" : {
    "attr1" : "value 1",
    "attr2" : "value 2"
  }
}
```

#### Deleting Generic Objects

Generic Objects can be deleted via the *delete* action as follows:

``` data
POST /api/generic_objects/:id
```

``` json
{
  "action" : "delete"
}
```

Multiple Generic Objects can also be deleted in a single request as
follows:

``` data
POST /api/generic_objects
```

``` json
{
  "action" : "delete",
  "resources" : [
    { "href" : "http://localhost:3000/api/generic_objects/21" },
    { "id" : "22" },
    { "id" : "23" }
  ]
}
```

Single Generic Objects can also be deleted with the DELETE method as
follows:

``` data
DELETE /api/generic_objects/:id
```
