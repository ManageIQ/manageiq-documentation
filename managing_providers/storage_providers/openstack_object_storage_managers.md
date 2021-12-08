---
---

# OpenStack Object Storage Managers

The OpenStack Object Storage (`openstack-swift`) service provides cloud
object storage.

To use the OpenStack Object Storage service as a storage manager, you
must first add an OpenStack cloud provider to your {{ site.data.product.title_short }}
appliance and enable events. The Object Storage service will be
automatically discovered by {{ site.data.product.title_short }} and added to the **Storage Managers** list in {{ site.data.product.title_short }}. See
[Adding OpenStack Providers](../cloud_providers/openstack_providers#adding_openstack_cloud_providers) for instructions on adding a cloud provider and enabling events.

{% include_relative _topics/viewing_swift_object_stores.md %}

{% include_relative _topics/viewing_swift_manager_timeline.md %}
