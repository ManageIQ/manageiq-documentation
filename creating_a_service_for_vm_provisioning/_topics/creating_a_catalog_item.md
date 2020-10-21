## Creating a Catalog Item

Create a service catalog item to represent that service in a catalog.

1.  Navigate to menu:Services\[Catalog\].

2.  Click the **Catalog Items** accordion.

3.  Click ![1847](../images/1847.png)(**Configuration**), and then
    ![1862](../images/1862.png)(**Add a new Catalog Item**).

4.  Select **RHEV** from the **Catalog Item Type** list.

5.  Enter the basic details in the Basic Info tab:

    1.  Enter a name for the catalog item in **Name**.

    2.  Enter a description for the catalog item in **Description**.

    3.  Select **Display in Catalog**.

    4.  Select the catalog you created from the **Catalog** list.

    5.  Select the service dialog you created from the **Dialog** list.

6.  Click the **Details** tab:

    1.  Enter a description of the catalog item using HTML tags.

7.  Click the **Request Info** tab to enter the request details. Enter
    the same data you did in the traditional provisioning dialog.

    1.  In the **Catalog** tab, select the template on which to base the
        virtual machine from the **Selected VM** area.

    2.  Enter `changeme` as the default name of the virtual machine in
        **VM Name**.

    3.  In the Network tab, select **rhevm** from the **vLan** list.

8.  Click **Add**.

**Note:**

In {{ site.data.product.title_short }}, service catalog items can be more complex
than a single virtual machine and are provisioned through a series of
automation workflows. The service dialog you created will be used to
gather information from the user requesting the virtual machine, hiding
all the complexity of the details needed to actually deploy any of the
components.

</div>

You can now provision a virtual machine through Red Hat Virtualization
using the Self Service user interface.
