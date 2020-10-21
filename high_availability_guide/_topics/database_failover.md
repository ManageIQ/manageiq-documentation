## Configuring Database Failover

The failover monitor daemon must run on all of the non-database
{{ site.data.product.title_short }} appliances to check for failures. In case of a
database failure, it modifies the database configuration accordingly.

<div class="important">

This configuration is crucial for high availability to work in your
environment. If the database failover monitor is not configured,
non-database {{ site.data.product.title_short }} appliances will not react to the
failover event and will not be reconfigured against the new primary
database host.

</div>

### Failover Configuration Settings

Configuration settings are located in
`/var/www/miq/config/ha_admin.yml`.

**Default settings**:

| Parameter                  | Default Value | Description                                                                                                                                       |
| -------------------------- | ------------- | ------------------------------------------------------------------------------------------------------------------------------------------------- |
| `failover_attempts`        | 10            | The number of times the `failover_monitor` will attempt to failover after discovering the connection to the current database is no longer active. |
| `db_check_frequency`       | 300s          | The sleep interval in the monitor loop, it defines how frequently the connection to the database is checked.                                      |
| `failover_check_frequency` | 60s           | The sleep interval between attempting to failover additional times.                                                                               |

**Note:**

`failover_attempts` and `failover_check_frequency` determine the time
limit for the cluster to elect a new primary. To produce quicker
failovers, reduce the value for `failover_check_frequency` and increase
the value for `failover_attempts`.

### Configuring the Failover Monitor

Configure the failover monitor only on the non-database
{{ site.data.product.title_short }} appliances with the following steps:

1.  In the appliance console menu, select **Configure Application
    Database Failover Monitor**.

2.  Select **Start Database Failover Monitor**.

### Testing Database Failover

Test that failover is working correctly between your databases with the
following steps:

1.  Simulate a failure by stopping the database on the primary server:

        # systemctl stop postgresql.service

2.  To check the status of the database, run:

        # systemctl status postgresql.service

    **Note:**

    You can check the status of the simulated failure by viewing the
    most recent `evm.log` log on the engine appliances.
    
3.  Check the appliance console summary screen for the primary database.
    If configured correctly, the **{{ site.data.product.title_abbr_uc }} Database**
    value in the appliance console summary should have switched from the
    hostname of the old primary database to the hostname of the new
    primary on all {{ site.data.product.title_short }} appliances.

<div class="important">

Upon database server failover, the standby server becomes the primary.
However, the failed node cannot switch to standby automatically and must
be manually configured. Data replication from the new primary to the
failed and recovered node does not happen by default, so the failed node
must be reintroduced into the configuration.

</div>

### Reintroducing the Failed Node

Manual steps are required to reintroduce the failed primary database
node back into the cluster as a standby. This allows for greater control
over the configuration, and to diagnose the failure.

To reintroduce the failed node, reinitialize the standby database. On
the standby database-only appliance, configure the following:

1.  In the appliance console menu, select **Configure Database
    Replication**.

2.  Select **Configure Server as Standby**.

3.  Select `y` to remove all previous data from the server and configure
    it as a new standby database.

4.  Set a unique identifier number for the standby server and enter the
    database name and credentials:

    1.  Select a number to uniquely identify the node in the replication
        cluster. This number can be the same as the node’s original
        identification number.

    2.  Enter the cluster database name.

    3.  Enter the cluster database username.

    4.  Enter the cluster database password.

    5.  Enter the new primary database-only appliance hostname or IP
        address.

    6.  Enter the new standby database-only appliance hostname or IP
        address.

        **Note:**

        The hostname must be visible to all appliances that communicate
        with this database, including the engine appliances and any
        global region databases.

    7.  Select `y` to configure the replication manager for automatic failover.

        **Note:**

        If re-using the node’s identification number, select `y` to
        overwrite the existing node ID (this cannot be undone).
        Additionally, select `y` to overwrite and reconfigure the
        replication settings in `/etc/repmgr.conf` when prompted.
        
    8.  Confirm that the replication standby server configuration details are correct, and select `y` to apply the configuration.

The standby server will then run an initial synchronization with the
primary database, and start locally in standby mode.

Verify the configuration on the appliance console details screen for the
standby server. When configured successfully, **Local Database Server**
shows as `running (standby)`.

Your {{ site.data.product.title_short }} environment is now re-configured for high
availability.
