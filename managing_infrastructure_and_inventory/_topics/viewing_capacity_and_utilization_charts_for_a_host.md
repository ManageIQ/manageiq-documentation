# Viewing Capacity and Utilization Charts for a Host

View Capacity & Utilization data for hosts that are part of a cluster.

<div class="note">

Your {{ site.data.product.title }} server requires network visibility to the provider
assigned the **Server Role** of **Capacity & Utilization Collector** to
enable this feature.

</div>

1.  Navigate to menu:Compute\[Infrastructure \> Hosts\].

2.  Click the Host to view capacity data.

3.  Click ![1994](../images/1994.png) (**Monitoring**), and then
    ![1994](../images/1994.png) (**Utilization**) or from the Host
    accordion, click menu:Properties\[Capacity & Utilization\].

4.  From **Interval**, select to view hourly or daily data points and
    the dates to view data. Use **Group by** to group the lines by
    SmartTags. Use **Time Profiles** to select a time range for the
    data.

    ![2220](../images/2220.png)

![2221](../images/2221.png)

The charts are displayed for CPU, memory, disk, network, and running
virtual machines.

<div class="note">

Daily charts only include full days of data. If a day does not include
all the 24 data points for a day, the data does not show for that day.

</div>

For information about data optimization including utilization trend
reports, see [???](#data-optimization).
