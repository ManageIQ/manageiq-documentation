---
---

# Oracle Kubernetes Engine (OKE) Container Provider

After initial installation and creation of a {{ site.data.product.title_short }}
environment you can add an Oracle Kubernetes Engine Container provider.

1.  Browse to menu: **Compute > Containers > Providers**.

2.  Click **Configuration**, then
    click ![Add a New Containers Provider](../../images/1862.png)
     (**Add a New Containers Provider**).

3.  From the **Type** list, select **Oracle Kubernetes Engine**.

4.  Enter a **Name** for the provider.

5.  Enter the appropriate **Zone** for the provider. If you do not
    specify a zone, it is set to `default`.

6.  Select the provider region where your Oracle Kubernetes Cluster is located

7.  Next you will need to gather your Oracle Tenant ID from
https://cloud.oracle.com/tenancy, and use the `Copy` link to fetch your tenant
OCID.

8.  Now you need to enter the Cluster ID of your OKE cluster.  This can be found
on the `Cluster Details` tab on your cluster's dashboard at `Cluster Id`.
Use the `Copy` link to copy this ID.

9.  In the **Default** tab, configure the following for the OKE provider:

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
    2.  Enter the **Hostname** of the cluster, you can obtain this from the
    `Cluster Details` page at `Kubernetes API Public Endpoint`

    3.  Enter the **API Port** of the cluster. The default port is `6443`.

    4.  Enter the Oracle User ID for the user that you want
     {{ site.data.product.title_short }} to use to access your account.
     You can get this from the `Profile` dropdown and clicking on your username.
     Then use the `Copy` link to copy the OCID for your user.

    5.  Next copy and paste the public key for your user's Auth Token.  If you
    do not have one yet you can create an Auth Token by going to your user
    profile and selecting `Auth Tokens` under `Resources` and select the
    `Generate Token` button.

    6.  Now copy and paste your private key from the same auth token.

    7.  Click **Validate** to confirm that {{ site.data.product.title_short }} can connect
        to the Oracle Kubernetes Engine provider.
10. Click **Add**.
