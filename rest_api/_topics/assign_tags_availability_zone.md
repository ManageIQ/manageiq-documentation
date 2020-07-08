#### Assigning Tags to Availability Zones

##### Request:

    POST /api/availability_zones/14/tags

``` json
{
  "action" : "assign",
  "resources" : [
    { "category" : "location", "name" : "london" },
    { "category" : "department", "name" : "engineering" },
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
      "message": "Assigning Tag: category:'location' name:'london'",
      "href": "https://hostname/api/availability_zones/14",
      "tag_category": "location",
      "tag_name": "ny"
    },
    {
      "success": true,
      "message": "Assigning Tag: category:'department' name:'engineering'",
      "href": "https://hostname/api/availability_zones/14",
      "tag_category": "department",
      "tag_name": "engineering"
    },
    {
      "success": true,
      "message": "Assigning Tag: category:'environment' name:'test'",
      "href": "https://hostname/api/availability_zones/14",
      "tag_category": "environment",
      "tag_name": "test"
    }
  ]
}
```

#### Assigning Tags by Name to Availability Zones

##### Request:

    POST /api/availability_zones/14/tags

``` json
{
  "action" : "assign",
  "resources" : [
    { "name" : "location/london" },
    { "name" : "department/engineering" },
    { "name" : "environment/test" }
  ]
}
```

##### Response:

``` json
{
  "results": [
    {
      "success": true,
      "message": "Assigning Tag: category:'location' name:'london'",
      "href": "https://hostname/api/availability_zones/14",
      "tag_category": "location",
      "tag_name": "london"
    },
    {
      "success": true,
      "message": "Assigning Tag: category:'department' name:'engineering'",
      "href": "https://hostname/api/availability_zones/14",
      "tag_category": "department",
      "tag_name": "engineering"
    },
    {
      "success": true,
      "message": "Assigning Tag: category:'environment' name:'test'",
      "href": "https://hostname/api/availability_zones/14",
      "tag_category": "environment",
      "tag_name": "test"
    }
  ]
}
```
