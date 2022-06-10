## Capacity Planning

### Capacity and Utilization Collection

{{ site.data.product.title_short }} server can collect and analyze capacity and utilization data from your virtual infrastructure. Use this data to understand the limitations of your current environment and plan for growth.

For some capacity and utilization data, {{ site.data.product.title_short }} calculates and shows trend lines in the charts. Trend lines are created by using linear regression, which is calculated by using the capacity and utilization data that is collected by {{ site.data.product.title_short }} during the interval you specify for the chart. The more data that you have the better the predictive value of the trend line.

Three server roles are associated with the collection and metric creation of capacity and utilization.

  - The Capacity & Utilization Coordinator role checks to see whether it is time to collect data, somewhat like a scheduler. If it is time, a job is queued for the Capacity & Utilization Data Collector. The Coordinator role is required to complete capacity and utilization data collection. If more than one server in a specific zone has this role, only one is active at a time.

  - The Capacity & Utilization Data Collector performs the actual collection of capacity and utilization data. This role has a dedicated worker, and there can be more than one server with this role in a zone.

  - The Capacity & Utilization Data Processor processes all of the data that is collected, allowing {{ site.data.product.title_short }} to create charts. This role has a dedicated worker, and there can be more than one server with this role in a zone.

### Assigning the Capacity and Utilization Server Roles

{% include cap-util-assign-server-roles.md %}

**Note:**

In addition to setting the server role, you must also select which
clusters and data stores to collect data for. For more information, see the **General Configuration** guide. You must have super administrator privileges to edit these settings.

### Adding Database Credentials for Data Collection

After you create the new user, add the user’s credentials to the settings for the provider.

1. From menu: **Compute > Infrastructure > Providers**, select an
    infrastructure provider to update its settings.

2. Click ![1847](../images/1847.png)**Configuration**, and then
    ![1851](../images/1851.png)**Edit Selected Infrastructure Provider**.

3. In the **Credentials** area, click **C & U Database**.

4. Type in the credentials for the new database user you created.

5. Click **Save**.

6. Restart the Capacity and Utilization Data Collector.

### Data Collection for Red Hat Virtualization

To collect capacity and utilization data for Red Hat Virtualization (RHV), you must add a user to the RHV-M history database for {{ site.data.product.title_short }} to use.

Perform this procedure on the PostgreSQL server where the history
database (ovirt\_engine\_history) is located. Usually, this is the RHV-M server.

1. Using SSH, access the RHV-M database server as the root user:

        $ ssh root@example.postgres.server

2. Switch to the postgres user:

        # su - postgres

    <div class="important">

    For RHV 4.2, the PostgreSQL database is delivered as a software collection in version 9.5 and must be enabled first. Therefore, to run the following psql commands, you need to enable the *rh-postgresql95* collection and load into the current shell prompt by using the source command:

    $ source /opt/rh/rh-postgresql95/enable

    </div>

3. Create the user for {{ site.data.product.title_short }} to be granted read-only access to the history database:

        $ psql -U postgres -c "CREATE ROLE example_role_name WITH LOGIN ENCRYPTED PASSWORD '[password]';" -d ovirt_engine_history

4. Grant the newly created user permission to connect to the history
    database:

        $ psql -U postgres -c "GRANT CONNECT ON DATABASE ovirt_engine_history TO example_role_name;"

5. Grant the newly created user usage of the public schema:

        $ psql -U postgres -c "GRANT USAGE ON SCHEMA public TO example_role_name;" ovirt_engine_history

6. Generate the rest of the permissions that will be granted to the newly created user and save them to a file:

        $ psql -U postgres -c "SELECT 'GRANT SELECT ON ' || relname || ' TO example_role_name;' FROM pg_class JOIN pg_namespace ON pg_namespace.oid = pg_class.relnamespace WHERE nspname = 'public' AND relkind IN ('r', 'v', 'S');" --pset=tuples_only=on  ovirt_engine_history > grant.sql

