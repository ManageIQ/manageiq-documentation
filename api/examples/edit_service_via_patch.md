---
---

### Editing a resource via the Patch Method.

Supported attribute actions for PATCH include, add, edit and remove.

#### Request:

    PATCH /api/services/90

``` json
[
  { "action" : "edit", "path" : "name", "value" : "updated_service_90" },
  { "action" : "remove", "path" : "description"}
]
```

#### Response:

``` json
{
  "href": "http://localhost:3000/api/services/90",
  "id": "90",
  "name": "updated_service_90",
  "guid": "eb6fc61c-7c9b-11e4-8a3a-b8e85646e742",
  "options": {
  },
  "created_at": "2014-12-05T16:29:43Z",
  "updated_at": "2015-04-16T22:38:57Z"
}
```

<div class="note">

Note that the description attribute is no longer defined for this
service.

</div>
