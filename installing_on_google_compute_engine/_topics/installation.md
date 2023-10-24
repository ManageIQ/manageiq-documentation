## Installing {{ site.data.product.title_short }}

Installing {{ site.data.product.title_short }} consists of the following steps:

1.  Downloading the appliance for your environment as a virtual machine
    image template.

2.  Setting up a virtual machine based on the appliance.

3.  Configuring the {{ site.data.product.title_short }} appliance.

After you have completed all the procedures in this guide, you will have
a working environment on which additional customizations and
configurations can be performed.

### Obtaining the Appliance

### Uploading the Appliance on Google Compute Engine

When the {{ site.data.product.title_short }} Google Compute Engine appliance has finished
downloading to your system, upload the appliance to Google Compute
Engine.

To upload the {{ site.data.product.title_short }} Google Compute Engine appliance file you
will need: \* 44 GB of storage space. \* 12 GB RAM. \* 4 vCPUs.

You can upload the appliance with the following steps:

1.  Log in to the Google Cloud Platform dashboard.

2.  Click **Home** in the top left of the screen.

3.  Click ![gce products services](../images/gce-products-services.png) to
    show the **Products and Services** menu. Click **Storage**.

4.  Create a bucket by clicking **Create Bucket**, and configure the
    following details:

    1.  Enter a unique **Name** for the bucket using lower case
        alphanumeric characters, hyphens, and/or underscores.

    2.  Configure your location from the dropdown list.

    3.  Click **Create**.

5.  Click **Upload Files** and browse to the location of the
    {{ site.data.product.title_short }} Google Compute Engine appliance you downloaded.
    Select the `tar.gz` file on your local machine, and click **Open**
    to begin the upload.

6.  When the upload is complete, click ![gce products
    services](../images/gce-products-services.png) **Products &
    services > Compute Engine** on the left menu.

7.  Create an image by clicking **Images** from the left menu, then
    **Create Image**. Fill in the following details about the image:

    1.  Enter a unique **Name** for the image using lower case
        alphanumeric characters and/or hyphens.

    2.  Add a **Description** if desired.

    3.  Configure **Encryption** if desired. This defaults to `Automatic
        (recommended)`.

    4.  In **Source**, use the dropdown to select `Cloud Storage file`.
        This shows the **Cloud Storage file** field.

    5.  In **Cloud Storage file**, click **Browse** to bring up the
        **Select object** window. Select the bucket containing the image
        you uploaded and click the **\>** symbol to locate the `tar.gz`
        image inside the bucket. Select the image and click **Select**.

    6.  Click **Create**. Creating the image will take a few minutes.
        When the image is created, the screen will refresh and the new
        image will appear in the **Images** list.

8.  Create a virtual machine instance by navigating to **VM
    instances > Create Instance**, and configure the following fields:

    1.  Enter a unique **Name** for the virtual machine instance using
        lower case alphanumeric characters and/or hyphens.

    2.  Select the **Zone** closest to your location.

    3.  Under **Boot disk**, click **Change** to bring up the **Boot
        disk** window. Click the **Your Image** tab and select the disk
        you previously created. Click **Select**.

    4.  Under **Firewall**, select the check box for **Allow HTTPS
        traffic**.

    5.  Click ![gce
        managementsshkeys](../images/gce-managementsshkeys.png)**Management,
        disk, networking, SSH keys**. Then, click the **SSH Keys** tab,
        add your entire SSH public key data in the **Username** box.

    6.  Configure any other fields as desired, and click **Create**.

Your new virtual machine instance, as well as the external IP address
for accessing the {{ site.data.product.title_short }} interface, appears under **VM
instances**.
