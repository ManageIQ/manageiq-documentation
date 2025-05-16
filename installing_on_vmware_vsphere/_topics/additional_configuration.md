## Additional Configuration for Appliances on VMware vSphere

{% include installing-vmware-vddk.md %}
{% include installing-vmware-webmks.md %}

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

  - Use the `noop` scheduler instead. See the [VMware
    documentation](https://kb.vmware.com/s/article/2011861) for more
    details on the best scheduler for your environment. See [Setting the
    Default I/O
    Scheduler](https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/7/html/performance_tuning_guide/sect-red_hat_enterprise_linux-performance_tuning_guide-storage_and_file_systems-configuration_tools#sect-Red_Hat_Enterprise_Linux-Performance_Tuning_Guide-Configuration_tools-Setting_the_default_IO_scheduler)
    in the Red Hat Enterprise Linux *Performance Tuning Guide* for
    instructions on changing the default I/O scheduler.
