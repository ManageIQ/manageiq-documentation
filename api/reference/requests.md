---
---

## Request Support

Support for Requests in the API is provided and implemented by specific
request types as listed here:

| API Collection            | Request Type                                       |
| ------------------------- | -------------------------------------------------- |
| /api/automation\_requests | [Automation Requests](automation_requests.html)    |
| /api/provision\_requests  | [Provision Requests](provision_requests.html)      |
| /api/service\_requests    | [Service Requests](services.html#service-requests) |

A lower level support for creating and updating requests is also
provided by the following:

``` data
/api/requests
```

  - [Creating Requests](#creating-requests)

  - [Querying Requests](#querying-requests)

  - [Editing Requests](#editing-requests)

  - [Approving or Denying Requests](#approving-denying-requests)

  - [Request Types](#request-types)

### Creating Requests

Either by specifying a *create* action or by posting the request
directly to **/api/requests**.

As an example:

``` data
POST /api/requests
```

``` json
{
  "options" : {
    "request_type" : "service_reconfigure",
    "src_id" : "4",
    "service_param1" : "updated_value1",
    "service_param2" : "updated_value2"
  },
  "requester" : {
    "user_name" : "admin"
  },
  "auto_approve" : true | false
}
```

Response:

``` json
{
  "results": [
    {
      "id": "97",
      "description": "Service Reconfigure for: svc4",
      "approval_state": "pending_approval",
      "type": "ServiceReconfigureRequest",
      "created_on": "2016-11-10T21:39:08Z",
      "updated_on": "2016-11-10T21:39:08Z",
      "requester_id": "1",
      "requester_name": "Administrator",
      "request_type": "service_reconfigure",
      "request_state": "pending",
      "message": "Service Reconfigure - Request Created",
      "status": "Ok",
      "options": {
        "request_type": "service_reconfigure",
        "src_id": "4",
        "service_param1": "updated_value1",
        "service_param2": "updated_value2"
      },
      "userid": "admin",
      "source_id": "4",
      "source_type": "Service",
      "tenant_id": "1",
      "process": true
    }
  ]
}
```

### Querying Requests

Once a request is created, the response result as shown above will
include the id of request itself.

In the above example, the request could be queried periodically until
the **request\_state** reaches the **finished** state.

    GET /api/requests/97

**NOTE**: The requests tasks of a request can also be queried by
expanding the request\_tasks subcollection:

    GET /api/requests/:id?expand=request_tasks

### Editing Requests

Updating requests is provided by specifying an *edit* action as follows:

``` data
POST /api/requests/97
```

``` json
{
  "action" : "edit",
  "resource" : {
    "options" : {
      "service_param1" : "new_updated_value1",
      "service_param2" : "new_updated_value2"
    },
    "requester" : {
      "user_name" : "admin"
    }
  }
}
```

Response:

``` json
{
  "href": "http://localhost:3000/api/requests/97",
  "id": "97",
  "options": {
    "request_type": "service_reconfigure",
    "src_id": "4",
    "service_param1": "new_updated_value1",
    "service_param2": "new_updated_value2"
  },
  "description": "Service Reconfigure for: svc3",
  "approval_state": "pending_approval",
  "type": "ServiceReconfigureRequest",
  "created_on": "2016-11-10T21:39:08Z",
  "updated_on": "2016-11-10T22:11:03Z",
  "requester_id": "1",
  "requester_name": "Administrator",
  "request_type": "service_reconfigure",
  "request_state": "pending",
  "message": "Service Reconfigure - Request Created",
  "status": "Ok",
  "userid": "admin",
  "source_id": "4",
  "source_type": "Service",
  "tenant_id": "1",
  "process": true
}
```

### Approving or Denying Requests

If a request is not auto approved, it can be approved or denied via the
actions *approve* and *deny* on the request resource.

#### Approving a Request

``` data
POST /api/requests/:id
```

``` json
{
  "action" : "approve",
  "reason" : "reason for approval"
}
```

#### Denying a Request

``` data
POST /api/requests/:id
```

``` json
{
  "action" : "deny",
  "reason" : "reason for denial"
}
```

### Request Types

The details for creating each type of request using the lower level API,
including validation of *request\_type* and necessary options is driven
by the model.

The basic structure for creating the request is as follows:

``` json
{
  "options" : {
    "request_type" : "...",
    ...
  },
  "requester" : {
    "user_name" : "..."
  },
  "auto_approve" : true | false
}
```

The list of supported *request\_type* values as of this writing is shown
here below:

| request\_type           | Description         |
| ----------------------- | ------------------- |
| automation              | Automation          |
| clone\_to\_service      | Service Provision   |
| clone\_to\_template     | VM Publish          |
| clone\_to\_vm           | VM Clone            |
| host\_pxe\_install      | Host Provision      |
| provision\_via\_foreman | Foreman Provision   |
| service\_reconfigure    | Service Reconfigure |
| template                | VM Provision        |
| vm\_migrate             | VM Migrate          |
| vm\_reconfigure         | VM Reconfigure      |
