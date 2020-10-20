# Configuring Authentication with Active Directory

This procedure outlines how to configure {{ site.data.product.title_short }} to
authenticate against an existing Active Directory (AD) configuration
using external HTTP authentication. This provides Active Directory users
access to the {{ site.data.product.title_short }} appliance user interface, as well
as the REST API.

## Connecting {{ site.data.product.title_short }} to an Active Directory Domain

To use an Active Directory domain to authenticate users to
{{ site.data.product.title_short }}, configure the following on
{{ site.data.product.title_short }}:

1.  Connect to the {{ site.data.product.title_short }} appliance using SSH.

2.  Run `realm discover` to determine what Active Directory realms are
    available:

        # realm discover example.com
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

3.  Using the above information for your realm, join the Active
    Directory realm with a user that has enough permissions to be able
    to browse the directory:

        # realm join example.com -U user
        Password for user: ******

4.  Allow all realm users to log in using `realm permit`:

        # realm permit --all

5.  Edit the `/etc/sssd/sssd.conf` file with your Active Directory
    domain details. Refer to the following example for formatting:

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
         ldap_user_extra_attrs = mail, givenname, sn, displayname, domainname

        [sssd]
        domains = example.com
        config_file_version = 2
        services = nss, pam, ifp
        default_domain_suffix = example.com

        [nss]
        homedir_substring = /home

        [pam]
        default_domain_suffix = example.com

        [ifp]
        default_domain_suffix = example.com
        allowed_uids = apache, root
        user_attributes = +mail, +givenname, +sn, +displayname, +domainname

6.  Restart and enable the `sssd` service:

        # systemctl restart sssd
        # systemctl enable sssd

7.  Make sure the Kerberos keytab created by `realm join` above is
    readable by Apache:

        # chgrp apache /etc/krb5.keytab
        # chmod 640 /etc/krb5.keytab

8.  Copy the following `httpd` configuration files into the correct
    respective directories with the following commands:

        # TEMPLATE_DIR="/opt/rh/cfme-appliance/TEMPLATE"
        # cp ${TEMPLATE_DIR}/etc/pam.d/httpd-auth /etc/pam.d/httpd-auth
        # cp ${TEMPLATE_DIR}/etc/httpd/conf.d/manageiq-remote-user.conf /etc/httpd/conf.d/
        # cp ${TEMPLATE_DIR}/etc/httpd/conf.d/manageiq-external-auth.conf.erb /etc/httpd/conf.d/manageiq-external-auth.conf

9.  Edit the `/etc/httpd/conf.d/manageiq-external-auth.conf` file to
    point to the Kerberos domain hosted by your Active Directory domain
    by adding or editing the lines for `KrbAuthRealms`, `Krb5KeyTab` and
    `KrbServiceName` for your environment:

        <Location /dashboard/kerberos_authenticate>
          AuthType           Kerberos
          AuthName           "Kerberos Login"
          KrbMethodNegotiate On
          KrbMethodK5Passwd  Off
          KrbAuthRealms      example.com
          Krb5KeyTab         /etc/krb5.keytab
          KrbServiceName     Any
          Require            pam-account httpd-auth

          ErrorDocument 401  /proxy_pages/invalid_sso_credentials.js
        </Location>

10. Set the following SELinux booleans:

        # setsebool -P allow_httpd_mod_auth_pam on
        # setsebool -P httpd_dbus_sssd          on

11. Restart and enable the `httpd` service:

        # systemctl restart httpd
        # systemctl enable httpd

Complete authentication setup by configuring the following on each
appliance with the `user_interface` or `web_services` server roles
enabled.

From the {{ site.data.product.title_short }} user interface:

1.  Log in to the user interface as an administrative user.

2.  Navigate to the settings menu, then
    menu:Configuration\[Authentication\].

3.  Select a **Session Timeout** if required.

4.  Select **External (httpd)** as the authentication **Mode**.

5.  Select **Enable Single Sign-On** to allow single sign-on using
    Kerberos tickets from client machines that authenticate to the same
    Active Directory domain as the appliance.

6.  In the **Role Settings** area, select **Get User Groups from
    External Authentication (httpd)**.

7.  Click **Save**.

**Important:**

Make sure the user’s Active Directory groups for the appliance are created and appropriate roles assigned to those groups. See [Roles](../general_configuration/index.html#roles) in *General Configuration* for more information.

{{ site.data.product.title_short }} is now configured to use authentication from your
Active Directory domain.

## Mapping Active Directory Users to {{ site.data.product.title_short }} User Roles

This section provides instructions for mapping your existing Active
Directory (AD) groups to user account roles in {{ site.data.product.title_short }}.

This is done by assigning a {{ site.data.product.title_short }} role to an AD group.
When an AD user who is a part of that AD group attempts to log in to
{{ site.data.product.title_short }}, they get that role assigned automatically and
inherit the permissions from that role. As a result, all users in that
AD group will then be assigned the {{ site.data.product.title_short }} role(s)
associated with that group.

After configuring {{ site.data.product.title_short }} to connect to an Active
Directory domain in [Connecting {{ site.data.product.title_short }} to an Active
Directory Domain](#connecting_to_AD_domain), complete the following
steps:

1.  Click ![config gear](../images/config-gear.png) (**Configuration**).

2.  Click the **Access Control** accordion, then click **Groups**.

3.  Click ![1847](../images/1847.png) (**Configuration**), and ![plus
    green](../images/plus_green.png) (**Add a new Group**) to create a
    group.

4.  In **Group Information**, select **Look Up External Authentication
    Groups** to find a list of groups assigned to a specific user in
    Active Directory.

5.  In **User to Look Up**, enter the user name for a user in your AD
    group.

    ![ad userlookup](../images/ad-userlookup.png)

6.  Click **Retrieve** to look up details for the user in Active
    Directory and pull group information for the user. As a result, the
    AD groups will appear in the **LDAP Groups for User** drop-down
    list.

7.  From the list in **LDAP Groups for User**, select the group you want
    to associate a {{ site.data.product.title_short }} role with; for example, the
    `cloudforms` group.

    ![assign ad roles](../images/assign_ad-roles.png)

8.  Select a **Role** to map to the group.

9.  Select a **Project/Tenant** to map to the group.

10. Click **Add**.

Any user who is part of `cloudforms` AD group can now log in to
{{ site.data.product.title_short }} with their AD username and password, and they
will automatically inherit the permissions for the role you assigned
earlier.

To confirm this is configured correctly, log in to the
{{ site.data.product.title_short }} user interface with a user in the `cloudforms` AD
group.

To grant an additional user access to the {{ site.data.product.title_short }} server,
create the user in Active Directory, then add that user to the
`cloudforms` AD group. When that user attempts to log in to
{{ site.data.product.title_short }}, they will automatically inherit the correct
permissions for the group.
