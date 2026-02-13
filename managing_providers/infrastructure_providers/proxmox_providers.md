---
---

# Proxmox VE Providers

Proxmox Virtual Environment is a complete, open-source server management platform for enterprise virtualization. It tightly integrates the KVM hypervisor and Linux Containers (LXC), software-defined storage and networking functionality, on a single platform. With the integrated web-based user interface you can manage VMs and containers, high availability for clusters, or the integrated disaster recovery tools with ease.

## Adding a Proxmox Provider

After initial installation and creation of a {{ site.data.product.title_short }}
environment, add a Proxmox provider to the appliance.

1.  Browse to menu: **Compute > Infrastructure > Providers**.

2.  Click **Configuration**, then
    click ![Add a New Infrastructure Provider](../../images/1862.png) (**Add
    a New Infrastructure Provider**).

3.  Select **Proxmox** from the **Type** list.

4.  Enter the **Name** of the provider to add. The **Name** is how the
    device is labeled in the console.

5.  Select the appropriate **Zone** for the provider. By default, the
    zone is set to **default**.

6.  Under **Endpoints** in the **Default** tab, configure the following:
      - Select **Verify** or **Do not verify** for **SSL Verification** to specify whether to authenticate securely to the provider using SSL.  This will default to **Verify**
      - Enter the **Host Name or IP address(IPv4 or IPv6)** of the provider.

        **Important:**

        The **Hostname** must be a unique fully qualified domain name.

      - Enter the **API Port** if your provider uses a non-standard port for access.  This will default to 8006

      - Enter the user name in the **Username** field.

      - Enter the password in the **Password** field.

      - Click **Validate** to confirm {{ site.data.product.title_short }} can connect to the Proxmox provider.

7.  Click **Add** to finish adding the Proxmox provider.
