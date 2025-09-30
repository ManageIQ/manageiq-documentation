---
---

# Nutanix Providers

Nutanix AHV is a full-featured enterprise virtualization platform that can seamlessly
integrate into Nutanix Cloud Platform for full-stack management from a single intuitive UI.

## Adding a Nutanix Provider

After initial installation and creation of a {{ site.data.product.title_short }}
environment, add a Nutanix provider to the appliance.

1.  Browse to menu: **Compute > Infrastructure > Providers**.

2.  Click **Configuration**, then
    click ![Add a New Infrastructure Provider](../../images/1862.png) (**Add
    a New Infrastructure Provider**).

3.  Select **Nutanix** from the **Type** list.

4.  Enter the **Name** of the provider to add. The **Name** is how the
    device is labeled in the console.

5.  Select the appropriate **Zone** for the provider. By default, the
    zone is set to **default**.

6.  Under **Endpoints** in the **Default** tab, configure the following:
      - Select **Verify** or **Do not verify** for **SSL Verification** to specify whether to authenticate securely to the provider using SSL.  This will default to **Verify**
      - Enter the **Host Name or IP address(IPv4 or IPv6)** of the provider.

        **Important:**

        The **Hostname** must be a unique fully qualified domain name.

      - Enter the **API Port** if your provider uses a non-standard port for access.  This will default to 9440

      - Enter the user name in the **Username** field.

      - Enter the password in the **Password** field.

      - Click **Validate** to confirm {{ site.data.product.title_short }} can connect to the Nutanix provider.

7.  Click **Add** to finish adding the Nutanix provider.
