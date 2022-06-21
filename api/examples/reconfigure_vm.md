---
---

### Reconfigure a VM - Set Memory and CPUs

If a VM is running it might not be possible to change CPUs and/or memory.  Refer to the `cpu_hot_add_enabled`, `cpu_hot_remove_enabled`, and `memory_hot_add_enabled` properties of the VM to see if what you would like to change is possible.

#### Request:

    POST /api/requests

``` json
{
  "action" : "create",
  "options": {
    "request_type": "vm_reconfigure",
    "src_ids": ["2"],
    "vm_memory": "8192",
    "number_of_cpus": 2,
    "cores_per_socket": 2
  }
}
```

#### Response:
``` json
{
  "results": [
    {
      "href": "http://localhost:3000/api/requests/5",
      "id": "5",
      "description": "VM Reconfigure for: VM1 - Memory: 8192 MB",
      "approval_state": "approved",
      "type": "VmReconfigureRequest",
      "created_on": "2021-12-15T19:25:41Z",
      "updated_on": "2021-12-15T19:25:41Z",
      "requester_id": "1",
      "requester_name": "Administrator",
      "request_type": "vm_reconfigure",
      "request_state": "pending",
      "message": "VM Reconfigure - Request Created",
      "status": "Ok",
      "options": {
        "src_ids": [
          "2"
        ],
        "request_type": "vm_reconfigure",
        "vm_memory": "8192"
      },
      "userid": "admin",
      "tenant_id": "1",
      "process": true,
      "initiated_by": "user"
    }
  ]
}
```

### Reconfigure a VM - Add a disk

#### Request:

    POST /api/requests

``` json
{
  "action" : "create",
  "options": {
    "request_type": "vm_reconfigure",
    "src_ids": ["2"],
    "disk_add": [
      {
        "new_controller_type": "VirtualLsiLogicController",
        "thin_provisioned": true,
        "disk_size_in_mb": 10240,
      }
    ]
  }
}
```

The new_controller_type parameter is optional and only used if there are no more open ports on the existing controllers and a new one has to be added.

The valid options are:
* `VirtualLsiLogicController`
* `ParaVirtualSCSIController`
* `VirtualBusLogicController`
* `VirtualLsiLogicSASController`

### Reconfigure a VM - Remove a disk

#### Request:

    POST /api/requests

``` json
{
  "action" : "create",
  "options": {
    "request_type": "vm_reconfigure",
    "src_ids": ["2"],
    "disk_remove": [
      {
        "disk_name": "[Datastore 0] vm/vm_1.vmdk",
        "delete_backing": true
      }
    ]
  }
}
```

You can retrieve the disk_name from the disk's `filename` property
Delete backing is optional and defaults to true.

### Reconfigure a VM - Resize a disk

#### Request:

    POST /api/requests

``` json
{
  "action" : "create",
  "options": {
    "request_type": "vm_reconfigure",
    "src_ids": ["2"],
    "disk_resize": [
      {
        "disk_name": "[Datastore 0] vm/vm_1.vmdk",
        "disk_size_in_mb": 20480
      }
    ]
  }
}
```

You can retrieve the disk_name from the disk's `filename` property
Decreasing a disk's size is not supported

### Reconfigure a VM - Add a Network Adapter

#### Request:

    POST /api/requests

``` json
{
  "action" : "create",
  "options": {
    "request_type": "vm_reconfigure",
    "src_ids": ["2"],
    "network_adapter_add": [
      {
        "network": "VM Network"
      }
    ]
  }
}
```

### Reconfigure a VM - Remove a Network Adapter

#### Request:

    POST /api/requests

``` json
{
  "action" : "create",
  "options": {
    "request_type": "vm_reconfigure",
    "src_ids": ["2"],
    "network_adapter_remove": [
      {
        "network": {
          "name": "Network Adapter 1"
        }
      }
    ]
  }
}
```

### Reconfigure a VM - Modify a Network Adapter

#### Request:

    POST /api/requests

``` json
{
  "action" : "create",
  "options": {
    "request_type": "vm_reconfigure",
    "src_ids": ["2"],
    "network_adapter_edit": [
      {
        "name": "Network Adapter 1",
        "network": "VM Network 2"
      }
    ]
  }
}
```

### Reconfigure a VM - Connect a CD-ROM

#### Request:

    POST /api/requests

``` json
{
  "action" : "create",
  "options": {
    "request_type": "vm_reconfigure",
    "src_ids": ["2"],
    "cdrom_connect": [
      {
        "device_name": "CD/DVD drive 1",
        "storage_id": "1",
        "filename": "file.iso"
      }
    ]
  }
}
```

### Reconfigure a VM - Disconnect a CD-ROM

#### Request:

    POST /api/requests

``` json
{
  "action" : "create",
  "options": {
    "request_type": "vm_reconfigure",
    "src_ids": ["2"],
    "cdrom_disconnect": [
      {
        "device_name": "CD/DVD drive 1"
      }
    ]
  }
}
```
