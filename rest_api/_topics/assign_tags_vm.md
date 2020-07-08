#### Assigning Tags to a Virtual Machine

##### Request:

    POST /api/vms/101/tags

``` json
{
  "action" : "assign",
  "resources" : [
    { "name" : "/department/finance" },
    { "name" : "/location/ny" }
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
      "href": "https://hostname/api/vms/101",
      "tag_category": "location",
      "tag_name": "ny"
    },
    {
      "success": true,
      "message": "Assigning Tag: category:'department' name:'finance'",
      "href": "https://hostname/api/vms/101",
      "tag_category": "department",
      "tag_name": "finance"
    },
    {
      "success": true,
      "message": "Assigning Tag: category:'environment' name:'dev'",
      "href": "https://hostname/api/vms/101",
      "tag_category": "environment",
      "tag_name": "dev"
    }
  ]
}
```

#### Assigning Tags by Name to a Virtual Machine

##### Request:

    POST /api/vms/101/tags

``` json
{
  "action" : "assign",
  "resources" : [
    { "name" : "/department/finance" },
    { "name" : "/location/ny" }
  ]
}
```

##### Response:

``` json
{
  "results": [
    {
      "success": true,
      "message": "Assigning Tag: category:'department' name:'finance'",
      "href": "https://hostname/api/vms/101",
      "tag_category": "department",
      "tag_name": "finance"
    },
    {
      "success": true,
      "message": "Assigning Tag: category:'location' name:'ny'",
      "href": "https://hostname/api/vms/101",
      "tag_category": "location",
      "tag_name": "ny"
    }
  ]
}
```

#### Assigning Tags by Reference to a Virtual Machine

##### Request:

    POST /api/vms/101/tags

``` json
{
  "action" : "assign",
  "resources" : [
    { "href" : "https://hostname/api/vms/1/tags/49" }
  ]
}
```

##### Response:

``` json
{
  "results": [
    {
      "success": true,
      "message": "Assigning Tag: category:'department' name:'finance'",
      "href": "https://hostname/api/vms/101",
      "tag_category": "department",
      "tag_name": "finance",
      "tag_href": "https://hostname/api/tags/49"
    }
  ]
}
```
