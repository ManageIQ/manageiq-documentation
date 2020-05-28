---
---

### Refresh Provider

#### Request:

    POST /api/providers/105

``` json
{
  "action" : "refresh"
}
```

#### Response:

``` json
{
  "success": true,
  "message": "Provider id:105 name:'sample_provider' refreshing",
  "href": "http://localhost:3000/api/providers/105",
  "task_id" : "23",
  "task_href" : "http://localhost:3000/api/tasks/23",
  "tasks" : [
    { "id" : "23", "href" : "http://localhost:3000/api/tasks/23"},
    { "id" : "24", "href" : "http://localhost:3000/api/tasks/24"}
  ]
}
```

*Note:* In the above example a multi-manager provider was refreshed and
in the response, a task id and href pair is returned for each of the
provider managers. This allows the caller to check the status of each
manager refresh for completion.
