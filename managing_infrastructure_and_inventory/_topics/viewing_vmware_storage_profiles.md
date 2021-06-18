# Viewing a VMware Virtual Machine’s Storage Profile

VMware storage profiles allow you to assign policies to datastores.
Storage profiles are used to tag virtual machines to ensure they operate
in compliance with settings in the datastore.

{{ site.data.product.title_short }} retrieves VMware virtual machine storage profile
information in the inventory, and associates the virtual machines and
disks with them.

To view a virtual machine’s storage profile:

1.  Browse to menu: **Compute > Infrastructure > Virtual Machines**.

2.  Click a VMware virtual machine to open its summary page.

3.  The VMware **Storage Profile** is listed under **Properties**.

You can assign a storage profile when provisioning a VMware virtual
machine in {{ site.data.product.title_short }}, by using the virtual machine as a template
to clone. See [Provisioning Virtual
Machines](../provisioning_virtual_machines_and_hosts/index.html#provisioning-virtual-machines)
in *Provisioning Virtual Machines and Hosts* for instructions.
