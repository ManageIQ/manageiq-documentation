#### Adding Multiple Service Catalogs

##### Request:

    POST /api/service_catalogs

``` json
{
   "action" : "create",
   "resources" : [
      {
        "name" : "First Sample Service Catalog",
        "description" : "Description of First Sample Service Catalog",
        "service_templates" : [
          { "href" : "https://hostname/api/service_templates/1" },
          { "href" : "https://hostname/api/service_templates/2" }
        ]
      },
      {
        "name" : "Second Sample Service Catalog",
        "description" : "Description of Second Sample Service Catalog",
        "service_templates" : [
          { "href" : "https://hostname/api/service_templates/3" },
          { "href" : "https://hostname/api/service_templates/4" }
        ]
      },
      {
        "name" : "Third Sample Service Catalog",
        "description" : "Description of Third Sample Service Catalog",
        "service_templates" : [
          { "href" : "https://hostname/api/service_templates/5" },
          { "href" : "https://hostname/api/service_templates/6" }
        ]
      }
  ]
}
```

##### Response:

``` json
{
  "results": [
    {
      "id": 8,
      "name": "First Sample Service Catalog",
      "description": "Description of First Sample Service Catalog"
    },
    {
      "id": 9,
      "name": "Second Sample Service Catalog",
      "description": "Description of Second Sample Service Catalog"
    },
    {
      "id": 10,
      "name": "Third Sample Service Catalog",
      "description": "Description of Third Sample Service Catalog"
    }
  ]
}
```
