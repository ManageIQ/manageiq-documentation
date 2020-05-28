---
---

## Cloud Volumes

Management of Cloud Volumes is provided via the following collection:

``` data
/api/cloud_volumes
```

The following actions are available on cloud\_volumes:

  - [Querying Cloud Volumes](#querying-cloud-volumes)

  - [Deleting Cloud Volumes](#deleting-cloud-volumes)

### Querying Cloud Volumes

Querying all cloud volumes in the system is simply:

    GET /api/cloud_volumes

And getting details of a specific Cloud Volume is as follows:

    GET /api/cloud_volumes/:id

### Deleting Cloud Volumes

Cloud Volumes can be deleted via either the **delete** POST action or
via the DELETE HTTP method.

    POST /api/cloud_volumes/101

``` json
{
  "action" : "delete"
}
```

or simply:

    DELETE /api/cloud_volumes/101

Deleting multiple Cloud Volumes can be done as follows:

    POST /api/cloud_volumes

``` json
{
  "action" : "delete",
  "resources" : [
    { "href" : "http://localhost:3000/api/cloud_volumes/101" },
    { "href" : "http://localhost:3000/api/cloud_volumes/102" },
    ...
  ]
}
```
