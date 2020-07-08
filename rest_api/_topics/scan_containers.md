#### Scanning Containers

Scan containers using SmartState Analysis.

<div class="note">

  - Scanning containers requires enabling the SmartProxy server role.
    See
    [Servers](https://access.redhat.com/documentation/en-us/red_hat_cloudforms/4.6/html-single/general_configuration/#servers)
    in the *General Configuration Guide* for information on server
    roles.

  - Attached OpenSCAP policies do not affect responses.

</div>

##### Request:

    POST /api/container_images/440

``` json
{
  "action": "scan"
}
```

##### Response:

``` json
{
"success": true,
"message": "ContainerImage id:440 name:'cbud_test_cont' scanning",
"task_id": "2133",
"task_href": "https://<hostname>/api/tasks/2133",
"href": "https://<hostname>/api/container_images/440"
}
```
