### Creating a Policy for Automate

This procedure shows you how to create a policy for automate.

1.  Navigate to menu:Control\[Explorer\].

2.  Click the **Policies** accordion, and select **Control Policies**.

3.  Select **Vm Control Policies**.

4.  Click ![image](/images/1847.png)(**Configuration**), then
    ![image](/images/1862.png) (**Add a New Control Vm Policy**).

5.  Type in a **Description**.

6.  Uncheck **Active** if you do not want this policy processed even
    when assigned to a resource.

7.  Click **Add**. You are brought to the page where you add conditions
    and events to your new policy.

8.  Click ![image](/images/1847.png)(**Configuration**), then
    ![image](/images/1851.png) (**Edit this Policy’s Event
    assignments**).

      - Check the events you want to use to send to an **Automate
        Model**.

      - Click **Save**.

      - From the **Events** area, click on the **Description of the
        Event** you want to assign an action to.

      - Click ![image](/images/1851.png) (**Edit Actions for this Policy
        Event**).

9.  Select **Raise Automation Event**, and click
    ![image](/images/1876.png) (**Move selected Actions into this
    Event**).

10. Click **Save**.

You can now assign this policy to a **Policy Profile**. Then, assign the
policy profile to the virtual machines. Every time this event happens on
the virtual machine the appropriate Automate Model will be initiated.

<div class="note">

If you want the policy to initiate an Automate Model from the
`/System/Process/Request` class, then you can create your own custom
action. Be sure to have an instance in the `/System/Process/Request`
class for it to map to.

</div>
