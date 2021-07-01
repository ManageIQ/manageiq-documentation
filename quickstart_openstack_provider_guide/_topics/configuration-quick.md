After deploying the appliance, log in with the root password `smartvm`.
If you deployed the appliance as a virtual machine, you can log in
through `virsh`:

    [root@kvm-host ~]# virsh console my-cfme
    Connected to domain my-cfme
    ...
    Welcome to the CFME Virtual Appliance.

    You can browse to http://localhost.localdomain/

    Red Hat Enterprise Linux Server 7.2 (Maipo)
    Kernel 3.10.0-327.36.1.el7.x86_64 on an x86_64
    localhost login: root
    Password:
    Last login: Thu Oct 13 23:03:53 on tty2
    Welcome to the Appliance Console

    For a menu, please type: appliance_console
    [root@localhost ~]#

### Configuring General Appliance Settings

{% include configuration-advanced.md %}

### Configuring a Database for {{ site.data.product.title_short }}

{{ site.data.product.title_short }} supports the use of an internal or external database.
The following instructions are suitable for configuring an *internal*
database. For instructions on how to configure an external database
instead, see [Configuring an External
Database](https://access.redhat.com/documentation/en/red-hat-cloudforms/4.1/single/installing-red-hat-cloudforms-on-red-hat-enterprise-linux-openstack-platform#configuring_an_external_database).

{% include configuration-db.md %}

### Configuring General {{ site.data.product.title_short }} Settings

After configuring the general settings for the appliance and creating a
database for it, you can now launch {{ site.data.product.title_short }}. To do this, use the
**Start EVM Server Processes** option from the appliance console
([Configuring General Appliance
Settings](#configuring_general_appliance_settings)). Once you launch
{{ site.data.product.title_short }}, note the **Hostname** and **IP Address** displayed on
the appliance console screen.

Open the {{ site.data.product.title_short }} web-based user interface by accessing either
**Hostname** and **IP Address** on a web browser. At the login screen,
use the following credentials:

  - Username: **admin**

  - Password: **smartvm**

**Note:**

You can also change the password of the **admin** account from the login
screen. To do so, click the **Update Password** link.

You can access and configure most {{ site.data.product.title_short }} settings through the
**Configuration** menu. You can access this menu through **Administrator | EVM** > **Configuration**.

{% include configuration-gui.md %}

### Configuring {{ site.data.product.title_short }} Metrics for SmartState Analysis

You can also configure {{ site.data.product.title_short }} to perform a *SmartState
Analysis*. This type of analysis collects details such as accounts,
drivers, network information, hardware, and security patches on assets
managed by the OpenStack provider. Enabling SmartState Analysis involves
two steps:

1.  [Configuring {{ site.data.product.title_short }} Capacity and Utilization](#cf-caputils), and

2.  [Enabling SmartState Analysis](#cf-smartproxy)

These steps are required to allow {{ site.data.product.title_short }} to collect
metrics from OpenStack and use them to perform a SmartState analysis.
You can choose different servers to perform either function; the
following sections assume that you will.

#### Configuring {{ site.data.product.title_short }} Capacity and Utilization

{% include cap-util-note-metrics-collection.md %}

To enable these server roles:

{% include cap-util-assign-server-roles.md %}

For more information, see [Capacity and Utilization Collection](https://access.redhat.com/documentation/en/red-hat-cloudforms/4.1/deployment-planning-guide/#capacity_and_utilization_collection)
from the *Deployment Planning Guide*.

#### Enabling SmartState Analysis

{% include smartstate.md %}
