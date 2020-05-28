#### Unassigning Tags on Cloud Subnets

##### Request:

    POST /api/cloud_subnets/7/tags

``` json
{
  "action" : "unassign",
  "resources" : [
    { "category" : "location", "name" : "london" },
    { "category" : "department", "name" : "marketing" },
    { "category" : "environment", "name" : "dev" }
  ]
}
```

##### Response:

``` json
{
  "results": [
    {
      "success": true,
      "message": "Unassigning Tag: category:'location' name:'london'",
      "href": "https://hostname/api/cloud_subnets/7",
      "tag_category": "location",
      "tag_name": "london"
    },
    {
      "success": true,
      "message": "Unassigning Tag: category:'department' name:'marketing'",
      "href": "https://hostname/api/cloud_subnets/7",
      "tag_category": "department",
      "tag_name": "marketing"
    },
    {
      "success": true,
      "message": "Unassigning Tag: category:'environment' name:'dev'",
      "href": "https://hostname/api/cloud_subnets/7",
      "tag_category": "environment",
      "tag_name": "dev"
    }
  ]
}
```
