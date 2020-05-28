### Creating an Hourly Performance Alert

Hourly performance alerts enable you to be notified immediately when an
hourly performance threshold has been met for a cluster. Capacity and
Utilization must be enabled for performance thresholds to be detected.

1.  Navigate to menu:Control\[Explorer\].

2.  Click the **Alerts** accordion.

3.  Click ![1847](/images/1847.png) (**Configuration**),
    ![1862](/images/1862.png) (**Add a new Alert**).

4.  In the **Info** area:

    ![1979](/images/1979.png)

      - Type in a **Description** for the alert.

      - From **Based On**, select **Cluster**.

      - For **What to Evaluate**, select **Hourly Performance**.

      - In **Notification Frequency**, select how often you want to be
        notified if threshold is met.

5.  In the **Hourly Performance Parameters** area select performance
    field and the criteria. You can also select options from the **And
    is Trending** dropdown box and whether the **Debug Tracing** is true
    or false.

6.  After setting the parameters, you then select what you want the
    alert to do. You can send an email, create an SNMP Trap, or send a
    management event to start an automation process.

7.  Click **Add**.
