---
---

## OpenID-Connect

External Authentication on the Appliance has been enhanced to support
OpenID-Connect, which will also be referred to as *OIDC*.

The OIDC implementation has been tested with KeyCloak 3.2.1.

In this guide we will cover how to manually configure an Appliance’s
external authentication to work with OIDC. The OIDC implementation has
been tested with KeyCloak but is implemented generically using Apache’s
mod\_auth\_openidc module and should work with other OIDC Identity
Providers.

The current implementation secures the Appliance’s Web
administrative and self service UI with OIDC.

1.  [Requirements](#requirements)

2.  [Configuring Keycloak](#configuring-keycloak)

3.  [OIDC Assertions](#oidc-assertions)

4.  [Apache Configuration](#apache-configuration)

5.  [OIDC Configuration](#oidc-configuration)

6.  [Configuring the Administrative
    UI](#configuring-the-administrative-ui)

7.  [Re-Enabling Local Login](#re-enabling-local-login)

8.  [Configuring OIDC using the CLI](#oidc-configuration-cli)

## Requirements

The following is needed in order to enable OIDC Authentication to the
Appliance:

  - A CentOS/RHEL 7.5 based Appliance

  - A OIDC Identity Provider, (e.g. KeyCloak 3.2.1 or Later)

## Configuring Keycloak

For KeyCloak, a Realm can be created for one or more Appliances with
individual Clients defined one per Appliance where the Client ID
identifies the individual appliance, e.g. the appliance hostname.

Adding a Client in the KeyCloak ManageIQ Realm:

  - Set Client ID as \<miq-appliance\>

  - Set Client protocol as **openid-connect**.

The Client definition for the appliance can then be updated with the
following:

| Setting                            | Value                                             |
| ---------------------------------- | ------------------------------------------------- |
| Client Protocol                    | openid-connect                                    |
| Access Type                        | confidential                                      |
| Valid Redirect URIs                | <https://<miq-appliance>>                         |
|                                    | <https://<miq-appliance>/ui/service/>             |
|                                    | <https://<miq-appliance>/oidc_login/redirect_uri> |
| User Info Signed                   | unsigned                                          |
| Request Object Signature Algorithm | any                                               |

The value used for OIDCClientSecret (*oidc\_client\_secret*) in the
*manageiq-external-auth-oidc.conf* file is taken from the Keycloak
Client’s *Credentials / Secret* value. To generate a new client secret,
First set the *Credentials / Client Authenticator* to *Client Id and
Secret* . Then *Regenerate Secret* button.

### OIDC Assertions

For authenticating to the appliance, the following remote user
parameters are looked at by the appliance upon a successful login and
redirect from the Identity Provider.

| HTTP Environment        | OIDC Assertion |
| ----------------------- | -------------- |
| REMOTE\_USER            | username       |
| REMOTE\_USER\_EMAIL     | email          |
| REMOTE\_USER\_FIRSTNAME | firstname      |
| REMOTE\_USER\_LASTNAME  | lastname       |
| REMOTE\_USER\_FULLNAME  | fullname       |
| REMOTE\_USER\_GROUPS    | groups         |

For KeyCloak, the above OIDC Assertions can be created for the Appliance
Client in KeyCloak as Mappers.

The following mappers are automatically generated when the OIDC client
is created:

| Name        | Category     | Mapper Type      |
| ----------- | ------------ | ---------------- |
| email       | Token mapper | User Property    |
| family name | Token mapper | User Property    |
| given name  | Token mapper | User Property    |
| full name   | Token mapper | User’s full name |
| username    | Token mapper | User Property    |

The following *Group Membership* mapper must be manually created:

| Name   | Consent Required | Mapper Type      | Token Claim Name | Full group path | Add to ID token | Add to access token | Add to userinfo |
| ------ | ---------------- | ---------------- | ---------------- | --------------- | --------------- | ------------------- | --------------- |
| groups | OFF              | Group Membership | groups           | OFF             | ON              | OFF                 | OFF             |

The following *User Session Note* mappers must be manually created:

| Name              | Consent Required | Mapper Type       | User Session Note | Token Claim Name | Claim JSON Type | Add to ID token | Add to access token |
| ----------------- | ---------------- | ----------------- | ----------------- | ---------------- | --------------- | --------------- | ------------------- |
| Client Host       | OFF              | User Session Note | clientHost        | clientHost       | String          | ON              | ON                  |
| Client ID         | OFF              | User Session Note | clientId          | clientId         | String          | ON              | ON                  |
| Client IP Address | OFF              | User Session Note | clientAddress     | clientAddress    | String          | ON              | ON                  |

### Apache Configuration

Copy the Apache OIDC template configuration files:

    # TEMPLATE_DIR="/var/www/miq/system/TEMPLATE"
    # cp ${TEMPLATE_DIR}/etc/httpd/conf.d/manageiq-remote-user-openidc.conf \
        /etc/httpd/conf.d/
    # cp ${TEMPLATE_DIR}/etc/httpd/conf.d/manageiq-external-auth-openidc.conf.erb \
        /etc/httpd/conf.d/manageiq-external-auth-openidc.conf

### OIDC Configuration

The Apache */etc/httpd/conf.d/manageiq-external-auth-openidc.conf*
configuration files must be updated with installation specific values:

The defaults in the *manageiq-external-auth-oidc.conf* file are:

| Name                     | Value     |
| ------------------------ | --------- |
| LogLevel                 | warn      |
| OIDCCryptoPassphrase     | sp-cookie |
| OIDCOAuthRemoteUserClaim | username  |

Installation specific values must be specified in the
*manageiq-external-auth-oidc.conf* file for the following parameters,
where the *parameter* including the \<%= …​ %\> anchors need to be
replaced with the appropriate values:

<table>
<colgroup>
<col style="width: 25%" />
<col style="width: 25%" />
<col style="width: 50%" />
</colgroup>
<thead>
<tr class="header">
<th>Name</th>
<th>Parameter</th>
<th>Value</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p>ServerName</p>
<p>and</p>
<p>OIDCRedirectURI</p></td>
<td><p>miq_appliance</p></td>
<td><p>FQDN of the appliance</p></td>
</tr>
<tr class="even">
<td><p>OIDCProviderMetadataURL</p></td>
<td><p>oidc_provider_metadata_url</p></td>
<td><p>The OpenID-Connect Provider URL, i.e. <a href="http://&lt;keycloak_server&gt;:8080/auth/realms/miq/.well-known/openid-configuration">http://&lt;keycloak_server&gt;:8080/auth/realms/miq/.well-known/openid-configuration</a></p></td>
</tr>
<tr class="odd">
<td><p>OIDCClientID</p>
<p>and</p>
<p>OIDCOAuthClientID</p></td>
<td><p>oidc_client_id</p></td>
<td><p>The OpenID-Connect Client ID</p></td>
</tr>
<tr class="even">
<td><p>OIDCClientSecret</p>
<p>end</p>
<p>OIDCOAuthClientSecret</p></td>
<td><p>oidc_client_secret</p></td>
<td><p>The OpenID-Connect Client Secret</p></td>
</tr>
<tr class="odd">
<td><p>OIDCOAuthIntrospectionEndpoint</p></td>
<td><p>oidc_introspection_endpoint</p></td>
<td><p>The OpenID-Connect Introspection Endpoint</p></td>
</tr>
</tbody>
</table>

Optional parameters can be appended to the end fo the configuration file
to avoid SSL verification. These can be used when a valid SSL server
certificate is not available for communicating with the OpenID Provider.

**NOTE: Using these parameters is insecure and should only be used in a
development environment.**

| Name                       | Value |
| -------------------------- | ----- |
| OIDCSSLValidateServer      | Off   |
| OIDCOAuthSSLValidateServer | Off   |

Finally, restart Apache on the appliance as follows:

    # systemctl restart httpd

## Configuring the Administrative UI

After having configured Apache for OIDC, the next step is to update the
Appliance Administrative UI to be OIDC aware and function accordingly.

Login as admin, then in *Configure→Configuration→Authentication*

  - Set mode to External (httpd)

  - Check: *Provider Type: Enable Enable OpenID-Connect* - This enables
    the OIDC login button on the login screen, that redirects to the
    OIDC protected page for authentication, and supports the OIDC logout
    process.

  - Optional: Check: *Enable Single Signon* - With this option enabled,
    initial access to the Appliance Administrative UI will redirect to
    the OIDC Identity Provider authentication screen. Note that logouts
    from the Appliance will return the user to the Appliance login
    screen allowing them to login as admin unless *Disable Local Login*
    is checked below.

  - Optional: Check: *Disable Local Login* - Do this **only** if you
    need to disable *admin* login to appliance and only allow OIDC based
    authentication. Note that if there are issues with the Identity
    Provider or you need admin access to the appliance you won’t be able
    to login until you re-enable the Local Login as described below.

  - Check: *Get User Groups from External Authentication (httpd)*

  - Click Save.

The above steps need to be done on each UI enabled appliance.

In Configure→Configuration→Access Control

  - Make sure the user’s groups are created on the Appliance and
    appropriate roles assigned to those groups.

## Re-Enabling Local Login

If the Local Login has been disabled in the Administrative UI and there
is a need to be able to login as *admin*, the Local Login can be
re-enabled using either of the following methods:

### Administrative UI:

This option is available if the Identity Provider is available and one
can login using a user with enough administrative privileges to update
it:

  - Login as administrative user,

  - In then in *Configure→Configuration→Authentication* uncheck *Disable
    Local Login* and save.

### Appliance Console Interface:

  - ssh to the appliance as root

  - Run *appliance\_console*

  - Select menu entry *Update External Authentication Options*

  - Select *Enable Local Login*

  - then *Apply updates*

### Appliance Console CLI:

  - ssh to the appliance as root

  - Run *appliance\_console\_cli --extauth-opts*
    **local\_login\_disabled=false**

## Configuring OIDC using the CLI

Another way to configure OpenID-Connect on the appliance is to use the
appliance console CLI instead of the above steps. The `--oidc-config`
subcommand of the appliance console CLI allows one to configure the
appliance for OpenID-Connect Authentication by updating both Apache
configurations as well as the necessary Administrative UI settings. The
`--oidc-unconfig` subcommand is also provided for unconfiguring the
appliance OpenID-Connect Authentication and reverting the appliance to
Database Authentication.

Usage of the new Appliance Console CLI subcommands are as follows:

### Configure OpenID-Connect

To configure the appliance for OpenID-Connect Authentication:

    # appliance_console_cli --oidc-config
                            [--oidc-client-host]
                            --oidc-url
                            --oidc-client-id
                            --oidc-client-secret
                            [--oidc-introspection-endpoint]
                            [--oidc-enable-sso]
                            [--oidc-insecure]

When the `--oidc-introspection-endpoint` is not specified, an attempt
will be made to fetch the introspection endpoint by querying the
OpenID-Connect Provider URL.

When the `--oidc-client-host` is not specified, the configured appliance
host is used for the ServerName and OpenID-Connect Redirect URI in the
OpenID-Connect Apache configuration file. The `--oidc-client-host` is
usually the externally reachable FQDN of the appliance.

When `--oidc-insecure` is specified no SSL verification will be done
when attempting to fetch the introspection endpoint and SSL verification
will be disabled using parameters `OIDCSSLValidateServer` and
`OIDCOAuthSSLValidateServer` as described above.

Configuring OpenID-Connect requires the following parameters:

| Parameter             | Description                               |
| --------------------- | ----------------------------------------- |
| \--oidc-url           | This is the OpenID-Connect Provider URL   |
| \--oidc-client-id     | The OpenID-Connect Provider Cliend ID     |
| \--oidc-client-secret | The OpenID-Connect Provider Client Secret |

The `--oidc-url` varies for different providers. An example provider URL
for keycloak:

    --oidc-url=http://keycloak-server:8080/auth/realms/miq-realm/.well-known/openid-configuration

With **miq-realm** being the Keycloak Realm this OpenID-Connect
appliance client is being configured for.

The `--oidc-client-id` is the Client ID specified for the appliance in
the OpenID-Connect provider, usually just `<miq-appliance-fqdn>`

By default, SSO is not enabled, so from the Appliance login page, the
user clicks on Log In to Corporate System to get redirected to the
OpenID-Connect login page. With the `--oidc-enable-sso` option
specified, the Appliance redirects the user to the OpenID-Connect login
page for logging in.

### Unconfigure OpenID-Connect

To unconfigure the appliance from OpenID-Connect Authentication and
revert to Database authentication:

    # appliance_console_cli --oidc-unconfig

This will remove the Apache external authentication OpenID-Connect
configuration files and revert the appliance’s authentication settings
to Database mode.
