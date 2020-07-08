---
---

## Transformation Mappings

Management of transformation mappings is provided via the following
collection:

``` data
/api/transformation_mappings
```

The following actions are available for transformation mappings:

  - [Querying Transformation
    Mappings](#querying-transformation-mappings)

  - [Creating Transformation
    Mappings](#creating-transformation-mappings)

  - [Deleting Transformation
    Mappings](#deleting-transformation-mappings)

### Querying Transformation Mappings

To query all transformation mappings:

    GET /api/transformation_mappings

To query a specific transformation mapping for details:

    GET /api/transformation_mappings/:id

### Creating Transformation Mappings

Transformation mappings can be created via the *create* `POST` action,
by posting the request directly to **/api/transformation\_mappings**.

``` json
{
  "action": "create",
  "resource": {
    "name": "VMware to RHV",
    "description": "Infrastructure Mapping for migration from VMware to RHV",
    "transformation_mapping_items": [
      { "source": "/api/clusters/00000000000001", "destination": "/api/clusters/00000000000003" },
      { "source": "/api/data_stores/00000000000001", "destination": "/api/data_stores/00000000000013" },
      { "source": "/api/data_stores/00000000000002", "destination": "/api/data_stores/00000000000013" },
      { "source": "/api/data_stores/00000000000003", "destination": "/api/data_stores/00000000000013" },
      { "source": "/api/data_stores/00000000000004", "destination": "/api/data_stores/00000000000013" },
      { "source": "/api/lans/00000000000007", "destination": "/api/lans/00000000000034" },
      { "source": "/api/lans/00000000000015", "destination": "/api/lans/00000000000034" },
      { "source": "/api/lans/00000000000009", "destination": "/api/lans/00000000000032" },
      { "source": "/api/lans/00000000000017", "destination": "/api/lans/00000000000032" }
    ]
  }
}
```

#### Transportation Mapping Attributes

<table>
<colgroup>
<col style="width: 33%" />
<col style="width: 33%" />
<col style="width: 33%" />
</colgroup>
<thead>
<tr class="header">
<th>Attribute</th>
<th>Type</th>
<th>Description</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p>name</p></td>
<td><p>string</p></td>
<td><p>Name of transformation mapping</p></td>
</tr>
<tr class="even">
<td><p>description</p></td>
<td><p>string</p></td>
<td><p>Description of transformation mapping</p></td>
</tr>
<tr class="odd">
<td><p>transformation_mapping_items</p></td>
<td><p>array</p></td>
<td><p>List of transformation mapping items. Each item contains:</p>
<ul>
<li><p><code>source</code>: Suffix of the source resource URL</p></li>
<li><p><code>destination</code>: Suffix of the destination resource URL</p></li>
</ul></td>
</tr>
</tbody>
</table>

#### Response

``` json
{
  "results": [
    {
      "href": "http://localhost:3000/api/transformation_mappings/00000000000001",
      "id": "00000000000001",
      "name": "VMware to RHV",
      "description": "Infrastructure Mapping for migration from VMware to RHV",
      "comments": null,
      "state": null,
      "options": {},
      "tenant_id": null,
      "created_at": "2019-09-09T09:56:59Z",
      "updated_at": "2019-09-09T09:56:59Z"
    }
  ]
}
```

### Deleting Transformation Mappings

Transformation mappings can be deleted either with the **delete** `POST`
action or the `DELETE` HTTP method.

    POST /api/transformation_mappings/101

``` json
{
  "action" : "delete"
}
```

or:

    DELETE /api/transformation_mappings/101

To delete multiple transformation mappings:

    POST /api/transformation_mappings

``` json
{
  "action" : "delete",
  "resources" : [
    { "href" : "http://localhost:3000/api/transformation_mappings/101" },
    { "href" : "http://localhost:3000/api/transformation_mappings/102" },
    ...
  ]
}
```