7. Use the file that you created in the previous step to grant permissions to the newly created user:

        $ psql -U postgres -f grant.sql ovirt_engine_history

8. Remove the file that you used to grant permissions to the newly created user:

        $ rm grant.sql

9. Exit to the RHV-M database server prompt:

        $ exit

10. Update the server’s firewall to accept TCP communication on port 5432:

        # firewall-cmd --add-port=5432/tcp --permanent

11. Enable external md5 authentication.

    1. For RHV 4.0, 4.1, and 4.4 update the following line in
        `/var/lib/pgsql/data/pg_hba.conf`:

            host    all      all    0.0.0.0/0     md5

    2. For RHV 4.2, update the following line in
        `/var/opt/rh/rh-postgresql95/lib/pgsql/data/pg_hba.conf`:

            host    all      all    0.0.0.0/0     md5

12. Enable PostgreSQL to listen for remote connections.

    1. For RHV 4.0, 4.1, and 4.4 ensure the `listen_addresses` line in `/var/lib/pgsql/data/postgresql.conf` matches the following example:

            listen_addresses  =  '*'

    2. For RHV 4.2, ensure the `listen_addresses` line in
        `/var/opt/rh/rh-postgresql95/lib/pgsql/data/postgresql.conf` matches the following example:

            listen_addresses  =  '*'

13. Reload the PostgreSQL configuration.

    1. For RHV 4.0, 4.1, and 4.4:

            # systemctl reload postgresql

    2. For RHV 4.2:

            # systemctl reload rh-postgresql95-postgresql

### Data Collection for Red Hat Enterprise Linux OpenStack Platform

Before you can collect data from a Red Hat Enterprise Linux OpenStack Platform (RHEL-OSP) provider, you must install Ceilometer and configure it to accept queries from external systems.

These instructions require a Red Hat Enterprise Linux 6.4 @base
installation of RHEL-OSP and registration to a satellite that has access to both the `RHEL-OSP` and `RHEL Server Optional` channels. Perform all steps on your RHEL-OSP system.

1. Add the required channels and update your system:

        # rhn-channel --add -c rhel-x86_64-server-6-ost-3 -c rhel-x86_64-server-optional-6
        # yum update -y
        # reboot

2. Install `Ceilometer`:

        # yum install *ceilometer*

3. Install and start the MongoDB store:

        # yum install mongodb-server
        # sed -i '/--smallfiles/!s/OPTIONS=\"/OPTIONS=\"--smallfiles /' /etc/sysconfig/mongod
        # service mongod start

4. Create the following users and roles:

        # SERVICE_TENANT=$(keystone tenant-list | grep services | awk '{print $2}')
        # ADMIN_ROLE=$(keystone role-list | grep ' admin ' | awk '{print $2}')
        # SERVICE_PASSWORD=servicepass
        # CEILOMETER_USER=$(keystone user-create --name=ceilometer \
        --pass="$SERVICE_PASSWORD" \
        --tenant_id $SERVICE_TENANT \
        --email=ceilometer@example.com | awk '/ id / {print $4}')
        # RESELLER_ROLE=$(keystone role-create --name=ResellerAdmin | awk '/ id / {print $4}')
        # ADMIN_ROLE=$(keystone role-list | awk '/ admin / {print $2}')
        # for role in $RESELLER_ROLE $ADMIN_ROLE ; do
        keystone user-role-add --tenant_id $SERVICE_TENANT \
        --user_id $CEILOMETER_USER --role_id $role
        done

