#### Stopping a Virtual Machine

##### Request:

    POST /api/vms/1921

``` json
{
  "action": "stop"
}
```

##### Response:

``` json
{
  "success": true,
  "message": "VM id:1921 name:'aab_demo_vm' stopping",
  "task_id": 619,
  "task_href": "https://hostname/api/tasks/619",
  "href": "https://hostname/api/vms/1921"
}
```
