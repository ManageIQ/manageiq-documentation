### Creating an Expression Alert

Expression alerts enables you to create a notification based on any possible criteria for clusters, datastores, hosts, and virtual machines. The following procedure creates an alert for when a host’s datastore has less than 5% free space.

1. Browse to menu: **Control > Explorer**.

2. Click on the **Alerts** accordion, then click **Configuration**, ![1862](../images/1862.png) **Add a new Alert**.

3. In the **Info** area:

    ![expressionalerts](../images/expressionalerts.png)

      - Type in a description for the alert.

      - From **Based On**, select **Host/Node**.

      - For **What to Evaluate**, select **Expression Custom**.

      - In **Notification Frequency**, select how often you want to be notified if the expression is evaluated to true.

4. Use the expression editor to create your expression. This is the same expression editor used to create **Conditions**.

    ![expressioneditor](../images/expressioneditor.png)

5. Click ![1863](../images/1863.png) **Commit expression element changes** to accept the expression.

6. After setting the parameters, you then select what you want the alert to do. You can send an email, create an SNMP Trap, or send a management event to start an automation process.

7. Click **Add**.
