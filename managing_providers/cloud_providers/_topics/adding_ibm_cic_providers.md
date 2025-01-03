Complete the following procedure to add an IBM CIC cloud provider in
{{ site.data.product.title_short }}.

1.  Browse to menu: **Compute > Clouds > Providers**.

2.  Click **Configuration**, then click
    ![1862](../../images/1862.png) (**Add a New Cloud Provider**).

3.  From the **Type** list, select **IBM Cloud Infrastructure Center**.

4.  Enter a **Name** for the provider.

5.  Select the appropriate **Zone**.

6.  Enter the CIC region in **Provider Region**.

7.  Select the appropriate **Domain ID**.

8.  (Optional) Enable tenant mapping by toggling the **Tenant Mapping Enabled**
    option to **On**. This synchronizes resources and users between the IBM
    CIC provider and {{ site.data.product.title_short }}. By default,
    tenant mapping is disabled.

9.  Under **Endpoints**, in the **Default** tab:

    1.  Select a **Security Protocol** method to specify how to authenticate the provider:

          - **SSL without validation**: Authenticate the provider insecurely
            using SSL.

          - **SSL**: Authenticate the provider securely using a trusted
            Certificate Authority. Select this option if the provider has a
            valid SSL certificate and it is signed by a trusted Certificate
            Authority. No further configuration is required for this option.
            This is the recommended authentication method.

          - **Non-SSL**: Connect to the provider insecurely using only
            HTTP protocol, without SSL.

    2.  In **CIC API Endpoint (Hostname or IPv4/IPv6 address)**, enter the
        public IP or fully qualified domain name of the CIC API endpoint.

    3.  In **API Port**, set the public port used by the CIC API. By
        default, CIC is configured to use port 5000.

    4.  In the **API Username** field, enter the name of a user in the CIC
        environment.

        <div class="important">

        The user must have the **admin** role for the relevant domain.

        </div>

    5.  In the **API Password** field, enter the password for the user.

    6.  Click **Validate** to confirm {{ site.data.product.title_short }} can
        connect to the CIC provider.

10.  Click **Add**.
