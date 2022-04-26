## Additional Configuration for Appliances on VMware vSphere

### Installing VMware VDDK on {{ site.data.product.title_short }}

{% include installing-vmware-vddk.md %}

### Tuning Appliance Performance

By default, the {{ site.data.product.title_short }} appliance uses the `tuned`
service and its `virtual-guest` profile to optimize performance. In most
cases, this profile provides the best performance for the appliance.

However on some VMware setups (for example, with a large vCenter
database), the following additional tuning may further improve appliance
performance:

  - When using the `virtual-guest` profile in `tuned`, edit the
    `vm.swappiness` setting to `1` in the `tuned.conf` file from the
    default of `vm.swappiness = 30`.

  - Use the `noop` scheduler instead. For more information, please refer to “Deploying an OVF or OVA Template” topic in the [VMware
    documentation](https://docs.vmware.com/en/VMware-vSphere/7.0/com.vmware.vsphere.vm_admin.doc/GUID-17BEDA21-43F6-41F4-8FB2-E01D275FE9B4.html) for more
    details on the best scheduler for your environment. See [Setting the
    Default I/O
    Scheduler](https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/7/html/performance_tuning_guide/sect-red_hat_enterprise_linux-performance_tuning_guide-storage_and_file_systems-configuration_tools#sect-Red_Hat_Enterprise_Linux-Performance_Tuning_Guide-Configuration_tools-Setting_the_default_IO_scheduler)
    in the Red Hat Enterprise Linux *Performance Tuning Guide* for
    instructions on changing the default I/O scheduler.
