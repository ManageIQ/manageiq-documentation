# Creating a Template Based on a Virtual Machine

A template is a copy of a virtual machine (VM) that you can use to
simplify the subsequent, repeated creation of similar VMs. Templates
capture the configuration of software, configuration of hardware, and
the software installed on the VM on which the template is based.

**Note:**

Virtual machines must meet the following criteria to publish as
templates:

  - The VM must not be blank, archived or orphaned.

  - The VM must be associated with a oVirt / RHV provider.

  - oVirt / RHV provider 4.0 or higher, with
    `use_ovirt_engine_sdk` set to `true` in
    `/var/www/miq/vmdb/config/settings.yml` on your
    {{ site.data.product.title_short }} appliance.

  - The VM power state is `OFF`.

  - Sealing a template is not supported for Windows OS VMs.

To create a template based on an existing VM:

1.  Browse to menu: **Compute > Infrastructure > Providers**.

2.  Click on a oVirt / RHV provider.

3.  Select a VM.

4.  Click ![Lifecycle](../images/2007.png) (**Lifecycle**), then click
    ![Publish selected VM to a Template](../images/import.png) (**Publish
    selected VM to a Template**).

5.  Under the **Request** tab, provide **Request Information** and
    identify a **Manager**:

    1.  Enter an **E-Mail** address.

    2.  Provide a **First** and **Last** name in the individual fields.

    3.  Enter a **Manager** name.

6.  Assign tags to the new template in the **Purpose** tab.

    1.  Click on a tag category and check applicable tags.

7.  Use fields in the **Catalog** tab to identify the source VM and
    provide details for the template:

    1.  Select the source VM from the **Name** field.

    2.  (Optional) Check **Seal Template**.

        **Note:**

        Sealing, which uses the `virt-sysprep` command, removes
        system-specific details from a virtual machine before creating a
        template based on that VM. This prevents the original VM’s
        details from appearing in subsequent VMs that are created using
        the same template. It also ensures the functionality of other
        features, such as predictable vNIC order.
        
    3.  The **Number of VMs** indicates the output will be a single
        template.

    4.  Provide a **Name** and **Description** for the created template.

8.  Under the **Environment** tab, specify information for the storage
    domain in which to create the template’s disks.

    1.  Check **Choose Automatically** to allow {{ site.data.product.title_short }}
        to determine the destination cluster and datastore.

        Or, manually enter cluster and datastore information using the
        following steps:

    2.  Select the cluster with which to associate the template from the
        **Cluster** list. By default, this is identical to the cluster
        of the source VM.

    3.  Choose a **Datastore** for the destination to create the
        template’s disks.

9.  Provide provisioning and retirement information for VMs based on the
    template in the **Schedule** tab.

    1.  Select **Schedule** or **Immediately on Approval** for
        **Schedule Info** to determine when to provision the VM.

    2.  Set the **Time to Retirement** under **Lifespan** using the
        drop-down menu.

10. Click **Submit**.
