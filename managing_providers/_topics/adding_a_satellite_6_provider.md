# Adding a Satellite 6 Provider

To start provisioning bare metal machines, you need at least one Red Hat
Satelllite 6 provider added to {{ site.data.product.title }}.

1.  Navigate to menu:Configuration\[Management\].

2.  Select menu:Configuration\[Add a new Provider\].

3.  Enter a **Name** for the provider.

4.  Enter a **URL** for the provider. This is the root URL for the
    Satellite 6 server and can be either an IP address or a hostname.
    For example, *<http://satellite6.example.com>*.

5.  Select **Verify Peer Certificate** to use encrypted communication
    with the provider. This requires the **SSL certificates** from your
    Red Hat Satellite 6 provider.

6.  Enter a **Username** for a user on the provider. Ideally, this would
    be a user in Satellite 6 with administrative access.

7.  Enter a **Password**, and then enter it again in **Confirm
    Password**.

8.  Click **Validate** to test your connection with the Red Hat
    Satellite 6 server.

9.  Click **Add** to confirm your settings and save the provider.

{{ site.data.product.title }} saves the Satellite 6 provider in its database and
triggers a refresh of resources detected in the provider.