5. Configure the authtoken in `ceilometer.conf`:

        # openstack-config --set /etc/ceilometer/ceilometer.conf keystone_authtoken auth_host 127.0.0.1
        # openstack-config --set /etc/ceilometer/ceilometer.conf keystone_authtoken auth_port 35357
        # openstack-config --set /etc/ceilometer/ceilometer.conf keystone_authtoken auth_protocol http
        # openstack-config --set /etc/ceilometer/ceilometer.conf keystone_authtoken admin_tenant_name services
        # openstack-config --set /etc/ceilometer/ceilometer.conf keystone_authtoken admin_user ceilometer
        # openstack-config --set /etc/ceilometer/ceilometer.conf keystone_authtoken admin_password $SERVICE_PASSWORD

6. Configure the user credentials in `ceilometer.conf`:

        # openstack-config --set /etc/ceilometer/ceilometer.conf DEFAULT os_auth_url http://127.0.0.1:35357/v2.0
        # openstack-config --set /etc/ceilometer/ceilometer.conf DEFAULT os_tenant_name services
        # openstack-config --set /etc/ceilometer/ceilometer.conf DEFAULT os_password $SERVICE_PASSWORD
        # openstack-config --set /etc/ceilometer/ceilometer.conf DEFAULT os_username ceilometer

7. Start the Ceilometer services:

        # for svc in compute central collector api ; do
          service openstack-ceilometer-$svc start
          done

8. Register an endpoint with the service catalog. Replace
    `$EXTERNALIFACE` with the IP address of your external interface:

        # keystone service-create --name=ceilometer \
        --type=metering --description="Ceilometer Service"
        # CEILOMETER_SERVICE=$(keystone service-list | awk '/ceilometer/ {print $2}')
        # keystone endpoint-create \
        --region RegionOne \
        --service_id $CEILOMETER_SERVICE \
        --publicurl "http://$EXTERNALIFACE:8777/" \
        --adminurl "http://$EXTERNALIFACE:8777/" \
        --internalurl "http://localhost:8777/"

9. Enable access to Ceilometer from external systems:

        # iptables -I INPUT -p tcp -m multiport --dports 8777 -m comment --comment "001 ceilometer incoming" -j ACCEPT
        # iptables save

10. Confirm the status of OpenStack and the Ceilometer services:

        # openstack-status
        # for svc in compute central collector api ; do
          service openstack-ceilometer-$svc status
          done

11. Verify that Ceilometer is working correctly by authenticating as a user with running instances, for example `admin`. Pipe the sample for the CPU meter to count lines, and confirm that the value changes according to the interval specified in `/etc/ceilometer/pipeline.yaml`. The default interval is 600 seconds.

        # . ~/keystonerc_admin
        # ceilometer sample-list -m cpu |wc -l

12. Add the configured OpenStack provider to {{ site.data.product.title_short }}. See After adding the provider, capacity, and utilization data for your instances populate in a few minutes.

### Capacity and Utilization Data Collected

{{ site.data.product.title_short }} generates charts from the collected data that can be used to plan your hardware and virtual machine needs. Depending on the type of data, these charts can include lines for averages, maximums, minimums, and trends.

**Note:**

For reporting of daily capacity and utilization data, incomplete days (days with less than 24 hourly data points from midnight to midnight) that are at the beginning or end of the requested interval are excluded. Days with less than 24 hourly data points would be inaccurate and including them would skew trend lines. Therefore, at least one full day of hourly data from midnight to midnight is necessary for displaying the capacity and utilization charts under the menu: **Compute > Infrastructure** tab.

#### Capacity and Utilization Charts for Hosts, Clusters, and Virtual Machines

| Resource Type   | CPU Usage | CPU States | Disk I/O | Memory Usage | Network I/O | Running VMS | Running Hosts |
| --------------- | --------- | ---------- | -------- | ------------ | ----------- | ----------- | ------------- |
| Host            | Y         | Y          | Y        | Y            | Y           | Y           | NA            |
| Cluster         | Y         | Y          | Y        | Y            | Y           | Y           | Y             |
| Virtual Machine | Y         | Y          | Y        | Y            | Y           | NA          | NA            |

Capacity and Utilization Charts for Hosts, Clusters, and Virtual
Machines

