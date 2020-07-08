#### REST API Entry Point

The REST API is available via the `/api` URL prefix. It is accessed on
the {{ site.data.product.title }} server as follows:

    https://<host_fqdn>/api

`Response`

``` json
{
  "name" : "API",
  "description" : "REST API",
  "version" : "2.0.0",
  "versions" : [
    {
      "name" : "2.0.0",
      "href" : "https://hostname/api/v2.0.0"
    },
  ]
  "collections" : [
    {
      "name" : "automation_requests",
      "href" : "https://hostname/api/automation_requests",
      "description" : "Automation Requests"
    },
    {
      "name" : "availability_zones",
      "href" : "https://hostname/api/availability_zones",
      "description" : "Availability Zones"
    },
    ...
  ]
}
```

  - `version` is the current API version, accessible via either of the
    following:

  - /api/

  - /api/v2.0.0/

  - `versions` lists all the earlier API versions that are still exposed
    via their respective entry points:

  - /api/vVersion/
