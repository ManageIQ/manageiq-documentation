#### Unassigning Tags on Flavors

##### Request:

    POST /api/flavors/223/tags

``` json
{
  "action" : "unassign",
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
      "message": "Unassigning Tag: category:'owner' name:'production linux team'",
      "href": "https://hostname/api/flavors/223",
      "tag_category": "owner",
      "tag_name": "production linux team"
    },
    {
      "success": true,
      "message": "Unassigning Tag: category:'owner' name:'gold'",
      "href": "https://hostname/api/flavors/223",
      "tag_category": "service level",
      "tag_name": "gold"
    }
  ]
}
```
