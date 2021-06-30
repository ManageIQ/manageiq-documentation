1.  Browse to menu: **Automation > Automate > Customization**.

2.  Click the **Buttons** accordion.

3.  From the **Object Types** tree, select the type of object you want to create the button for.

4.  Click **Unassigned Buttons**.

5.  Click **Configuration**, then ![image](../images/1862.png) **Add a new Button**.

    **Note:**

    If ![image](../images/1862.png) **Add a new Button** is not available, that means you have not
    created a button group for that object. To continue, create a button group first. See
    [Creating a Custom Button](#create-custom-button-group).

6.  Under the **Options** tab:

    1.  Select the **Button** type from the list.

    2.  Enter button **Text** and **Hover Text**, and select the **Icon** and **Icon Color** to
        use.

    1.  Select a **Dialog** if applicable.

    2.  Check **Open URL** to open a browser window for the custom URL returned when the button is
        executed.

    1.  Choose a **Display For** option for the button.

    2.  Select a **Submit** parameter to choose how to submit objects to automate. Selecting
        *Submit All* will pass all objects at once when the button is executed, while choosing
        *One by one* will run execute the button action each time per object.

7.  Under the **Advanced** tab:

    1.  Set button **Enablement**. Click **Define Expression** to access the expression editor
        tool. Enter **Disabled Button Text** to display when the custom button is disabled.

    1.  Use **Visibility** to determine button appearance based on a custom expression. Click
        **Define Expression** to access the expression editor tool.

        **Note:**

        For more about setting visibility and enablement for a custom button, see [Filtering](#setting-enablement-and-visibility-for-custom-buttons).

    1.  In **Object Details**, select **Request** from the `/System/Process/` dropdown. By default,
        the message is `create`. Do not change it.

    1.  Enter a **Request** name for the `/System/Process/Request` instance.

    2.  Enter the **Attribute/Value Pairs** fields if applicable.

    3.  Set **Role Access**. Selecting *\<By Role\>* will display available roles. Check applicable
        roles.

8.  Click **Add** when you have confirmed that the button accomplishes the task you want.
