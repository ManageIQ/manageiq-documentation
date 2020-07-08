## Creating a Virtual Machine Control Policy

You can create a control policy by combining an event, a condition, and an action. The procedure below describes how to create a virtual machine control policy to assign the newly-created action to the **VM Analysis Start** event. Optionally, you can use a scope expression that is tested immediately when the policy is triggered by an event. If the item is out of scope, then the policy will not continue on to the conditions, and the assigned action will not run.

1. Browse to menu: **Control > Explorer**.

2. Expand the **Policies** accordion, and click **Control Policies**.

3. Select **Vm Control Policies**.

4. Click ![image](../images/1847.png) **Configuration**, then ![image](../images/1862.png) **Add a New VM and Instance Control Policy**.

5. Enter a **Description**. This will be the name given to your VM control policy.

6. Clear the **Active** box if you do not want this policy processed even when assigned to a resource.

7. Optional: Enter a **Scope** (you can also create a scope as part of a condition, or not use one at all). If the virtual machine is not included in the scope, the assigned action will not run.

    - You can use the drop-down list to create an expression for the **Scope**. Based on what you choose, different options appear. Click ![image](../images/1863.png) **Commit expression element changes** to add the scope.

8. Enter **Notes** if required.

9. Click **Add**. The policy is added and listed under **Vm Control Policies** in the **Policies** accordion.

10. Select the newly-added VM control policy. You can now associate events, conditions, and actions with the policy.

11. Click ![image](../images/1847.png) **Configuration**, then ![image](../images/1851.png) **Edit this Policy’s Event assignments**.

12. Under **VM Operation**, set **VM Analysis Start** to **Yes**.

13. Click **Save**.

14. Click the **VM Analysis Start** event to configure actions.

15. Click ![image](../images/1847.png) **Configuration**, then ![image](../images/1851.png) **Edit Actions for this Policy Event**.

16. In **Order of Actions if ALL Conditions are True**, select the action created in [Creating an Action to Assign the Virtual Machine Analysis Profile to the Analysis Task](#creating-an-action-to-assign-the-virtual-machine-analysis-profile-to-the-analysis-task) from the **Available Actions** list. This action will take place if the resources meet the conditions of the policy.

    ![image](../images/edit-event.png)

    **Note:**

    Each selected action can be executed synchronously or asynchronously; a synchronous action will not start until the
    previous synchronous action is completed, while an asynchronous action allows the next action to start whether or not the first action has completed. Also, at least one {{ site.data.product.title_short }} server in the {{ site.data.product.title_short }} zone must have the notifier server role enabled for the trap to be sent.

17. Click (![image](../images/1876.png)) which will move the action to **Selected Actions**. The selected action is set to (S) Synchronous by default. From **Selected Actions**, select the action, then:

      - Click **A** (Set selected Actions to Asynchronous) to make it asynchronous.

      - Click **S** (Set selected Actions to Synchronous) to make it synchronous. If creating a synchronous action, use the up and
        down arrows to identify in what order you want the actions to run.

18. Click **Save**.
