#### Creating a Compliance Policy

Create compliance policies by assigning or creating a condition. {{ site.data.product.title_short }} automatically assigns the events and actions to the compliance policy as opposed to a control policy where you must define this yourself. The entity type (VM or host, for example) compliance check event is assigned to the compliance policy. A compliance policy runs the mark as compliant action when the virtual machine or host passes all of the conditions. If any of the conditions are not met, then the virtual machine or host is marked as non-compliant.

Carefully plan the purpose of your policy before creating it. You can also use a scope expression that is tested immediately when the compliance check event triggers the policy. If the item is out of scope, then the policy does not continue on to the conditions, and none of the associated actions run.

1. Browse to menu: **Control > Explorer**.

2. Click the **Policies** accordion, and select **Compliance Policies**.

3. Select either **Host Compliance Policies** or **VM Compliance Policies** or **Replicator Compliance Policies** or **Pod Compliance Policies** or **Container Node Compliance Policies** or **Container Image Compliance Policies**.

4. Click ![image](../images/1847.png)**Configuration**, ![image](../images/1862.png)**Add a new Compliance Policy**.

5. Type in a **Description** for the policy.

    ![image](../images/1935.png)

6. Uncheck **Active** if you do not want this policy to be processed even when assigned to a resource.

7. You can enter a scope here. (You can also create a scope as part of a condition, or not use one at all.) If the host or virtual machine is not included in the scope, no actions run.

8. In the **Notes** area, add a detailed explanation of the policy.

9. Click **Add**.

You must add one or several conditions:

  - You can create a new condition by clicking ![image](../images/1847.png)**Configuration**, ![image](../images/1862.png)**Create a new Condition assigned to this Policy**, as described in [Creating a New Policy Condition](#creating-a-new-policy-condition).

  - You can use an existing condition by clicking ![image](../images/1847.png)**Configuration**, ![image](../images/1851.png)**Edit this Policy’s Condition assignments**, as described in [Editing Policy Condition Assignments](#editing-policy-condition-assignments).

By default, if any of the conditions are false, the virtual machine is marked as non-compliant. To add other actions, such as sending an email if the virtual machine fails the compliance test:

1.  Click the **Compliance Check** event under the policy (exact name depends on entity type, for example **VM Compliance Check**.

2. Click ![image](../images/1847.png)**Configuration**, ![image](../images/1851.png)**Edit Actions for this Policy Event**.

3. Select **Stop Virtual Machine** and **Send Email** from the **Available Actions** area in **Order of Actions if ANY conditions
    are False**. (**Mark as Non-Compliant** should already be selected.)

    ![image](../images/1933.png)

4. Click ![image](../images/1876.png)**Move selected Actions into this Event**.

5. Click **Add**.

You can now make this part of a policy profile. After assigning the policy profile to the virtual machine, you can check it for its compliance status either on a schedule or on demand.
