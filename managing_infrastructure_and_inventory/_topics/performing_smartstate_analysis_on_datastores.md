# Performing SmartState Analysis on Datastores

Analyze a datastore to collect information on the types of files on a
datastore, and to see the number of managed/registered,
managed/unregistered, and unmanaged virtual machines. To perform a
SmartState analysis, the datastore is accessible from a running host and
valid security credentials are supplied for that host.

**Note:**

  - SmartState analysis on datastores is processed by the **Provider Operations** role. It is enabled by default.

  - Be aware that executing a SmartState analysis on a datastore from the console takes a while to return data on the content. If capacity and utilization roles are enabled, {{ site.data.product.title_short }} performs the analysis automatically on a scheduled basis approximately every 24 hours.

1.  Browse to menu: **Compute > Infrastructure > Datastores**.

2.  Select the datastores to analyze.

3.  Click **Configuration**, and
    then ![Perform SmartState Analysis](../images/1942.png) (**Perform SmartState Analysis**).

4.  Click **OK**.
