---
---

## SAML

External Authentication on the Appliance has been enhanced to support
SAML. The SAML implementation has been tested with KeyCloak 1.8.

In this guide we will cover how to manually configure an Appliance’s
external authentication to work with SAML. The SAML implementation has
been tested with KeyCloak but is implemented generically using Apache’s
mod\_auth\_mellon module and should work with other SAML Identity
Providers.

The current implementation only secures the Appliance’s Web
administrative UI with SAML.

**Note:** The REST API and Self-Service UI do not currently support
SAML.

1.  [Requirements](#requirements)

2.  [Configuring SAML](#configuring-saml)

3.  [Configuring the Administrative UI](#configuring-admin-ui)

4.  [Re-Enabling Local Login](#re-enabling-local-login)

5.  [Configuring SAML using the CLI](#configuring-saml-via-cli)

## Requirements

The following is needed in order to enable SAML Authentication to the
Appliance:

  - A CentOS/RHEL 7.2 based Appliance

  - A SAML Identity Provider, (e.g. KeyCloak 1.8 or Later)

## Configure SAML

All SAML related certificates and keys are accessed from
/etc/httpd/saml2/

First ssh to the appliance as root, then create that directory:

    # mkdir -p /etc/httpd/saml2

### Apache Configuration

Copy the Apache remote user and SAML template configuration files:

    # TEMPLATE_DIR="{{ site.data.product.appliance_rpm_dir }}/TEMPLATE"
    # cp ${TEMPLATE_DIR}/etc/httpd/conf.d/manageiq-remote-user.conf        \
        /etc/httpd/conf.d/
    # cp ${TEMPLATE_DIR}/etc/httpd/conf.d/manageiq-external-auth-saml.conf \
        /etc/httpd/conf.d/

### SAML Configuration

Notable defaults in the *manageiq-external-auth-saml.conf* file:

| Description                                         | Default                             |
| --------------------------------------------------- | ----------------------------------- |
| **Identity Provider Files** (i.e. KeyCloak)         |                                     |
| Metadata File                                       | /etc/httpd/saml2/idp-metadata.xml   |
| **Service Provider Files** (i.e. mod\_auth\_mellon) |                                     |
| Private Key File                                    | /etc/httpd/saml2/miqsp-key.key      |
| Certificate File                                    | /etc/httpd/saml2/miqsp-cert.cert    |
| Metadata File                                       | /etc/httpd/saml2/miqsp-metadata.xml |

Other mod\_auth\_mellon parameters must not be modified as the Appliance
expects them to be defined as such, i.e. End points, Protected URL, etc.

For the Service Provider files on the Appliance, these can be generated
using the mod\_auth\_mellon command *mellon\_create\_metadata.sh* as
follows:

    # cd /etc/httpd/saml2
    # /usr/libexec/mod_auth_mellon/mellon_create_metadata.sh https://<miq-appliance> https://<miq-appliance>/saml2

The mellon\_create\_metadata.sh script creates file names based on the
appliance URL but can be renamed to match the expected file names from
the *manageiq-external-auth-saml.conf* file:

    # mv https_<miq-appliance>.key  miqsp-key.key
    # mv https_<miq-appliance>.cert miqsp-cert.cert
    # mv https_<miq-appliance>.xml  miqsp-metadata.xml

With the service provider metadata.xml file generated, the Service
Provider definition can now be defined in the Identity Provider.

For KeyCloak, a Realm can be created for one or more Appliances with
individual Clients defined one per Appliance where the Client ID is
essentially the URL of the appliance.

Adding a Client in the KeyCloak ManageIQ Realm:

  - Select and Import the miqsp-metadata.xml file created for
    mod\_auth\_mellon.

  - Set Client ID as <https://<miq-appliance>>

  - Set Client protocol as **saml**.

The Client definition for the appliance can then be updated with the
following:

| Setting             | Value                                        |
| ------------------- | -------------------------------------------- |
| Name ID Format      | username                                     |
| Valid Redirect URIs | <https://<miq-appliance>/saml2/paosResponse> |
|                     | <https://<miq-appliance>/saml2/postResponse> |
| Base URL            | <https://<miq-appliance>/>                   |

| **Fine Grain SAML Endpoint Configuration**      |                                              |
| ----------------------------------------------- | -------------------------------------------- |
| **Setting**                                     | **Value**                                    |
| Assertion Consumer Service POST Binding URL     | <https://<miq-appliance>/saml2/postResponse> |
| Assertion Consumer Service Redirect Binding URL | <https://<miq-appliance>/saml2/postResponse> |
| Logout Service Redirect Binding URL             | <https://<miq-appliance>/saml2/logout>       |

The Identity Provider’s Metadata file idp-metadata.xml can then be
obtained as follows:

    # cd /etc/httpd/saml2
    # curl -s -o idp-metadata.xml \
        http://<keycloak-server>:8080/auth/realms/<miq-realm>/protocol/saml/descriptor

Finally, restart Apache on the appliance as follows:

    # systemctl restart httpd

#### SAML Assertions

For authenticating to the appliance, the following remote user
parameters are looked at by the appliance upon a successful login and
redirect from the Identity Provider.

| HTTP Environment        | SAML Assertion |
| ----------------------- | -------------- |
| REMOTE\_USER            | username       |
| REMOTE\_USER\_EMAIL     | email          |
| REMOTE\_USER\_FIRSTNAME | firstname      |
| REMOTE\_USER\_LASTNAME  | lastname       |
| REMOTE\_USER\_FULLNAME  | fullname       |
| REMOTE\_USER\_GROUPS    | groups         |

For KeyCloak, the above SAML Assertions can be created for the Appliance
Client in KeyCloak as Mappers.

| Name      | Mapper Type   | Property  | Friendly Name | SAML Attribute Name | SAML Attribute Name Format |
| --------- | ------------- | --------- | ------------- | ------------------- | -------------------------- |
| username  | User Property | username  | username      | username            | Basic                      |
| email     | User Property | email     | email         | email               | Basic                      |
| firstname | User Property | firstName | firstname     | firstname           | Basic                      |
| lastname  | User Property | lastName  | lastname      | lastname            | Basic                      |

| Name     | Mapper Type    | User Attribute | Friendly Name | SAML Attribute Name | SAML Attribute Name Format |
| -------- | -------------- | -------------- | ------------- | ------------------- | -------------------------- |
| fullname | User Attribute | fullName       | fullname      | fullname            | Basic                      |

| Name   | Mapper Type | Group attribute name | Friendly Name | SAML Attribute Name | SAML Attribute Name Format |
| ------ | ----------- | -------------------- | ------------- | ------------------- | -------------------------- |
| groups | Group List  | groups               | groups        | groups              | Basic                      |

**Note:** The fullName attribute was not available in the default
database as of this writing and must be added to each user as a user
attribute.

## Configure Administrative UI

After having configured Apache for SAML, the next step is to update the
Appliance Administrative UI to be SAML aware and function accordingly.

Login as admin, then in *Configure→Configuration→Authentication*

  - Set mode to External (httpd)

  - Check: *Enable Single Signon* - With this option enabled, initial
    access to the Appliance Administrative UI will redirect to the SAML
    Identity Provider authentication screen. Note that logouts from the
    Appliance will return the user to the Appliance login screen
    allowing them to login as admin unless *Disable Local Login* is
    checked below.

  - Check: *provider Type: \_Enable SAML* - This enables the SAML login
    button on the login screen, the redirects to the SAML protected page
    for authentication, and supports the SAML logout process.

  - Optional: Check: *Disable Local Login* - Do this **only** if you
    need to disable *admin* login to appliance and only allow SAML based
    authentication. Note that if there are issues with the Identity
    Provider or you need admin access to the appliance you won’t be able
    to login until you re-enable the Local Login as described below.

  - Check: *Get User Groups from External Authentication (httpd)*

  - Click Save.

The above steps need to be done on each UI enabled appliance.

in *Configure→Configuration→Access Control*

  - Make sure the user’s groups are created on the Appliance and
    appropriate roles assigned to those groups.

## Re-Enabling Local Login

If the Local Login has been disabled in the Administrative UI and there
is a need to be able to login as *admin*, the Local Login can be
re-enabled as follows:

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

## Configuring SAML using the CLI

Another way to configure SAML on the appliance is to use the appliance
console CLI instead of the above steps. The `--saml-config` subcommand
of the appliance console CLI allows one to configure the appliance for
SAML Authentication by updating both Apache configurations as well as
the necessary Administrative UI settings. The `--saml-unconfig`
subcommand is also provided for unconfiguring the appliance SAML
Authentication and reverting the appliance to Database Authentication.

Usage of the new Appliance Console CLI subcommands are as follows:

### Configure SAML

To configure the appliance for SAML Authentication:

    # appliance_console_cli --saml-config [--saml-client-host=miq_appliance.fqdn] \
                                           --saml-idp-metadata=file|url           \
                                          [--saml-enable-sso]

When --saml-client-host is not specified, the configured appliance host
is used for creating the SP metadata. This host fqdn must be reachable
from the SAML IDP.

Configuring SAML requires the IDP metadata file. The --saml-idp-metadata
option allows the user to specify the file path of a copy that was
downloaded to the appliance or by a URL, in which case the CLI downloads
the copy from the IDP.

Examples:

    --saml-idp-metadata=/tmp/downloaded_idp_metadata.xml

    --saml-idp-metadata=http://<idp-host:port>/auth/realms/<miq-realm>/protocol/saml/descriptor

In both cases, the IDP metadata file is copied to
`/etc/httpd/saml2/idp-metadata.xml`

By default, SSO is not enabled, so from the Appliance login page, the
user clicks on Log In to Corporate System to get redirected to the SAML
login page. With this option enabled, the Appliance redirects the user
to the SAML login page for logging in.

After SAML is configured, the SP metadata file can be fetched from
`/etc/httpd/saml2/miqsp-metadata.xml` to create the related Client on
the SAML IDP.

### Unconfigure SAML

To unconfigure the appliance from SAML Authentication and revert to
Database authentication:

    # appliance_console_cli --saml-unconfig

This will remove the Apache external authentication SAML configuration
files and revert the appliance’s authentication settings to Database
mode.
