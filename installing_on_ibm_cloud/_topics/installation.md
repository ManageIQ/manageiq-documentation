## Installing {{ site.data.product.title }}

Installing {{ site.data.product.title }} consists of the following steps:

1.  Downloading the appliance for your environment as a virtual machine image template.

2.  Setting up a virtual machine based on the appliance.

3.  Configuring the {{ site.data.product.title_short }} appliance.

After you have completed all the procedures in this guide, you will have a working environment on which additional customizations and configurations can be performed.

### Obtaining the {{ site.data.product.title }} Virtual Appliance

### Uploading and Provisioning the {{ site.data.product.title }} Virtual Appliance in IBM Cloud

To upload the {{ site.data.product.title }} appliance file in IBM Cloud, ensure the following requirements are met:

  - Approximately 2 GB of space for each image; 44+ GB of space, 12 GB RAM, and 4 VCPUs for the {{ site.data.product.title }} appliance.

  - You must have an IBM Cloud user account with the following roles: 
![Figure showing the required roles for an IBM Cloud user account.](../images/required_roles.png){: caption="Figure 1. Required roles for IBM Cloud user account" caption-side="bottom"}

  - Depending on your infrastructure, allow time for the upload.

### Step A. Setting up the Custom image for {{ site.data.product.title }} in IBM Cloud
{: #config-image}

Create a custom Linux-based image to deploy {{ site.data.product.title }} as a virtual server instance in IBM Cloud.

1. If you don't already have an instance of IBM Cloud Object Storage, see [Getting started with IBM Cloud Object Storage](https://cloud.ibm.com/docs/services/cloud-object-storage?topic=cloud-object-storage-getting-started)

    ![Figure showing example Cloud Object Storage created.](../images/cloud_object_storage.png){: caption="Figure 2. Example Cloud Object Storage created" caption-side="bottom"}

    You must also create a bucket in IBM Cloud Object Storage to store your images.
    ![Figure showing example standard type bucket created.](../images/buckets.png){: caption="Figure 3. Example Standard type bucket created" caption-side="bottom"}


2. Upload the {{ site.data.product.title }} installation image (file name: `cfme-rhos-5.11.4.x86_64.qcow2`) to your IBM Cloud Object Storage. Select your bucket and click Add Objects to upload the images. For more information, see [Uploading data by using the console](https://cloud.ibm.com/docs/services/cloud-object-storage?topic=cloud-object-storage-upload#upload-console). **Note:** You can use the Aspera high-speed transfer plug-in to upload images larger than 200 MB.  
![Figure showing example that uses Aspera uploaded file to bucket.](../images/upload_images_to_bucket.png){: caption="Figure 4. Example using Aspera uploaded file to bucket" caption-side="bottom"}

3. From IBM Cloud Identity and Access Management (IAM), create an authorization between the Virtual Private Cloud (VPC) Infrastructure (source service) > Image Service for VPC (resource type) and Cloud Object Storage (target service). For more information, see [Create an authorization](https://cloud.ibm.com/docs/iam?topic=iam-serviceauth#serviceauth).
    
    **Important**: The configuration must be set up as this example or permissions can fail. 
    ![Figure showing example IAM authorization.](../images/service_auth_vpc.png){: caption="Figure 5. Example IAM authorization" caption-side="bottom"}

4. Create a generation 2 Virtual Private Cloud (**Must be generation 2**). For more information, see [Create a VPC](https://cloud.ibm.com/docs/vpc?topic=vpc-getting-started#create-and-configure-vpc)
  
    a. Create a VPC - The VPC must be in the same resource group and region as your bucket.

    b. Create subnets in one or more zones. You can create subnets in suggested prefix ranges or in your own IP ranges that you bring to IBM Cloud.

    c. Attach a public gateway if you want to allow all resources in a subnet to communicate with the public internet.

    ![Figure showing example VPC.](../images/service_auth_vpc.png){: caption="Figure 6. Example VPC" caption-side="bottom"}

5. Configure an access control list (ACL) to limit the subnet's inbound and outbound traffic.

    ![Figure showing example ACL.](../images/config_ACL.png){: caption="Figure 7. Example ACL" caption-side="bottom"}

6. Import the {{ site.data.product.title }} installation images from the bucket into the VPC.
  
    a. Browse to **VPC Infrastructure** > **Compute** > **Custom images** and select **import custom image**.

    b. Enter a name.

    c. Select a resource group.

    d. Select the region.

    ![Figure showing importing of custom image.](../images/import_custom_image.png){: caption="Figure 8. Example import of custom image" caption-side="bottom"}

    e. Select your Cloud Object Storage and bucket based on your authorization that is created in step 3.

    f. Select your qcow2 image (custom image).

    g. Select the Red Hat Enterprise for Operating system.

    h. Click **Import custom image**.

    ![Figure showing example of custom image imported.](../images/select_qcow2_image.png){: caption="Figure 9. Example of custom image imported" caption-side="bottom"}

    ![Figure showing example of custom image listing after successful image creation.](../images/results_vpc_images.png){: caption="Figure 10. Example of custom image listing after successful image creation" caption-side="bottom"}

7. Create a virtual server from the custom image by clicking the "three dot menu" of that image, then selecting "New virtual server".
![Figure showing select three dot menu for New virtual server.](../images/select_new_server.png){: caption="Figure 11. Select New virtual server from the three dot menu" caption-side="bottom"}
  
   a. Enter your name. Select the Virtual private cloud and Resource group.
   ![Figure showing New virtual server for VPC.](../images/new_virtual_server.png){: caption="Figure 12. Enter your name, select the Virtual private cloud and Resource group" caption-side="bottom"}

   b. Select your region.

   c. Select the custom image that you imported.

   d. Use Memory Profile (2 vcpus, 16 gb ram, 4 gps).

   e. Add an ssh key. You can use a public key. For more information, see: [Locating or generating your SSH key](https://cloud.ibm.com/docs/vpc-on-classic-vsi?topic=vpc-on-classic-vsi-ssh-keys#locating-or-generating-your-ssh-key).

   ![Figure showing add ssh key.](../images/ssh_keys.png){: caption="Figure 13. Add an ssh key" caption-side="bottom"}

   f. Add storage to your virtual service. For example, 100 gigabytes. This volume is needed to configure the {{ site.data.product.title }} appliance. 

   **Note:** Make sure that the data volume name is unique and not named the same as another volume across your virtual server instances.

   ![Figure showing example Data volumes.](../images/data_volumes.png){: caption="Figure 14. Example Data volumes" caption-side="bottom"}

    g. Select create virtual server instance. 
 
8. Update the security group that allows inbound and outbound traffic. Open the server instance, go down to the Network interfaces section, and then modify the security group.

   ![Figure showing example security group that allows inbound and outbound traffic.](../images/security_inbound_outbound.png){: caption="Figure 15. Example security group that allows inbound and outbound traffic" caption-side="bottom"}

9. Assign the floating IP address:

   ![Figure showing example Floating IP address.](../images/floating_ip_vpc.png){: caption="Figure 16. Example Floating IP address assigned" caption-side="bottom"}


### Step B. Setting up the {{ site.data.product.title }} appliance

1. Use the `ssh` command to connect to your virtual server instance (appliance) by using the floating IP address. Log in with a username of `root` and the default password `smartvm`. The Bash prompt for the root user is displayed.
  
   Example ssh as root user:
   ```
   ssh root@<host_ip_address>
   ```
2. Enter the `appliance_console` command. The {{ site.data.product.title }} appliance summary screen is displayed.

   ![Figure showing example appliance_console.](../images/setup_appliance.png){: caption="Figure 17. Welcome to the Appliance Console" caption-side="bottom"}

3. Press Enter to manually configure settings.

    **Note:** Networking is already configured. You can skip this step.

4. Select _5) Configure database_ from the menu.

    - You are prompted to create or fetch an encryption key.
    If this instance is the first {{ site.data.product.title }} appliance, select _1) Create key_.
    
    - If this is not the first {{ site.data.product.title }} appliance, select _2) Fetch key_ from remote system to fetch the key from the first appliance. For worker and multi-region setups, use this option to copy key from another appliance.

    **Note:** All {{ site.data.product.title }} appliances in a multi-region deployment must use the same key.

5. Select _1) Create Internal Database_ for the database location.

6. Choose a disk for the database. The disk can be either a disk you attached previously, or a partition on the current disk.

    **Important:** Best practice is using a separate disk for the database.
    
    If an unpartitioned disk is attached to the virtual machine, the dialog shows the options. For example,
    ```
    1) /dev/vdb: 20480
    2) Don't partition the disk
    ```
    - Enter 1 to choose /dev/vdb for the database location. This option creates a logical volume by using this device and mounts the volume to the appliance in a location appropriate for storing the database. The default location is /var/lib/pgsql, which can be found in the environment variable $APPLIANCE_PG_MOUNT_POINT.
    
    - Enter 2 to continue without partitioning the disk. A second prompt confirms this choice. Selecting this option results in using the root file system for the data directory (not advised in most cases).

7. Enter N for "Should this appliance run as a stand-alone database server?"
    - Select N to configure the appliance with the full administrative user interface.

8. When prompted, enter a unique number (01-99) to create a new region.

    **Important:** Creating a new region deletes any existing data on the chosen database.

9.  Create and confirm a password for the database.

    {{ site.data.product.title }} configures the internal database. This takes a few minutes. 

10. Once {{ site.data.product.title }} is installed, you can log in and complete administrative tasks.
    - Log in to Red Hat {{ site.data.product.title }} for the first time by:
    - Select the URL for the login screen. For example,  `https://xx.xx.xx.xx` on the virtual server instance, where `xx.xx.xx.xx` is the floating IP.
    - Enter the default credentials (Username: admin | Password: smartvm) for the initial login.
    - Click Login.
  
    