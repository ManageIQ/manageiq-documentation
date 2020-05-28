---
---

## IPA/AD Trust Authentication

Active Directory (AD) Trust Authentication on the Appliance is supported
with External Authentication to IPA.

In this guide we will cover how to manually configure an Appliance’s
external authentication to work with AD Trust Authentication using IPA.
This provides IPA Users access to the Appliance Administrative UI and
the REST API using their AD credentials.

1.  [Requirements](#requirements)

2.  [Set up and configure an IPA server for AD Trust
    Authentication](#configure-ipa-ad-trust-server)

3.  [Enable the MiQ Appliance to use the configued IPA
    server](#enable-external-auth)

4.  [Configure the MiQ appliance to use external
    authentication](#configure-admin-ui)

5.  [Create groups on the MiQ appliance](#create-group-ui)

6.  [Use AD Trust Authentication](#use-ad-trust)

## Requirements

The following is needed in order to enable AD Trust Authentication to
the Appliance:

  - A CentOS/RHEL 7.2 based MiQ Appliance

  - Windows Server 2008 R2 or later with configured AD DC and DNS
    installed locally on the DC

## Set up and configure an IPA server for AD Trust Authentication

  - Configure an IPA Server based on FreeIPA 3.3.3 or later

Instructions for setting up and configuring cross-realm trust between an
IPA domain and an AD (Active Directory) domain can be found at
[freeipa.org Active Directory Trust
Setup](http://www.freeipa.org/page/Active_Directory_trust_setup)

  - Add necessary user attributes to the SSSD configuration on the IPA
    server

The SSSD configuration file on the IPA Server must be updated to list
needed user attributes.

Add the following entry to the SSSD configuration file
/etc/sssd/sssd.conf

**Note**: Starting with SSSD version 1.15.2, which will be available in
CentOS version 7.4, SSSD will provide the domain name as a user
attribute. The below examples show how to set *ldap\_user\_extra\_attrs*
and *user\_attributes* to take advantage of this new feature. If running
an appliance built with CentOS version prior to CentOS 7.4 do not
include *domainname* for these attributes.

``` bash
[ifp]
user_attributes = +mail, +givenname, +sn, +displayname, +domainname
```

and update *ldap\_user\_extra\_attrs* to include *domainname* where
appropriate.

``` bash
[domain/example.com]
ldap_user_extra_attrs = mail, givenname, sn, displayname, domainname
```

  - DNS Configuration Significance

Special care should be made when configuring DNS as improper DNS
configurations can result in poor performance and improper
functionality. For more details refer to the following documents:

  - [freeipa.org Active Directory Trust Setup/DNS
    configuration](http://www.freeipa.org/page/Active_Directory_trust_setup#DNS_configuration)

  - [freeipa.org DNS](http://www.freeipa.org/page/DNS)

  - [freeipa.org DNSSEC](https://www.freeipa.org/page/Howto/DNSSEC)

## Enable the MiQ Appliance to use the configued IPA server

Use the Appliance Console to enable external authentication to the IPA
Server.

1.  Log in to console as *root*

2.  Run *appliance\_console*

3.  Summary screen should show **External Auth** as *not configured*,
    Press any key

4.  From the Advanced Setting menu, select the menu item **Configure
    External Authentication (httpd)**

5.  Enter the FQDN of the IPA Server, i.e. *ipaserver.test.company.com*

6.  Enter the IPA Server domain, i.e. *test.company.com*

7.  Enter the IPA Server realm, i.e. *TEST.COMPANY.COM*

8.  Press enter to select the default IPA Server Principal, i.e. *admin*

9.  Enter the Password of the IPA Server Principal

10. Review details, and Enter **y** to proceed.

## Configure the MiQ appliance to use external authentication

Log in to the MiQ appliance as admin, then in
*Settings→Configuration→Server→Authentication*

  - Set mode to External (httpd)

  - Check: *Get User Groups from External Authentication (httpd)*

  - *Optionally* Check: *Enable Single Signon*

  - Click Save.

The above steps need to be done on each UI and WebService enabled
appliance.

in *Settings→Configuration→Access Control*

  - Make sure the user’s groups are created on the Appliance and
    appropriate roles assigned to those groups.

## Create groups on the MiQ appliance

The below steps need to be done on each UI and WebService enabled
appliance.

Log in to the MiQ appliance as admin, then in
*Settings→Configuration→Access Control→Groups→Configuration→Add a
new Group*

  - Check: *(Look Up LDAP Groups)*

  - Enter the AD user as the *User to Look Up* i.e.
    *ipauser@ipaserver.test.company.com*

  - Click Retrieve.

  - Choose a group from the *LDAP Groups for User* dropdown.

  - Assign the appropriate roles to the group

  - Click Add.

## Use AD Trust Authentication

Once the above is done, the user simply needs to specify their AD
Username and Password when:

  - Logging into the Appliance Administrative UI

  - Accessing the REST API

  - Using the Self Service UI

  - Using the Single Sign On (SSO) to access the MiQ appliance after
    generating a Kerberos ticket by using kinit with AD credentials.
