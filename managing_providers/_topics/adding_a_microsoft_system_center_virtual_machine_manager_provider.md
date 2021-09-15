# Adding a Microsoft SCVMM Provider

After initial installation and creation of a {{ site.data.product.title_short }}
environment, add a Microsoft System Center Virtual Machine Manager
(SCVMM) provider to the appliance.

**Note:**

To authenticate the provider using a self-signed Certificate Authority (CA), configure the {{ site.data.product.title_short }} appliance to trust the
certificate using the steps in [Using a Self-Signed CA Certificate](#app-self_signed_CA) before adding
the provider.

1.  Browse to menu: **Compute > Infrastructure > Providers**.

2.  Click **Configuration**, then click
    ![1862](../images/1862.png) (**Add a New Infrastructure Provider**).

3.  Enter the **Name** of the provider to add. The **Name** is how the
    device is labeled in the console.

4.  Select **Microsoft System Center VMM** from the **Type** list.

5.  Enter the **Host Name or IP address(IPv4 or IPv6)** of the provider.

    <div class="important">

    The **Host Name** must use a unique fully qualified domain name.

    </div>

6.  Select **Kerberos** or **Basic (SSL)** from the **Security
    Protocol** list.

    1.  For **Kerberos**:

        1.  Enter the user name and realm in the **Username** field.

        2.  Enter the password in the **Password** field.

        3.  Enter the password again in the **Confirm Password** field.

    2.  For **Basic (SSL)**:

        1.  Enter the user name in the **Username** field.

        2.  Enter the password in the **Password** field.

        3.  Enter the password again in the **Confirm Password** field.

7.  Click **Validate** to confirm that {{ site.data.product.title_short }} can connect to
    the Microsoft System Center Virtual Machine Manager.

8.  Click **Add**.
