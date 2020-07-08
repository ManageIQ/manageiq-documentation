#### Unassigning Tags from a Service

##### Request:

    POST /api/services/101/tags

``` json
{
  "action" : "unassign",
  "resources" : [
    { "category" : "department", "name" : "finance" },
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
      "message": "Unassigning Tag: category:'department' name:'finance'",
      "href": "https://hostname/api/services/101",
      "tag_category": "department",
      "tag_name": "finance"
    },
    {
      "success": true,
      "message": "Unassigning Tag: category:'environment' name:'dev'",
      "href": "https://hostname/api/services/101",
      "tag_category": "environment",
      "tag_name": "dev"
    }
  ]
}
```

#### Unassigning a Tag by Name from a Service

##### Request:

    POST /api/services/101/tags

``` json
{
  "action" : "unassign",
  "resources" : [
    { "name" : "/managed/department/finance" }
  ]
}
```

##### Response:

``` json
{
  "results": [
    {
      "success": true,
      "message": "Unassigning Tag: category:'department' name:'finance'",
      "href": "https://hostname/api/services/101",
      "tag_category": "department",
      "tag_name": "finance"
    }
  ]
}
```

#### Unassigning a Tag by Reference from a Service

##### Request:

    POST /api/services/101/tags

``` json
{
  "action" : "unassign",
  "resources" : [
    { "href" : "tags/49" }
  ]
}
```

##### Response:

``` json
{
  "results": [
    {
      "success": true,
      "message": "Unassigning Tag: category:'department' name:'finance'",
      "href": "https://hostname/api/services/101",
      "tag_category": "department",
      "tag_name": "finance",
      "tag_href": "https://hostname/api/tags/49"
    }
  ]
}
```
