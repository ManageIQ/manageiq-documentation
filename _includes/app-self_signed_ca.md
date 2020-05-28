## Using a Self-Signed CA Certificate

Adding a self-signed Certificate Authority (CA) certificate for SSL
authentication requires additional configuration on OpenStack Platform
and Microsoft System Center Virtual Machine Manager (SCVMM) providers.

<div class="note">

This procedure is not required for OpenShift Container Platform, Red Hat
Virtualization, or middleware manager providers, which have the option
to select **SSL trusting custom CA** as a **Security Protocol** in the
user interface. These steps are needed only for providers without this
option in the user interface.

</div>

Before adding the provider, configure the following:

1.  Copy your provider’s CA certificate in PEM format to
    `/etc/pki/ca-trust/source/anchors/` on your {{ site.data.product.title_short }}
    appliance.

2.  Update the trust settings on the appliance:

        # update-ca-trust

3.  Restart the EVM processes on the server:

        # rake evm:restart

The CA certificate is added to the appliance, and you can add the
provider to {{ site.data.product.title_short }}.
