Before you can access and apply package updates, you must register and
subscribe the {{ site.data.product.title_short }} appliance to either Red Hat Content
Delivery Network (CDN) or to a Red Hat Satellite server.

You need the following to register your appliance:

  - Your Red Hat account login or Red Hat Network Satellite login

  - A Red Hat subscription that covers your product

To register your appliance with Red Hat Subscription Management or Red
Hat Satellite 6, first configure the region with your registration
details. These settings will apply to all appliances in this region.

To configure registration for a region:

1.  Log in to the appliance as the `admin` user.

2.  Click ![Configuration](../images/config-gear.png)(**Configuration**).

3.  Select **Region** in the accordion menu and click the **Red Hat
    Updates** tab.

4.  Click **Edit Registration**.

5.  Configure registration details for the {{ site.data.product.title_short }} appliance
    using one of two available options:

    1.  To register with Red Hat Subscription Management:

        1.  In **Register to**, select **Red Hat Subscription
            Management**.

        2.  Enter the **Red Hat Subscription Management Address**. The
            default is `subscription.rhn.redhat.com`.

        3.  Enter the **Repository Name(s)**. The default list is
            {product-repo\_list-511}.

        4.  To use a HTTP proxy, select **Use HTTP Proxy** and enter
            your proxy details.

        5.  Enter your Red Hat account information and click
            **Validate**.

        6.  After your credentials are validated, click **Save**.

    2.  To register with Red Hat Satellite 6:

        1.  In **Register to**, select **Red Hat Satellite 6**.

        2.  Enter the **Red Hat Satellite 6 Address**. The default is
            `subscription.rhn.redhat.com`.

        3.  Enter the **Repository Name(s)**. The default list is
            {product-repo\_list-511}.

        4.  To use a HTTP proxy, select **Use HTTP Proxy** and enter
            your proxy details.

        5.  Enter your Red Hat Satellite account information and click
            **Validate**.

        6.  After your credentials are validated, click **Save**.

Your appliance now appears in the **Appliance Updates** list as `Not
registered`.

To register your appliance:

1.  Select the appliance from the **Appliance Updates** list.

2.  Click **Register** to subscribe the appliance and attach
    subscriptions.

Registering and attaching subscriptions takes a few minutes. The
subscription process is complete when the appliance reports that it is
`Subscribed` under **Update Status**, and `Registered` under **Last
Message**.

You can now apply updates to your appliance.
