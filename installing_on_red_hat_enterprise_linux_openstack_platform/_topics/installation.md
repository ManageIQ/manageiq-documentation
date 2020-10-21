## Installing {{ site.data.product.title }}

Installing {{ site.data.product.title }} consists of the following steps:

1.  Downloading the appliance for your environment as a virtual machine
    image template.

2.  Setting up a virtual machine based on the appliance.

3.  Configuring the {{ site.data.product.title_short }} appliance.

After you have completed all the procedures in this guide, you will have
a working environment on which additional customizations and
configurations can be performed.

### Obtaining the appliance

### Uploading the Appliance on OpenStack

Log in to your OpenStack dashboard to upload your {{ site.data.product.title }}
appliance.

1.  Log in to the OpenStack dashboard.

2.  In the **Project** tab, navigate to menu:Compute\[Images\].

3.  Click **Create Image**.

4.  In **Name**, enter a name for the image.

5.  From **Image Source** list, select **Image Location**. Note that
    currently only images available via an HTTP URL are supported.

6.  In **Image Location**, add an external (HTTP) URL to load the image
    from. For example, **<http://example.com/image.iso>**.

7.  From the **Format** list, select the image format. For example, `ISO
    - Optical Disk Image`.

8.  Specify the **Architecture**. For example, `i386` for a 32-bit
    architecture or `x86-64` for a 64-bit architecture.

9.  Leave the **Minimum Disk (GB)** and **Minimum RAM (MB)** fields
    empty.

10. Check the **Public** box to make the appliance available to all
    users.

11. Check the **Protected** box to protect the image from being
    accidentally deleted.

12. Click **Create Image**.

You have successfully uploaded the {{ site.data.product.title }} appliance.

The appliance image is placed in a queue to be uploaded. It may take
some time before the Status of the image changes from Queued to Active.

### Adding a Rule to a Security Group

Security groups specify what IP traffic is allowed to reach an instance
on its public IP address. Security group rules are processed before
network traffic reaches firewall rules defined within the guest itself.

**Note:**

In the default configuration, the default security group accepts all
connections from the default source; all instances within the default
group can talk to each other on any port.

1.  From the OpenStack dashboard, navigate to menu:Project\[Compute \>
    Access & Security\].

2.  Navigate to menu:Security Groups\[Manage Rules\] on the row for the
    default security group. ![7216](../images/7216.png)

3.  Click **Add Rule**. ![4941](../images/4941.png)

4.  Configure the rule.

    1.  Select menu:Rule\[Custom TCP Rule\].

    2.  Select menu:Direction\[Ingress\].

    3.  Select **Port** from the **Open Port** list.

    4.  Specify `443` in the **Port** field.

    5.  Select **CIDR** from the **Remote** list.

    6.  Specify `0.0.0.0/0` in the **CIDR** field.

    7.  Click **Add**.

### Creating a Custom Flavor

A flavor is a resource allocation profile that specifies, for example,
how many virtual CPUs and how much RAM can be allocated to an instance.
You can, for example, run {{ site.data.product.title }} on a Red Hat OpenStack
m1.large flavor, which specifies a virtual machine with 4 cores, 12 GB
RAM, and 80 GB disk space. Creating a flavor to run {{ site.data.product.title }} is
optional.

The following procedure demonstrates creating a flavor with the minimum
requirements (4 cores, 12 GB RAM, 44 GB disk space) for {{ site.data.product.title }}.
For more information about flavors, see the Red Hat OpenStack Platform
Administration User Guide.

1.  Log in to the OpenStack dashboard as admin.

2.  In the **Admin** tab, navigate to menu:System\[Flavors\].

3.  Click **Create Flavor** to display the **Create Flavor** dialog.

4.  Configure the settings to define a flavor that meets {{ site.data.product.title }}
    system requirements.

    1.  Enter a name for the flavor.

    2.  Enter the following settings:

          - **VCPUs**: 4

          - **RAM MB**: 12288

          - **Root Disk GB**: 70

          - **Ephemeral Disk GB**: 0

          - **Swap Disk MB**: 0

5.  Click **Create Flavor**.

A new flavor specific to {{ site.data.product.title }} is created.

### Launching the Instance

1.  From the OpenStack dashboard, navigate to menu:Project\[Compute \>
    Instances\].

2.  Click **Launch Instance**.

3.  Enter a name for the instance.

4.  Select the custom flavor for your instance. The flavor selection
    determines the computing resources available to your instance. The
    resources used by the flavor are displayed in the **Flavor Details**
    pane.

5.  Enter **1** in the **Instance Count** field.

6.  Select a boot option from the **Instance Boot Source** list:

      - **Boot from image** - displays a new field for **Image Name**.
        Select the image from the drop-down list.

      - **Boot from snapshot** - displays a new field for **Instance
        Snapshot**. Select the snapshot from the drop-down list.

      - **Boot from volume** - displays a new field for **Volume**.
        Select the volume from the drop-down list.

      - **Boot from image (creates a new volume)** - boot from an image
        and create a volume by choosing **Device Size** and **Device
        Name** for your volume. Some volumes can be persistent. To
        ensure the volume is deleted when the instance is deleted,
        select **Delete on Terminate**.

      - **Boot from volume snapshot (creates a new volume)** - boot from
        volume snapshot and create a new volume by choosing **Volume
        Snapshot** from the drop-down list and adding a **Device Name**
        for your volume. Some volumes can be persistent. To ensure the
        volume is deleted when the instance is deleted, select **Delete
        on Terminate**.

7.  Click **Networking** and select a network for the instance by
    clicking the **+** (plus) button for the network from **Available
    Networks**.

8.  Click **Launch**.

### Adding a Floating IP Address

When you create an instance, Red Hat OpenStack Platform automatically
assigns it a fixed IP address in the network to which the instance
belongs. This IP address is permanently associated with the instance
until the instance is terminated.

In addition to the fixed address, you can also assign a floating IP
address to an instance. Unlike fixed IP addresses, you can modify
floating IP addresses associations at any time, regardless of the state
of the instances involved.

1.  At the command-line on your RHEL OpenStack Platform host, create a
    pool of floating IP addresses using the `nova-manage floating
    create` command. Replace **IP\_BLOCK** with the desired block of IP
    addresses expressed in CIDR notation.

        $ nova-manage floating create IP_BLOCK

2.  In the **Project** tab, navigate to menu:Compute\[Access &
    Security\].

3.  Click menu:Floating IPs\[Allocate IP To Project\]. The **Allocate
    Floating IP** window is displayed. ![7218](../images/7218.png)

4.  Click **Allocate IP** to allocate a floating IP from the pool. The
    allocated IP address appears in the **Floating IPs** table.

5.  Select the newly allocated IP address from the **Floating IPs**
    table. Click **Associate** to assign the IP address to a specific
    instance. ![7217](../images/7217.png)

6.  Select an instance with which to associate the floating IP Address.

7.  Click **Associate** to associate the IP address with the selected
    instance.

**Note:**

To disassociate a floating IP address from an instance when it is no
longer required, click **Release Floating IPs**.
