1.  Browse to menu: **Services > Catalogs**.

2.  Click the **Catalog Items** accordion.

3.  Click **Configuration**, and then
    ![1862](../images/1862.png)(**Add a New Catalog Item**).

4.  Select **OpenStack** from the **Catalog Item Type** drop-down.

5.  In the **Basic Info** subtab:

    1.  Type a **Name/Description**.

    2.  Check **Display in Catalog** to edit **Catalog**, **Dialog**,
        and **Entry Point(NS/Cls/Inst**) options.

        1.  **Provisioning Entry Point (Domain/NS/Cls/Inst**) requires you to select an Automate instance to run upon provisioning.
            Navigate to **ManageIQ/Service/Provisioning/State‐Machines/ServiceProvision\_Template/CatalogItemInitialization**
            and click **Apply**.

        2.  **Retirement Entry Point (Domain/NS/Cls/Inst**) requires you to select an Automate instance to run upon retirement. Navigate to **ManageIQ/Service/Provisioning/State‐Machines/ServiceProvision\_Template/CatalogItemTermination**
            and click **Apply**.

            **Note:**

            The entry point must be a State Machine since the **Provisioning Entry Point** list is filtered to only show State Machine class instances. No other entry points will be
            available from the **Provisioning Entry Point** field.

            You can only choose from the catalogs and dialogs you have already created. If you haven’t done so, leave the values
            blank and edit later.

6.  In the **Details** subtab, write a **Long Description** for the catalog item.

7.  In the **Request Info** subtab, select provisioning options that apply to the provider chosen.

8.  Click **Add**.
