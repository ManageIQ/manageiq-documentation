## Installing {{ site.data.product.title_short }}

Installing {{ site.data.product.title_short }} consists of the following steps:

1.  Downloading the appliance for your environment as a virtual machine
    image template.

2.  Setting up a virtual machine based on the appliance.

3.  Configuring the {{ site.data.product.title_short }} appliance.

After you have completed all the procedures in this guide, you will have
a working environment on which additional customizations and
configurations can be performed.

### Obtaining the appliance

### Uploading the Appliance on VMware vSphere

Uploading the {{ site.data.product.title_short }} appliance file onto VMware vSphere systems
has the following requirements:

  - 44 GB of space on the chosen vSphere datastore.

  - 12 GB RAM.

  - 4 VCPUs.

  - Administrator access to the vSphere Client.

  - Depending on your infrastructure, allow time for the upload.

**Note:**

These are the procedural steps as of the time of writing. For more
information, consult the VMware documentation.

Use the following procedure to upload the {{ site.data.product.title_short }} appliance OVF template from your local file system using the vSphere Client.

1.  In the vSphere Client, select menu:File\[Deploy OVF Template\]. The
    Deploy OVF Template wizard appears.

2.  Specify the source location and click **Next**.

      - Select **Deploy from File** to browse your file system for the
        OVF template, for example `manageiq-vsphere-ivanchuk-4.ova`.

      - Select **Deploy from URL** to specify a URL to an OVF template
        located on the internet.

3.  View the **OVF Template Details** page and click **Next**.

4.  Select the deployment configuration from the drop-down menu and
    click **Next**. The option selected typically controls the memory
    settings, number of CPUs and reservations, and application-level
    configuration parameters.

5.  Select the host or cluster on which you want to deploy the OVF
    template and click **Next**.

6.  Select the host on which you want to run the run the {{ site.data.product.title_short }}
    appliance, and click **Next**.

7.  Browse to, and select the resource pool where you want to run the
    {{ site.data.product.title_short }} appliance and click **Next**.

8.  Select a datastore to store the deployed {{ site.data.product.title_short }} appliance,
    and click Next. Ensure to select a datastore large enough to
    accommodate the virtual machine and all of its virtual disk files.

9.  Select the disk format to store the virtual machine virtual disks,
    and click **Next**.

      - Select **Thin Provisioned** if the storage is allocated on
        demand as data is written to the virtual disks.

      - Select **Thick Provisioned** if all storage is immediately
        allocated.

10. For each network specified in the OVF template, select a network by
    right-clicking the **Destination Network** column in your
    infrastructure to set up the network mapping and click **Next**.

11. The **IP Allocation** page does not require any configuration
    changes. Leave the default settings in the **IP Allocation** page
    and click **Next**.

12. Set the user-configurable properties and click **Next**. The
    properties to enter depend on the selected IP allocation scheme. For
    example, you are prompted for IP related information for the
    deployed virtual machines only in the case of a fixed IP allocation
    scheme.

13. Review your settings and click **Finish**.

The progress of the import task appears in the vSphere Client Status
panel.
