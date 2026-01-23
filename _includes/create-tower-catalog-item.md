<div class="important">

You must first create the job or workflow template in Ansible Automation Platform. The
job or workflow templates are automatically discovered by
{{ site.data.product.title_short }} when refreshing your Ansible Automation Platform provider’s inventory.

</div>

First, create a catalog:

1. Browse to menu: **Services > Catalogs**.

2.  Click **Configuration**, then
    ![Add a New Catalog](../images/1862.png) (**Add a New Catalog**)

3.  Enter a **Name** and **Description** for the catalog.

4.  Click **Add**.

Then, create an Ansible Automation Platform service catalog item:

1.  Browse to menu: **Automation < Ansible Automation Platform < Explorer**, then click
    on the **Templates** accordion menu.

2.  Click **Ansible Automation Platform Templates** and select an Ansible Automation Platform job or
    workflow template.

3.  Click **Configuration**, then
    ![Create Service Dialog from Template](../images/1862.png) (**Create
    Service Dialog from this Template**).

4.  Enter a **Service Dialog Name** (for example,
    *ansible\_tower\_job*)and click **Save**.

5.  Browse to menu: **Services > Catalogs**. Click **Catalog Items**.

6.  Click **Configuration**, then
    ![Add a New Catalog Item](../images/1862.png) (**Add a New Catalog
    Item**) to create a new catalog item with the following details, at
    minimum:

      - For **Catalog Item type**, select **Ansible Automation Platform**.

      - Enter a **Name** for the service catalog item.

      - Select **Display in Catalog**.

      - In **Catalog**, select the catalog you created previously.

      - In **Dialog**, select the service dialog you created previously
        (in this example, *ansible\_tower\_job*). To ask the user to
        enter extra information when running the task, **Service
        Dialog** must be selected. A dialog is required if **Display in
        Catalog** is chosen.

      - In **Provider**, select your Ansible Automation Platform provider. This brings
        up the **Ansible Automation Platform Template** option and configures the
        **Provisioning Entry Point State Machine** automatically.

      - Add configuration information for **Reconfigure Entry Point**
        and **Retirement Entry Point** as applicable.

      - Select your desired **Ansible Automation Platform Template** from the list.
        Generally, this is the Ansible Automation Platform job or workflow template
        previously used to create the service dialog.

7.  Click **Add**. The catalog item you created will appear in the **All
    Service Catalog Items** list.
