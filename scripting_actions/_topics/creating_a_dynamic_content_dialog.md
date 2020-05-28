#### Creating a Dynamic Content Dialog

The procedure describes the steps to create a dynamic content dialog.

1.  Navigate to menu:Automation\[Automate \> Explorer\].

2.  From the accordion menu, click menu:DOMAIN\[Cloud \> VM \>
    Operations \> Methods\].

    <div class="note">

    DOMAIN must be a user-defined Domain and not the locked ManageIQ
    Domain. If necessary, you can copy the class from the ManageIQ
    domain into a custom domain.

    </div>

    This example uses the **Cloud** Namespace but can also use the
    **Infrastructure** namespace.

3.  Click ![image](/images/1847.png) (**Configuration**), then
    ![image](/images/1862.png) (**Add a new Instance**).

4.  In the **Main Info** area, enter **Name** = *dynamic\_list*,
    replacing *dynamic\_list* with an appropriate name for the method.

5.  Enter a **Display Name** and **Description**.

6.  In the **Fields** area, enter **Value** = *dynamic\_list*. Leave the
    other fields blank or use the default values.

7.  Click **Add**.

8.  Navigate to **Methods** tab.

9.  In the **Main Info** area, enter **Name** = *dynamic\_list* and
    populate the **Data** section with the example automate method
    below.

10. Click **Add**.

11. Set the automate entry point for the dialog control; use the new
    instance created in step four. You can create a new domain and copy
    the method to that domain.

        #  Automate Method

        dialog_field = $evm.object

        # sort_by: value / description / none
        dialog_field["sort_by"] = "value"

        # sort_order: ascending / descending
        #dialog_field["sort_order"] = "ascending"

        # data_type: string / integer
        dialog_field["data_type"] = "integer"

        # required: true / false
        # dialog_field["required"] = "true"

        dialog_field["values"] = {1 => "one", 2 => "two", 10 => "ten", 50 => "fifty"}
        dialog_field["default_value"] = 2
