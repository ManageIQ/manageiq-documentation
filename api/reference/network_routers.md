---
---

## Network Routers

Management of Network Routers is provided via the following collection:

``` data
/api/network_routers
```

The following actions are available on Network Routers:

  - [Querying Network Routers](#querying-network-routers)

  - [Deleting Network Routers](#deleting-network-routers)

### Querying Network Routers

Querying all Network Routers in the system is simply:

    GET /api/network_routers

Getting details on a specific Network Router:

    GET /api/network_routers/:id

### Deleting Network Routers

Network Routers can be deleted via either the **delete** POST action or
via the DELETE HTTP method.

#### Request:

    POST /api/network_routers/101

``` json
{
  "action" : "delete"
}
```

#### Response:

``` json
{
  "success" : true,
  "message" : "Deleting Networking Router id:101 name: 'test_network_router'",
  "task_id" : "33",
  "task_href" : "http://localhost:3000/api/tasks/33"
}
```

or simply:

    DELETE /api/network_routers/101

Deleting multiple Network Routers can be done as follows:

    POST /api/network_routers

``` json
{
  "action" : "delete",
  "resources" : [
    { "href" : "http://localhost:3000/api/network_routers/101" },
    { "href" : "http://localhost:3000/api/network_routers/102" },
    ...
  ]
}
```
