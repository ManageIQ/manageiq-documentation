## Using a Non-Administrator Account for vCenter Hosts

After adding a VMware vCenter infrastructure provider, you must
authenticate its hosts to enable full functionality. You can use
administrator credentials, or create another user assigned to a role
created for {{ site.data.product.title_short }}. See the [VMware
documentation](https://www.vmware.com/support/pubs/vsphere-esxi-vcenter-server-pubs.html)
for instructions on how to create a role.

The following privileges should be enabled for the non-administrator
user:

From the Global group, check:

  - Cancel task

  - Diagnostics

  - Log Event

  - Set custom attribute

  - Settings

Check the entire set of privileges for the following groups:

  - Alarms

  - Datastores

  - dvPort Group

  - Host

  - Network

  - Resource

  - Scheduled Task

  - Tasks

  - Virtual Machine

  - vSphere Distributed Switch

Additionally, you must assign the new role to the following objects:

  - **Datacenter**: At the Datacenter the {{ site.data.product.title_short }} user/group
    must have at least the read-only role at the Datacenter level (Not
    Propagated) to be able to see the datacenter. Without this access,
    relationships cannot be made. Specifically, the datastores will not
    show up.

  - **Cluster**: Each Cluster that the {{ site.data.product.title_short }} needs access to
    must have the new role assigned and propagated.

  - **Folders**: Each Folder that {{ site.data.product.title_short }} needs access to must
    have the new role assigned and propagated.

  - **Datastores**: Each Datastore that {{ site.data.product.title_short }} needs access to
    must have the new role assigned and propagated.

  - **Networking**: Each vLAN or Port Group that {{ site.data.product.title_short }} needs
    access to must have the new role assigned and propagated.
