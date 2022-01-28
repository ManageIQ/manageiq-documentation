## Adding an IBM Power HMC Provider

After initial installation and creation of a {{ site.data.product.title_short }}
environment, add an IBM Power HMC provider to the appliance.

1.  Browse to menu: **Compute > Infrastructure > Providers**.

2.  Click **Configuration**, then
    click ![Add a New Infrastructure Provider](../../images/1862.png) (**Add
    a New Infrastructure Provider**).

3.  Select **IBM Power HMC** from the **Type** list.

4.  Enter the **Name** of the provider to add. The **Name** is how the
    device is labeled in the console.

5.  Select the appropriate **Zone** for the provider. By default, the
    zone is set to **default**.

6.  Under **Endpoints**, configure the following:

      - Select **SSL** or **SSL without validation** for **Security Protocol**
        to specify whether to authenticate securely to the provider using SSL.

      - Enter the **Hostname (or IPv4 or IPv6 address)** of the provider. The
        **Hostname** must use a unique fully qualified domain name.

      - Enter the **API port** if your provider uses a non-standard port for
        access.

      - Enter the user name in the **Username** field.

      - Enter the password in the **Password** field.

      - Click **Validate** to confirm {{ site.data.product.title_short }} can
        connect to the IBM Power HMC.

7. Click **Add**.
