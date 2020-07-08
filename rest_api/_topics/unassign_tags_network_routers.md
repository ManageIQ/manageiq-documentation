#### Unassigning Tags on Network Routers

##### Request:

    POST /api/network_routers/400/tags

``` json
{
  "action" : "unassign",
  "resources" : [
    { "category" : "network location", "name" : "cloud" },
    { "category" : "environment", "name" : "production" }
  ]
}
```

##### Response:

``` json
{
  "results": [
    {
      "success": true,
      "message": "Unassigning Tag: category:'network location' name:'cloud'",
      "href": "https://hostname/api/network_routers/400",
      "tag_category": "network location",
      "tag_name": "cloud"
    },
    {
      "success": true,
      "message": "Unassigning Tag: category:'environment' name:'production'",
      "href": "https://hostname/api/network_routers/400",
      "tag_category": "environment",
      "tag_name": "production"
    }
  ]
}
```
