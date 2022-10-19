### Configuring an Internal Database

Before installing an internal database, add a disk to the infrastructure
hosting your appliance. See the documentation specific to your
infrastructure for instructions for adding a disk. As a storage disk
usually cannot be added while a virtual machine is running, Red Hat
recommends adding the disk before starting the appliance.
{{ site.data.product.title_short }} only supports installing of an internal VMDB on blank
disks; installation will fail if the disks are not blank.

</div>

1.  Start the appliance and open a terminal console.

2.  Enter the `appliance_console` command. The {{ site.data.product.title_short }} appliance
    summary screen displays.

3.  Press **Enter** to manually configure settings.

4.  Select **Configure Application** from the menu.

5.  You are prompted to create or fetch an encryption key.

      - If this is the first {{ site.data.product.title_short }} appliance, choose **Create
        key**.

      - If this is not the first {{ site.data.product.title_short }} appliance, choose
        **Fetch key from remote machine** to fetch the key from the
        first appliance. For worker and multi-region setups, use this
        option to copy key from another appliance.

        **Note:**

        All {{ site.data.product.title_short }} appliances in a multi-region
        deployment must use the same key.

6.  Choose **Create Internal Database** for the database location. 

    In the **Configure Messaging** menu, select **Make No messaging changes**. If you see ```Configuration failed: Internal database require a volume mounted at /var/lib/pgsql. Please add an unpartitioned disk and try again.``` message, then ensure to add a second disk for the database per instructions as defined above.

7.  Choose a disk for the database. This can be either a disk you
    attached previously, or a partition on the current disk.

    <div class="important">

    Red Hat recommends using a separate disk for the database.

    </div>

    If there is an unpartitioned disk attached to the virtual machine,
    the dialog will show options similar to the following:

        1) /dev/vdb: 20480
        2) Don't partition the disk

      - Enter **1** to choose `/dev/vdb` for the database location. This
        option creates a logical volume using this device and mounts the
        volume to the appliance in a location appropriate for storing
        the database. The default location is `/var/lib/pgsql`, which
        can be found in the environment variable
        `$APPLIANCE_PG_MOUNT_POINT`.

      - Enter **2** to continue without partitioning the disk. A second
        prompt will confirm this choice. Selecting this option results
        in using the root filesystem for the data directory (not advised
        in most cases).

8.  Enter **Y** or **N** for **Should this appliance run as a standalone
    database server?**

      - Select **Y** to configure the appliance as a database-only
        appliance. As a result, the appliance is configured as a basic
        PostgreSQL server, without a user interface.

      - Select **N** to configure the appliance with the full
        administrative user interface.

9.  When prompted, enter a unique number to create a new region.

    <div class="important">

    Creating a new region destroys any existing data on the chosen
    database.

    </div>

10. Create and confirm a password for the database.

{{ site.data.product.title_short }} then configures the internal database. This takes a few
minutes. After the database is created and initialized, you can log in
to {{ site.data.product.title_short }}.
