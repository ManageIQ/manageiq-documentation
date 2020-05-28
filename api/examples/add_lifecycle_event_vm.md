---
---

### Add Lifecycle Event to VM

#### Request:

    POST /api/vms/1921

``` json
{
  "action" : "add_lifecycle_event",
  "resource" : {
    "event" : "event_name",
    "status" : "event_status",
    "message" : "Message about the event",
    "created_by" : "user_name"
  }
}
```

#### Response:

``` json
{
  "success": true,
  "message": "VM id:1921 name:'aab_demo_vm' adding lifecycle event=event_name message=Message about the event",
  "href": "http://localhost:3000/api/vms/1921"
}
```
