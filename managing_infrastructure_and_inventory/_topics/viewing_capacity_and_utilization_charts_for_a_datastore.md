# Viewing Capacity and Utilization Charts for a Datastore

You can view capacity and utilization data for a datastore.

**Note:**

{{ site.data.product.title_short }} requires network visibility to your provider assigned the server role of *Capacity & Utilization Collector* to enable this feature.

1.  Navigate to menu:Compute\[Infrastructure \> Datastores\], then click
    the Datastore for which to view Capacity and Utilization data.

2.  Click ![Monitoring](../images/1994.png) (**Monitoring**), and then
    ![Utilization](../images/1994.png) (**Utilization**).

3.  From **Interval**, select to view hourly or daily data points and the dates to view data.

4.  Use **Show VM Types** to include only managed/registered, managed/unregistered, or unmanaged virtual machines.

      - **Managed/Registered VM** - A virtual machine connected to a
        host and exists in the VMDB. Also, a template connected to a
        management system and exists in the VMDB.

        **Note:**

        Templates cannot be connected to a host.

      - **Managed/Unregistered VM** - A virtual machine or template that
        resides on a repository that is no longer connected to a
        management system or host, but exists in the VMDB. A virtual
        machine previously considered registered might become
        unregistered if the virtual machine is removed from management
        system inventory.

      - **Not Managed** - Files discovered on a datastore that do not
        have a virtual machine associated with them in the VMDB. These
        files might be registered to a management system that
        {{ site.data.product.title_short }} does not have configuration information.
        Possible causes might be the management system has not been
        discovered or the management system has been discovered but no
        security credentials are provided.

5.  Use **Time Profiles** to select a time range for the data.

**Note:**

Daily charts only include full days of data. If a day does not include all the 24 data points for a day, the data does not show for that day.

For information about data optimization including utilization trend reports, see [Data Optimization](../managing_infrastructure_and_inventory/index.html#data-optimization).
