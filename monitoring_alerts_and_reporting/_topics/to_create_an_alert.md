### Creating an Alert

This section outlines the basic procedure to create an alert.

**Note:**

To send emails or SNMP traps from the {{ site.data.product.title_short }} server, you must
enable the Notifier server role and set up SMTP email or SNMP traps. For
more information, see *General Configuration*.

1.  Navigate to **Control > Explorer**.

2.  Click the **Alerts** accordion, then click ![1847](../images/1847.png) (**Configuration**), ![1862](../images/1862.png) (**Add a New Alert**).

3.  Enter the basic details of the alert:

    1.  Enter a description in the **Description** field.

    2.  Select the **Active** check box to enable the alert after
        creation.

    3.  Select the severity level from the **Severity** list.

    4.  Select the inventory item on which to base the alert from the
        **Based On** list.

    5.  Select the type of event that triggers the alert from the **What
        to Evaluate** list.

    6.  Select the frequency with which to be notified if the event log
        threshold is reached from the **Notification Frequency** list.

4.  Configure the parameters of the alert.

    **Note:**

    The available parameters depend on the options you selected in the **Based On** and **What to Evaluate** lists. See later sections for the details of these parameters.

5.  Optionally, select **Send an E-mail** to configure options so that an email is sent when the alert is triggered:

    1.  Enter the email address from which to send the email in the **From** field.

    2.  Select a user from the **Add a User** list to add a user registered in {{ site.data.product.title_short }}. The user must have a valid email address entered under accounts.

    3.  Enter the email address of a user in the **Add (enter
        manually)** field and click ![2261](../images/2261.png) to add a
        user not registered in {{ site.data.product.title_short }}.

6.  Optionally, select **Send an SNMP Trap** to configure options so
    that an SNMP trap is sent when the alert is triggered:

    1.  Enter the IP addresses of the hosts to send the trap in the
        **Host** fields.

    2.  Select the version of SNMP to use from the **Version** list:

        1.  If you select **v1**, enter a trap number in the **Trap
            Number** field. Enter **1**, **2**, or **3**, based on the
            appropriate suffix number in the table below.

        2.  If you select **v2**, enter a trap object ID in the **Trap
            Object ID** field. Enter **info**, **warning**, or
            **critical** based on the values in the table below.

            | Object ID             | Suffix Number Added to PEN | PEN with the Suffix Added |
            | --------------------- | -------------------------- | ------------------------- |
            | info                  | 1                          | 1.3.6.1.4.1.33482.1       |
            | warn, warning         | 2                          | 1.3.6.1.4.1.33482.2       |
            | crit, critical, error | 3                          | 1.3.6.1.4.1.33482.3       |


7.  Optionally, select **Send a Management Event** to trigger an
    automation event:

    1.  Enter the name of the event that exists in the **Process/Event
        Class** in the **Event Name** field.

8.  Click **Add**.
