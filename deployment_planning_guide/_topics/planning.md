## Planning

This guide provides some general guidelines to planning a deployment on
{{ site.data.product.title }}. This includes creating multiple regions containing
{{ site.data.product.title }} appliances, CPU sizing recommendations, database sizing
recommendations, and database configuration.

### Regions

Regions are used for centralizing data which is collected from public
and private virtualization environments. A region is ultimately
represented as a single database for the VMDB. Regions are particularly
useful when multiple geographical locations need to be managed, as they
enable all the data collection to happen at each particular location and
avoid data collection traffic across slow links between networks.

When multiple regions are being used, each with their own unique ID, a
master region can be created to centralize the data of all the children
regions into a single master database. To do this, configure each child
region to replicate its data to the master region database (the
recommended region is 99, though any number up to three digits will
work). This parent and child region is a one-to-many relationship.

Regions can contain multiple zones, which in turn contain appliances.
Zones are used for further segregating network traffic along with
enabling failover configurations. Each appliance has the capability to
be configured for a number of specialized server roles. These roles are
limited to the zone containing the appliance they run on.

Only one failover type of each server role can run in a zone. If
multiple appliances have the same failover role, the extras are used as
backups that activate only if the primary appliance fails. Non-failover
server roles can run on multiple appliances simultaneously in a zone, so
resources can be adjusted according to the workload those roles are
responsible for.

The following diagram demonstrates an example of the multiple regions
working together in a {{ site.data.product.title }} environment.

![7151](../images/7151.png)

The master appliance is located in Chicago and contains a master region
and a subregion that manages the worker appliances. The Mahwah
technology center contains a single subregion that manages two zones.
Likewise, the San Diego technology center contains a single subregion
managing a single zone.

<div class="note">

  - Replicating a parent region to a higher-level parent is not
    supported.

  - Parent regions can be configured after the child regions are online.

</div>

The following diagram provides a closer look at a region:

![7150](../images/7150.png)

In this region, we have several {{ site.data.product.title }} appliances acting as UI
nodes and worker nodes. These worker nodes execute tasks on the
providers in your environment. The region also uses a region database
that reports to a master database on the main {{ site.data.product.title }} appliance.
All appliances can connect to the authentication services (Active
Directory, LDAP, Identity Management), outgoing mail (SMTP), and network
services (SNMP).

<div class="note">

{{ site.data.product.title_short }} can be configured in a highly available setup. In
this case, all PostgreSQL instances must be running on a server that is
deployed from the {{ site.data.product.title_short }} appliance. High availability is
achieved by database replication between two or more database servers.

</div>

### Roles

Server roles define what a server can do. Assigning different server
roles to appliances can allow them to focus on specific functions. When
planning a deployment, consider which roles to assign to each appliance.
Some server roles are enabled by default in {{ site.data.product.title_short }}. Many
server roles start worker processes.