#### Capacity and Utilization Charts for Datastores

Charts that are created include:

| Space by VM Type     | Virtual Machines and Hosts |
| -------------------- | -------------------------- |
| Used Space           | Number of VMs by Type      |
| Disk files Space     | Hosts                      |
| Snapshot Files Space | Virtual Machines           |
| Memory Files Space   |                            |
| Non-VM Files         |                            |
| Used Disk Space      |                            |

Capacity and Utilization Charts for Datastores

### Capacity and Utilization Chart Features

Capacity and utilization charts for host, clusters, virtual machines, and datastore provides its own set of special features that include zooming in on a chart and shortcut menus.

#### Zooming into a Chart

1. Browse to the chart you want to zoom. If you hover anywhere on the chart, two dashed lines appear to target a coordinate of the chart.

2. Click ![2251](../images/2251.png)(**Click to zoom in**) in the lower left corner of the chart to zoom into it.

3. To go back to the regular view click ![2252](../images/2252.png)(**Click to zoom out**) on the enlarged chart.

#### Drilling into Chart Data

1. Browse to the chart you want to get more detail from.

2. Hover over a data point to see the coordinates.

3. Click a data point to open a shortcut menu for the chart. In this example, you can use the shortcut menu to go to the hourly chart or display the virtual machines that were running at the time the data was captured.

      - If you are viewing the **CPU**, **Disk**, **Memory**, or **Network** charts, selecting from the **Chart** option will change all of the charts on the page to the new interval selected.

      - If you are viewing the **CPU**, **Disk**, **Memory**, or **Network** charts, selecting from the **Display** option will allow you to drill into the virtual machines or **Hosts** that were running at the time.

      - If you are viewing the **VM** or **Hosts** chart, the **Display** menu allows you to view running or stopped virtual machines. The time of the data point will be displayed in addition to the virtual machines that apply. From here, click a virtual machine to view its details.

### Planning Where to Put a New Virtual Machine

You can use the data that is collected in the VMDB to plan where you can put more virtual machines. With {{ site.data.product.title_short }}, you can use a reference virtual machine as an example to plan on which hosts and clusters you can place a new virtual machine.

** Note:** For more information about utilization trends and identifying bottlenecks in your environment, see [Data Optimization](../managing_infrastructure_and_inventory/index.html#data-optimization) in Managing Infrastructure and Inventory.

1. Browse to **Optimize > Planning**.
2. From **Reference VM Selection**, use the drop-down menu to select the virtual machine that is most like the one that you want to add.

   ![2254](../images/2254.png)

3. Select the required VM Options for what you want to base the calculations on.

   ![2255](../images/2255.png)

   From the **Source** list, select the type of data to use as the source for your projections. For example, select **Allocation** to calculate based on the current allocation values of each resource (CPU, memory, or disk space) for the reference virtual machine. Use **Reservation** to project based on the current guaranteed value of the specific resource (CPU Speed, CPU count, memory, or disk space) although that amount might not be allocated to the virtual machine at a specific moment in time. Select **Usage** if you want to calculate based on usage history of the reference virtual machine. Use **Manual Input** to enter your own set of parameters for each resource.

4. From **Target Options / Limits**, select if you want to use clusters or hosts as your targets.
      
   ![2256](../images/2256.png)

   Also, select the limit of how high the projection can go for CPU, memory, and datastore space. If you are targeting hosts, you are able to select a filter for which hosts can be targets. 
5. From Trend Options, select how far back you want to use the trend data for, a Time Profile and Time Zone if applicable. Note that Time Profile will only show if the logged on user has a Time Profile available.
6. Click Submit.

The **Summary** tab shows the best clusters or hosts on which to place the virtual machines. The **Report** tab shows the best fit and statistics on the reference virtual machine in a tabular format. From the **Report** tab, you can also create a PDF of the report or download the data in `txt` or `csv` format. 
