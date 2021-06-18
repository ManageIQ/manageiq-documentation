# Editing a Containers Provider

Edit information about a provider such as the name, hostname, IP address or port, and credentials as required. If you have just upgraded your {{ site.data.product.title_short }} environment from an older version, edit the provider to specify the authentication method the provider uses to connect to {{ site.data.product.title_short }}.

1.  Browse to menu: **Compute > Containers > Providers**.

2.  Click the containers provider to edit.

3.  Click **Configuration**, and then ![Edit Selected Containers Provider](../images/1851.png) (**Edit Selected Containers Provider**).

4.  Edit the **Name** if required.

    **Note:**

    The **Type** value is unchangeable.

5.  Under **Endpoints** in the **Default** tab, edit the following as required:

    1.  Select a **Security Protocol** method to specify how to authenticate the provider:

          - **SSL**: Authenticate the provider securely using a trusted Certificate Authority. Select this option if the provider has a valid SSL certificate and it is signed by a trusted Certificate Authority. No further configuration is required for this option.

          - **SSL trusting custom CA**: Authenticate the provider with a self-signed certificate. For this option, copy your provider’s CA certificate to the **Trusted CA Certificates** box in PEM format.

            **Note:**

            You can obtain your OpenShift Container Platform provider’s CA certificate for all endpoints (default, metrics, alerts)
            from `/etc/origin/master/ca.crt`. Paste the output (a block of text starting with `-----BEGIN CERTIFICATE-----`) into
            the **Trusted CA Certificates** field.
            
          - **SSL without validation**: Authenticate the provider insecurely (not recommended).

    2.  Enter the **Hostname** (or IPv4 or IPv6 address) of the provider.

        **Important:**

        The **Hostname** must use a unique fully qualified domain name.
        
    3.  Enter the **API Port** of the provider. The default port is `8443`.

    4.  Enter a token for your provider in the **Token** box.

        **Note:**

        To obtain a token for your provider, run the `oc get secret` command on your provider; see [Obtaining an OpenShift Container Platform Management Token](../managing_providers/index.html#obtaining-an-openshift-container-platform-management-token).

        For example:

        \# oc get secret --namespace management-infra
        management-admin-token-8ixxs --template='{{index .data "ca.crt"}}' | base64 --decode

    5.  Click **Validate** to confirm that {{ site.data.product.title_short }} can connect to the OpenShift Container Platform provider.

6.  Under **Endpoints** in the **Metrics** tab, configure the following for gathering capacity and utilization metrics for Hawkular or Prometheus based on the selection:

    1.  Select a **Security Protocol** method to specify how to authenticate the provider:

          - **SSL**: Authenticate the provider securely using a trusted Certificate Authority. Select this option if the provider has a valid SSL certificate and it is signed by a trusted
            Certificate Authority. No further configuration is required for this option.

          - **SSL trusting custom CA**: Authenticate the provider with a self-signed certificate. For this option, copy your provider’s CA certificate to the **Trusted CA Certificates** box in PEM format.

          - **SSL without validation**: Authenticate the provider insecurely using SSL. (Not recommended)

    2.  Enter the **Hostname** (or IPv4 or IPv6 address) of the provider.

    3.  Enter the **API Port** if your provider uses a non-standard port for access. The default port is `443`.

    4.  Click **Validate** to confirm that {{ site.data.product.title_short }} can connect to the endpoint.

7.  Under **Endpoints** in the **Alerts** tab, configure the following for Prometheus alerting from the cluster.

      - **SSL**: Authenticate the provider securely using a trusted Certificate Authority. Select this option if the provider has a valid SSL certificate and it is signed by a trusted Certificate Authority. No further configuration is required for this option.

      - **SSL trusting custom CA**: Authenticate the provider with a self-signed certificate. For this option, copy your provider’s CA certificate to the **Trusted CA Certificates** box in PEM format.

      - **SSL without validation**: Authenticate the provider insecurely using SSL. (Not recommended)

        1.  Enter the **Hostname** (or IPv4 or IPv6 address) of the provider.

        2.  Enter the **API Port** if your provider uses a non-standard port for access. The default port is `443`.

        3.  Click **Validate** to confirm that {{ site.data.product.title_short }} can connect to the endpoint.

8.  Click **Save**.
