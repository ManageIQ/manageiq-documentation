#### Assigning Tags to Cloud Subnets

##### Request:

    POST /api/cloud_subnets/7/tags

``` json
{
  "action" : "assign",
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
      "message": "Assigning Tag: category:'location' name:'ny'",
      "href": "https://hostname/api/cloud_subnets/7",
      "tag_category": "location",
      "tag_name": "ny"
    },
    {
      "success": true,
      "message": "Assigning Tag: category:'department' name:'marketing'",
      "href": "https://hostname/api/cloud_subnets/7",
      "tag_category": "department",
      "tag_name": "marketing"
    },
    {
      "success": true,
      "message": "Assigning Tag: category:'environment' name:'dev'",
      "href": "https://hostname/api/cloud_subnets/7",
      "tag_category": "environment",
      "tag_name": "dev"
    }
  ]
}
```

#### Assigning Tags by Name to Cloud Subnets

##### Request:

    POST /api/cloud_subnets/7/tags

``` json
{
  "action" : "assign",
  "resources" : [
    { "name" : "location/internal" },
    { "name" : "department/marketing" },
    { "name" : "environment/dev" }
  ]
}
```

##### Response:

``` json
{
  "results": [
    {
      "success": true,
      "message": "Assigning Tag: category:'location' name:'internal'",
      "href": "https://hostname/api/cloud_subnets/30",
      "tag_category": "location",
      "tag_name": "internal"
    },
    {
      "success": true,
      "message": "Assigning Tag: category:'department' name:'marketing'",
      "href": "https://hostname/api/cloud_subnets/30",
      "tag_category": "department",
      "tag_name": "marketing"
    },
    {
      "success": true,
      "message": "Assigning Tag: category:'environment' name:'dev'",
      "href": "https://hostname/api/cloud_subnets/30",
      "tag_category": "environment",
      "tag_name": "dev"
    }
  ]
}
```
