#### Assigning an Action to an Event

This procedure describes how to assign an action to an event.

1.  Navigate to menu:Control\[Explorer\].

2.  Click the **Policies** accordion, and select the policy you want to
    assign actions to.

3.  From the **Events** area, click on the description of the event you
    want to assign an action to.

4.  Click ![image](/images/1847.png) (**Configuration**),
    ![image](/images/1851.png) (**Edit Actions for this Policy Event**).

5.  Select all the appropriate actions from the **Available Actions**
    box, inside the **Order of Actions if ALL Conditions are True**.
    These are the actions that will take place if the resources meet the
    Condition of the Policy.

    ![image](/images/1882.png)

    <div class="note">

    Each selected action can be executed synchronously or
    asynchronously; synchronous actions will not start until the
    previous synchronous action is completed, and asynchronous action
    allows the next action to start whether or not the first action has
    completed. Also, at least one {{ site.data.product.title }} server in the
    {{ site.data.product.title }} zone must have the notifier server role enabled for
    the trap to be sent.

    </div>

6.  Click the add button ( ![image](/images/1876.png)), then:

      - Click the action, then click ![image](/images/1883.png) (**Set
        selected Actions to Asynchronous**) to make it asynchronous.

      - Click the action, then click ![image](/images/1884.png) (**Set
        selected Actions to Synchronous**) to make it synchronous. If
        creating a synchronous action, use the up and down arrows to
        identify in what order you want the actions to run.

7.  Select all the actions from the appropriate **Available Actions**
    box, inside of the **Order of Actions if ANY Conditions are False**.
    These are the actions that take place if the resources do not meet
    the condition of the policy.

8.  Click **Save**.
