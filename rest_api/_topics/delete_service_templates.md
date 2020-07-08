#### Deleting Multiple Service Templates

##### Request:

    POST /api/service_templates

``` json
{
  "action" : "delete",
  "resources" : [
    { "href" : "https://hostname/api/service_templates/4" },
    { "href" : "https://hostname/api/service_templates/5" }
  ]
}
```

##### Response:

``` json
{
  "results": [
    {
      "success": true,
      "message": "service_templates id: 4 deleting",
      "href": "https://hostname/api/service_templates/4"
    },
    {
      "success": true,
      "message": "service_templates id: 5 deleting",
      "href": "https://hostname/api/service_templates/5"
    }
  ]
}
```
