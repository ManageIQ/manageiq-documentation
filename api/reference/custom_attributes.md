---
---

## Custom Attributes

Custom Attributes can be managed for several types of resources. This is
done via the custom\_attributes sub-collection as follows:

| Resource Type    | Custom Attribute Subcollection        |
| ---------------- | ------------------------------------- |
| Virtual Machines | /api/vms/:id/custom\_attributes       |
| Cloud Instances  | /api/instances/:id/custom\_attributes |
| Providers        | /api/providers/:id/custom\_attributes |
| Services         | /api/services/:id/custom\_attributes  |

  - [Querying Custom Attributes](#querying-custom-attributes)

  - [Specifying Custom Attributes](#specifying-custom-attributes)

  - [Custom Attribute Actions](#custom-attribute-actions)

  - [Adding Custom Attributes](#add-custom-attributes)

  - [Editing Custom Attributes](#edit-custom-attributes)

  - [Deleting Custom Attributes](#delete-custom-attributes)

### Querying Custom Attributes

Custom attributes of a resource can be asked for by expanding the
subcollection as follows:

    GET /api/vms/:id?expand=custom_attributes
    GET /api/instances/:id?expand=custom_attributes
    GET /api/providers/:id?expand=custom_attributes
    GET /api/services/:id?expand=custom_attributes

Optionally, just the custom attributes of a resource can be queried:

    GET /api/vms/:id/custom_attributes
    GET /api/instances/:id/custom_attributes
    GET /api/providers/:id/custom_attributes
    GET /api/services/:id/custom_attributes

### Specifying Attribute Actions

Custom attributes are specified as follows:

``` json
{
  "name" : "...",
  "value" : "...",
  "field_type" : "...",
  "source" : "...",
  "section" : "...",
}
```

For adding custom attributes, **name** field is required.

**field\_type**, **source** and **section** are optional.

There is no default value for **field\_type**. Allowed values for
**field\_type** are **DateTime**, **Date** and **Time**.

Default value for **source** is **EVM**. If **source** is set to **VC**,
the custom attribute field will be updated on the provider.

Default value for **section** is **metadata**. Allowed values for
**section** include **metadata** and **cluster\_settings**.

For editing a custom attribute, specify the custom attribute either by
**name**:

``` json
{
  "name" : "...",
  "value" : "..."
}
```

Or by **href**:

``` json
{
  "href" : "http://localhost:3000/api/vms/:id/custom_attributes/:id",
  "value" : "..."
}
```

### Custom Attribute Actions

| Action | Description                                |
| ------ | ------------------------------------------ |
| add    | Adding Custom Attributes to a Resource     |
| edit   | Editing Custom Attributes of a Resource    |
| delete | Deleting Custom Attributes from a Resource |

### Adding Custom Attributes

Adding custom attributes to a Resource:

    POST /api/vms/:id/custom_attributes
    POST /api/instances/:id/custom_attributes
    POST /api/providers/:id/custom_attributes
    POST /api/services/:id/custom_attributes

``` json
{
  "action" : "add",
  "resources" : [
    { ... },
    { ... },
    ...
  ]
}
```

For example, adding two custom attributes:

``` json
{
  "action" : "add",
  "resources" : [
    { "name" : "ca1", "value" : "value 1" },
    { "name" : "ca2", "value" : "value 2" }
  ]
}
```

### Editing Custom Attributes

Editing custom attributes of a Resource:

    POST /api/vms/:id/custom_attributes
    POST /api/instances/:id/custom_attributes
    POST /api/providers/:id/custom_attributes
    POST /api/services/:id/custom_attributes

``` json
{
  "action" : "edit",
  "resources" : [
    { ... },
    { ... },
    ...
  ]
}
```

For example:

``` json
{
  "action" : "edit",
  "resources" : [
    { "name" : "ca_name1", "value" : "updated custom attribute value 1" },
    { "name" : "ca_name2", "value" : "updated custom attribute value 2" }
  ]
}
```

### Deleting Custom Attributes

Deleting custom attributes of a Resource:

    POST /api/vms/:id/custom_attributes
    POST /api/instances/:id/custom_attributes
    POST /api/providers/:id/custom_attributes
    POST /api/services/:id/custom_attributes

``` json
{
  "action" : "delete",
  "resources" : [
    { ... },
    { ... },
    ...
  ]
}
```

In the following example, a request to delete custom attributes of a VM
by name and by href:

``` json
{
  "action" : "delete",
  "resources" : [
    { "name" : "ca_name1" },
    { "href" : "http://localhost:3000/api/vms/:id/custom_attributes/:id" }
  ]
}
```

Custom attributes can be deleted via a *delete* action as follows:

    POST /api/vms/:id/custom_attributes/:ca_id
    POST /api/instances/:id/custom_attributes/:ca_id
    POST /api/providers/:id/custom_attributes/:ca_id
    POST /api/services/:id/custom_attributes/:ca_id

``` json
{
  "action" : "delete"
}
```

They can also be deleted via the DELETE method:

    DELETE /api/vms/:id/custom_attributes/:ca_id
    DELETE /api/instances/:id/custom_attributes/:ca_id
    DELETE /api/providers/:id/custom_attributes/:ca_id
    DELETE /api/services/:id/custom_attributes/:ca_id
