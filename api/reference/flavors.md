---
---

## Flavor Management

Management of Flavors is available via the following endpoint:

``` data
/api/flavors
```

### Querying Flavors

Querying all available Flavors:

    GET /api/flavors

Getting details on a specific Flavor:

    GET /api/flavors/:id

Querying the Flavors for a specific Provider:

    GET /api/providers/:id/flavors

Getting details on a specific Flavor of a Provider:

    GET /api/providers/:id/flavors/:flavor_id

### Managing Flavors

The following actions are available on Flavors of Providers:

| Action                    | Description    |
| ------------------------- | -------------- |
| [create](#create-flavors) | Create Flavors |
| [delete](#delete-flavors) | Delete Flavors |

### Create Flavors

Flavors can be created directly for a Provider as follows:

``` data
POST /api/providers/:id/flavors
```

``` json
{
  "name" : "base-system",
  "cpu_cores" : 2,
  "memory" :  4096000000,
  "root_disk_size" : 16384000000
}
```

### Delete Flavors

Flavors of a Provider can be deleted via the *delete* action:

``` data
POST /api/providers/:id/flavors/:flavor_id
```

``` json
{
  "action" : "delete"
}
```

Multiple Flavors can also be deleted in a single request as follows:

``` data
POST /api/providers/:id/flavors
```

``` json
{
  "action" : "delete",
  "resources" : [
    { "href" : "http://localhost:3000/api/flavors/6" },
    { "id" : "7" }
  ]
}
```

Single Flavors can also be deleted with the DELETE HTTP method as
follows:

``` data
DELETE /api/providers/:id/flavors/:flavor_id
```
