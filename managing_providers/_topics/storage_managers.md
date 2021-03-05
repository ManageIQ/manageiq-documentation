# Storage Managers

In {{ site.data.product.title_short }}, a storage manager is a service providing storage
resources that you can manage from a {{ site.data.product.title_short }} appliance. This
chapter describes the different types of storage managers used by
{{ site.data.product.title_short }}, and how they are added to {{ site.data.product.title_short }}.

There are three types of storage managers currently available to
{{ site.data.product.title_short }}:

  - Amazon Elastic Block Store

  - OpenStack Block Storage (`openstack-cinder`)

  - OpenStack Object Storage (`openstack-swift`)

## Amazon Elastic Block Store Managers

The Amazon Elastic Block Store service provides and manages persistent
block storage resources that Amazon EC2 instances can consume.

To use the Amazon Elastic Block Store service as a storage manager, you
must first add an Amazon EC2 cloud provider to your {{ site.data.product.title_short }}
appliance. The Amazon Elastic Block Store service is automatically
discovered by {{ site.data.product.title_short }}, and added to the **Storage Managers**
list. See [???](#adding-amazon-ec2-providers) for instructions on adding
an Amazon EC2 cloud provider.

## OpenStack Block Storage Managers

The OpenStack Block Storage service (`openstack-cinder`) provides and
manages persistent block storage resources that OpenStack infrastructure
instances can consume.

To use OpenStack Block Storage as a storage manager, you must first add
an OpenStack cloud provider to your {{ site.data.product.title_short }} appliance and enable
events. The Block Storage service will be automatically discovered by
{{ site.data.product.title_short }} and added to the **Storage Managers** list in
{{ site.data.product.title_short }}. See [???](#adding_openstack_cloud_providers) for
instructions on adding a cloud provider and enabling events.

## OpenStack Block Storage Manager Targeted Refresh

{{ site.data.product.title_short }} supports targeted refresh of OpenStack Block Storage
(Cinder) volumes. This functionality automatically pulls down new
inventory data for an object when {{ site.data.product.title_short }} receives an
event from the OpenStack provider. For example, if
{{ site.data.product.title_short }} receives a `volume.update.end` event from Cinder,
instead of refreshing the entire inventory, it performs a targeted
refresh of the volume referenced in the event.

## OpenStack Object Storage Managers

The OpenStack Object Storage (`openstack-swift`) service provides cloud
object storage.

To use the OpenStack Object Storage service as a storage manager, you
must first add an OpenStack cloud provider to your {{ site.data.product.title_short }}
appliance and enable events. The Object Storage service will be
automatically discovered by {{ site.data.product.title_short }} and added to the **Storage
Managers** list in {{ site.data.product.title_short }}. See
[???](#adding_openstack_cloud_providers) for instructions on adding a
cloud provider and enabling events.

{% include_relative _topics/viewing_swift_object_stores.md %}
