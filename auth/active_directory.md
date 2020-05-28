---
---

## Active Directory

In this guide we will cover how to manually configure a 7.1 Appliance’s
external authentication to work against Active Directory. This provides
AD users access to the Appliance UI as well as the REST API.

1.  [Enabling Network Manager](#enabling-nm)

2.  [Discovering AD Domain](#discovering-ad-domain)

3.  [Joining AD Domain](#joining-ad-domain)

4.  [Allowing AD Users to Login to appliance](#allowing-ad-users-login)

5.  [Configure SSSD](#configure-sssd)

6.  [Configure Apache](#configure-apache)

7.  [Configure Administrative UI](#configure-admin-ui)

In these examples, the AD Domain shown will be EXAMPLE.COM

## Enabling Network Manager

By default, the appliance is configured with Network Manager enabled.
Having Network Manager enabled allows the **realm** command to discover
the available Active Directory domains that can be joined. If not
enabled, one can still join an AD domain if known by the domain name.

If the appliance has Network Manager disabled, it can be enabled as
follows:

    # systemctl enable NetworkManager
    # systemctl start NetworkManager

## Discovering AD Domains

This only works if Network Manager is enabled.

    # realm discover
    example.com
      type: kerberos
      realm-name: EXAMPLE.COM
      domain-name: example.com
      configured: kerberos-member
      server-software: active-directory
      client-software: sssd
      required-package: oddjob
      required-package: oddjob-mkhomedir
      required-package: sssd
      required-package: adcli
      required-package: samba-common
      login-formats: %U@example.com
      login-policy: allow-realm-logins

## Joining AD Domain

When joining an AD domain, specify a user that has enough permission to
be able to browse the directory.

    # realm join example.com -U user
    Password for user: xxxxxxxx
    #

## Allowing AD Users to Login

    # realm permit --all

## Configure SSSD

Update the **/etc/sssd/sssd.conf** file as follows:

**Note**: Starting with SSSD version 1.15.2, which will be available in
CentOS version 7.4, SSSD will provide the domain name as a user
attribute. The below examples show how to set *ldap\_user\_extra\_attrs*
and *user\_attributes* to take advantage of this new feature. If running
an appliance built with CentOS version prior to CentOS 7.4 do not
include *domainname* for these attributes.

```
    [domain/example.com]
    ad_domain = example.com
    krb5_realm = EXAMPLE.COM
    realmd_tags = manages-system joined-with-samba
    cache_credentials = True
    id_provider = ad
    krb5_store_password_if_offline = True
    default_shell = /bin/bash
    ldap_id_mapping = True
    use_fully_qualified_names = True
    fallback_homedir = /home/%d/%u
    access_provider = ad
=>  ad_gpo_map_permit = +httpd-auth
=>  ldap_user_extra_attrs = mail, givenname, sn, displayname, domainname

=>  [sssd]
=>  domains = example.com
=>  config_file_version = 2
=>  services = nss, pam, ifp
=>  default_domain_suffix = example.com

=>  [nss]
=>  homedir_substring = /home

=>  [pam]
=>  default_domain_suffix = example.com

=>  [ifp]
=>  default_domain_suffix = example.com
=>  allowed_uids = apache, root
=>  user_attributes = +mail, +givenname, +sn, +displayname, +domainname
```

## Configure Apache

Make sure the Kerberos keytab created by **realm join** above is
readable by Apache.

    # chgrp apache /etc/krb5.keytab
    # chmod 640    /etc/krb5.keytab

Create the Apache configuration files

    # TEMPLATE_DIR="/var/www/miq/system/TEMPLATE"
    # cp ${TEMPLATE_DIR}/etc/pam.d/httpd-auth                         \
                        /etc/pam.d/httpd-auth
    # cp ${TEMPLATE_DIR}/etc/httpd/conf.d/manageiq-remote-user.conf       \
                        /etc/httpd/conf.d/
    # cp ${TEMPLATE_DIR}/etc/httpd/conf.d/manageiq-external-auth.conf.erb \
                        /etc/httpd/conf.d/manageiq-external-auth.conf

Update the Apache configuration file
**/etc/httpd/conf.d/manageiq-external-auth.conf** as follows to
reference the Kerberos keytab appropriately.

    ...
        <Location /dashboard/kerberos_authenticate>
          AuthType           GSSAPI
          AuthName           "GSSAPI Single Sign On Login"
    =>    GssapiCredStore    keytab:/etc/krb5.keytab
          GssapiLocalName    on
          Require            pam-account httpd-auth

          ErrorDocument 401 /proxy_pages/invalid_sso_credentials.js
        </Location>

    ...

Set appropriate SELinux permissions:

    # setsebool -P allow_httpd_mod_auth_pam on
    # setsebool -P httpd_dbus_sssd          on

Restart Services

    # systemctl restart sssd
    # systemctl restart httpd

## Configure Administrative UI

Login as admin, then in *Configure→Configuration→Authentication*

  - Set mode to External (httpd)

  - Check: *Get User Groups from External Authentication (httpd)*

  - Check: *Enable Single Signon* if you want to allow Kerberos SSO to
    AD.

  - Click Save.

The above steps need to be done on each UI and WebService enabled
appliance.

in *Configure→Configuration→Access Control*

  - Make sure the user’s AD group for the appliance are created and
    appropriate roles assigned to those groups.
