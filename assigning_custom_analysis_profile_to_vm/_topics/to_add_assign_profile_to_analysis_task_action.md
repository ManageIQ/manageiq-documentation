## Creating an Action to Assign the Virtual Machine Analysis Profile to the Analysis Task

Actions are performed after the condition is evaluated. You can
associate actions with specific events when you create a policy.
{{ site.data.product.title }} provides a set of default actions, but you can also
create custom actions using the {{ site.data.product.title_short }} user interface.

Use this procedure to create a custom action by adding the **Assign
Profile to Analysis Task** action type to the virtual machine analysis
profile (created in [???](#vm-analysis-profile)).

![image](../images/create-custom-action.png)

1.  Navigate to menu:Control\[Explorer\].

2.  Expand the **Actions** accordion and click
    ![image](../images/1847.png) (**Configuration**), then
    ![image](../images/1862.png) (**Add a new Action**).

3.  Enter a **Description** for the new action. This will be the name
    given to your new action.

4.  Select **Assign Profile to Analysis Task** from the **Action Type**
    list.

5.  Select the newly-created virtual machine analysis profile from the
    **Analysis Profiles** list.

6.  Click **Add**.

<div class="note">

You can only associate this action with an analysis start event.

</div>

The action is created and added to the **Available Actions** list.
Associate this action with the **VM Analysis Start** event when you
create a virtual machine control policy in the next procedure.
