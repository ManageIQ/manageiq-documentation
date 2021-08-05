# Instance live Migration

*Live migration* involves moving a live instance between Compute nodes.
Live migration is useful for avoiding instance downtime during cloud
maintenance or load management. See [How to Migrate a Live
Instance](https://access.redhat.com/documentation/en/red-hat-openstack-platform/version-8/migrating-instances/#how_to_migrate_a_live_instance)
in the Red Hat OpenStack Platform *Migrating Instances* guide for
details on the underlying OpenStack process.

To migrate a live instance:

1. Browse to menu: **Compute > Clouds > Instances**.

2. On the right pane, click the instance to be migrated. Use the
    **Instances by Provider** accordion to filter instances by provider
    and/or availability zone.

3. Click ![2007](../images/2007.png) **Lifecycle**, then
    ![2097](../images/2097.png) **Migrate selected Instance**.

4. On the **Migrate Instance** section, select your preferred migration
    options:

      - **Auto-select Host?**: let the OpenStack provider automatically
        choose a destination Compute node. If you prefer to choose a
        specific node, uncheck this option and choose from the
        **Destination Host** dropdown.

      - **Block Migration**: check this option to perform a
        *block-based* migration. With this migration, the entire virtual
        machine image is moved from the source node to the destination
        node. If your OpenStack provider uses *shared storage*, leave
        this option unchecked. See
        [Prerequisites](https://access.redhat.com/documentation/en/red-hat-openstack-platform/version-8/migrating-instances/#prerequisites)
        in the Red Hat OpenStack Platform *Migrating Instances* guide
        for related information.

      - **Disk Over Commit**: check this option to prevent the OpenStack
        provider from verifying first whether the destination host has
        available disk space to host the instance.

5. Click **Submit**.

Once the migration initiates, the instance list will reload with a
message indicating that the selected instance is being migrated. Upon
completion, the instance list will reload and the evacuated instance
will be displayed as ![2143](../images/2143.png) **On**.