Some roles are also dependent on other roles. For example, because the
{{ site.data.product.title_short }} user interface relies on the API for access, the
Web Services role must be enabled with the User Interface role for users
to log in to the appliance. See [Server
Roles](https://www.manageiq.org/docs/reference/latest/general_configuration/index.html#server-roles)
in *General Configuration* for details on each server role and its
function.

#### Appliance Types

Depending on the needs of your environment, you may choose to separate
worker and database tasks between appliances. One example of this is to
implement a highly available configuration so that certain appliances
are running the PostgreSQL database and providing failover. For more
details about configuring high availability, see the [*High Availability
Guide*](https://www.manageiq.org/docs/reference/latest/high_availability_guide/index.html).

The following provides a summary of types of appliances:

| Appliance Type                              | Database | Workers | Description                                                                                                                                                                                                                                                                                  |
| ------------------------------------------- | -------- | ------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| VMDB appliance                              | Yes      | Yes     | Worker processes are running, and it also hosts its own database that other appliances can connect to.                                                                                                                                                                                       |
| Non-database appliance                      | No       | Yes     | Worker processes are running on the appliance, but it does not host a database. The appliance is connected to an external database.                                                                                                                                                          |
| Dedicated-database appliance                | Yes      | No      | This appliance contains no worker processes, only a database for other appliances to connect to.                                                                                                                                                                                             |
| Non-{{ site.data.product.title_short }} VM with database | Yes      | No      | This appliance contains no worker processes, only a database. As this is not a {{ site.data.product.title_short }} appliance, you cannot run any {{ site.data.product.title_short }} `rake` tasks on it. This appliance must be migrated using a non-database appliance that is pointed at it, using it as a database. |

Appliance types

### Centralized Administration

{{ site.data.product.title }} includes centralized administration capabilities, where
certain operations can be initiated from the global region and processed
and executed on remote regions. From the global region, you can also
access the user interfaces of virtual machines residing in remote
regions.

The following life cycle management operations can be initiated from the
global region using centralized administration:

  - Virtual machine provisioning

  - Virtual machine power operations

  - Virtual machine retirement

  - Virtual machine reconfiguration

  - Service provisioning

  - Service retirement

  - Opening a virtual machine in the remote region

<div class="note">

{{ site.data.product.title_short }} life cycle operations other than those listed
above are not supported. Centralized administration capabilities are not
supported from the Self Service user interface.

</div>

With centralized administration, the remote\_queue\_put leverages a new
system-to-system REST API request to forward the original request to the
remote region. This request is put in the local queue in the remote
region, which is then delivered by a worker in the remote region as if
it was queued there all along. As a result, a {{ site.data.product.title_short }}
operator in the global region can be seen as provisioning on behalf of a
remote region.

![Centralized Administration Diagram](../images/centralized_admin.png)

<div class="note">

The operations initiated from the global region are subject to the
role-based access control (RBAC) rules on the remote region. The user in
the remote region which matches the logged-in user’s **user ID** will be
used to enforce RBAC in the target region. The operation will fail on
the remote system if the user does not have the required permissions.

</div>

### Tenancy

{{ site.data.product.title }} supports multitenancy. Tenants can be totally separate
or they can be in a parent-child or peer relationship. Tenants in a
relationship can share or inherit a certain configuration. You can
subdivide and create child tenants and they, in turn, can have child
tenants, and so on. The ability to have multi-level (nested) tenants in
a hierarchy enables those at the bottom to inherit permissions from
those above. This configuration allows for granular user permissions to
be set on specific tenants.

A tenant can also contain a self-contained child tenant known as a
'project'. A project cannot have a child tenant, but is useful for
allocating resources to a small group or team within a larger
organization.

<div class="note">

If you do not add any additional tenants, all resources and user
accounts are contained in a single base tenant which is your
{{ site.data.product.title_short }} appliance itself. In {{ site.data.product.title_short }}, is
sometimes referred as 'tenant zero'.

</div>

**Tenancy Account Roles.**

In {{ site.data.product.title_short }}, the following two account roles are
associated with tenancy:

  - Tenant administrator

  - Tenant quota administrator

<div class="important">

Tenant administrator and tenant quota administrator roles are like
administrator and super administrator. These roles are not limited to
the tenant upon which they are acting and act across all tenants, and
therefore should be considered privileged users. These are not roles
inside a tenant.

</div>

**Tenancy Models.**

The following two approaches exist for tenancy planning:

  - **Tenantless** - You can create a single large tenant, sometimes
    referred as 'tenant zero', and perform all your operations in there
    without any subdivision of resources or user accounts.

  - **Enterprise model** - A common scenario is to create a single
    tenant, and then subdivide it based on the structures or departments
    within your organization. Those departments are then able to further
    subdivide their resources into distinct projects. With this model,
    you have a single URL for user access, while still having the
    ability to divide resources into nested hierarchical tenants.

**Tenancy Configuration.**

You can create and configure tenancy using the {{ site.data.product.title_short }}
user interface in the same place you set up users, groups and roles by
selecting **Configuration** from the settings menu, and then clicking on
the **Access Control** accordion.

**Tenancy in Automation.**

One of the features of tenancy is that each tenant can have its own
automate domain. Tenant-based domains can help in several use cases,
such as if you have:

  - groups that need their own naming routines

  - varying types of approval needs

  - departments that use different end ticketing systems

  - a customer who is a holding company or centralized IT organization
    for managing different business units

Just like standard domains are nested, you can also add automate domains
that are nested at the tenant level.

**Tenancy Quota and Reporting.**

You can allocate and enforce quotas for the following attributes:

  - Virtual CPUs

  - Memory in GB

  - Storage in GB

  - Number of virtual machines

  - Number of templates

You can generate or schedule a report for **Tenant Quotas** similar to
other reports.

<div class="note">

Currently, in tenant quota reports you will see all of the tenants but
there is no nesting information available by parent and child tenants.

</div>

**Example:.**

In the following example of a tenant quota report, *DevOps Teams* is a
parent tenant and *Team Alpha* and *Team Bravo* are child tenants.

![tenant quotas report](../images/tenant-quotas-report.png)

  - Total Quota: Total quota enforced per attribute for a tenant

  - In Use: Amount of quota currently in use by tenants

  - Allocated: Amount of quota given to all child tenants

  - Available: *Total Quota* minus (-) *In Use* minus (-) *Allocated*

**Tenancy Chargeback.**

You have the ability to do tenancy in chargeback where you are able to
assign rates and have a different rate for each tenant. You can make use
of the default rate or create your own set of rates depending on the
tenant. As well, there is an ability to create chargeback reports by
tenant.

**Tenancy Service Catalogs.**

Similar to automate domains, you can have service catalogs at each level
of tenancy. Once you add a service catalog at a particular level of
tenancy, it is visible to that tenant and its children (unless you use
tagging to exclude).

**Tenancy Providers.**

Providers can be added at any level of tenancy. Once added, a provider
is visible to any child or lower tenants, making it possible to easily
separate resources that are owned or accessed by one group, and should
not be available to other tenants.

**Tenancy Relationships and Properties.**

The tenant summary page found in menu:Configuration\[Access Control \>
Tenants \> *Tenant*\] provides detailed information about the tenant and
its relationships including:

  - Catalog items and bundles

  - Automate domains

  - Provider relationships

### Using a Load Balancer

Deploying multiple user interface worker appliances and placing them
behind a third-party load balancer allows for redundancy and improved
performance. This requires extra configuration in both the load balancer
and in the {{ site.data.product.title_short }} user interface worker appliances.

#### Configuring the Load Balancer

  - Configure the load balancer to use sticky sessions. This ensures
    that when a session is started, all requests for that session are
    sent to the same worker appliance.

  - Configure the load balancer to test for connectivity using the
    {{ site.data.product.title_short }} ping response page:
    `https://appliance_name/ping`. The expected reply from the appliance
    is the text string *pong*. Using this URL is preferable to the
    appliance login URL as it does not establish a connection to the
    database.

#### Configuring Worker Appliances for Load Balancing

When using a load balancer, configure appliances that have the **User
Interface** role enabled to store session data in the database. As a
result, the user does not need to re-login if the load balancer
redirects them to an alternative server in the case the original user
interface worker is unresponsive.

On each appliance, configure the session data storage location using the
`session_store` parameter within the advanced settings page in the
{{ site.data.product.title_short }} user interface:

1.  Click ![config gear](../images/config-gear.png) (**Configuration**).

2.  Click the **Advanced** tab.

3.  Change the `session_store` parameter to `sql` in the following line
    (the default parameter is `cache`):

        :server:
        ...
         :session_store: sql

4.  Click **Save**.

<div class="important">

Configure the `session_store` parameter to point to `sql` on each user
interface appliance behind the load balancer.

</div>

### Database Configuration

This section describes the {{ site.data.product.title }} PostgreSQL database
configuration. The below table provides information on each file: its
location, primary function, and notes regarding behavior or
recommendations.

| File                    | Location                          | Description                                              | Note                                                                  |
| ----------------------- | --------------------------------- | -------------------------------------------------------- | --------------------------------------------------------------------- |
| `postgresql.conf`       | Data Directory                    | Default server configuration                             | Adds directive to include `/etc/manageiq/postgresql.conf.d` directory |
| `postgresql.auto.conf`  | Data Directory                    | Contains configuration set by the `ALTER SYSTEM` command | **Do not edit manually**                                              |
| `01_miq_overrides.conf` | `/etc/manageiq/postgresql.conf.d` | Contains {{ site.data.product.title_short }} default overrides        | Overwritten on upgrades                                               |
| \<other files\>         | `/etc/manageiq/postgresql.conf.d` | Contains user overrides                                  | Takes precedence if alphabetically after `01_miq_overrides.conf`      |

Database files

#### User Overrides

Store custom configurations, or user overrides, in
`/etc/manageiq/postgresql.conf.d`. Name the user override file so that
it follows `01_miq_overrides.conf` alphabetically. This ensures custom
configurations are not overwritten on {{ site.data.product.title_short }} upgrades.

The following file name example follows `01_miq_overrides.conf`
alphabetically in the `/etc/manageiq/postgresql.conf.d` directory:

**Example.**

    test_miq_overrides.conf

#### Reading Configuration Settings

Query the {{ site.data.product.title_short }} PostgreSQL database directly to read
configuration settings. See the [PostgreSQL
Documentation](https://www.postgresql.org/docs/9.5/index.html) for more
information.

The following example queries the {{ site.data.product.title_short }} for current
value set for `max_wal_senders`:

**Example.**

    `psql -d vmdb_production -c 'show max_wal_senders'
