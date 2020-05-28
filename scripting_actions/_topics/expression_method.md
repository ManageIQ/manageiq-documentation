#### Creating an Expression Method

Expression methods allow you to use advance search filters as automate
methods, substituting user input at runtime, and making them ideal for
dynamic dialogs.

To create an expression method:

1.  Navigate to menu:Automation\[Automate \> Explorer\], then click on a
    domain under **Datastore**.

2.  Under a namespace, select the class for which you want to create a
    new method.

3.  Click the **Methods** tab.

4.  Click ![image](/images/1847.png) (**Configuration**) then,
    ![image](/images/1862.png) (**Add a New Method**).

5.  In the **Main Info** area, select **expression** from the drop-down
    menu.

6.  Provide a **Name** and **Display Name**.

7.  Select an **Expression Object** from the drop-down menu.

8.  In the **Expression** editor, create the expression by setting the
    controls and values used at runtime:

    1.  Using the drop-down menu, select the value to use. Based on your
        selection, choose or input additional values from the drop-down
        menus or text fields that appear.

    2.  In the **Contains** field, input a value or click **User will
        input the value**.

    3.  Click ![image](/images/1863.png) to complete the expression.

9.  Add **Input Parameters** for each of the user input fields required.

    1.  Click ![image](/images/2366.png) to add a new parameter.

    2.  Provide a **Name**, **Default Value** and select a **Data Type**
        for each parameter.

    3.  Click ![image](/images/1863.png) to add the parameter.

        <div class="note">

        If **User will input the value** is checked, arguments for each
        input parameter names using the prefix “arg”.

        For example, if there are 3 fields then the input parameter
        names should be arg1, arg2, and arg3. If there are two runtime
        parameters arg1 and arg2 must be defined in the input
        parameters. In the default value for these fields values can be
        substituted from other objects in the Automate Workspace.

        </div>

10. Click **Add**.
