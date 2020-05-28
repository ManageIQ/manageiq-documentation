---
---

## Tasks

Management of Tasks is available via the following endpoint:

``` data
/api/tasks
```

### Querying Tasks

Querying all Takss:

    GET /api/tasks

Getting details of a specific Task:

    GET /api/tasks/:id

The following actions are available on tasks:

  - [Deleting Tasks](#deleting-tasks)

### Deleting Tasks

Tasks can be deleted via either the **delete** POST action or the DELETE
HTTP method.

    POST /api/tasks/101

``` json
{
  "action" : "delete"
}
```

or simply:

    DELETE /api/tasks/101

Deleting multiple Tasks can be done as follows:

    POST /api/tasks

``` json
{
  "action" : "delete",
  "resources" : [
    { "href" : "http://localhost:3000/api/tasks/101" },
    { "href" : "http://localhost:3000/api/tasks/102" },
    ...
  ]
}
```
