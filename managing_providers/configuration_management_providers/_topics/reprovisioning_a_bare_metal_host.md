## Reprovisioning a Bare Metal Host

This procedure provides an example of reprovisioning an existing bare
metal system into a new hostgroup. For this example, your Red Hat
Satellite 6 environment requires the following:

  - An existing bare metal system stored as a host object in your Red
    Hat Satellite 6 server. This system can be one of the following:

      - A standalone system previously provisioned without a host group.

      - A system previously provisioned using a host group.

  - A target host group. This host group contains the system
    configuration to apply to the host when reprovisioning it. This
    includes:

      - A new operating system installation, including a new partition
        table.

      - A new networking configuration that the Red Hat Satellite 6
        server defines and manages.

      - Registration to any Red Hat subscriptions and repositories
        assigned to the host group.

      - Application of any Puppet modules assigned to the host group.

<!-- end list -->

1.  Browse to menu: **Configuration > Management**.

2.  Select **Configured Systems** from the accordion menu on the left.
    This displays the system list.

3.  Select one or more hosts to reprovision.

4.  Select menu:Lifecycle\[Provision Configured Systems\].

5.  Under the **Request** tab, enter the following details:

    1.  **E-Mail address**

    2.  **First Name**

    3.  **Last Name**

    4.  This form also contains optional fields for users to enter a
        plain text **Note** to inform {{ site.data.product.title_short }} administrators of
        any special details, and a field to provide a manager’s name in
        case administrators require approval from a user’s manager.

6.  Select the **Purpose** tab and select any {{ site.data.product.title_short }} policy
    tags that apply to the system.

7.  Select the **Catalog** tab. This screen displays the list of chosen
    machines to reprovision and their current details. Select a **target
    host group** from the **Configuration Profile** list.
    {{ site.data.product.title_short }} communicates with Red Hat Satellite to apply the
    configuration from this host group to the selected host and
    reprovision the system.

8.  Select the **Customize** tab. This screen displays some customizable
    fields for the selected system. You can change the **Root Password**
    or change the **Hostname** and **IP Address**. Note that these
    fields are optional, because the host group in Red Hat Satellite 6
    contains this information. The fields here will override the
    settings from the host group.

    <div class="important">

    Provisioning bare metal systems still requires access to the network
    that Red Hat Satellite 6 manages. This is because Red Hat Satellite
    controls PXE booting, kickstarts, and Puppet configuration for bare
    metal systems. Ensure the IP address you enter in {{ site.data.product.title_short }}
    can access a DHCP service that Red Hat Satellite 6 provides either
    through the main server or through a Red Hat Satellite 6 Capsule
    server.

    </div>

9.  Select the **Customize** tab. This screen allows you to either
    launch the provisioning process immediately on approval or using a
    schedule. Click **Schedule** to show the date and time fields used
    to schedule the provisioning.

10. Click **Submit**.

Depending on the request settings on your {{ site.data.product.title_short }} appliance,
this provisioning request might require approval from an administrator.
If not, the provisioning request launches depending on your choice for
the schedule.

**Note:**

Previously provisioned hosts might require manual selection of PXE boot
from the boot menu, otherwise they might boot to hard disk and not
reprovision.
