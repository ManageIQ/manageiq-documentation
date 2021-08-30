## Updating Hostnames on Database-Only Appliances

When updating the hostnames of database-only appliances in a cluster,
you must also re-configure high availability on the primary and standby
database-only appliances.

### Preparing to Update Appliance Hostnames

Before updating the hostnames of your appliances, complete the
following:

1.  Note the hostnames of the active database (primary) appliance and
    the standby database appliances in the appliance console.

    You can verify this from the appliance summary screen of a
    database-only appliance, where the status for **Local Database
    Server** shows *primary* or *standby*, for example:

        ...
        Local Database Server:   running (primary)
        ...

2.  On the non-database {{ site.data.product.title_short }} appliances, stop the
    failover monitor:

    1.  In the appliance console menu, select **Configure Application
        Database Failover Monitor**.

    2.  Select **Stop Database Failover Monitor**.

3.  On the *standby* database-only appliances, stop the `postgresql`
    database service:

        # systemctl stop postgresql.service

4.  Stop `manageiq` on each non-database {{ site.data.product.title_short }}
    appliance:

        # systemctl stop manageiq

### Updating the Primary Database-Only Appliance Hostname

Run the following steps on your primary database-only appliance:

1.  In the appliance console menu, configure the new hostname or IP
    address from the **Configure Network** option.

2.  Restart the appliance.

3.  Update the `host` key to the primary database appliance’s new
    hostname in `/var/www/miq/vmdb/config/database.yml`.

### Updating the Standby Database-Only Appliance Hostname

Run the following steps on your standby database-only appliances:

1.  In the appliance console menu, configure the new hostname or IP
    address from the **Configure Network** option.

2.  Restart the appliance.

3.  Update the `host` key to the standby database appliance’s new
    hostname in `/var/www/miq/vmdb/config/database.yml`.

Repeat these steps on any additional standby database-only appliances.

<div class="important">

Your primary and standby appliances must be reachable to each other by
their hostnames. If all appliances are on the same network and are
resolvable, no additional updates are needed. If your appliances exist
on different networks, edit the `/etc/hosts` file on each database
appliance to include entries for the IP address and hostname of each
other database appliance in the cluster.

</div>

Proceed to re-configure high availability on the primary and standby
database-only appliances.

### Re-configuring High Availability on Database-Only Appliances

Re-configure replication on the database-only appliances, and restart
services on your cluster.

#### Configuring the Primary Database-Only Appliance

On the primary database-only appliance, initialize the nodes in the
database cluster to re-configure the database replication:

1.  In the appliance console menu, select **Configure Database
    Replication**.

2.  Select **Configure Server as Primary**.

3.  Set a unique identifier number for the server and enter the database
    name and credentials:

    1.  Select a number to uniquely identify the node in the replication
        cluster.

    2.  Enter the cluster database name.

    3.  Enter the cluster database username.

    4.  Enter the cluster database password and confirm the password.

    5.  Enter the new primary database-only appliance hostname or IP
        address.

        **Note:**

        The hostname or IP address must be visible to all appliances
        that communicate with this database, including the non-database
        {{ site.data.product.title_short }} appliances and any global region
        databases.

    6.  Confirm that the replication server configuration details are correct, and select `y` to apply the configuration.

#### Configuring the Standby Database-Only Appliance

The steps to re-configure the standby database-only appliances are similar to that of the primary database-only appliance, in that they
prepare the appliance to be database-only, but as the standby.

On the standby database-only appliances, configure the following:

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

    4.  Enter the cluster database password.

    5.  Enter the new primary database-only appliance hostname or IP
        address.

    6.  Enter the new standby database-only appliance hostname or IP
        address.

        **Note:**

        The hostname or IP address must be visible to all appliances
        that communicate with this database, including the engine
        appliances and any global region databases.

    7.  Select `y` to configure the replication manager for automatic failover.

    8.  Confirm that the replication standby server configuration
        details are correct, and select `y` to apply the configuration.
        The standby server will then run an initial synchronization with
        the primary database, and start locally in standby mode.

5.  Verify the configuration on the appliance console details screen for
    the standby server. When configured successfully, **Local Database
    Server** shows as `running (standby)`.

Repeat these steps on any additional standby database-only appliances.

<div class="important">

If you are using non-dedicated database appliances, also stop
`manageiq` on those appliances before changing their hostnames, and
reconfigure `database.yml` before restarting.

</div>

#### Restarting Services

1.  Start `manageiq` on each non-database {{ site.data.product.title_short }}
    appliance:

        # systemctl start manageiq

    After `manageiq` has started successfully, all appliances will be
    able connect to the database.

2.  Restart the failover monitor on the non-database
    {{ site.data.product.title_short }} appliances:

    1.  In the appliance console menu, select **Configure Application
        Database Failover Monitor**.

    2.  Select **Start Database Failover Monitor**.

**Note:**

You can view a summary of the updated appliances by running `repmgr cluster show` on one of the database appliances.

Your {{ site.data.product.title_short }} environment is now re-configured for high
availability.
