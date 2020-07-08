##### Adding Disks to OpenStack Instance Provisioning

Using the clone\_options, construct the keys and values required to
define new disks as well as override or set other keys if needed.

Include the following settings with prov.set\_options to set one or
multiple volumes to attach. Note that each hash requires the :volume\_id
and :device\_name keys.

    clone_options = {
      :block_device_mapping => [
        {:volume_id => "d4xxxx92-5xx0-4xx9-bxx4-f1xxxxxxxx19", :device_name => "/dev/sdb"},
        {:volume_id => "e7xxxxf5-dxxd-4xx0-8xx3-a2xxxxxxxx12", :device_name => "/dev/sdc"},
      ]
    }

    prov = $evm.root["miq_provision"]
    prov.set_option(:clone_options, clone_options)
