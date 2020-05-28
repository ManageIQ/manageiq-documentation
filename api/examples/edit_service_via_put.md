---
---

### Edit Service via PUT

#### Request:

    PUT /api/services/90

``` json
{
  "name" : "new_service_90",
  "description" : "This is a new description for the service 90"
}
```

#### Response:

``` json
{
  "href": "http://localhost:3000/api/services/90",
  "id": "90",
  "name": "new_service_90",
  "description": "This is a new description for the service 90",
  "guid": "eb6fc61c-7c9b-11e4-8a3a-b8e85646e742",
  "options": {
  },
  "created_at": "2014-12-05T16:29:43Z",
  "updated_at": "2015-04-16T22:41:37Z"
}
```
