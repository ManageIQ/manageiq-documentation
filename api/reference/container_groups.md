---
---

## Container Group Management

Management of Container Groups adds support for the following actions:

| Action            | Description                          |
| ----------------- | ------------------------------------ |
| check\_compliance | Check compliance of a Container Group |
| logs              | Fetch logs for a Container Group     |

  - [Querying Container Groups](#querying-container-groups)

  - [Checking Compliance of a Container Group](#checking-compliance-of-a-container-group)

  - [Fetching Logs of a Container Group](#fetching-logs-of-a-container-group)

### Querying Container Groups

Container Groups are queried via the primary collection URL:

``` data
/api/container_groups
```

Filtering, sorting and paging as mentioned on the
[Querying](../overview/query.html) page.

A specific Container Group can be queried via:

``` data
/api/container_groups/:id
```

### Checking Compliance of a Container Group

Compliance of a Container Group can be checked by posting the following action:

    POST /api/container_groups/:id

``` json
{
  "action" : "check_compliance"
}
```

Multiple Container Groups can also be checked with a single request:

    POST /api/container_groups

``` json
{
  "action" : "check_compliance",
  "resources" : [
    { "href" : "http://localhost:3000/api/container_groups/101" },
    { "href" : "http://localhost:3000/api/container_groups/102" },
    { "href" : "http://localhost:3000/api/container_groups/103" }
  ]
}
```

### Fetching Logs of a Container Group

Logs for a Container Group can be fetched by posting the following action:

    POST /api/container_groups/:id

``` json
{
  "action" : "logs"
}
```

An optional `tail_lines` parameter can be passed to limit the number of log
lines returned:

    POST /api/container_groups/:id

``` json
{
  "action" : "logs",
  "tail_lines" : 10
}
```

The response includes a `task_id` that can be used to track the progress of
the log fetch:

``` json
{
  "success" : true,
  "message" : "Fetching logs for Container Group id: 101 name: 'test-pod'",
  "task_id" : "123",
  "task_href" : "http://localhost:3000/api/tasks/123"
}
```

The task result can be polled via:

``` data
GET /api/tasks/:id
```

Logs for multiple Container Groups can also be fetched with a single request:

    POST /api/container_groups

``` json
{
  "action" : "logs",
  "resources" : [
    { "href" : "http://localhost:3000/api/container_groups/101" },
    { "href" : "http://localhost:3000/api/container_groups/102" },
    { "href" : "http://localhost:3000/api/container_groups/103" }
  ]
}
```

**Note:**

Container Groups can be referenced by **href** or **id**. The `logs` action is
only available when the Container Group's provider supports log retrieval.
