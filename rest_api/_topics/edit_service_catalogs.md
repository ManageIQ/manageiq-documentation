#### Editing Multiple Service Catalogs

##### Request:

    POST /api/service_catalogs

``` json
{
   "action" : "edit",
   "resources" : [
     {
       "href" : "https://hostname/api/service_catalogs/3",
       "description" : "Updated Description for Third Service Catalog"
     },
     {
       "href" : "https://hostname/api/service_catalogs/6",
       "description" : "Updated Description for Sixth Service Catalog"
     }
   ]
}
```

##### Response:

``` json
{
  "results": [
    {
      "id": 3,
      "name": "Service Catalog B Added from REST API",
      "description": "Updated Description for Third Service Catalog"
    },
    {
      "id": 6,
      "name": "Service Catalog E Added from REST API",
      "description": "Updated Description for Sixth Service Catalog"
    }
  ]
}
```
