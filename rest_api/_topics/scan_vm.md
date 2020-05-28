#### Scanning a Virtual Machine

##### Request:

    POST /api/vms/1922

``` json
{
  "action": "scan"
}
```

##### Response:

``` json
{
  "success": true,
  "message": "VM id:1922 name:'aab_test_vm' scanning",
  "task_id": 618,
  "task_href": "https://hostname/api/tasks/618",
  "href": "https://hostname/api/vms/1922"
}
```

Optionally, to query the status of the scan:

##### Request:

    GET /api/tasks/618

##### Response:

``` json
{
  "href": "https://hostname/api/tasks/618",
  "id": 618,
  "name": "VM id:1922 name:'aab_test_vm' scanning",
  "state": "Finished",
  "status": "Ok",
  "message": "Task completed successfully",
  "userid": "admin",
  "created_on": "2015-05-05T19:37:32Z",
  "updated_on": "2015-05-05T19:37:38Z"
}
```
