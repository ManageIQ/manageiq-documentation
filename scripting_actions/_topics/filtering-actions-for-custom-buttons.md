### Setting Enablement and Visibility for Custom Buttons

{{ site.data.product.title_short }} adds methods for evaluating an expression to determine whether a custom button is visible and enabled. Each method has a target
object, for example, a virtual machine or host, and expressions can set a custom button to visible, hidden, or disabled.

**Note:**

Filtering works on single objects and is not applicable to lists.

To apply filtering actions to a custom button:

1.  Navigate to menu:Automation\[Automate \> Customization\].

2.  Click the **Buttons** accordion. Select the custom button to use.

3.  Click ![image](../images/1847.png)(**Configuration**), then
    ![image](../images/1851.png) (**Edit this Button**).

4.  Click the **Advanced** tab.

5.  To set enablement filtering on a custom button:

    1.  Under **Enablement**, click on **Define Expression**.

    2.  Create a visibility expression using the expression editor
        tools.

    3.  Click ![Confirm](../images/1863.png) (**Confirm**) when finished
        defining the expression.

    4.  Provide **Disabled Button Text** in the field.

6.  To set visibility filtering on a custom button:

    1.  Under **Visibility**, click on **Define Expression**.

    2.  Create a visibility expression using the expression editor
        tools.

    3.  Click ![Confirm](../images/1863.png) (**Confirm**) when finished
        defining the expression.

7.  Click **Save**.
