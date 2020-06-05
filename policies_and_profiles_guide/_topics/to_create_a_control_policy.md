#### Creating Control Policies

Create control policies by combining an event, a condition, and an
action. Plan carefully the purpose of your policy before creating it.
You can also use a scope expression that is tested immediately when the
policy is triggered by an event. If the item is out of scope, then the
policy does not continue on to the conditions, and none of the
associated actions run.

The procedure below describes how to create a control policy, its
underlying conditions, and assign its events and actions in one process.
Conditions and custom actions can be created separately as well. Those
procedures are described in later sections in conditions and actions.
Also, a description of all events is provided in events.

1.  Navigate to menu:Control\[Explorer\].

2.  Click the **Policies** accordion, and select **Control Policies**.

3.  Select either **Host Control Policies** or **VM Control Policies**
    or **Replicator Control Policies** or **Pod Control Policies** or
    **Container Node Control Policies** or **Container Image Control
    Policies**.

4.  Click ![image](../images/1847.png) (**Configuration**),
    ![image](../images/1862.png) (**Add a New Host / VM / Replicator / Pod
    / Node / Image Control Policy**).

5.  Type in a **Description**.

    ![image](../images/:../images/1849.png)

6.  Uncheck **Active** if you do not want this policy processed even
    when assigned to a resource.

7.  You can enter a **Scope** here (You can also create a scope as part
    of a condition, or not use one at all). If the host or virtual
    machine is not included in the scope, no actions will be run.

8.  In the **Notes** area, add a detailed explanation of the policy.

9.  Click **Add**. You are brought to the page where you add conditions
    and events to your new policy.

    ![image](../images/:../images/1850.png)

10. Click ![image](../images/1847.png) (**Configuration**) to associate
    conditions, events, and actions with the policy.
