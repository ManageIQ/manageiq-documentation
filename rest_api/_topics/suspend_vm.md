#### Suspending a Virtual Machine

##### Request:

    POST /api/vms/1921

``` json
{
  "action": "suspend"
}
```

##### Response:

``` json
{
  "success": true,
  "message": "VM id:1921 name:'aab_demo_vm' suspending",
  "task_id": 620,
  "task_href": "https://hostname/api/tasks/620",
  "href": "https://hostname/api/vms/1921"
}
```
