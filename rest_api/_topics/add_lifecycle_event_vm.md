#### Adding a Lifecycle Event to a Virtual Machine

##### Request:

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

##### Response:

``` json
{
  "success": true,
  "message": "VM id:1921 name:'aab_demo_vm' adding lifecycle event=event_name message=Message about the event",
  "href": "https://hostname/api/vms/1921"
}
```
