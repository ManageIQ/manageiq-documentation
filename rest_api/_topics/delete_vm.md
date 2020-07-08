#### Deleting Virtual Machines

##### Deleting a Single Virtual Machine

#### Request:

    DELETE /api/vms/334

On success, the virtual machine targeted for deletion asynchronously and
no response content with an HTTP status code of 204 are returned.

##### Deleting Multiple Virtual Machines

#### Request:

    DELETE /api/vms

``` json
{
  "action" : "delete",
  "resources" : [
    { "href" : "https://hostname/api/vms/348" },
    { "href" : "https://hostname/api/vms/349" },
    { "href" : "https://hostname/api/vms/3" }
  ]
}
```

#### Response:

``` json
{
  "results": [
    {
      "success": true,
      "message": "VM id:348 name:'aab-temp1' deleting",
      "task_id": 616,
      "task_href": "https://hostname/api/tasks/616",
      "href": "https://hostname/api/vms/348"
    },
    {
      "success": true,
      "message": "VM id:349 name:'aab-temp2' deleting",
      "task_id": 617,
      "task_href": "https://hostname/api/tasks/617",
      "href": "https://hostname/api/vms/349"
    }
  ]
}
```

Optionally, monitor the asynchronous virtual machine deletion by
accessing the related task as follows:

#### Request:

    GET /api/tasks/616

#### Response:

``` json
{
  "href": "https://hostname/api/tasks/616",
  "id": 616,
  "name": "VM id:348 name:'aab-temp1' deleting",
  "state": "Finished",
  "status": "Ok",
  "message": "Task completed successfully",
  "userid": "admin",
  "created_on": "2015-05-05T19:33:35Z",
  "updated_on": "2015-05-05T19:33:40Z"
}
```
