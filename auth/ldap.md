---
---

## LDAP

This guide covers how to manually configure an appliance’s external authentication to work against LDAP. This provides LDAP users access to the Appliance UI as well as the REST API.

1.  [Testing OpenLDAP](#testing-openldap)

2.  [Configure SSSD](#configure-sssd)

3.  [Configure Apache](#configure-apache)

4.  [Configure SELinux](#configure-selinux)

5.  [Configure Administrative UI](#configure-admin-ui)

In these examples, the LDAP domain used will be *example.com*

**Note**: The SSSD and OpenLDAP configurations shown below are simply
examples. Depending on the Ldap environment, Ldap directory server used,
the configurations can widely differ. Many other options are available
to the *authconfig* command as well as the *sssd.conf* configuration
file.

The following reference are available for customizing SSSD for any LDAP
directory:

    # man authconfig
    # man ldap.conf
    # man sssd-ldap

The document @
<https://onemoretech.wordpress.com/2014/02/23/sssd-for-ldap-auth-on-linux/>
is also helpful.

## Testing OpenLDAP

### With SSL

For Configuring external authentication to Ldap, the sssd-ldap
communication must be secured (SSL or Start TLS). So an SSL Certificate
needs to be created.

The *apacheds-cert.pem* certificate file is used in the examples below.

Update the LDAP Directory Server to point to the keystore for the
certificate. This is used for both SSL and Start TLS.

For SSL, update the **/etc/openldap/ldap.conf** accordingly to test:

    SASL_NOCANON    on

    URI             ldaps://ldap-example.com:10636
    BASE            dc=example,dc=com
    TLS_REQCERT     demand
    TLS_CACERTDIR   /etc/openldap/cacerts
    TLS_CACERT      /etc/openldap/cacerts/apacheds-cert.pem

Then try out a search:

    # ldapsearch -x -H ldaps://ldap-example:10636 -LLL \
           -b "ou=people,dc=example,dc=com" -s sub     \
           "(objectclass=organizationalPerson)"

### With User Bind DN and Password

You can also test the ldap directory by specifying a user Bind DN and
password on the Ldap search command line as follows:

    # ldapsearch -x -H ldap://ldap-example:389 -LLL                 \
           -b "ou=people,dc=example,dc=com" -s sub                  \
           -D "ui=:userid,ou=People,dc=example,dc=com" -w :password \
           "(objectclass=organizationalPerson)"

## Configure SSSD

There are two different ways that SSSD can be configured.

For *CentOS 7* and earlier **authconfig** is used to configure SSSD.
Starting with *CentOS 8* a new command, **authselect** is used.

Perform the steps in only one of these two sections below:

  - Configure sssd.conf with authselect (CentOS 8 and newer)

  - Configure sssd.conf with authconfig (CentOS 7 and older)

**Note**: SSSD must be configured to communicate with LDAP over SSL or
Start TLS. Otherwise an authentication error will be returned to the
Appliance login screen.

### Configure sssd.conf with authselect (CentOS 8 and newer)

```
  # authselect select sssd --force
```

Seed the sssd.conf configuration file

**authselect** does not automatically generate the */etc/sssd/sssd.conf*
file, however the template, *sssd.conf.erb*, is now delivered with
ManageIQ which can be used to seed the */etc/sssd/sssd.conf*.

    # TEMPLATE_DIR="{{ site.data.product.appliance_rpm_dir }}/TEMPLATE"
    # mkdir -p /etc/sssd
    # cp ${TEMPLATE_DIR}/etc/sssd/sssd.conf.erb /etc/sssd/sssd.conf
    # chmod 600 /etc/sssd/sssd.conf

Update the SSSD configuration file /etc/sssd/sssd.conf to specify the
correct *ldap\_search\_base* and *ldap\_uri*:

    ...
    ldap_search_base = dc=example,dc=com
    id_provider = ldap
    auth_provider = ldap
    chpass_provider = ldap
    ldap_uri = ldaps://ldap-example.com:10636
    ldap_id_use_start_tls = False
    cache_credentials = True
    ...

### Configure sssd.conf with authconfig (CentOS 7 and older)

```
  # authconfig \
    --enablesssd                                \
    --enablesssdauth                            \
    --enablelocauthorize                        \
    --enableldap                                \
    --enableldapauth                            \
    --ldapserver=ldaps://ldap-example.com:10636 \
    --disableldaptls                            \
    --ldapbasedn=dc=example,dc=com              \
    --enablerfc2307bis                          \
    --enablecachecreds                          \
    --update
```

### Update **sssd.conf**

Edit the different sections in **/etc/sssd/sssd.conf** for the Appliance
as in the following example, customizing the main
**\[domain/example.com\]** section for the particular Ldap installation.

**Note**: Starting with SSSD version 1.15.2, which will be available in
CentOS version 7.4, SSSD will provide the domain name as a user
attribute. The below examples show how to set *ldap\_user\_extra\_attrs*
and *user\_attributes* to take advantage of this new feature. If running
an appliance built with CentOS version prior to CentOS 7.4 do not
include *domainname* for these attributes.

    =>  [domain/example.com]
        autofs_provider = ldap
        id_provider = ldap
        auth_provider = ldap
        chpass_provider = ldap
        ldap_schema = rfc2307bis

        ldap_uri = ldaps://ldap-example.com:10636
        ldap_id_use_start_tls = False
    =>  ldap_tls_cacertdir = /etc/openldap/cacerts
    =>  ldap_tls_cacert = /etc/openldap/cacerts/apacheds-cert.pem

    =>  ldap_pwd_policy = none

        ldap_search_base = dc=example,dc=com
    =>  ldap_network_timeout = 3

    =>  ldap_user_search_base = ou=people,dc=example,dc=com
    =>  ldap_user_object_class = posixAccount
    =>  ldap_user_name = uid
    =>  ldap_user_uid_number = uidNumber

    =>  ldap_group_object_class = groupOfNames
    =>  ldap_group_search_base = ou=user_groups,dc=example,dc=com
    =>  ldap_group_name = cn
    =>  ldap_group_member = member

        cache_credentials = True
    =>  entry_cache_timeout = 600

    =>  ldap_user_extra_attrs = mail, givenname, sn, displayname, domainname

        [sssd]
    =>  domains = example.com
        config_file_version = 2
    =>  services = nss, pam, ifp
    =>  sbus_timeout = 30
    =>  default_domain_suffix = example.com

        [nss]
        homedir_substring = /home

        [pam]
    =>  default_domain_suffix = example.com

    =>  [ifp]
    =>  default_domain_suffix = example.com
    =>  allowed_uids = apache, root, manageiq
    =>  user_attributes = +mail, +givenname, +sn, +displayname, +domainname

#### Testing SSSD Updates

The best way to test manual SSSD updates is to query a user via the
message bus system (D-Bus) API. When user attributes and groups are
properly returned, that is a good indication that the External
Authentication would succeed.

For the *dbus-send* command to succeed when run from command line,
SELinux must be in permissive mode.

    # setenforce 0

After each update to **sssd.cond**, restart the sssd service before
testing the changes.

    systemctl restart sssd

Example query of user attributes for user evmuser. This primarily
validates the *ldap\_user\_* attributes of **sssd.conf**.

    # dbus-send --print-reply --system --dest=org.freedesktop.sssd.infopipe /org/freedesktop/sssd/infopipe org.freedesktop.sssd.infopipe.GetUserAttr string:evmuser array:string:mail,givenname,sn,displayname,domainname

Query groups of user evmuser. This primarily validates the
*ldap\_group\_* attributes of **sssd.conf**.

    # dbus-send --print-reply --system --dest=org.freedesktop.sssd.infopipe /org/freedesktop/sssd/infopipe org.freedesktop.sssd.infopipe.GetUserGroups string:evmuser

With logging for each of the **sssd.conf** section in the appropriate
/var/log/sssd/ log file. The log files of primary interest are:

| Log File                            | Type of debugging                                     |
| ----------------------------------- | ----------------------------------------------------- |
| /var/log/sssd/sssd.log              | SSSD communication with processes                     |
| /var/log/sssd/sssd\_example.com.log | sssd-ldap communication to the LDAP server            |
| /var/log/sssd/sssd\_ifp.log         | Gathering user and group information from LDAP server |

For each of the log file here, an debug level attribute (maximum value
of 9) can be added to the appropriate **sssd.conf** section as follows:

```
    [ifp]
=>  debug_level = 9
    default_domain_suffix = example.com
    ...
```

When done testing, re-enable SELinux enforcing mode.

    # setenforce 1

**Note:** When testing authentication on the Appliance, if updates are
done in LDAP and not immediately seen when authenticating, then clean
the SSSD cache as follows then retry:

    # sss_cache -E

## Configure Apache

Create the Apache configuration files

    # TEMPLATE_DIR="{{ site.data.product.appliance_rpm_dir }}/TEMPLATE"
    # cp ${TEMPLATE_DIR}/etc/pam.d/httpd-auth                         \
                        /etc/pam.d/httpd-auth
    # cp ${TEMPLATE_DIR}/etc/httpd/conf.d/manageiq-remote-user.conf       \
                        /etc/httpd/conf.d/
    # cp ${TEMPLATE_DIR}/etc/httpd/conf.d/manageiq-external-auth.conf.erb \
                        /etc/httpd/conf.d/manageiq-external-auth.conf

## Configure SELinux

For SSSD to Ldap, assure that non-standard Ldap ports (other than 389 or
636) are allowed:

    # semanage port -a -t ldap_port_t -p tcp 10389
    # semanage port -a -t ldap_port_t -p tcp 10636

Set appropriate SELinux permissions:

    # setsebool -P allow_httpd_mod_auth_pam on
    # setsebool -P httpd_dbus_sssd          on

Restart Services

    # systemctl restart sssd
    # systemctl restart httpd

## Configure Administrative UI

Log in as admin, navigate to *Settings > Application Settings > Settings*.  Select the server, then select the *Authentication tab*

  - Set mode to External (httpd)

  - Check: *Get User Groups from External Authentication (httpd)*

  - Do not check: *Enable Single Signon* since Kerberos is not
    configured against LDAP.

  - Click Save.

The above steps need to be completed on each UI and WebService enabled
appliance.

Navigate to *Settings > Application Settings > Access Control*

  - Make sure the user’s LDAP group for the appliance are created and
    appropriate roles assigned to those groups.