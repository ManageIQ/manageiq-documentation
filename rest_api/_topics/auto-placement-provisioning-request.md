#### Placement of Environmental Variables in Provisioning Requests

Pass environment values directly through the `vm_fields` attribute group
of a provisioning request by first adding `"placement_auto":"false"` to
the hash.

<div class="note">

Once `"placement_auto:"false"` has been added, you must pass values for
all the required fields on the Environment tab.

</div>

The example request displays how the `vm_fields` attribute group should
appear when passing environment values.

##### Request:

Provisioning requests are made available via the following entrypoint,
either by specifying a create action or by posting the request directly
to /api/provision\_requests:

    POST /api/provision_requests

    "vm_fields" : {
      "vm_name" : "aab_rest_vm1",
      "placement_auto": "false",
      "placement_availability_zone": "2",
      "cloud_network": "2",
      "cloud_subnet": "3",
      "security_groups": "64",
      "instance_type": "2",
    },
