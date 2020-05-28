{{ site.data.product.title }} can be installed on a number of virtualization
platforms, such as [VMware
vSphere](https://access.redhat.com/documentation/en/red-hat-cloudforms/4.0/installing-cloudforms-on-vmware-vsphere/installing-cloudforms-on-vmware-vsphere),
and [Red Hat Enterprise
Virtualization](https://access.redhat.com/documentation/en/red-hat-cloudforms/4.0/installing-cloudforms-on-red-hat-enterprise-virtualization/installing-cloudforms-on-red-hat-enterprise-virtualization).
This chapter describes how to install and configure {{ site.data.product.title }} on
*Red Hat OpenStack Platform*.

### Obtaining and Installing the {{ site.data.product.title }} Appliance

First, download the appliance from the Red Hat Customer Portal:

{% include cfme-obtaining-the-appliance.md %}

Afterwards, upload or install the appliance image as a virtual machine
or instance on a supported virtualization environment or cloud provider.
See the [Installation and
Upgrade](https://access.redhat.com/documentation/en/red-hat-cloudforms/?category=installation%2520and%2520upgrade&version=4.7)
section for information on different supported *{{ site.data.product.title }}*
deployment methods.

Whichever deployment method you choose, ensure that *{{ site.data.product.title }}* is
configured with connectivity to the OpenStack management network.

<div class="tip">

See [Uploading the Appliance on
OpenStack](https://access.redhat.com/documentation/en/red-hat-cloudforms/4.7/single/installing-red-hat-cloudforms-on-red-hat-enterprise-linux-openstack-platform/#uploading-the-appliance-on-openstack)
for instructions on deploying *{{ site.data.product.title }}* as an instance on the
overcloud.

</div>
