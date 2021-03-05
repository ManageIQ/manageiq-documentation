### Creating a hostd Log Threshold Alert

Use the **hostd Log Threshold** to send a notification when certain
items are found in the event logs for a host. A default analysis profile
with event log items is required for this feature. The following example
shows steps to check the host’s log for a failure to validate a virtual
machine’s IP address.

1.  Navigate to menu:Control\[Explorer\].

2.  Click the **Alert** accordion.

3.  Click ![1847](../images/1847.png) (**Configuration**),
    ![1862](../images/1862.png) (**Add a new Alert**).

4.  In the **Info** area:

    ![hostdlogalert](../images/hostdlogalert.png)

      - Type in a **Description** for the alert.

      - From **Based On**, select **Host/Node**.

      - For **What to Evaluate**, select **Hostd Log Threshold**.

      - In **Notification Frequency**, select how often you want to be
        notified if the log item is detected.

5.  In the **Hostd Log Threshold Parameters** area, select the
    parameters for the event log message. You can set a threshold for a
    filter, level, or message source.

      - Use **Message Filter** to look for specific text in a message.
        Use **Message Level** to filter based on message level.
        {{ site.data.product.title_short }} reports on the specified level and above. Use
        **Message Source** to filter log messages based on its source.

      - Set **How Far Back to Check** in days you want to look for this
        message.

      - If you only want an alert triggered when the log message has
        occurred a certain number of times, type the number in **Event
        Count Threshold**.

6.  After setting the parameters, select what you want the alert to do.
    You can send an email, create an SNMP Trap, or send a management
    event to start an automation process.

7.  Click **Add**.
