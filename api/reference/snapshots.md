---
---

## Snapshot Management

Management of snapshots is provided for virtual machines and instances
via the snapshots subcollection:

``` data
/api/vms/:id/snapshots
```

``` data
/api/instances/:id/snapshots
```

### Snapshot Actions

The following snapshot actions are available for the supported
resources:

| Snapshot Action | Vms | Instances |
| --------------- | --- | --------- |
| read            | X   | X         |
| create          | X   | X         |
| revert          | X   |           |
| delete          | X   | X         |

  - [Querying Snapshots](#query-snapshots)

  - [Creating Snapshots](#create-snapshots)

  - [Reverting Snapshots](#revert-snapshots)

  - [Deleting Snapshots](#delete-snapshots)

### Querying Snapshots

Snapshots of machines are queried via the subcollection of vms and
instances as follows:

Querying all snapshots of a VM:

``` data
GET /api/vms/:id/snapshots
```

Querying all snapshots of an Instance:

``` data
GET /api/instances/:id/snapshots
```

Filtering, sorting and paging on the subcollection as mentioned on the
[Querying](../overview/query.html) page.

For example:

``` data
GET /api/vms/11/snapshots?expand=resources&filter[]=name=test*
```

One can also fetch a single snapshot by id:

``` data
GET /api/vms/:id/snapshots/:snapshot_id
```

``` data
GET /api/instances/:id/snapshots/:snapshot_id
```

### Creating Snapshots

Creating snapshots on Vms and Instances is done by posting the request
to the snapshots subcollection.

``` data
POST /api/vms/:id/snapshots
```

``` data
POST /api/instances/:id/snapshots
```

``` json
{
  "name" : "name_of_new_snapshot",
  "description" : "Description of new Snapshot",
  "memory" : false
}
```

In the above example, only *name* is required. *memory* can be set to
true to have the snapshot include physical memory.

### Reverting Snapshots

Reverting snapshots is only available for Vms.

``` data
POST /api/vms/:id/snapshots/:snapshot_id
```

``` json
{
  "action" : "revert"
}
```

### Deleting Snapshots

Individual snapshots of Vms and Instances can be deleted via the DELETE
method as follows:

``` data
DELETE /api/vms/:id/snapshots/:snapshot_id
```

``` data
DELETE /api/instances/:id/snapshots/:snapshot_id
```

As well as the *delete* POST action as follows for VMs:

``` data
POST /api/vms/:id/snapshots/:snapshot_id
```

or instances:

``` data
POST /api/instances/:id/snapshots/:snapshot_id
```

``` json
{
  "action" : "delete"
}
```

Snapshots can also be deleted in bulk via the *delete* action on the
snapshots subcollection as follows:

``` data
POST /api/vms/11/snapshots
```

``` json
{
  "action" : "delete",
  "resources" : [
    { "href" : "http://localhost:3000/api/vms/11/snapshots/3" },
    { "href" : "http://localhost:3000/api/vms/11/snapshots/4" },
    { "href" : "http://localhost:3000/api/vms/11/snapshots/5" }
  ]
}
```

As well as for instances:

``` data
POST /api/instances/201/snapshots
```

``` json
{
  "action" : "delete",
  "resources" : [
    { "href" : "http://localhost:3000/api/instances/201/snapshots/7" },
    { "href" : "http://localhost:3000/api/instances/201/snapshots/8" }
  ]
}
```
