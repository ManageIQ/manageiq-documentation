### External Authentication Configuration Map Settings

See [Sample External Authentication
Configuration](#appe-saml-authentication-example) for an example
configuration map file.

The configuration map includes the following parameters:

  - auth-type
    The authentication type.

    This parameter controls which configuration files `httpd` will load
    upon startup. The default is `internal`. Supported values are:

    | Value              | External Authentication Configuration                                                         |
    | ------------------ | --------------------------------------------------------------------------------------------- |
    | `internal`         | Application Based Authentication - Database, LDAP/LDAPS, Amazon. This is the default.         |
    | `external`         | IPA, IPA 2-factor authentication, IPA/AD Trust, LDAP (OpenLDAP, RHDS, Active Directory, etc.) |
    | `active-directory` | Active Directory domain realm join                                                            |
    | `saml`             | SAML based authentication (Keycloak, ADFS, etc.)                                              |


    `auth-type` values

    <div class="important">

    Enabling external authentication must be done from the
    {{ site.data.product.title_short }} user interface; see the Authentication section
    in the [User Reference](https://www.manageiq.org/docs/reference/) for details.

    </div>

  - auth-kerberos-realms
    The Kerberos realms to join.

    When configuring external authentication against IPA, Active
    Directory or LDAP, this parameter defines the Kerberos realm `httpd`
    is configured against, such as *example.com*. When specifying
    multiple Kerberos realms, they must be separated by spaces. The
    default is `undefined`.

  - auth-configuration.conf
    The external authentication configuration file which declares the
    list of files to overlay upon startup if `auth-type` is other than
    `internal`.

    Syntax for the file is as follows:

        # for comments
        file = basename1 target_path1 permission1
        file = basename2 target_path2 permission2

    For the files to overlay on the `httpd` pod, one `file` directive is
    needed per file.

  - basename
    The name of the source file in the configuration map.

  - permission
    (optional) By default, files are copied using the pod’s default
    umask, owner and group, so files are created as mode 644 owner root,
    group root.

    `permission` can be specified as follows, reflecting the mode and
    ownership to set the copied files to:

      - mode

      - mode:owner

      - mode:owner:group

        For example:

      - 755

      - 640:root

      - 644:root:apache

        Binary files can be specified in the configuration map in their
        base64 encoded format with a basename having a `.base64`
        extension. Such files are then converted back to binary as they
        are copied to their target path.

        When an `/etc/sssd/sssd.conf` file is included in the
        configuration map, the `httpd` pod automatically enables the
        SSSD service upon startup.

  - target\_path
    The path of the file on the pod to overwrite, i.e.
    `/etc/sssd/sssd.conf`.

### Sample External Authentication Configuration

The following is an example of the data section of a SAML auth-config
map data section (excluding the content of the files):

``` bash
apiVersion: v1
data:
auth-type: saml
auth-kerberos-realms: example.com
auth-configuration.conf: |
#
# Configuration for SAML authentication
#
file = manageiq-remote-user.conf        /etc/httpd /conf.d/manageiq-remote-user.conf        644
file = manageiq-external-auth-saml.conf /etc/httpd/conf.d/manageiq-external-auth-saml.conf 644
file = idp-metadata.xml                 /etc/httpd/saml2/idp-metadata.xml                  644
file = sp-key.key                       /etc/httpd/saml2/sp-key.key                        600:root:root
file = sp-cert.cert                     /etc/httpd/saml2/sp-cert.cert                      644
file = sp-metadata.xml                  /etc/httpd/saml2/sp-metadata.xml                   644
manageiq-remote-user.conf: |
RequestHeader unset X_REMOTE_USER
...
manageiq-external-auth-saml.conf: |
LoadModule auth_mellon_module modules/mod_auth_mellon.so
...
idp-metadata.xml: |
<EntitiesDescriptor ...
...
</EntitiesDescriptor>
sp-key.key: |
-----BEGIN PRIVATE KEY-----
...
-----END PRIVATE KEY-----
sp-cert.cert: |
-----BEGIN CERTIFICATE-----
...
-----END CERTIFICATE-----
sp-metadata.xml: |
<EntityDescriptor ...
...
</EntityDescriptor>
```
