Through {{ site.data.product.title }}, you can perform a *Compute scale down* on a Red
Hat OpenStack infrastructure provider. This process involves decreasing
its Compute nodes used by an OpenStack infrastructure provider. Doing so
involves putting a Compute node into *maintenance mode* and removing it
from the provider afterwards. Once a node is in maintenance mode, it can
be repurposed (for examle, re-provision it as a Controller node),
repaired, or decommissioned altogether.

Before scaling down, evacuate or migrate any instances hosted on the node you are removing. For instructions on either procedure, see [Migrating a Live Instance](#_to_live_migrate_an_instance) or
[Evacuating an Instance](#_to_evacuate_an_instance).

After migrating or evacuating instances from the node, set the node to maintenance mode. To do so:

1.  Navigate to menu:Compute\[Infrastructure \> Hosts\].

2.  Click the OpenStack compute node to be removed from the provider.

3.  Click ![1847](../images/1847.png) (**Configuration**), and then
    ![1851](../images/1851.png) (**Toggle Maintenance Mode**).

    **Note:**

    This option can only be used with OpenStack providers with at least
    two Compute nodes.

Repeat this procedure for every node you want to remove from the cloud provider.

After setting a Compute node to maintenance mode, you can scale down its provider:

1.  Navigate to menu:Compute\[Infrastructure \> Providers\].

2.  Click the provider to be scaled down.

3.  Click ![1847](../images/1847.png) (**Configuration**), and then
    ![1851](../images/1851.png) (**Scale Down**).

4.  From the **Scale Infrastructure Provider Down** section, check the
    nodes to be removed from the provider. You can only do this for
    nodes where **Maintenance** is set to **true**.

5.  Click **Scale Down**.
