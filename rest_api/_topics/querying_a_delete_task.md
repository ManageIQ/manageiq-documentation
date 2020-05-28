#### Querying a Delete Task

##### Request:

    GET /api/tasks/625

##### Response:

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
