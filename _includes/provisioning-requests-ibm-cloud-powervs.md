For an overview of IBM Power Systems Virtual Servers, including terminology
used in {{ site.data.product.title_short }}, see [Getting started with IBM
Power Systems Virtual
Servers](https://cloud.ibm.com/docs/power-iaas?topic=power-iaas-getting-started)

Create a request to provision IBM Power Systems Virtual Servers instances
from images.

1.  Browse to menu: **Compute > Clouds > Instances**.

2.  Click **Lifecycle**, then click ![1862](../images/1862.png)(**Provision
    Instances**).

3.  Select an image from the list presented. Each image is associated with a
    single Power Systems Virtual Servers provider instance. If there are
    multiple provider instances registered be sure to select an image
    associated with the desired instance.

    **Notes:**

    - Images must already be imported into a Power Systems Virtual Servers
      provider instance before becoming available in the
      {{ site.data.product.title_short }} inventory. This can be done using the
      IBM Cloud web interface, CLI, or API.  For detailed instructions see [IBM
      Cloud PowerVS docs: Importing a boot
      image](https://cloud.ibm.com/docs/power-iaas?topic=power-iaas-importing-boot-image)
      and [IBM Cloud CLI: ibmcloud pi
      image-create](https://cloud.ibm.com/docs/cli?topic=power-iaas-cli-plugin-power-iaas-cli-reference#ibmcloud-pi-image-create).

    - [SAP HANA on IBM Power Systems Virtual
      Servers](https://www.ibm.com/docs/en/power-systems-vs?topic=gs-getting-started-sap-hana-power-systems-virtual-servers)
      requires special SLES for SAP HANA images. These boot images are added to
      a Power Systems Virtual Servers provider instance automatically when
      provisioning an SAP HANA instance through the IBM Cloud web interface.
      Once the SLES for SAP HANA image has been added, subsequent instances can
      be provisioned using {{ site.data.product.title_short }}.

4.  Click **Continue**.

5.  Click the **General** tab for general instance options.

    1. Select the **Number of Instances** to provision.

    2. Type an **Instance Name**.

6.  Click the **Profile** tab for hardware profile options.

    ![Power Systems Virtual Server VM provisioning form](../images/ibm_cloud_powervs_vm_provision_form.png)

    1. Select the **Processor** type.

       **Note:** See [Power Systems Virtual Servers
       documentation](https://cloud.ibm.com/docs/power-iaas?topic=power-iaas-power-iaas-faqs#processor)
       for more information.

    2. Select a **Machine Type**.

       **Note:** When provisioning with an SAP HANA image, the **Machine Type**
       field is used to select the SAP profile. The SAP profile includes the
       number of entitled processors and memory (these fields will be
       automatically set and can only be changed by selected a different SAP
       profile).

    3. Optionally, select **Attach Volumes** items.

       **Note:** A VM cannot have disks from different storage types. Only existing
       volumes matching the **Storage Type** will be available for selection.

    4. Select a **Storage Type**.

       **Note:** See [Power Systems Virtual Servers
       documentation](https://cloud.ibm.com/docs/power-iaas?topic=power-iaas-power-iaas-faqs#storage)
       for more information on volume types.

    5. Enter number of **Entitled Processors**.

       **Notes:**

       - If 'dedicated' **Processor** is selected, **Entitled Processors** must
         be allocated in whole numbers.

       - If 'shared' or 'uncapped' **Processor** is selected, **Entitled
         Processors** must be allocated in a multiple of '0.25'.

       - When provisioning with an SAP HANA image this field is set by the
         profile (**Machine Type**) selection.

    6. Enter **Memory (GB)**.

       **Note:** When provisioning with an SAP HANA image this field is set by
       the profile (**Machine Type**) selection.

    7. Optionally, select a **Key Pair**.

7.  Click the **New Volumes** tab to optionally create new volumes to be
    attached to the VM.

    All new volumes will be the **Storage Type** selected in the **Profile**
    tab. For each new volume:

    1. Type a volume **Name**.

    2. Enter **Size (GB)**.

    4. Select a **Sharable**.

8.  Click the **Network** tab to select networks.

    1. Select an existing network from **Network Interface**. If 'None' is
       selected then **Attach to New Public Network** must be selected.

    2. Select **Attach to New Public Network** to create a new public network
       to attach to the VM.

9.  Click the **Customization** tab for additional options.

    1. Use the **Upload File** section to upload a Cloud-init file.

    2. In the **Other** section, select **Migratable** and **VM pinning**

       **Note:** [Learn
       more](https://cloud.ibm.com/docs/power-iaas?topic=power-iaas-power-iaas-faqs#pinning)
       about VM pinning.

    3. In the **IP Address Information** section, optionally enter an IP
       address to request for the selected **Network Interface** in the
       **Network** tab.

13. Click **Submit**.

The provisioning request is sent for approval. For the provisioning to begin, a
user with the admin, approver, or super admin account role must approve the
request. The admin and super admin roles can also edit, delete, and deny the
requests. You will be able to see all provisioning requests where you are
either the requester or the approver.

After submission, the appliance assigns each provision request a **Request
ID**. If an error occurs during the approval or provisioning process, use this
ID to locate the request in the appliance logs. The Request ID consists of the
region associated with the request followed by the request number. As regions
define a range of one trillion database IDs, this number can be several digits
long.

**Request ID Format**

Request 99 in region 123 results in Request ID 123000000000099.
