# Introduction to Authentication in {{ site.data.product.title_short }}

{{ site.data.product.title }} provides several methods to authenticate users.
Authentication can be configured from {{ site.data.product.title_short }} using the
local database, or {{ site.data.product.title_short }} can use protocols such as LDAP
and SAML to connect to a pre-configured authentication system such as
Red Hat Identity Management (IdM), Red Hat Single Sign-On (SSO), Active
Directory (AD), or AWS Identity and Access Management (IAM) to use
existing user accounts and groups.

This guide provides instructions to configure authentication management
in your {{ site.data.product.title_short }} environment as an administrative user.

After completing the setup of an authentication system, users can log in
with their credentials.

<div class="note">

For further information on managing users, groups, and account roles,
see [Access
Control](https://access.redhat.com/documentation/en-us/red_hat_cloudforms/4.7/html-single/general_configuration/#access-control)
in *General Configuration*.

</div>

## Configuring Authentication Settings in {{ site.data.product.title_short }}

As the admin user, configure your authentication method from the
**Authentication** tab in the **Configuration** menu.

To change authentication settings:

1.  Click ![config gear](/images/config-gear.png) (**Configuration**).

2.  Select your server in the **Settings** accordion.

3.  Select the **Authentication** tab.

4.  Use **Session Timeout** to set the period of inactivity before a
    user is logged out of the console.

5.  Set the authentication method in **Mode** from the following
    methods:

      - To configure authentication locally using the Virtual Management
        Database (VMDB), choose **Database**. This is the default
        method. See [Creating a
        User](https://access.redhat.com/documentation/en-us/red_hat_cloudforms/4.5/html-single/general_configuration/#creating_a_user)
        in *General Configuration* to create users from
        {{ site.data.product.title_short }}.

      - To configure LDAP-based authentication to use with IdM or Active
        Directory, choose **LDAP** or **LDAPS**, see
        [???](#ldap_settings) for configuration steps.

      - To configure Amazon AWS Identity and Access Management (IAM)
        authentication, choose **Amazon**, see [???](#amazon_settings)
        for configuration steps.

      - To configure federated authentication to use with IdM or Red Hat
        Single Sign-On (SSO), choose **External (httpd)** and follow the
        steps for your authentication method in [???](#external_auth).
