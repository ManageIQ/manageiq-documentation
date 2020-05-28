---
---

## Advanced Provisioning Attributes

This appendix lists parameters that apply to REST API initiated
provisioning via /api/provision\_requests.

  - [Defining new vLans adapters](#defining-new-vlans-adapters)

  - [Defining new SCSI Controller](#defining-new-scsi-controller)

  - [Defining new Disks](#defining-new-disks)

  - [Cloning Type](#cloning-type)

  - [Limit Template Selection](#limit-template-selection)

### Defining new vLans adapters

These attributes allow adding new vLan adapters during the provisioning
request.

| Attribute                                 | Type    | Required | Values                                      | Default        |
| ----------------------------------------- | ------- | -------- | ------------------------------------------- | -------------- |
| network\#\#                               | string  | Required | Network Name                                |                |
| network\#\#.mac\_address                  | string  | Optional | MAC Address                                 |                |
| network\#\#.deviceType                    | string  | Optional | VirtualE1000, VirtualPCNet32, VirtualVmxnet | VirtualPCNet32 |
| network\#\#.connectable.allowGuestControl | boolean | Optional |                                             | true           |
| network\#\#.connectable.startConnected    | boolean | Optional |                                             | true           |
| network\#\#.connectable.connected         | boolean | Optional |                                             | true           |

Example:

``` json
"network0" : "VM Network",
"network0.mac_address" : "00:50:56:57:58:59"
```

### Defining new SCSI Controller

The SCSI Controller attributes are optional. If a controller is
required, it will be added with the defined defaults. These settings are
only required if you need to override a default value.

| Attribute              | Type   | Required | Values                                               | Default                   |
| ---------------------- | ------ | -------- | ---------------------------------------------------- | ------------------------- |
| ctrlscsi\#\#           | string | Required | VirtualBusLogicController, VirtualLsiLogicController | VirtualLsiLogicController |
| ctrlscsi\#\#.sharedBus | string | Optional | noSharing, physicalSharing, virtualSharing           | noSharing                 |

<div class="note">

The \#\# value defines the controller bus number

</div>

Example:

``` json
"ctrlscsi00" : "VirtualBusLogicController"
"ctrlscsi00.sharedBus" : "virtualSharing"
```

### Defining new Disks

The Disk attributes allow adding disks as part of the provisioning
request.

| Attribute                                  | Type    | Required | Values                                                                         | Default    |
| ------------------------------------------ | ------- | -------- | ------------------------------------------------------------------------------ | ---------- |
| diskscsi\#\#                               | string  | Required | "controller\_\#:controller\_position\_\#:size\_in\_mb"                         |            |
| diskscsi\#\#.datastore                     | string  | Optional | Datastore Name                                                                 |            |
| diskscsi\#\#.filename                      | string  | Optional | Filename                                                                       |            |
| diskscsi\#\#.connectable.allowGuestControl | boolean | Optional |                                                                                | false      |
| diskscsi\#\#.connectable.startConnected    | boolean | Optional |                                                                                | true       |
| diskscsi\#\#.connectable.connected         | boolean | Optional |                                                                                | true       |
| diskscsi\#\#.backing.diskmode              | string  | Optional | persistent, independent\_persistent, independent\_nonpersistent, nonpersistent | persistent |
| diskscsi\#\#.backing.split                 | boolean | Optional |                                                                                | false      |
| diskscsi\#\#.backing.thinProvisioned       | boolean | Optional |                                                                                | false      |
| diskscsi\#\#.backing.writeThrough          | boolean | Optional |                                                                                | false      |

Example:

``` json
"diskscsi0" : "0:0:10"
"diskscsi1" : "0:0:8"
"diskscsi1.datastore" : "storage1"
"diskscsi1.backing.diskmode" : "independent_persistent"
```

### Cloning Type

This attribute sets the type of cloning request, either clone to vm or
clone to template. It is an attribute to set with the *template\_fields*
hash.

| Attribute     | Type   | Required | Values                             | Default       |
| ------------- | ------ | -------- | ---------------------------------- | ------------- |
| request\_type | string | Optional | clone\_to\_vm, clone\_to\_template | clone\_to\_vm |

Example:

``` json
"template_fields" : {
  "guid" : "afe6e8a0-89fd-11e3-b6ac-b8e85646e742",
  "request_type" : "clone_to_template"
}
```

### Limit Template Selection

This attribute value limits the template selection to the Datacenters
contained in the specified cluster. It is an attribute to be specified
with the *additional\_values* hash.

| Attribute | Type   | Required |
| --------- | ------ | -------- |
| cluster   | string | Optional |

Example:

``` json
"additional_values" : {
  "request_id" : "87458",
  "cluster" : "sales_prod"
}
```
