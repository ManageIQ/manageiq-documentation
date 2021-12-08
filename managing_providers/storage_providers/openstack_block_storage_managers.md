---
---

# OpenStack Block Storage Managers

The OpenStack Block Storage service (`openstack-cinder`) provides and
manages persistent block storage resources that OpenStack infrastructure
instances can consume.

To use OpenStack Block Storage as a storage manager, you must first add
an OpenStack cloud provider to your {{ site.data.product.title_short }} appliance and enable
events. The Block Storage service will be automatically discovered by
{{ site.data.product.title_short }} and added to the **Storage Managers** list in
{{ site.data.product.title_short }}. See [Adding OpenStack Providers](../cloud_providers/openstack_providers#adding_openstack_cloud_providers) for
instructions on adding a cloud provider and enabling events.

## OpenStack Block Storage Manager Targeted Refresh

{{ site.data.product.title_short }} supports targeted refresh of OpenStack Block Storage
(Cinder) volumes. This functionality automatically pulls down new
inventory data for an object when {{ site.data.product.title_short }} receives an
event from the OpenStack provider. For example, if
{{ site.data.product.title_short }} receives a `volume.update.end` event from Cinder,
instead of refreshing the entire inventory, it performs a targeted
refresh of the volume referenced in the event.

{% include_relative _topics/viewing_a_cinder_manager_timeline.md %}
