#### Deleting Services

##### Request:

    POST /api/services

``` json
{
  "action" : "delete",
  "resources" : [
    { "href" : "https://hostname/api/services/97" },
    { "href" : "https://hostname/api/services/98" },
    { "href" : "https://hostname/api/services/99" }
  ]
}
```

##### Response:

``` json
{
  "results": [
    {
      "success": true,
      "message": "services id: 97 deleting",
      "href": "https://hostname/api/services/97"
    },
    {
      "success": true,
      "message": "services id: 98 deleting",
      "href": "https://hostname/api/services/98"
    },
    {
      "success": true,
      "message": "services id: 99 deleting",
      "href": "https://hostname/api/services/99"
    }
  ]
}
```
