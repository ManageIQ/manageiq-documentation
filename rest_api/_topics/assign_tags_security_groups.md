#### Assigning Tags to Security Groups

##### Request:

    POST /api/security_groups/30/tags

``` json
{
  "action" : "assign",
  "resources" : [
    { "category" : "network location", "name" : "internal" },
    { "category" : "owner", "name" : "windows 2008 test team" },
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
      "message": "Assigning Tag: category:'network location' name:'internal'",
      "href": "https://hostname/api/security_groups/30",
      "tag_category": "network location",
      "tag_name": "internal"
    },
    {
      "success": true,
      "message": "Assigning Tag: category:'owner' name:'windows 2008 test team'",
      "href": "https://hostname/api/security_groups/30",
      "tag_category": "owner",
      "tag_name": "windows 2008 test team"
    },
    {
      "success": true,
      "message": "Assigning Tag: category:'environment' name:'test'",
      "href": "https://hostname/api/security_groups/30",
      "tag_category": "environment",
      "tag_name": "test"
    }
  ]
}
```

#### Assigning Tags by Name to Security Groups

##### Request:

    POST /api/security_groups/30/tags

``` json
{
  "action" : "assign",
  "resources" : [
    { "name" : "network location/internal" },
    { "name" : "owner/windows 2008 test team" },
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
      "message": "Assigning Tag: category:'network location' name:'internal'",
      "href": "https://hostname/api/security_groups/30",
      "tag_category": "network location",
      "tag_name": "internal"
    },
    {
      "success": true,
      "message": "Assigning Tag: category:'owner' name:'windows 2008 test team'",
      "href": "https://hostname/api/security_groups/30",
      "tag_category": "owner",
      "tag_name": "windows 2008 test team"
    },
    {
      "success": true,
      "message": "Assigning Tag: category:'environment' name:'test'",
      "href": "https://hostname/api/security_groups/30",
      "tag_category": "environment",
      "tag_name": "test"
    }
  ]
}
```
