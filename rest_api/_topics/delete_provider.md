#### Deleting a Provider

##### Deleting a Single Provider

#### Request:

    DELETE /api/provider/105

Or via the delete action as follows:

    POST /api/provider/105

``` json
{
  "action" : "delete"
}
```

#### Response:

``` json
{
  "success": true,
  "message": "Provider id:106 name:'rhevm102' deleting",
  "task_id": 625,
  "task_href": "https://hostname/api/tasks/625",
  "href": "https://hostname/api/providers/106"
}
```

**Note:**

Delete actions are done asynchronously as it can take a while to
complete. The delete task can be queried as follows:

#### Request:

    GET /api/tasks/625

#### Response:

``` json
{
  "href": "https://hostname/api/tasks/625",
  "id": 625,
  "name": "Provider id:106 name:'rhevm102' deleting",
  "state": "Finished",
  "status": "Ok",
  "message": "Task completed successfully",
  "userid": "admin",
  "created_on": "2015-05-06T14:02:26Z",
  "updated_on": "2015-05-06T14:02:32Z"
}
```

##### Deleting Multiple Providers

#### Request:

    POST /api/providers

``` json
{
  "action" : "delete",
  "resources" : [
    { "href" : "https://hostname/api/providers/107" },
    { "href" : "https://hostname/api/providers/108" }
  ]
}
```

#### Response:

``` json
{
  "results": [
    {
      "success": true,
      "message": "Provider id:107 name:'rhevm102' deleting",
      "task_id": 626,
      "task_href": "https://hostname/api/tasks/626",
      "href": "https://hostname/api/providers/107"
    },
    {
      "success": true,
      "message": "Provider id:108 name:'rhevm103' deleting",
      "task_id": 627,
      "task_href": "https://hostname/api/tasks/627",
      "href": "https://hostname/api/providers/108"
    }
  ]
}
```
