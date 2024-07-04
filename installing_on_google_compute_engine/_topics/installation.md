## Installing {{ site.data.product.title_short }}

Installing {{ site.data.product.title_short }} consists of the following steps:

1.  Downloading the appliance for your environment as a virtual machine
    image template.

2.  Setting up a virtual machine based on the appliance.

3.  Configuring the {{ site.data.product.title_short }} appliance.

After you complete all the listed preceding steps, you have
a working environment on which additional customizations and
configurations can be performed.

### Obtaining the Appliance

### Uploading the Appliance on Google Compute Engine

When the {{ site.data.product.title_short }} Google Compute Engine appliance is downloaded to your system, upload the appliance to Google Compute Engine.

To upload the {{ site.data.product.title_short }} Google Compute Engine appliance file, you need to satisfy the following requirements:
- 44 GB of storage space
- 12 GB RAM
- 4 vCPUs.

You can upload the appliance with the following steps:

1.  Log in to the Google Cloud Platform dashboard.

2.  Click **Home** located on the left of the screen.

3.  Click ![gce products services](../images/gce-products-services.png) to
    show the **Products and Services** menu. Click **Storage**.

4.  Create a bucket by clicking **Create Bucket**, and configure the
    following details:

    1.  Enter a unique **Name** for the bucket that uses lowercase
        alphanumeric characters, hyphens, and underscores.

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
    **Create Image**. Enter the following details about the image:

    1.  Enter a unique **Name** for the image that uses lowercase
        alphanumeric characters and hyphens.

    2.  Add a **Description**.

    3.  Configure **Encryption** if needed. The default value is set to `Automatic
        (recommended)`.

    4.  In **Source**, use the dropdown to select `Cloud Storage file`.
        This shows the **Cloud Storage file** field.

    5.  In **Cloud Storage file**, click **Browse** to open the
        **Select object** window. Select the bucket containing the image that you uploaded and click the **\>** symbol to locate the `tar.gz`
        image inside the bucket. Select the image and click **Select**.

    6.  Click **Create**. Creating an image can take a few minutes.
        When the image is created, the screen refreshes, and the new
        image appears in the **Images** list.

8.  Create a virtual machine instance by navigating to **VM
    instances > Create Instance**, and configure the following fields:

    1.  Enter a unique **Name** for the virtual machine instance that uses
        lowercase alphanumeric characters and hyphens.

    2.  Select the **Zone** closest to your location.

    3.  Under **Boot disk**, click **Change** to open the **Boot
        disk** window. Click the **Your Image** tab and select the disk that you previously created. Click **Select**.

    4.  Under **Firewall**, select the checkbox for **Allow HTTPS
        traffic**.

    5.  Click ![gce
        managementsshkeys](../images/gce-managementsshkeys.png)**Management,
        disk, networking, SSH keys**. Then, click the **SSH Keys** tab,
        add your entire SSH public key data in the **Username** box.

    6.  Configure any other fields as needed, and click **Create**.

Your new virtual machine instance and the external IP address
for accessing the {{ site.data.product.title_short }} interface appears under **VM instances**.
