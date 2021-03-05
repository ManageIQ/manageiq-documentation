# Reconfiguring Virtual Machines

Memory, processors, disks, ISOs, and CD/DVD Drives can be reconfigured
on existing VMware and Red Hat Virtualization virtual machines using the
**Reconfigure this VM** button.

You can reconfigure multiple components on a virtual machine using one
request, or make each reconfiguration separately. Confirm your changes
using the **Submit** button.

<div class="important">

The following restrictions apply to adding and removing Red Hat
Virtualization virtual machine disks:

  - Supported by Red Hat Virtualization 4.0 and above.

  - Only a single bootable disk is supported.

  - The virtual machine requires at least one existing disk to allow
    adding additional disks. This is because the destination storage
    cannot be specified from the {{ site.data.product.title_short }} dialog, so the storage
    associated with the existing disk is reused.

</div>

{% include_relative _topics/adding_a_vm_disk.md %}

{% include_relative _topics/removing_a_vm_disk.md %}

{% include_relative _topics/reconfiguring_a_vm_disk.md %}

{% include_relative _topics/reconfiguring_vm_memory.md %}

{% include_relative _topics/reconfiguring_vm_processors.md %}

{% include_relative _topics/reconfiguring_vm_network_adapters.md %}

{% include_relative _topics/reconfiguring_vm_iso.md %}
