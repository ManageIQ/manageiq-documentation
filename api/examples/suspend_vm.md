---
---

### Suspend a VM

#### Request:

    POST /api/vms/1921

``` json
{
  "action": "suspend"
}
```

#### Response:

``` json
{
  "success": true,
  "message": "VM id:1921 name:'aab_demo_vm' suspending",
  "task_id": "620",
  "task_href": "http://localhost:3000/api/tasks/620",
  "href": "http://localhost:3000/api/vms/1921"
}
```
