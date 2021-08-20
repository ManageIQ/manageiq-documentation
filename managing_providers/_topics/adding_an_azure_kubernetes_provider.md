# Adding an Azure Kubernetes Service (AKS) Container Provider

After initial installation and creation of a {{ site.data.product.title_short }}
environment you can add an Azure Kubernetes Service Container provider.

You will need to retrieve the cluster hostname and the cluster_admin token.

Navigate to your AKS cluster in the Azure Portal (https://portal.azure.com).  In the `Overview` tab search for the `API server address`.  This is the `hostname` that you will need when you create your provider.

Next you need to retrieve your cluster_admin token, click on the `Connect` button.  This will open a panel with instructions on running the `az` command line utility in `Azure Cloud Shell` (you can also run this locally if you have the `az` utility installed).

```
az account set --subscription SUBSCRIPTION_ID
az aks get-credentials --admin --resource-group RESOURCE_GROUP_NAME --name CLUSTER_NAME
Merged "CLUSTER_NAME-admin" as current context in ~/.kube/config
```

Now grab the token for your user out of the `~.kube/config` file.  If this is the only cluster configured in your `~/.kube/config` then you can simply run:
```
grep 'token: ' .kube/config
    token: abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwx
```

If you already have multiple clusters configured search for your AKS cluster admin user, it will be named `clusterAdmin_${RESOURCE_GROUP_NAME}_${CLUSTER_NAME}`

1.  Browse to menu: **Compute > Containers > Providers**.

2.  Click **Configuration**, then
    click ![Add a New Containers Provider](../images/1862.png) (**Add a New Containers Provider**).

3.  Enter a **Name** for the provider.

4.  From the **Type** list, select **Azure Kubernetes Service**.

5.  Enter the appropriate **Zone** for the provider. If you do not
    specify a zone, it is set to `default`.

6.  In the **Default** tab, configure the following for the AKS
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

    2.  Enter the **Hostname** of the provider that you obtained earlier.

        **Important:**

        The **Hostname** must use a unique fully qualified domain name.

    3.  Enter the **API Port** of the provider. The default port is
        `443`.

    4.  Enter the token that you obtained earlier for your provider in the **Token** box.

    5.  Click **Validate** to confirm that {{ site.data.product.title_short }} can connect
        to the Azure Kubernetes Service provider.
7. Click **Add**.
