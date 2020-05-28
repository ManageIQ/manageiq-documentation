#### Provisioning a Virtual Machine Using Cloud-init

##### Request:

    POST api/provision_requests/

``` json
{"version"=>"1.1",
 "template_fields"=>
  {"guid"=>"1dbfed74-1c8b-4535-9f1e-c654a5456805",
   "name"=>"template_name",
   "request_type"=>"template"},
 "vm_fields"=>
  {"customization_template_id"=>10000000000000,
   "addr_mode"=>"static",
   "sysprep_enabled"=>"fields",
   "placement_auto"=>true,
   "number_of_vms"=>1,
   "provision_type"=>"native_clone",
   "vm_name"=>"name_of_vm_to_provision",
   "vm_auto_start"=>true,
   "retirement"=>0,
   "retirement_warn"=>604800,
   "vlan"=>"9af50e0c-b277-422a-a5c3-11e158d21fa8",
   "disk_format"=>"default",
   "number_of_sockets"=>1,
   "cores_per_socket"=>1,
   "vm_memory"=>"2048",
   "memory_reserve"=>341,
   "memory_limit"=>8192,
   "network_adapters"=>1},
 "requester"=>{"owner_email"=>"test@testing.com"},
 "tags"=>{},
 "additional_values"=>nil,
 "ems_custom_attributes"=>nil,
 "miq_custom_attributes"=>nil}
```

Following are some possible cases where the VLAN field is not set
correctly, which can lead to a validation failure:

    Provision failed for the following reasons:\n'Network/Virtual NIC Profile ID or Profile Name (Network Name)' is required.

1.  When providing VNIC profile ID:

    1.  vnic\_profile\_id does not belong to the expected cluster
        (*should match the VNIC profile ID of the network taken from RHV
        based on template’s cluster assigned network*)

    2.  Non-existent VNIC profile ID (*should be available under RHV,
        i.e.: https:/\<RHV FQDN\>/ovirt-engine/api/vnicprofiles*)

2.  When providing: “profile name (network name)”:

    1.  Non-existent network name

    2.  Wrong format (*missing space before the first bracket*:
        “profile\_name(network\_name)”)

    3.  Use Network name that was used in V3 instead of: “profile\_name
        (network\_name)”

| VLAN value                                     | Result                                   |
| ---------------------------------------------- | ---------------------------------------- |
| “vlan": "1dbfed74-1c8b-4535-9f1e-c654a5456805" | Failed, no such ID                       |
| "vlan": "aaa (aaa)"                            | Failed, no such VNIC profile/network     |
| "vlan": "ovirtmgmt(ovirtmgmt)"                 | Failed, invalid format                   |
| "vlan": "0000000a-000a-000a-000a-000000000398" | Failed, VNIC profile ID of other cluster |
| "vlan": "ovirtmgmt"                            | Failed, not supported by v4              |

Examples of incorrect VLAN value:

| VLAN value                                     | Result                        |
| ---------------------------------------------- | ----------------------------- |
| "vlan": "654281a3-db89-4718-ae43-9466b81eb001" | Passed, valid VNIC profile ID |
| "vlan": "ovirtmgmt (ovirtmgmt)"                | Passed, supported format      |

Examples of correct VLAN value:
