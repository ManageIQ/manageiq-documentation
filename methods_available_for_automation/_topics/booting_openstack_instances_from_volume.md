##### Booting OpenStack Instances from Volume

You can boot instances created in Red Hat Enterprise Linux OpenStack
Platform from a specified volume from an existing selection of block
volumes. You can enable automate to pass the required parameters to
OpenStack to use volumes as booting devices on an instance.

Include the following settings in the prov.set\_option for provisioning
instances created in OpenStack.

    prov.set_option(
      :clone_options, {
        :image_ref => nil,
        :block_device_mapping_v2 => [{
          :boot_index => 0,
          :uuid => "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxx",
          :device_name => "vda",
          :source_type => "volume",
          :destination_type => "volume",
          :delete_on_termination => false
        }]
      }
    )

You can allow passing "block\_device\_mapping\_v2" in the clone options
and remove keys from clone\_options by setting value to nil.
