#### Unassigning Service Templates from a Service Catalog

##### Request:

    POST /api/service_catalogs/6/service_templates

``` json
{
  "action" : "unassign",
  "resources" : [
    { "href" : "https://hostname/api/service_templates/1" },
    { "href" : "https://hostname/api/service_templates/5" },
    { "href" : "https://hostname/api/service_templates/8" }
  ]
}
```

##### Response:

``` json
{
  "results": [
    {
      "success": false,
      "message": "Service Template 1 is not currently assigned to Service Catalog 3",
      "service_template_id": 1,
      "service_template_href": "https://hostname/api/service_templates/1",
      "href": "https://hostname/api/service_catalogs/6"
    },
    {
      "success": true,
      "message": "Unassigning Service Template id:5 name:'template5'",
      "service_template_id": 5,
      "service_template_href": "https://hostname/api/service_templates/5",
      "href": "https://hostname/api/service_catalogs/6"
    },
    {
      "success": false,
      "message": "Couldn't find ServiceTemplate with id=8",
      "href": "https://hostname/api/service_catalogs/6"
    }
  ]
}
```
