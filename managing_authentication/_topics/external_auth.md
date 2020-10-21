# Configuring Identity Management (External Authentication) with {{ site.data.product.title_short }}

You can configure {{ site.data.product.title_short }} to use system authentication
methods such as Red Hat Identity Management (IdM) or IPA, Red Hat Single
Sign-On (SSO), or Active Directory (AD).

This method uses `apache` (`httpd`) modules with web browsers to control
authentication to {{ site.data.product.title_short }}. It is the recommended
authentication method to connect {{ site.data.product.title_short }} with most
identity management services.

## Configuring Authentication with IPA

You can configure {{ site.data.product.title_short }} to use IPA with the **External
Authentication (httpd)** option in {{ site.data.product.title_short }}.

When external authentication is enabled, users can log in to the
{{ site.data.product.title_short }} appliance using their IPA server credentials. The
appliance creates user accounts automatically and imports relevant
information from the IPA server.

The appliance contains IPA client software for connecting to IPA
servers, but it is not configured by default. External authentication is
enabled by configuring it with the appliance console and enabling it the
web interface.

Disabling external authentication and returning to internal database
authentication also requires steps in both the appliance console and the
web user interface.

### External Authentication Requirements

  - For an appliance to leverage an IPA server on the network, both the
    appliance and the IPA server must have their clocks synchronized or
    Kerberos and LDAP authentication fail.

  - The IPA server must be known by DNS and accessible by name. If DNS
    is not configured accordingly, the hosts files need to be updated to
    reflect both IPA server and the appliance on both virtual machines.

  - For users to log in to the appliance using IPA server credentials,
    they must be members of at least one group on the IPA server which
    is also defined in the appliance. Navigate to the settings menu,
    then menu:Configuration\[Access Control \> Groups\] to administer
    groups.

### Configuring the Appliance for External Authentication

To configure the appliance for external authentication, set up
authentication using the appliance console, then select the **External
Authentication** option in the web user interface.

Using the appliance console:

1.  Log in to the appliance console using the user name `admin`.

2.  The summary screen displays:

        External Auth:  not configured

3.  Press Enter.

4.  Select **Configure External Authentication (httpd)**.

5.  Enter the fully qualified host name of the IPA server, for example
    *ipaserver.test.company.com*.

6.  Enter the IPA server domain, for example *test.company.com*.

7.  Enter the IPA server realm, for example *TEST.COMPANY.COM*.

8.  Enter the IPA server principal, for example *admin*.

9.  Enter the password of the IPA server principal.

10. Enter `y` to proceed.

**Note:**

If any of the following conditions are true, configuration fails:

  - The IPA server is not reachable by its FQDN

  - The IPA server cannot reach the appliance by its FQDN

  - The time is not synchronized between the appliance and the IPA
    server

  - The IPA server admin password is entered incorrectly

</div>

Alternatively, you can configure external authentication using the
`appliance_console_cli` command instead of using the appliance console
menu:

    $ ssh root@appliance.test.company.com
    [appliance]# /bin/appliance_console_cli --host appliance.test.company.com \
                                          --ipaserver ipaserver.test.company.com \
                                          --iparealm TEST.COMPANY.COM \
                                          --ipaprincipal admin \
                                          --ipapassword smartvm1

Finish configuring external authentication using the web user interface:

1.  Log in to the web user interface as an administrative user.

2.  Navigate to the settings menu, then menu:Configuration\[Settings \>
    Zone \> Server \> NTP Servers\] or use the hosting provider of the
    virtual machine to synchronize the appliance’s time with an NTP
    server.

3.  Click ![config gear](../images/config-gear.png) (**Configuration**).

4.  Select your server in the **Settings** accordion.

5.  Select the **Authentication** tab.

6.  Select a **Session Timeout** if required.

7.  Select **External (httpd)** in the **Mode list**.

8.  Select **Enable Single Sign-On** to allow single sign-on using
    Kerberos tickets from client machines that authenticate to the same
    IPA server as the appliance.

9.  In the **Role Settings** area, select **Get User Groups** from
    **External Authentication (https)**.

10. Click **Save**.

### Reverting to Internal Database Authentication

To revert to internal database authentication, first configure
authentication using the web user interface, then using the appliance
console.

Using the web user interface:

1.  Click ![config gear](../images/config-gear.png) (**Configuration**).

2.  Select your server in the **Settings** accordion.

3.  Select the **Authentication** tab.

4.  Select **Database** in the **Mode** list.

5.  Click **Save**.

Using the appliance console:

1.  Log in to the appliance console using the user name `admin`.

2.  The summary screen displays:

        External Auth:  Id.server.FQDN

3.  Press `Enter`.

4.  Select **Configure External Authentication (httpd)**. The currently
    configured IPA server host name and domain are displayed.

5.  Enter `y` to remove configuration details for the IPA client.

<!-- end list -->

    $ ssh root@appliance.test.company.com
    [appliance]# /bin/appliance_console_cli --uninstall-ipa

### Optional Configuration Using the Appliance Console CLI

In addition to using the appliance console, external authentication can
optionally be configured and reverted using the appliance console
command line interface.

Appliance console CLI command and relevant options include:

    /bin/appliance_console_cli --host <appliance_fqdn>
                               --ipaserver <ipa_server_fqdn>
                               --iparealm <realm_of_ipa_server>
                               --ipaprincipal <ipa_server_principal>
                               --ipapassword <ipa_server_password>
                               --uninstall-ipa4.5

  - \--host
    Updates the host name of the appliance. If you performed this step
    using the console and made the necessary updates made to
    `/etc/hosts` if DNS is not properly configured, you can omit the
    `--host` option.

  - \--iparealm
    If omitted, the `iparealm` is based on the domain name of the
    `ipaserver`.

  - \--ipaprincipal
    If omitted, defaults to admin.
