# Migrating Virtual Machines

{{ site.data.product.title_short }} supports migrating virtual machines between datacenters,
clusters, resource pools, folders and hosts. Create and submit a request
with detailed environment information to which to migrate the VM.

To create a request to migrate a virtual machine:

1.  Browse to menu: **Compute > Infrastructure > Virtual Machines**.

2.  Click **VMs & Templates** on the accordion menu.

3.  Select the VM to migrate.

4.  Click **Configuration**, and then ![2007](../images/2007.png) **Lifecycle**.

5.  Click ![migration icon](../images/migration_icon.png) **Migrate selected items**. The Migrate Virtual Machine form will appear.

6.  Under the **Request** tab:

    1.  Provide an **E-mail** address, **First Name** and **Last Name**.

    2.  Include any **Notes** and a Manager’s **Name**.

7.  Under the **Environment** tab:

    1.  Select a **Datacenter** to migrate the VM to.

    2.  Select a **Cluster** from the list.

    3.  Choose a **Resource Pool**.

    4.  Select a **Folder** to migrate the VM to.

    5.  Under **Host** choose a **Filter** and click on a **Name** from
        the list that appears.

    6.  **Filter** the **Datastore** and click a **Name** from the
        results.

8.  Under the **Schedule** tab:

    1.  Select **Schedule Info** for migrating the virtual machine.
        Provide a **Provision on** date if selecting **Schedule**.

9.  Click **Submit**.
