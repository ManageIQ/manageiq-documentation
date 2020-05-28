#### Monitoring Request

Once a provisioning request is created, the response result will include
the queryable provision request itself, for example:
`/api/provision_requests/:id`

##### Response:

``` json
{
  "results": [
    {
      "id": 3068,
      "description": "Provision from [template1] to [###]",
      "approval_state": "pending_approval",
      "type": "MiqProvisionRequest",
      "created_on": "2015-04-14T17:36:30Z",
      "updated_on": "2015-04-14T17:36:30Z",
      "requester_id": 88913,
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
      "source_id": 109996,
      "source_type": "VmOrTemplate"
    }
  ]
}
```

In the above example, the request can be queried periodically until the
`request_state` reaches the `finished` state with:

    GET /api/provision_requests/3068

<div class="note">

The `requests` tasks of a provisioning request can also be queried by
expanding the `request_tasks` subcollection as follows:

</div>

    GET /api/provision_requests/:id?expand=request_tasks

An alias **tasks** is also defined for the above subcollection:

    GET /api/provision_requests/:id?expand=tasks

For a list of available attributes, see the [Provisioning Request
Attributes](#provision-request-supported-attributes) section.
