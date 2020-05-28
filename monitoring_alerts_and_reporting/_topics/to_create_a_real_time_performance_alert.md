### Creating a Real Time Performance Alert

Real Time Performance alerts enables you to be notified immediately when
a performance threshold has been met for a virtual machine, host, or
cluster. Capacity and Utilization must be enabled for performance
thresholds to be detected.

1.  Navigate to menu:Control\[Explorer\].

2.  Click the **Alert** accordion, then click ![1847](/images/1847.png)
    (**Configuration**), ![1862](/images/1862.png) (**Add a new
    Alert**).

3.  In the **Info** area:

      - Type in a **Description** for the alert.

      - From **Based On**, select **VM and Instance**.

      - For **What to Evaluate**, select **Real Time Performance**.

      - In **Notification Frequency**, select how often you want to be
        notified if the performance threshold is reached.

4.  Set the threshold in the **Real Time Performance Parameters** area.

    ![1978](/images/1978.png)

      - From **Performance Field**, select the field to check and any
        other parameters required for that field.

      - In **And is Trending**, select **Don’t Care** if it does not
        matter how the performance metric is trending. Otherwise, choose
        from the possible trending options.

      - In **Field Meets Criteria for**, select the amount of time that
        the threshold requires to be met to trigger the alert.

      - Set **Debug Tracing** to true only when directed to do so by Red
        Hat Support. This provides an extremely detailed level of
        logging and can result in many more log lines being written.

5.  After setting the parameters, you then select what you want the
    alert to do. You can send an email, create an SNMP Trap, or send a
    management event to start an automation process.

6.  Click **Add**.
