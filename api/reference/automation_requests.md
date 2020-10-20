---
---

## Automation Requests

Automation requests are made available via the following entrypoint:

``` data
/api/automation_requests
```

  - [Creating Requests](#creating-requests)

  - [Editing Requests](#editing-requests)

  - [Approving or Denying Requests](#approving-denying-requests)

  - [Monitoring Requests](#monitoring-requests)

  - [Editing Request Tasks](#editing-request-tasks)

### Creating Requests

Either by specifying a *create* action or by posting the automation
request directly to **/api/automation\_requests**.

As an example:

``` json
{
  "uri_parts" : {
    "namespace" : "System",
    "class"     : "Request",
    "instance"  : "InspectME",
    "message"   : "create"
  },
  "parameters" : {
    "var1" : "value 1",
    "var2" : "value 2",
    "minimum_memory" : 2048
  },
  "requester" : {
    "auto_approve" : true
  }
}
```

### Editing Requests

Updating requests can be performed by posting an *edit* action as
follows:

``` data
POST /api/automation_requests/11
```

``` json
{
  "action" : "edit",
  "resource" : {
    "options" : {
      "attrs" : {
        "var1" : "updated value1",
        "var2" : "updated value2",
        "minimum_memory" : 4096
      }
    }
  }
}
```

Response:

``` json
{
  "href": "http://localhost:3000/api/automation_requests/11",
  "id": "11",
  "options": {
    "message": "create",
    "namespace": "System",
    "class_name": "Request",
    "instance_name": "InspectME",
    "user_id": "1",
    "attrs": {
      "var1" : "updated value1",
      "var2" : "updated value2",
      "minimum_memory" : 4096
    }
  },
  "tenant_id": "1",
  "approval_state": "approved",
  "status": "Ok",
  "request_type": "automation",
  "description": "Automation Task",
  "type": "AutomationRequest",
  "created_on": "2018-01-08T13:48:00Z",
  "updated_on": "2018-01-08T13:56:15Z",
  "requester_id": "1",
  "requester_name": "Administrator",
  "request_state": "pending",
  "message": "Automation Request - Request Created",
  "userid": "admin",
  "process": true
}
```

### Approving or Denying Requests

If an automation request is not auto approved, it can be approved or
denied via the actions *approve* and *deny* on the automation request
resource.

#### Approving a Request

``` data
POST /api/automation_requests/:id
```

``` json
{
  "action" : "approve",
  "reason" : "reason for approval"
}
```

#### Denying a Request

``` data
POST /api/automation_requests/:id
```

``` json
{
  "action" : "deny",
  "reason" : "reason for denial"
}
```

### Monitoring Requests

Once an automation request is created, the response will be the
queryable automation request itself, i.e.
**/api/automation\_request/:id**

#### Response:

``` json
{
  "results": [
    {
      "id": "10",
      "description": "Automation Task",
      "approval_state": "approved",
      "type": "AutomationRequest",
      "created_on": "2015-04-14T18:12:12Z",
      "updated_on": "2015-04-14T18:12:12Z",
      "requester_id": "1",
      "requester_name": "Administrator",
      "request_type": "automation",
      "request_state": "pending",
      "status": "Ok",
      "options": {
        "message": "create",
        "namespace": "System",
        "class_name": "Request",
        "instance_name": "InspectME",
        "user_id": "1",
        "attrs": {
          "var1": "value 1",
          "var2": "value 2",
          "minimum_memory": 2048,
          "userid": "admin"
        }
      },
      "userid": "admin"
    }
  ]
}
```

In the above example, the request could be queried periodically until
the **request\_state** reaches the **finished** state.

**Note:**

The request tasks of an automation request can also be queried by expanding the request\_tasks subcollection as follows:

    GET /api/automation_requests/:id?expand=request_tasks

or by fetching them directly as follows:

    GET /api/automation_requests/:id/request_tasks?expand=resources

### Editing Request Tasks

Request tasks for Automation Requests can be updated as follows:

    POST /api/automation_requests/:id/request_tasks/:request_task_id

``` json
{
  "action" : "edit",
  "resource" : {
    "options" : {
      "request_param_a" : "value_a",
      "request_param_b" : "value_b"
    }
  }
}
```
