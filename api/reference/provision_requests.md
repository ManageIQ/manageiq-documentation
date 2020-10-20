---
---

## Provision Requests

Provisioning requests are made available via the following entrypoint.

``` data
/api/provision_requests
```

  - [Creating Requests](#creating-requests)

  - [Editing Requests](#editing-requests)

  - [Approving or Denying Requests](#approving-denying-requests)

  - [Monitoring Requests](#monitoring-requests)

  - [Editing Request Tasks](#editing-request-tasks)

### Creating Requests

Either by specifying a *create* action or by posting the request
directly to **/api/provision\_requests**.

As an example:

``` json
{
  "version" : "1.1",
  "template_fields" : {
    "guid" : "afe6e8a0-89fd-11e3-b6ac-b8e85646e742"
  },
  "vm_fields" : {
    "number_of_cpus" : 1,
    "vm_name" : "aab_test_vm1",
    "vm_memory" : "1024",
    "vlan" : "nic1"
  },
  "requester" : {
    "user_name" : "jdoe",
    "owner_first_name" : "John",
    "owner_last_name" : "Doe",
    "owner_email" : "jdoe@sample.com",
    "auto_approve" : true
  },
  "tags" : {
    "network_location" : "Internal",
    "cc" : "001"
  },
  "additional_values" : {
    "request_id" : "1001"
  },
  "ems_custom_attributes" : { },
  "miq_custom_attributes" : { }
}
```

### Provision Requests Attribute Groups

<table>
<colgroup>
<col style="width: 33%" />
<col style="width: 33%" />
<col style="width: 33%" />
</colgroup>
<thead>
<tr class="header">
<th>Attribute Group</th>
<th>Type</th>
<th>Description</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p>version</p></td>
<td><p>string</p></td>
<td><p>Interface version. Defaults to 1.1</p></td>
</tr>
<tr class="even">
<td><p>template_fields</p></td>
<td><p>hash</p></td>
<td><p>Fields used to find template virtual machine. Provide any or all fields. Supply a guid or ems_guid to protect against matching same-named templates on different Providers within the appliance.</p>
<p>Supported fields are: name=[VM Template Name] Example: template_1 guid=[guid value from vms resource] ems_guid=[uid_ems value from vms resource]</p></td>
</tr>
<tr class="odd">
<td><p>vm_fields</p></td>
<td><p>hash</p></td>
<td><p>Allows for the setting of properties on the Catalog, Hardware, Network, Customize, and Schedule tabs in the Provisioning dialog</p></td>
</tr>
<tr class="even">
<td><p>requester</p></td>
<td><p>hash</p></td>
<td><p>Allows for the setting of properties on the Requester tab in the Provisioning dialog</p></td>
</tr>
<tr class="odd">
<td><p>tags</p></td>
<td><p>hash</p></td>
<td><p>Tags to apply to newly created VM</p>
<p>Example: network_location=Internal cc=001</p></td>
</tr>
<tr class="even">
<td><p>additional_values</p></td>
<td><p>hash</p></td>
<td><p>Additional values are name-value pairs stored with a provision request, but not used by the core provisioning code. These values are usually referenced from automate methods for custom processing</p>
<p>Example: Store a request_id from an external system so the system can be notified during the provisioning process</p></td>
</tr>
<tr class="odd">
<td><p>ems_custom_attributes</p></td>
<td><p>hash</p></td>
<td><p>Custom attributes applied to the virtual machine through the Provider as part of provisioning</p></td>
</tr>
<tr class="even">
<td><p>miq_custom_attributes</p></td>
<td><p>hash</p></td>
<td><p>Custom attributes applied to the virtual machine and stored in the database as part of provisioning</p></td>
</tr>
</tbody>
</table>

### Editing Requests

Updating provision requests can be performed by posting an *edit* action
as follows:

``` data
POST /api/provision_requests/11
```

``` json
{
  "action" : "edit",
  "resource" : {
    "options" : {
      "custom_var1" : "custom value1"
    }
  }
}
```

#### Response:

``` json
{
  "href": "http://localhost:3000/api/provision_requests/11",
  "id": "11",
  "description": "Provision from [template1] to [###]",
  "approval_state": "pending_approval",
  "type": "MiqProvisionRequest",
  "created_on": "2015-04-14T17:36:30Z",
  "updated_on": "2015-04-14T18:32:30Z",
  "requester_id": "88913",
  "requester_name": "API User",
  "request_type": "template",
  "request_state": "pending",
  "message": "VM Provisioning - Request Created",
  "status": "Ok"
  "options": {
    "use_pre_dialog": false,
    "request_type": "template",
    "miq_request_dialog_name": "miq_provision_dialogs",
    "src_vm_id": [
      109996,
      "template1"
    ],
    "src_vm_nics": [],
    "src_vm_lans": [],
    "src_ems_id": [
      59136,
      "ems_0000000000002"
    ],
    "placement_auto": [
      true,
      1
    ],
    "vm_tags": [],
    "ws_values": {
    },
    "ws_ems_custom_attributes": {
    },
    "ws_miq_custom_attributes": {
    },
    "tags": {
    }
    "userid": "admin",
    "source_id": "109996",
    "source_type": "VmOrTemplate",
    "custom_var1" : "custom value1"
  }
}
```

### Approving or Denying Requests

If a provision is not auto approved, it can be approved or denied via
the actions *approve* and *deny* on the provision request resource.

#### Approving a Request

``` data
POST /api/provision_requests/:id
```

``` json
{
  "action" : "approve",
  "reason" : "reason for approval"
}
```

#### Denying a Request

``` data
POST /api/provision_requests/:id
```

``` json
{
  "action" : "deny",
  "reason" : "reason for denial"
}
```

### Monitoring Requests

Once a provision request is created, the response result will include
the queryable provision request itself, i.e.
**/api/provision\_requests/:id**

#### Response:

``` json
{
  "results": [
    {
      "id": "3068",
      "description": "Provision from [template1] to [###]",
      "approval_state": "pending_approval",
      "type": "MiqProvisionRequest",
      "created_on": "2015-04-14T17:36:30Z",
      "updated_on": "2015-04-14T17:36:30Z",
      "requester_id": "88913",
      "requester_name": "API User",
      "request_type": "template",
      "request_state": "pending",
      "message": "VM Provisioning - Request Created",
      "status": "Ok"
      "options": {
        "use_pre_dialog": false,
        "request_type": "template",
        "miq_request_dialog_name": "miq_provision_dialogs",
        "src_vm_id": [
          109996,
          "template1"
        ],
        "src_vm_nics": [],
        "src_vm_lans": [],
        "src_ems_id": [
          59136,
          "ems_0000000000002"
        ],
        "placement_auto": [
          true,
          1
        ],
        "vm_tags": [],
        "ws_values": {
        },
        "ws_ems_custom_attributes": {
        },
        "ws_miq_custom_attributes": {
        },
        "tags": {
        }
      },
      "userid": "admin",
      "source_id": "109996",
      "source_type": "VmOrTemplate"
    }
  ]
}
```

In the above example, the request could be queried periodically until
the **request\_state** reaches the **finished** state. Specifically,

    GET /api/provision_requests/3068

**Note:**

The requests tasks of a provisioning request can also be queried by
expanding the request\_tasks subcollection as follows:

    GET /api/provision_requests/:id?expand=request_tasks

or by fetching them directly as follows:

    GET /api/provision_requests/:id/request_tasks?expand=resources

### Editing Request Tasks

Request tasks for Provision Requests can be updated as follows:

    POST /api/provision_requests/:id/request_tasks/:request_task_id

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

For a list of attributes available for the provision request attribute
groups please refer to the [Provision Request Supported
Attributes](../appendices/provision_attributes.html) in the appendices
section.
