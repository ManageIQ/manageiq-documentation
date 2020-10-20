## Installing {{ site.data.product.title }}

Installing {{ site.data.product.title }} on Red Hat Virtualization consists of the
following steps:

1.  Downloading the appliance for your environment as a virtual machine
    image template.

2.  Uploading the appliance image to the Red Hat Virtualization data
    storage domain.

3.  Creating a virtual machine based on the appliance.

After you have completed all the procedures in this chapter, you will
have a working environment which you can further configure and
customize.

**Requirements.**

Uploading the {{ site.data.product.title_short }} appliance file to Red Hat
Virtualization requires:

  - 44 GB of storage space on both the export domain and the local
    partition where `/tmp` resides, as the `OVF` archive is locally
    expanded into that directory.

  - 12 GB RAM.

  - 4 vCPUs.

**Note:**

See [Creating a Virtual
Machine](https://access.redhat.com/documentation/en-us/red_hat_virtualization/4.2/html/virtual_machine_management_guide/chap-installing_linux_virtual_machines#Creating_a_virtual_machine_linux_vm)
in the Red Hat Virtualization *Virtual Machine Management Guide* for
information on specifying memory for a new virtual machine.

### Obtaining the Appliance

After the image completes downloading, you are ready to upload the
CloudForms appliance to your Red Hat Virtualization environment and
create a virtual machine.

### Uploading the Appliance to Red Hat Virtualization

Upload the `qcow2` appliance image to your Red Hat Virtualization data
storage domain from the Red Hat Virtualization Administration Portal.

  - You must configure the Image I/O Proxy when running `engine-setup`.
    See [Configuring the Red Hat Virtualization
    Manager](https://access.redhat.com/documentation/en-us/red_hat_virtualization/4.2/html/installation_guide/configuring_the_red_hat_virtualization_manager)
    in the *Red Hat Virtualization Installation Guide* for more
    information.

  - Internet Explorer 10, Firefox 35, or Chrome 13 or greater is
    required to perform this upload procedure. Previous browser versions
    do not support the required HTML5 APIs.

  - You must import the required certificate authority into the web
    browser used to access the Administration Portal.

**Note:**

To import the certificate authority, browse to
`https://<engine_address>/ovirt-engine/services/pki-resource?resource=ca-certificate&format=X509-PEM-CA`
and select all the trust settings. Refer to the instructions to install
the certificate authority in
[Firefox](https://access.redhat.com/solutions/95103), [Internet
Explorer](https://access.redhat.com/solutions/17864), or [Google
Chrome](https://access.redhat.com/solutions/1168383).

To upload the appliance:

1.  Log in to the Red Hat Virtualization Administration Portal.

2.  Click menu:Storage\[Disks\].

3.  Select menu:Upload\[Start\].

4.  Click **Choose File**, and select the appliance image to upload.

5.  Under **Disk Options**, enter an **Alias** for the image.

6.  (Optional) Edit other fields in **Disk Options** if desired.

7.  Click **OK**.

A progress bar in the **Status** column indicates the status of the
upload. You can also pause, cancel, or resume uploads from the
**Upload** menu.

The status shows **OK** when the image has completed uploading.

**Note:**

See the [Uploading Images to a Data Storage
Domain](https://access.redhat.com/documentation/en-us/red_hat_virtualization/4.2/html/administration_guide/sect-storage_tasks#Uploading_Images_to_a_Data_Storage_Domain)
in the *Red Hat Virtualization Administration Guide* for more
information.

1.  If the upload times out and you see the message, `Reason: timeout
    due to transfer inactivity`, increase the timeout value:

        # engine-config -s TransferImageClientInactivityTimeoutInSeconds=6000

2.  Restart the ovirt-engine service:

        # systemctl restart ovirt-engine

### Creating a {{ site.data.product.title_short }} Virtual Machine

After uploading the appliance to the data domain, create a virtual
machine containing the {{ site.data.product.title_short }} image and a second disk
for the database:

1.  In menu:Compute\[Virtual Machines\], click **New** to open the **New
    Virtual Machine** dialog.

2.  From the **General** tab, specify a name for the virtual machine and
    any other details.

3.  Click **Attach**.

4.  Select the {{ site.data.product.title_short }} appliance you uploaded from the
    list of images and click **OK**.

5.  Click the VM to open its details screen, and click the **Disks**
    tab.

6.  Click **Edit** to the disk, and check **Bootable** if it is not
    marked already.

7.  Click **OK**.

8.  Add a second disk for the database:

    1.  Click the **General** tab and click the **Edit** button to edit
        the virtual machine.

    2.  Click **+** and **Create** to create a disk for the database
        (VMDB).

    3.  Specify a **Size** in GB for the disk that allows sufficient
        space for your database. Red Hat recommends allocating the
        virtual machine disk fully at the time of creation. Three main
        factors affect the size of your database over time:

          - Virtual Machine Count: the most important factor in the
            calculation of virtual machine database (VMDB) size over
            time.

          - Host Count: the number of hosts associated with the
            provider.

          - Storage Count: the number of individual storage elements as
            seen from the perspective of the provider or host. It is not
            the total number of virtual disks for all virtual machines.

    4.  Set the **Allocation Policy** to `Preallocated` (thick
        provisioning) for best performance.

    5.  Specify any other values as desired.

9.  Click **OK** to create the disk and return to the **New Virtual
    Machine** window.

10. Add a network interface to the virtual machine by selecting a vNIC
    profile from the **nic1** list.

11. Click **OK** to save your changes to the virtual machine.

12. Start the {{ site.data.product.title_short }} appliance by clicking the **Run**
    button.

Your Red Hat Virtualization environment now contains a running
{{ site.data.product.title_short }} appliance.

Next, configure the database on the disk you created by following the
steps in [Configuring an Internal Database](#configuring-an-internal-database).
