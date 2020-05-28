#### Assigning Tags to Flavors

##### Request:

    POST /api/flavors/223/tags

``` json
{
  "action" : "assign",
  "resources" : [
    { "category" : "owner", "name" : "production linux team" },
    { "category" : "service level", "name" : "gold" }
  ]
}
```

##### Response:

``` json
{
  "results": [
    {
      "success": true,
      "message": "Assigning Tag: category:'owner' name:'production linux team'",
      "href": "https://hostname/api/flavors/223",
      "tag_category": "owner",
      "tag_name": "production linux team"
    },
    {
      "success": true,
      "message": "Assigning Tag: category:'service level' name:'gold'",
      "href": "https://hostname/api/flavors/223",
      "tag_category": "service level",
      "tag_name": "gold"
    }
  ]
}
```

#### Assigning Tags by Name to Flavors

##### Request:

    POST /api/flavors/223/tags

``` json
{
  "action" : "assign",
  "resources" : [
    { "name" : "owner/production linux team" },
    { "name" : "service level/gold" }
  ]
}
```

##### Response:

``` json
{
  "results": [
    {
      "success": true,
      "message": "Assigning Tag: category:'owner' name:'production linux team'",
      "href": "https://hostname/api/flavors/223",
      "tag_category": "owner",
      "tag_name": "production linux team"
    },
    {
      "success": true,
      "message": "Assigning Tag: category:'service level' name:'gold'",
      "href": "https://hostname/api/flavors/223",
      "tag_category": "service level",
      "tag_name": "gold"
    }
  ]
}
```
