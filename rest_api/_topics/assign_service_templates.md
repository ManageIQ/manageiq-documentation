#### Assigning Service Templates to Service Catalogs

##### Request:

    POST /api/service_catalogs/6/service_templates

``` json
{
  "action" : "assign",
  "resources" : [
    { "href" : "https://hostname/api/service_templates/5" },
    { "href" : "https://hostname/api/service_templates/1" }
  ]
}
```

##### Response:

``` json
{
  "results": [
    {
      "success": true,
      "message": "Assigning Service Template id:5 name:'template5'",
      "service_template_id": 5,
      "service_template_href": "https://hostname/api/service_templates/5",
      "href": "https://hostname/api/service_catalogs/6"
    },
    {
      "success": false,
      "message": "Service Template 1 is currently assigned to Service Catalog 3",
      "service_template_id": 1,
      "service_template_href": "https://hostname/api/service_templates/1",
      "href": "https://hostname/api/service_catalogs/6"
    }
  ]
}
```
