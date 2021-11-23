# Infrastructure Providers

In {{ site.data.product.title_short }}, an infrastructure provider is a virtual
infrastructure environment that you can add to a {{ site.data.product.title_short }}
appliance to manage and interact with the resources in that environment.
This chapter describes the different types of infrastructure providers
that you can add to {{ site.data.product.title_short }}, and how to manage them.
Infrastructure providers can be either discovered automatically by
{{ site.data.product.title_short }}, or added individually.

The web interface uses virtual thumbnails to represent infrastructure
providers. Each thumbnail contains four quadrants by default, which
display basic information about each provider:

![2189](../images/2189.png)

1.  Number of hosts

2.  Management system software

3.  Currently unused

4.  Authentication status

| Icon                      | Description                                                                    |
| ------------------------- | ------------------------------------------------------------------------------ |
| ![2190](../images/2190.png) | Validated: Valid authentication credentials have been added.                   |
| ![2191](../images/2191.png) | Invalid: Authentication credentials are invalid.                               |
| ![2192](../images/2192.png) | Unknown: Authentication status is unknown or no credentials have been entered. |

For information on managing specific infrastructure providers see the following.

* [Red Hat Virtualization Providers](./infrastructure_providers/red_hat_virtualization_providers.md)

* [OpenStack Infrastructure Providers](./infrastructure_providers/openstack_infrastructure_providers.md)

* [VMware vCenter Providers](./infrastructure_providers/vmware_vcenter_providers.md)

* [Microsoft SCVMM Providers](./infrastructure_providers/microsoft_scvmm_providers.md)

{% include_relative _topics/refreshing_multiple_management_systems.md %}

{% include_relative _topics/tagging_multiple_management_systems.md %}

{% include_relative _topics/reviewing_a_management_system.md %}

{% include_relative _topics/to_remove_management_systems.md %}

{% include_relative _topics/viewing_the_management_system_timeline.md %}

{% include_relative _topics/viewing_hosts_and_clusters.md %}

{% include_relative _topics/viewing_virtual_machines_and_templates.md %}
