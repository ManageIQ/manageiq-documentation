#### Editing a Service Catalog

##### Request:

    POST /api/service_catalog/7

``` json
{
   "action" : "edit",
   "resource" : {
      "description" : "Updated Description of the Seventh Service Catalog"
   }
}
```

##### Response:

``` json
{
  "href": "https://hostname/api/service_catalogs/7",
  "id": 7,
  "name": "Sample Service Catalog",
  "description": "Updated Description of the Seventh Service Catalog",
  "service_templates": {
    "count": 1,
    "resources": [
      {
        "href": "https://hostname/api/service_catalogs/7/service_templates/3"
      }
    ]
  }
}
```
