# Configuring Federated Authentication with SAML

This procedure outlines how to manually configure an appliance to use
SAML for federation authentication.

To enable external authentication using SAML, complete the following
steps to configure your HTTP server, then your {{ site.data.product.title_short }}
appliance.

<div class="note">

The current SAML implementation only secures the {{ site.data.product.title_short }}
appliance’s web user interface with SAML. The REST API and self service
user interface do not currently support SAML.

</div>

**SAML Requirements.**

The following is required in order to enable SAML authentication to the
appliance:

  - A {{ site.data.product.title_short }} appliance

  - A SAML identity provider (e.g. Red Hat Single Sign-On 7.0 or later)

## Configuring Authentication with SAML and Red Hat Single Sign-On (RH-SSO)

While other SAML identity providers can be used with
{{ site.data.product.title_short }}, this example procedure covers using Red Hat
Single Sign-On (RH-SSO) 7.0, which is implemented using the Apache HTTP
server’s `mod_auth_mellon` module.

<div class="note">

For more information about Red Hat Single Sign-On (RH-SSO), see the [Red
Hat Single Sign-On
documentation](https://access.redhat.com/products/red-hat-single-sign-on).

</div>

### Configuring the HTTP Server for SAML Authentication with Red Hat Single Sign-On (RH-SSO)

The Apache HTTP server first must be configured to work with SAML
authentication. All SAML-related certificates and keys are accessed from
`/etc/httpd/saml2/`.

1.  Log into the {{ site.data.product.title_short }} appliance as root using SSH, and
    create the `/etc/httpd/saml2/` directory:

        # mkdir -p /etc/httpd/saml2

2.  Copy the `httpd` remote user and SAML template configuration files
    to the appliance:

        # TEMPLATE_DIR="/opt/rh/cfme-appliance/TEMPLATE"
        # cp ${TEMPLATE_DIR}/etc/httpd/conf.d/manageiq-remote-user.conf /etc/httpd/conf.d/
        # cp ${TEMPLATE_DIR}/etc/httpd/conf.d/manageiq-external-auth-saml.conf /etc/httpd/conf.d/

    <div class="note">

    The following are notable SAML configuration defaults in the
    `manageiq-external-auth-saml.conf` file:

      - Identity Provider Files (i.e. Red Hat SSO)

          - Metadata File: `/etc/httpd/saml2/idp-metadata.xml`

      - Service Provider Files (i.e. `mod_auth_mellon`)

          - Private Key File: `/etc/httpd/saml2/miqsp-key.key`

          - Certificate File: `/etc/httpd/saml2/miqsp-cert.cert`

          - Metadata File: `/etc/httpd/saml2/miqsp-metadata.xml`

    Other `mod_auth_mellon` parameters, such as endpoints and protected
    URLs, must not be modified as the appliance expects them to be
    defined as such.

    </div>

3.  Generate the service provider files on the appliance using the
    Apache HTTP server’s `mod_auth_mellon` command
    `mellon_create_metadata.sh`:

        # cd /etc/httpd/saml2
        # /usr/libexec/mod_auth_mellon/mellon_create_metadata.sh https://<miq-appliance> https://<miq-appliance>/saml2

    The `mellon_create_metadata.sh` script creates file names based on
    the appliance URL.

    <div class="note">

    If your appliance is behind a load balancer or uses a virtual IP
    address, use the hostname associated with the VIP. For example: `#
    /usr/libexec/mod_auth_mellon/mellon_create_metadata.sh
    https://my-haproxy-ka https://my-haproxy-ka/saml2`

    </div>

4.  Rename the files created by the `mellon_create_metadata.sh` script
    to match the expected file names from the
    `manageiq-external-auth-saml.conf` file:

        # mv https_<miq-appliance>.key  miqsp-key.key
        # mv https_<miq-appliance>.cert miqsp-cert.cert
        # mv https_<miq-appliance>.xml  miqsp-metadata.xml

5.  Now that the service provider’s `metadata.xml` file has been
    generated, the service provider definition can be defined in the
    SAML identity provider. For Red Hat SSO, a realm can be created for
    one or more appliances with individual clients defined one per
    appliance, where the client ID is specified as the URL of the
    appliance.

    To add a client in the Red Hat SSO {{ site.data.product.title_short }} realm:

    1.  Select and import the `miqsp-metadata.xml` file created for
        `mod_auth_mellon`.

    2.  Set the client ID as `https://<miq-appliance&gt;`.

    3.  Set the client protocol as `saml`.

6.  Update the client definition for the appliance in Red Hat SSO with
    the following:

    | Setting                                     | Value                                        |
    | ------------------------------------------- | -------------------------------------------- |
    | Name ID Format                              | username                                     |
    | Valid Redirect URIs                         | <https://<miq-appliance>/saml2/postResponse> |
    | Assertion Consumer Service POST Binding URL | <https://<miq-appliance>/saml2/postResponse> |
    | Logout Service Redirect Binding URL         | <https://<miq-appliance>/saml2/logout>       |


7.  Obtain the identity provider’s `idp-metadata.xml` metadata file as
    follows:

        # cd /etc/httpd/saml2
        # curl -s -o idp-metadata.xml \
          http://<redhatSSO-server>:8080/auth/realms/<miq-realm>/protocol/saml/descriptor

8.  In {{ site.data.product.title_short }}, the following change is necessary to the
    `idp-metadata.xml` file for SAML logout to work between
    `mod_auth_mellon` and Red Hat SSO:

        # vi idp-metadata.xml

          ...
          <SingleLogoutService
        <   Binding="urn:oasis:names:tc:SAML:2.0:bindings:HTTP-POST"
        ---
        >   Binding="urn:oasis:names:tc:SAML:2.0:bindings:HTTP-Redirect"
            Location=
          ...

9.  Restart the HTTP server on the appliance:

        # systemctl restart httpd

### Configuring SAML Authentication in the {{ site.data.product.title_short }} User Interface

After configuring the HTTP server for SAML, update the
{{ site.data.product.title_short }} appliance so that user interface can be accessed
using SAML authentication.

1.  Click ![config gear](../images/config-gear.png) (**Configuration**).

2.  Select your server in the **Settings** accordion.

3.  Select the **Authentication** tab.

4.  Select a **Session Timeout** to set the period of inactivity before
    a user is logged out of the console.

5.  Set the mode to **External (httpd)**.

6.  Check **Enable SAML**. This enables the SAML login button on the
    appliance login screen, then redirects to the SAML protected page
    for authentication, and supports the SAML logout process.

7.  Check **Enable Single Sign-On**. With this option enabled, initial
    access to the appliance’s user interface redirects to the SAML
    identity provider authentication screen. Logging out from the
    appliance returns the user to the appliance login screen, allowing
    them to log in as `admin` unless **Disable Local Login** is also
    checked.

8.  Optional: Check **Disable Local Login** to disable the `admin` login
    to appliance and only allow SAML based authentication. Note that if
    there are issues with the identity provider or you require `admin`
    access to the appliance, you cannot log in through the appliance
    login screen until you re-enable local login as described in
    [Re-enabling Local Login ](#re-enable-local-login).

9.  Check **Get User Groups from External Authentication (httpd)**.

10. Click **Save**.

<div class="important">

Ensure the user’s groups are created on the appliance and appropriate
roles are assigned to those groups. See *SAML Assertions* in [SAML
Assertions](#saml-assertions) for more information on the parameters
used by the {{ site.data.product.title_short }} appliance.

For example, to configure user groups from your SAML identity provider
to work with {{ site.data.product.title_short }}:

1.  In your SAML identity provider, specify your existing user groups in
    similar format to the following:
    `REMOTE_USER_GROUPS=Administrators;CloudAdministrators;Users`

2.  On your {{ site.data.product.title_short }} appliance, create the equivalent
    groups. See [Creating a User
    Group](https://www.manageiq.org/docs/reference/latest/general_configuration/index.html#creating-a-group)
    in *General Configuration*.

3.  On your {{ site.data.product.title_short }} appliance, assign EVM roles to the
    groups. See [Creating a
    Role](https://www.manageiq.org/docs/reference/latest/general_configuration/index.html#creating-a-role)
    in *General Configuration*.

</div>

Complete the above steps on each appliance in the settings menu, then
navigate to menu:Configuration\[Access Control\].

You can now log into your {{ site.data.product.title_short }} appliance using your
SAML credentials.

## SAML Assertions

To authenticate to the {{ site.data.product.title_short }} appliance using SAML, the
following remote user parameters are looked at by the appliance upon a
successful login and redirect from the identity provider. These
parameters are used by the appliance to obtain group authentication
information.

| HTTP Environment        | SAML Assertion |
| ----------------------- | -------------- |
| REMOTE\_USER            | username       |
| REMOTE\_USER\_EMAIL     | email          |
| REMOTE\_USER\_FIRSTNAME | firstname      |
| REMOTE\_USER\_LASTNAME  | lastname       |
| REMOTE\_USER\_FULLNAME  | fullname       |
| REMOTE\_USER\_GROUPS    | groups         |

For Red Hat SSO, the above SAML assertions can be defined for the
appliance client in Red Hat SSO as mappers.

| Name      | Category                  | Type           | Property  |
| --------- | ------------------------- | -------------- | --------- |
| username  | AttributeStatement Mapper | User Property  | username  |
| email     | AttributeStatement Mapper | User Property  | email     |
| firstname | AttributeStatement Mapper | User Property  | firstName |
| lastname  | AttributeStatement Mapper | User Property  | lastName  |
| fullname  | AttributeStatement Mapper | User Attribute | fullName  |
| groups    | Group Mapper              | Group List     | groups    |

<div class="important">

The `fullName` attribute was not available in the default database as of
this writing and was added as a user attribute.

</div>

## Re-enabling Local Login *(Optional)*

If you disabled local login in the {{ site.data.product.title_short }} user interface
but need the ability to log in as `admin`, you can re-enable local login
using one of the following methods:

**Re-enabling Local Login from the Appliance User Interface.**

This method requires the identity provider to be available, and the
ability to log in as a user with enough administrative privileges to
update {{ site.data.product.title_short }} authentication settings.

1.  Log in to the appliance user interface as the administrative user.

2.  From the settings menu, select menu:Configuration\[Authentication\].

3.  Uncheck **Disable Local Login**.

4.  Click **Save**.

<!-- end list -->

1.  Use SSH to log into the appliance as `root`.

2.  Run the `appliance_console` command.

3.  Select **Update External Authentication Options**.

4.  Select **Enable Local Login**.

5.  Apply the updates.

Alternatively, log into the appliance as root using SSH, and run the
following command:

    # appliance_console_cli --extauth-opts local_login_disabled=false
