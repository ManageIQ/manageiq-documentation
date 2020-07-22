After initial installation and creation of a {{ site.data.product.title }}
environment, add an OpenStack infrastructure provider to the appliance.
{{ site.data.product.title }} supports operating with the OpenStack `admin` tenant.
When creating an OpenStack infrastructure provider in {{ site.data.product.title }},
select the OpenStack infrastructure provider’s `admin` user because it
is the default administrator of the OpenStack `admin` tenant. When using
the `admin` credentials, a user in {{ site.data.product.title }} provisions into the
`admin` tenant, and sees images, networks, and instances that are
associated with the `admin` tenant.

<div class="note">

  - You can set whether {{ site.data.product.title }} should use the Telemetry service
    or Advanced Message Queueing Protocol (AMQP) for event monitoring.
    If you choose Telemetry, you should first configure the
    **ceilometer** service on the undercloud to store events. See
    [???](#openstack-events-uc) for instructions. For more information,
    see [OpenStack Telemetry
    (ceilometer)](https://access.redhat.com/documentation/en-us/red_hat_openstack_platform/11/html-single/architecture_guide/#comp-telemetry)
    in the Red Hat OpenStack Platform *Architecture Guide*.

  - To authenticate the provider using a self-signed Certificate
    Authority (CA), configure the {{ site.data.product.title_short }} appliance to
    trust the certificate using the steps in [Using a Self-Signed CA Certificate](#app-self_signed_CA)
    before adding the provider.

</div>

1.  Navigate to menu:Compute\[Infrastructure \> Providers\].

2.  Click ![Configuration](../images/1847.png) (**Configuration**), then
    click ![Add a New Infrastructure Provider](../images/1862.png) (**Add
    a New Infrastructure Provider**).

3.  Enter the **Name** of the provider to add. The **Name** is how the
    device is labeled in the console.

4.  Select **OpenStack Platform Director** from the **Type** list.

5.  Select the **API Version** of your OpenStack provider’s Keystone
    service from the list. The default is `Keystone v2`.

    <div class="note">

    {% include openstack/osp-keystone-api-v3.md %}

    </div>

6.  Select the appropriate **Zone** for the provider. By default, the
    zone is set to **default**.

    <div class="note">

    For more information, see the definition of host aggregates and
    availability zones in [OpenStack Compute
    (nova)](https://access.redhat.com/documentation/en-us/red_hat_openstack_platform/11/html/architecture_guide/components#comp-compute)
    in the Red Hat OpenStack Platform *Architecture Guide*.

    </div>

7.  In the **Default** tab, under **Endpoints**, configure the host and
    authentication details of your OpenStack provider:

    1.  Select a **Security Protocol** method to specify how to
        authenticate the provider:

          - **SSL without validation**: Authenticate the provider
            insecurely using SSL.

          - **SSL**: Authenticate the provider securely using a trusted
            Certificate Authority. Select this option if the provider
            has a valid SSL certificate and it is signed by a trusted
            Certificate Authority. No further configuration is required
            for this option. This is the recommended authentication
            method.

          - **Non-SSL**: Connect to the provider insecurely using only
            HTTP protocol, without SSL.

    2.  Enter the **Host Name or IP address(IPv4 or IPv6)** of the
        provider. If your provider is an undercloud, use its hostname
        (see [Setting the Hostname for the
        System](https://access.redhat.com/documentation/en-us/red_hat_openstack_platform/11/html-single/director_installation_and_usage/#sect-Setting_the_Hostname_for_the_System)
        in Red Hat OpenStack Platform *Director Installation and Usage*
        for more details)

    3.  In **API Port**, set the public port used by the OpenStack
        Keystone service. By default, OpenStack uses port 5000 for
        non-SSL security protocol. For SSL, API port is 13000 by
        default.

    4.  In the **Username** field, enter the name of an OpenStack user
        with privileged access (for example, **admin**). Then, provide
        its corresponding password in the **Password** and **Confirm
        Password** fields.

    5.  Click **Validate** to confirm {{ site.data.product.title }} can connect to the
        OpenStack provider.

8.  Next, configure how {{ site.data.product.title }} should receive events from the
    OpenStack provider. Click the **Events** tab in the **Endpoints**
    section to start.

      - To use the Telemetry service of the OpenStack provider, select
        **Ceilometer**. Before you do so, the provider must first be
        configured accordingly. See [???](#openstack-events-uc) for
        details.

      - If you prefer to use the AMQP Messaging bus instead, select
        **AMQP**. When you do: In **Hostname (or IPv4 or IPv6 address)**
        (of the **Events** tab, under **Endpoints**), enter the public
        IP or fully qualified domain name of the AMQP host.

          - In the **API Port**, set the public port used by AMQP. By
            default, OpenStack uses port 5672 for this.

          - In the **Username** field, enter the name of an OpenStack
            user with privileged access (for example, **admin**). Then,
            provide its corresponding password in the **Password**
            field.

          - Click **Validate** to confirm the credentials.

9.  You can also configure SSH access to all hosts managed by the
    OpenStack infrastructure provider. To do so, click on the **RSA key
    pair** tab in the **Endpoints** section.

    1.  From there, enter the **Username** of an account with privileged
        access.

    2.  If you selected **SSL** in **Endpoints \> Default \> Security
        Protocol** earlier, use the **Browse** button to find and set a
        private key.

10. Click **Add** after configuring the infrastructure provider.

<div class="note">

{{ site.data.product.title }} requires that the `adminURL` endpoint for all OpenStack
services be on a non-private network. Accordingly, assign the adminURL
endpoint an IP address of something other than `192.168.x.x`. The
`adminURL` endpoint must be accessible to the {{ site.data.product.title }} appliance
that is responsible for collecting inventory and gathering metrics from
the OpenStack environment. Additionally, all the Keystone endpoints must
be accessible, otherwise refresh will fail.

</div>
