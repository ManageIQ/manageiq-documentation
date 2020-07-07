## Environment Overview

Learn how to configure and manage database high availability in a {{ site.data.product.title }} environment. This configuration allows for disaster mitigation: a failure in the primary database does not result in downtime, as the standby database takes over the failed database’s processes. This is made possible by database replication between two or more database servers. In {{ site.data.product.title_short }}, these servers are *database-only {{ site.data.product.title_short }} appliances*, which do not have `evmserverd` processes that are enabled. This is configured from the `appliance_console` menu at the time of deployment.

Two types of appliances that are used in high availability:

  - *Database-only {{ site.data.product.title_short }} appliances*, which do not have `evmserverd` processes that are enabled or a user interface.

  - *Non-database {{ site.data.product.title_short }} appliances*, which are standard appliances that contain a user interface and which have `evmserverd` processes that are enabled.

In this configuration, a failover monitor daemon is configured and running on each non-database {{ site.data.product.title_short }} appliance. The failover monitor watches the `repmgr` metadata about the database-only appliances present in the cluster. When the primary database-only appliance goes down, the non-database {{ site.data.product.title_short }} appliances start polling each of the configured standby database-only appliances to monitor which one comes up as the new primary. The promotion is orchestrated either by `repmgrd` on the database-only appliances or is done manually. When the non-database {{ site.data.product.title_short }} appliances find that a standby has been promoted, {{ site.data.product.title_short }} reconfigures the setup by writing the new IP address in the `database.yml` file to point to the new primary.

**Note:**

Manual steps are required to reintroduce the failed database node back as the standby server. See [Reintroducing the Failed Node](#reintroducing-the-failed-node).


Note, this procedure also does not provide scalability or a multi-master database setup. While a {{ site.data.product.title_short }} environment is comprised of an engine tier and a database tier, this configuration affects only the database tier and does not provide load balancing for the appliances.

### Requirements

For a high availability {{ site.data.product.title }} environment, you need a virtualization host containing at minimum four virtual machines with {{ site.data.product.title_short }} installed, consisting of:

  - One virtual machine for the primary external database containing a minimum of 4 GB dedicated disk space

  - One virtual machine for the standby external database containing a minimum of 4 GB dedicated disk space

  - Two virtual machines for the non-database {{ site.data.product.title_short }} appliances

The database-only appliances must reside on a highly reliable local network in the same location.

**Important:**

It is essential to use the same {{ site.data.product.title }} appliance template version to install each virtual machine in this environment.

Correct time synchronization is required before installing the cluster. After installing the appliances, configure time synchronization on all appliances by using `chronyd`.
