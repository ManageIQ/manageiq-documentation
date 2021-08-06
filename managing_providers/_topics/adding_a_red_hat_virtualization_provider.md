# Adding a Red Hat Virtualization Provider

After initial installation and creation of a {{ site.data.product.title_short }} environment, add
a Red Hat Virtualization provider to the appliance.

1. Browse to menu: **Compute > Infrastructure > Providers**.

2. Click **Configuration**, then click
3. ![Add a New Infrastructure Provider](../images/1862.png) **Add a New Infrastructure Provider**.

4. Enter a **Name** for the provider.

5. Select **Red Hat Virtualization** from the **Type** list.

6. Select the appropriate **Zone** for the provider. If you do not specify a zone, it is set to
   **default**.

7. Under **Endpoints** in the **Default** tab, configure the following:

    - Enter the **Hostname** or IPv4 or IPv6 address of the Red Hat Virtualization Manager.

      **Important:**

      The **Hostname** must be a unique fully qualified domain name.

    - Enter the **API Port** if your provider uses a non-standard port for access.

    - Select **Yes** or **No** to **Verify TLS Certificates** to specify whether to authenticate securely to the provider using TLS.

      - If you select **Yes** for **Verify TLS Certificates**, you can either paste a custom certificate in the **Trusted CA Certificates** field in PEM format, or leave the **Trusted CA Certificates** field empty if your Red Hat Virtualization provider has a trusted Certificate Authority.

    - Provide the login credentials for the Red Hat Virtualization administrative user:

      - Enter the user name (formatted as `admin@internal`) in the **Username** field.

      - Enter the password in the **Password** field.

      - Confirm the password in the **Confirm Password** field.

        - Click **Validate** to confirm {{ site.data.product.title_short }} can connect to the Red Hat Virtualization Manager.

8. Under **Endpoints** in the **C & U Database** tab, you can configure capacity and utilization
   metrics collection by providing login credentials for the {{ site.data.product.title_short }}
   user of the Red Hat Virtualization Data Warehouse database. You can also configure this later
   by editing the provider. Configure the following in the **C & U Database** tab:

    **Important**

    To collect capacity and utilization data from a Red Hat Virtualization provider, the capacity
    and utilization server roles must be enabled in {{ site.data.product.title_short }}. The Red
    Hat Virtualization environment must also contain the Data Warehouse and Reports components and
    a {{ site.data.product.title_short }} user. Specific clusters, hosts, and datastores can also
    be configured for collection. See
    [Enabling Red Hat Virtualization Capacity and Utilization Data Collection](#enabling-red-hat-virtualization-capacity-and-utilization-data-collection)
    for configuration details.

      - Enter the database hostname or IPv4 or IPv6 address in **Hostname**.

      - Enter the **API Port** if your provider uses a non-standard port for access.

      - Enter the **Database Name**.

      - Enter the database user name in the **Username** field.

      - Enter the user password in the **Password** field.

      - Confirm the user password in the **Confirm Password** field.

      - Click **Validate** to confirm {{ site.data.product.title_short }} can connect to the database.

9. Click **Add** to finish adding the Red Hat Virtualization provider.
