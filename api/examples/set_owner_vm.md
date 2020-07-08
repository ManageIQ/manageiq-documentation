---
---

### Set owner of a VM

#### Request:

    POST /api/vms/1921

``` json
{
  "action": "set_owner",
  "resource" : {
    "owner" : "admin"
  }
}
```

#### Response:

``` json
{
  "success": true,
  "message": "VM id:1921 name:'aab_demo_vm' setting owner to 'admin'",
  "href": "http://localhost:3000/api/vms/1921"
}
```
