#### Adding a Sample Service Catalog

##### Request:

    POST /api/service_catalogs

``` json
{
   "action" : "create",
   "resource" : {
        "name" : "Sample Service Catalog",
        "description" : "Description of Sample Service Catalog",
        "service_templates" : [
          { "href" : "https://hostname/api/service_templates/3" },
          { "href" : "https://hostname/api/service_templates/4" }
        ]
   }
}
```

##### Response:

``` json
{
  "results": [
    {
      "id": 7,
      "name": "Sample Service Catalog",
      "description": "Description of Sample Service Catalog"
    }
  ]
}
```
