## Installing the Appliances

This chapter outlines the steps for installing and configuring the
{{ site.data.product.title_short }} components needed for high availability: a database
cluster comprised of primary and standby database-only appliances, and
two (at minimum) non-database {{ site.data.product.title_short }} appliances.

### Installing the Primary Database-Only Appliance

The primary database-only appliance functions as an external database to
the non-database {{ site.data.product.title_short }} appliances.

1.  Deploy a {{ site.data.product.title_short }} appliance with an extra (and
    unpartitioned) disk for the database at a size appropriate for your
    deployment. For recommendations on disk space, see [Database Requirements](../deployment_planning_guide/index.html#database-requirements) in the *Deployment Planning Guide*.

2.  Configure time synchronization on the appliance by editing
    `/etc/chrony.conf` with valid NTP server information.

3.  From your host environment, open the appliance and configure the
    network and hostname using nmcli or nmtui from the console or from your
    web browser using Cockpit on port 9090

4.  Resynchronize time information across the appliances:

        # systemctl enable chronyd.service
        # systemctl start chronyd.service

5.  In the appliance console, configure the following:

    1.  Select **Configure Application**.

    2.  Select **Create key** to create the encryption key. You can
        create a new key, or use an existing key on your system by
        selecting **Fetch key from remote machine** and following the
        prompts.

    3.  Select **Create Internal Database**.

    4.  Select the database disk. {{ site.data.product.title_short }} then activates
        the configuration.

    5.  For **Should this appliance run as a standalone database
        server?**, select `y`. Selecting this option configures this
        appliance as a database-only appliance, and therefore the
        {{ site.data.product.title_abbr_uc }} application and `evmserverd` processes
        will not run. This is required in highly available database
        deployments.

        **Warning:**

        This configuration is not reversible.

    6.  Create the database password.

**Note:**

Do not create a region at this stage in the procedure.

You have now created the empty database.

You can check the configuration on the appliance console details screen.
If configured successfully, **Local Database Server** shows as `running
(primary)`.

Running the `psql vmdb_production` command also provides information
about the database.

### Installing the First {{ site.data.product.title_short }} Appliance

Install and configure a {{ site.data.product.title_short }} appliance to point to the
primary database server. You can then create a database region and
configure the primary database. This appliance does not serve as a
database server.

After installing and configuring an empty database-only appliance in
[Installing the Primary Database-Only
Appliance](#installing-the-primary-database-only-appliance), the steps in this section create
the database schema used by {{ site.data.product.title_short }} on the primary
database-only appliance, and populate the database with the initial
data.

<div class="important">

Region metadata is required to configure the primary database-only
appliance as a primary node in the replication cluster. This must be
configured from the {{ site.data.product.title_short }} appliance before the primary
and secondary database-only appliances can be configured.

</div>

1.  Deploy a {{ site.data.product.title_short }} appliance. There is no requirement
    for an extra disk on this appliance.

2.  Configure time synchronization on the appliance by editing
    `/etc/chrony.conf` with valid NTP server information.

3.  From your host environment, open the appliance and configure the
    network and hostname using nmcli or nmtui from the console or from your
    web browser using Cockpit on port 9090

4.  Re-synchronize time information across the appliances:

        # systemctl enable chronyd.service
        # systemctl start chronyd.service

5.  In the appliance console, configure the following:

    1.  Select **Configure Application**.

    2.  Configure this appliance to use the encryption key from the
        primary database-only appliance:

        1.  For **Encryption Key**, select **Fetch key from remote
            machine**.

        2.  Enter the hostname for the primary database-only appliance
            you previously configured containing the encryption key.

        3.  Enter the primary database-only appliance’s username.

        4.  Enter the primary database-only appliance’s password.

        5.  Enter the path of the remote encryption key. (For example,
            `/var/www/miq/vmdb/certs/v2_key`.)

            <div class="important">

            All appliances in the same region must use the same v2 key.

            </div>

    3.  Configure the database:

        1.  Select **Create Region in External Database**, since the
            database is external to the appliances.

            <div class="important">

            Creating a database region will destroy any existing data
            and cannot be undone.

            </div>

        2.  Assign a unique database region number.

        3.  Enter the port number.

        4.  For **Are you sure you want to continue?** Select `y`.

    4.  Enter the primary database-only appliance’s name and access
        details:

        1.  Enter the hostname for the primary database-only appliance.

        2.  Enter a name to identify the database.

        3.  Enter the primary database-only appliance’s username.

        4.  Enter a password for the database and confirm the password.

This initializes the database, which takes a few minutes.

You can check the configuration on the appliance console details screen.
When configured successfully, **{{ site.data.product.title_abbr_uc }} Server** will
show as `running`, and **{{ site.data.product.title_abbr_uc }} Database** will show
the hostname of the primary database-only appliance.

### Configuring the Primary Database-Only Appliance

On the primary database-only appliance you created in [Installing the
Primary Database-Only Appliance](#installing-the-primary-database-only-appliance), initialize
the nodes in the database cluster to configure the database replication.
Run these steps from the appliance console:

1.  In the appliance console menu, select **Configure Database
    Replication**.

2.  Select **Configure Server as Primary**.

3.  Set a unique identifier number for the server and enter the database
    name and credentials:

    1.  Select a number to uniquely identify the node in the replication
        cluster.

    2.  Enter the name of the database you configured previously.

    3.  Enter the cluster database username.

    4.  Enter the cluster database password and confirm the password.

    5.  Enter the primary database-only appliance hostname or IP
        address.

        **Note:**

        The hostname must be visible to all appliances that communicate
        with this database, including the non-database
        {{ site.data.product.title_short }} appliances and any global region
        databases.

    6.  Confirm that the replication server configuration details are correct, and select `y` to apply the configuration.

This configures database replication in the cluster.

### Installing the Standby Database-Only Appliance

The standby database-only appliance is a copy of the primary
database-only appliance and takes over the role of primary database in
case of failure.

Follow these steps to create a new standby appliance, or to add another
standby appliance to the cluster.

1.  Deploy a {{ site.data.product.title_short }} appliance with an extra (and unpartitioned) disk for the database that is the same size as the primary database-only appliance, as it will contain the same data.
    For recommendations on disk space, see [Database Requirements](../deployment_planning_guide/index.html#database-requirements) in the *Deployment Planning Guide*.

2.  Configure time synchronization on the appliance by editing
    `/etc/chrony.conf` with valid NTP server information.

3.  From your host environment, open the appliance and configure the
    network and hostname using nmcli or nmtui from the console or from your
    web browser using Cockpit on port 9090

4.  Re-synchronize time information across the appliances:

        # systemctl enable chronyd.service
        # systemctl start chronyd.service

You can now configure this appliance as a standby database-only
appliance in the cluster.

### Configuring the Standby Database-Only Appliance

The steps to configure the standby database-only appliance are similar
to that of the primary database-only appliance, in that they prepare the
appliance to be database-only, but as the standby.

On the standby database-only appliance, configure the following from the
appliance console:

1.  In the appliance console menu, select **Configure Database
    Replication**.

2.  Select **Configure Server as Standby**.

3.  Select the database disk. {{ site.data.product.title_short }} then activates the
    configuration.

4.  Set a unique identifier number for the standby server and enter the
    database name and credentials:

    1.  Select a number to uniquely identify the node in the replication
        cluster.

    2.  Enter the cluster database name.

    3.  Enter the cluster database username.

    4.  Enter and confirm the cluster database password.

    5.  Enter the primary database-only appliance hostname or IP
        address.

    6.  Enter the standby database-only appliance hostname or IP
        address.

        **Note:**

        The hostname must be visible to all appliances that communicate
        with this database, including the engine appliances and any
        global region databases.

    7.  Select `y` to configure the replication manager for automatic failover.

    8.  Confirm that the replication standby server configuration
        details are correct, and select `y` to apply the configuration.

The standby server will then run an initial synchronization with the
primary database, and start locally in standby mode. This takes a few
minutes.

Verify the configuration on the appliance console details screen for the
standby server. When configured successfully, **Local Database Server**
shows as `running (standby)`.

### Installing Additional {{ site.data.product.title_short }} Appliances

Install a second virtual machine with a {{ site.data.product.title_short }} appliance
and any additional appliances in the region using the following steps:

1.  Deploy a {{ site.data.product.title_short }} appliance. There is no requirement
    for an extra disk on this appliance.

2.  Configure time synchronization on the appliance by editing
    `/etc/chrony.conf` with valid NTP server information.

3.  From your host environment, open the appliance and configure the
    network and hostname using nmcli or nmtui from the console or from your
    web browser using Cockpit on port 9090

4.  Re-synchronize time information across the appliances:

        # systemctl enable chronyd.service
        # systemctl start chronyd.service

5.  In the appliance console, configure the following:

    1.  Select **Configure Application**.

    2.  Configure this appliance to use the encryption key from the
        primary database-only appliance:

        1.  For **Encryption Key**, select **Fetch key from remote
            machine**.

        2.  Enter the hostname for the primary database-only appliance
            you previously configured containing the encryption key.

        3.  Enter the port number.

        4.  Enter the primary database-only appliance’s username.

        5.  Enter the primary database-only appliance’s password.

        6.  Enter the path of the remote encryption key. (For example,
            `/var/www/miq/vmdb/certs/v2_key`.)

        7.  Select **Join Region in External Database** from the
            appliance console menu.

    3.  Enter the primary database-only appliance’s name and access
        details:

        1.  Enter the hostname for the primary database-only appliance.

        2.  Enter a name to identify the database.

        3.  Enter the primary database-only appliance’s username.

        4.  Enter a password for the database and confirm the password.

This configuration takes a few minutes to process.

You can check the configuration on the appliance console details screen.
When configured successfully, **{{ site.data.product.title_abbr_uc }} Server** will
show as `running`, and **{{ site.data.product.title_abbr_uc }} Database** will show
the hostname of the primary database-only appliance.
