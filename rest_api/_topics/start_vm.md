#### Starting a Virtual Machine

##### Request:

    POST /api/vms/1921

``` json
{
  "action": "start"
}
```

##### Response:

``` json
{
  "success": true,
  "message": "VM id:1921 name:'aab_demo_vm' starting",
  "task_id": 610,
  "task_href": "https://hostname/api/tasks/610",
  "href": "https://hostname/api/vms/1921"
}
```

#### Querying Task Progress

##### Request:

    GET /api/tasks/620

##### Response:

``` json
{
  "href": "https://hostname/api/tasks/610",
  "id": 610,
  "name": "VM id:1921 name:'aab_demo_vm' starting",
  "state": "Queued",
  "status": "Ok",
  "message": "Queued the action: [VM id:1921 name:'aab_demo_vm' starting] being run for user: [admin]",
  "userid": "admin",
  "created_on": "2015-05-05T15:58:08Z",
  "updated_on": "2015-05-05T15:58:08Z"
}
```
