### Configuring Host-Based Access Control Rules on your IPA Server

{{ site.data.product.title }} provides support for external authentication using an
IPA server. However, there are certain recommendations to enhance
security to your appliance, such as creating a specific user group and
host group that can access the appliance authentication service.

Run the following steps on your IPA server:

1.  Create a user group and restrict access to only the {{ site.data.product.title }}
    users:

        [root@ipa ~]# ipa group-add {{ site.data.product.title_short_l }}_users --desc="{{ site.data.product.title_short_l }} Users"
        [root@ipa ~]# ipa group-add-member {{ site.data.product.title_short_l }}_users --users=testuser1,testuser2

2.  Create a host group and restrict access to your appliance hosts:

        [root@ipa ~]# ipa hostgroup-add {{ site.data.product.title_short_l }}_hosts --desc "{{ site.data.product.title }} hosts"
        [root@ipa ~]# ipa hostgroup-add-member {{ site.data.product.title_short_l }}_hosts --hosts=appliance1.example.com,appliance2.example.com

3.  Add rules to allow the host group and user group access to the
    {{ site.data.product.title }} HTTP service:

        [root@ipa ~]# ipa hbacrule-add {{ site.data.product.title_short_l }}_access --srchostcat=all
        [root@ipa ~]# ipa hbacrule-add-service {{ site.data.product.title_short_l }}_access --hbacsvcs httpd-auth
        [root@ipa ~]# ipa hbacrule-add-user {{ site.data.product.title_short_l }}_access --groups {{ site.data.product.title_short_l }}_users
        [root@ipa ~]# ipa hbacrule-add-host {{ site.data.product.title_short_l }}_access --hostgroups {{ site.data.product.title_short_l }}_hosts

4.  Remove the default rule on your IPA server to allow access to all:

        [root@ipa ~]# ipa hbacrule-disable allow_all

This ensures only users in the `{{ site.data.product.title_short_l }}_users` group can
access the authentication service (`http-auth`) on the appliances in the
`{{ site.data.product.title_short_l }}_hosts` host group.
