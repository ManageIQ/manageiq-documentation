# Infrastructure Providers

In {{ site.data.product.title }}, an infrastructure provider is a virtual
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

Provider authentication status

{% include_relative
_topics/discovering_multiple_management_systems.md %}

{% include_relative _topics/discovering_physical_infra_providers.md
%}

## Red Hat Virtualization Providers

To use a Red Hat Virtualization provider, add it to the appliance and
authenticate its hosts. You can also configure capacity and utilization
data collection to help track usage and find common issues.

{% include_relative _topics/enabling_red_hat_virtualization_cu.md
%}

{% include_relative
_topics/adding_a_red_hat_virtualization_provider.md %}

{% include_relative
_topics/authenticating_red_hat_virtualization_hosts.md %}

## OpenStack Infrastructure Providers

Enable an OpenStack Infrastructure provider by adding it to the
appliance.

{% include_relative
_topics/adding_an_openstack_infrastructure_provider.md %}

{% include openstack/discovering-openstack-infrastructure-providers.md
%}

## VMware vCenter Providers

To use a VMware vCenter provider, add it to the appliance and
authenticate its hosts.

{% include_relative _topics/adding_a_vmware_vcenter_provider.md %}

{% include_relative _topics/nonadmin_vmware_vcenter_auth.md %}

{% include_relative _topics/authenticating_vmware_vcenter_hosts.md
%}

## Microsoft SCVMM Providers

To use a Microsoft System Center Virtual Machine Manager (SCVMM)
provider, add it to the appliance and set up the SCVMM server for
authentication.

**Note:**

To use a SCVMM provider, you must have at least one network adapter
available for communication between the host and the SCVMM management
server. Make sure that **Used by Management** is checked for this
network adapter in the SCVMM host properties.

</div>

{% include_relative _topics/authenticating_to_microsoft_scvmm.md %}

{% include_relative
_topics/adding_a_microsoft_system_center_virtual_machine_manager_provider.md
%}

{% include_relative
_topics/refreshing_multiple_management_systems.md %}

{% include_relative _topics/tagging_multiple_management_systems.md
%}

{% include_relative _topics/reviewing_a_management_system.md %}

{% include_relative _topics/to_remove_management_systems.md %}

{% include_relative
_topics/viewing_the_management_system_timeline.md %}

{% include_relative _topics/viewing_hosts_and_clusters.md %}

{% include_relative
_topics/viewing_virtual_machines_and_templates.md %}
