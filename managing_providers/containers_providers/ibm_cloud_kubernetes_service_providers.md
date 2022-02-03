---
---

# IBM Cloud Kubernetes Service (IKS) Container Provider

After initial installation and creation of a {{ site.data.product.title_short }}
environment you can add an IBM Cloud Kubernetes Service Container provider.

1.  Browse to menu: **Compute > Containers > Providers**.

2.  Click **Configuration**, then
    click ![Add a New Containers Provider](../../images/1862.png)
     (**Add a New Containers Provider**).

3.  From the **Type** list, select **IBM Cloud Kubernetes Service**.

4.  Enter a **Name** for the provider.

5.  Enter the appropriate **Zone** for the provider. If you do not
    specify a zone, it is set to `default`.

6.  Select a **Security Protocol** method to specify how to
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

7.  Enter the **Hostname** and **API Port** of the cluster. On IBM Cloud,
these values can be retrieved by accessing the `Overview` page for your cluster.
Under `Networking`, click `Copy link` to copy the `Public enabled` service endpoint
URL for your cluster. The URL will be copied in the following
format: `https://<Hostname>:<API Port>` and the necessary values can be extracted.

8.  Enter your IBM Cloud **API Key**. For detailed instructions on how to
create an IBM Cloud API key, see https://cloud.ibm.com/docs/account?topic=account-userapikey&interface=ui#create_user_key
**Note:** The API key must belong to the IBM Cloud user that created the cluster

9.  Click **Validate** to confirm that {{ site.data.product.title_short }} can connect
    to the IBM Cloud Kubernetes Service.

10. Click **Add**.


## Configuring Metrics Collection for IBM Cloud Kubernetes Service (IKS) Provider

1. On IBM Cloud, create an `IBM Cloud Monitoring` service instance

2. Log in to IBM Cloud CLI i.e. `ibmcloud login -sso`

3. Use the following command to retrieve the monitoring instance ID: `ibmcloud resource service-instance <INSTANCE_NAME> --output json | jq -r '.[].guid'`

Refer to the following table to determine the hostname for the `IBM Cloud Monitoring` service instance:

| Region   | Hostname                            |
| -------- | ----------------------------------- |
| US South | `us-south.monitoring.cloud.ibm.com` |
| EU DE    | `eu-de.monitoring.cloud.ibm.com`    |
| EU GB    | `eu-gb.monitoring.cloud.ibm.com`    |
| JP OSA   | `jp-osa.monitoring.cloud.ibm.com`   |
| JP TOK   | `jp-tok.monitoring.cloud.ibm.com`   |
| US East  | `us-east.monitoring.cloud.ibm.com`  |
| AU SYD   | `au-syd.monitoring.cloud.ibm.com`   |
| CA TOR   | `ca-tor.monitoring.cloud.ibm.com`   |
| BR SAO   | `br-sao.monitoring.cloud.ibm.com`   |

4. Enter the **Hostname** and **Monitoring Instance ID** under the **Metrics** tab when creating the IKS provider