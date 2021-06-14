Use the following procedure to create an Amazon catalog item. Once
created, the catalog item and service dialog combine with all of the
options in the provisioning dialog. Users can then order Red Hat
Enterprise Linux instances from the **Service Catalog** in the
{{ site.data.product.title_short }} Service user interface.

1.  Browse to menu: **Services > Catalogs**, then click on the **Catalog Items** accordion.

2.  Click **Configuration**, then ![1862](../images/1862.png)**Add a New Catalog Item**.

3.  Select **Amazon** from the **Catalog Item Type** list.

4.  Enter the basic details in the **Basic Info** tab:

    1.  Enter a **Name** and **Description** for the new service catalog
        item.

    2.  Select **Display in Catalog**.

    3.  Select the appropriate catalog from the **Catalog** list.

    4.  Select the appropriate service dialog from the **Dialog** list.

5.  Click the **Request Info** tab to enter request details:

    1.  On the **Catalog** tab, select your Amazon AWS image name from
        the **Name** list, and the number of instances from the
        **Count** list. The **VM Name** will be overwritten during the
        provisioning process, but you can enter it as *changeme* for
        now.

    2.  On the **Properties** tab, select *T2 Micro* from the **Instance
        Type** list, and *Basic* or *Advanced* for **CloudWatch**. If
        you plan to access the instance, select a **Guest Access Key
        Pair**, too.

    3.  On the **Customize** tab, set the **Root Password** under
        **Credentials**, then select the *Basic root pass template* as a
        script for cloud-init under **Customize Template**.

6.  Click **Add**.
