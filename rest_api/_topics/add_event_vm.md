#### Adding an Event to a Virtual Machine

##### Request:

    POST /api/vms/1921

``` json
{
  "action": "add_event",
  "resource" : {
    "event_type" : "BadUserNameSessionEvent",
    "event_message" : "Cannot login user@test.domain"
  }
}
```

##### Response:

``` json
{
  "success": true,
  "message": "Adding Event type=BadUserNameSessionEvent message=Cannot login user@test.domain",
  "href": "https://hostname/api/vms/1921"
}
```
