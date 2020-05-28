---
---

### Stop a VM

#### Request:

    POST /api/vms/1921

``` json
{
  "action": "stop"
}
```

#### Response:

``` json
{
  "success": true,
  "message": "VM id:1921 name:'aab_demo_vm' stopping",
  "task_id": "619",
  "task_href": "http://localhost:3000/api/tasks/619",
  "href": "http://localhost:3000/api/vms/1921"
}
```
