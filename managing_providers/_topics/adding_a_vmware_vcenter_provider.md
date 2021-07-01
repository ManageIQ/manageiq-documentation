# Adding a VMware vCenter Provider

After initial installation and creation of a {{ site.data.product.title_short }}
environment, add a VMware vCenter provider to the appliance.

1.  Browse to menu: **Compute > Infrastructure > Providers**.

2.  Click **Configuration**, then
    click ![Add a New Infrastructure Provider](../images/1862.png) (**Add
    a New Infrastructure Provider**).

3.  Enter the **Name** of the provider to add. The **Name** is how the
    device is labeled in the console.

4.  Select **VMware vCenter** from the **Type** list.

5.  Enter the **Host Name or IP address(IPv4 or IPv6**) of the provider.

    <div class="important">

    The **Host Name** must use a unique fully qualified domain name.

    </div>

6.  Select the appropriate **Zone** for the provider. By default, the
    zone is set to **default**.

7.  Optional: Enter the **Host Default VNC Start Port** and **Host Default VNC End Port**. These properties are used for remote console access with VNC. If VNC is available from the hosts, list the available port range using the start and end port.

8.  In the **Credentials** area, under **Default**, provide the login
    credentials required for the VMware vCenter administrative user:

      - Enter the user name in the **Username** field.

      - Enter the password in the **Password** field.

      - Confirm the password in the **Confirm Password** field.

      - Click **Validate** to confirm {{ site.data.product.title_short }} can connect to the
        VMware vCenter.

9.  Click **Add**.
