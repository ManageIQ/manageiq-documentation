# Troubleshooting External Authentication Configuration

The following are common errors that you may encounter when integrating
with IPA:

    Error -1 : Kerberos authentication failed: kinit: Cannot contact any KDC for realm

**Resolution:** Verify on IPA server if you are able to log into the IPA
server using same user.

    Error-2: [----] W, [2017-09-28T10:05:29.157980 #28902:fa8bc4] WARN -- Failure: MIQ(Authenticator.authenticate) userid: [jdoe] - Authentication failed for userid jdoe: Authentication token is no longer valid; new one required

**Resolution:** The password has expired. Go to IPA/LDAP server and
update your password using `kinit <username>`.

    Error-3: [----] W, [2017-09-28T10:13:10.083614 #28902:fa8bc4] WARN -- Failure: MIQ(Authenticator.block in authorize) userid: [jdoe] - Authentication failed for userid jdoe, unable to match user's group membership to an EVM role

**Resolution:** You should add the same group to the
{{ site.data.product.title_short }} group. Make sure you select **Look up External
Authentication Groups** and enter the group name and user to look up.

## Additional Troubleshooting Tips

  - Make an IPA/LDAP host entry in `/etc/hosts` file on the
    {{ site.data.product.title_short }} appliance.

  - Make sure NTP synchronization exists between the
    {{ site.data.product.title_short }} appliance and the IPA server.

  - Check `/var/log/krb5kdc.log` on the IPA server end and
    `/var/www/miq/vmdb/log/audit.log` on the {{ site.data.product.title_short }}
    appliance end for any other exception.
