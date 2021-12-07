# VMware Tanzu Container Provider

After initial installation and creation of a {{ site.data.product.title_short }}
environment you can add a VMware Tanzu Container provider.

1.  Browse to menu: **Compute > Containers > Providers**.

2.  Click **Configuration**, then
    click ![Add a New Containers Provider](../../images/1862.png)
     (**Add a New Containers Provider**).

3.  From the **Type** list, select **VMware Tanzu**.

4.  Enter a **Name** for the provider.

5.  Enter the appropriate **Zone** for the provider. If you do not
    specify a zone, it is set to `default`.

6.  In the **Default** tab, configure the following for the VMware Tanzu
    provider:

    1.  Select a **Security Protocol** method to specify how to
        authenticate the provider:

          - **SSL**: Authenticate the provider securely using a trusted
            Certificate Authority. Select this option if the provider
            has a valid SSL certificate and it is signed by a trusted
            Certificate Authority. No further configuration is required
            for this option.

          - **SSL trusting custom CA**: Authenticate the provider with a
            self-signed certificate. For this option, copy your
            provider’s CA certificate to the **Trusted CA
            Certificates** box in PEM format.

          - **SSL without validation**: Authenticate the provider
            insecurely (not recommended).

    2.  Enter the **Hostname** (or IPv4 or IPv6 address) of the provider.

        **Important:**

        The **Hostname** must use a unique fully qualified domain name.

    3.  Enter the **API Port** of the provider. The default port is
        `8443`.

    4. Enter the **Username** of your user.  This user must have cluster
       level access to the VMware Tanzu cluster.

    5. Enter the **Password** of your user.

    6. Click **Validate** to confirm that {{ site.data.product.title_short }} can connect
       to the VMware Tanzu provider.

7. Click **Add**.
