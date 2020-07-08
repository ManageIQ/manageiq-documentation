#### Assigning Tags to Network Routers

##### Request:

    POST /api/network_routers/400/tags

``` json
{
  "action" : "assign",
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
      "message": "Assigning Tag: category:'network location' name:'cloud'",
      "href": "https://hostname/api/network_routers/400",
      "tag_category": "network location",
      "tag_name": "cloud"
    },
    {
      "success": true,
      "message": "Assigning Tag: category:'environment' name:'production'",
      "href": "https://hostname/api/network_routers/400",
      "tag_category": "environment",
      "tag_name": "production"
    }
  ]
}
```

#### Assigning Tags by Name to Network Routers

##### Request:

    POST /api/cloud_networks/400/tags

``` json
{
  "action" : "assign",
  "resources" : [
    { "name" : "network location/cloud" },
    { "name" : "environment/production" }
  ]
}
```

##### Response:

``` json
{
  "results": [
    {
      "success": true,
      "message": "Assigning Tag: category:'network location' name:'cloud'",
      "href": "https://hostname/api/cloud_networks/400",
      "tag_category": "network location",
      "tag_name": "cloud"
    },
    {
      "success": true,
      "message": "Assigning Tag: category:'environment' name:'production'",
      "href": "https://hostname/api/cloud_networks/400",
      "tag_category": "environment",
      "tag_name": "production"
    }
  ]
}
```
