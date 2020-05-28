#### Unassigning Tags on Cloud Networks

##### Request:

    POST /api/cloud_networks/223/tags

``` json
{
  "action" : "unassign",
  "resources" : [
    { "category" : "location", "name" : "chicago" },
    { "category" : "department", "name" : "support" },
    { "category" : "environment", "name" : "test" }
  ]
}
```

##### Response:

``` json
{
  "results": [
    {
      "success": true,
      "message": "Unassigning Tag: category:'location' name:'chicago'",
      "href": "https://hostname/api/cloud_networks/223",
      "tag_category": "location",
      "tag_name": "chicago"
    },
    {
      "success": true,
      "message": "Unassigning Tag: category:'department' name:'support'",
      "href": "https://hostname/api/cloud_networks/223",
      "tag_category": "department",
      "tag_name": "support"
    },
    {
      "success": true,
      "message": "Unassigning Tag: category:'environment' name:'test'",
      "href": "https://hostname/api/cloud_networks/223",
      "tag_category": "environment",
      "tag_name": "test"
    }
  ]
}
```
