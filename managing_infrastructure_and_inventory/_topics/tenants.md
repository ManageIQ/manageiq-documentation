# Cloud Tenants

A tenant is an OpenStack term for an organizational unit or project.
{{ site.data.product.title_short }} creates cloud tenants to match existing OpenStack
tenants for managing resources and controlling visibility of objects.

**Note:**

OpenStack tenant mapping must be enabled for cloud tenants to be created. See [Tenant Mapping](#tenant-mapping) for details.

OpenStack uses tenants for the following reasons:

  - Assigning users to a project

  - Defining quotas for a project

  - Applying access and security rules for a project

  - Managing resources and instances for a project

This helps administrators and users organize their OpenStack environment
and define limits for different groups of people. For example, one
project might require higher quotas and another project might require
restricted access to certain ports. OpenStack allows you to define these
limits and apply them to a project.

{{ site.data.product.title_short }} can abstract information from tenants including quotas
and relationships to other OpenStack objects.

To see multiple tenants in {{ site.data.product.title_short }}, the user authenticating to
your OpenStack environment from {{ site.data.product.title_short }} must be configured to
have visibility into these tenants.

**Note:**

This section describes OpenStack cloud tenant usage. For information about tenants created in {{ site.data.product.title_short }} for access and resource control, see [Access Control](../general_configuration/index.html#access-control) in *General Configuration*.

## Tenant Mapping

{% include openstack/tenant-mapping.md %}

{% include_relative _topics/viewing_a_tenant.md %}
