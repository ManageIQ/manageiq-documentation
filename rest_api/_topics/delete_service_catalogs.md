#### Deleting Multiple Service Catalogs

##### Request:

    POST /api/service_catalogs

``` json
{
  "action" : "delete",
  "resources" : [
    { "href" : "https://hostname/api/service_catalogs/8"  },
    { "href" : "https://hostname/api/service_catalogs/9"  },
    { "href" : "https://hostname/api/service_catalogs/10" }
  ]
}
```

##### Response:

``` json
{
  "results": [
    {
      "success": true,
      "message": "service_catalogs id: 8 deleting",
      "href": "https://hostname/api/service_catalogs/8"
    },
    {
      "success": true,
      "message": "service_catalogs id: 9 deleting",
      "href": "https://hostname/api/service_catalogs/9"
    },
    {
      "success": true,
      "message": "service_catalogs id: 10 deleting",
      "href": "https://hostname/api/service_catalogs/10"
    }
  ]
}
```
