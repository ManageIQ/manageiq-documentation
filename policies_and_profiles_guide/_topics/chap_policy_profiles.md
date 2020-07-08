Policy profiles are groups of policies that you can assign wholesale to virtual machines, providers, clusters, hosts, resource pools, replicators, pods, container nodes, and container images. Policy profiles provide a framework for easily managing and assigning different levels of security, across various types of cloud resources.

{% include_relative _topics/creating_policy_profiles.md %}

{% include_relative _topics/deleting_a_policy_profile.md %}

### Simulating Policy

Before assigning a policy profile to a virtual machine, use the {{ site.data.product.title }} controls policy simulation feature to determine if a virtual machine passes a policy profile.

{% include_relative
_topics/to_simulate_policy_profiles_on_virtual_machines.md %}

### Assigning Policy Profiles

After creating your policy profiles, you are ready to evaluate and assign them.

  - Assign a policy profile to a virtual machine to apply the policy profile to a specific virtual machine, independent of its related host, provider, or repository.

  - Assign a policy profile to a provider to apply the policy profile to all virtual machines, hosts, replicators, pods, container nodes or container images registered to that provider.

  - Assign a policy profile to a replicator to apply the policy profile to that specific replicator.

  - Assign a policy profile to a pod to apply the policy profile to that specific pod.

  - Assign a policy profile to a container node to apply the policy profile to that specific node.

  - Assign a policy profile to a container image to apply the policy profile to that specific image.

  - Assign a policy profile to a cluster to apply the policy profile to all virtual machines or hosts assigned to that cluster.

  - Assign a VM policy profile to a host to apply the policy profile to that specific host or all virtual machines registered to that host.

  - Assign a VM policy profile to a resource pool to apply the policy profile to all virtual machines or hosts assigned to that resource pool.

{% include_relative
_topics/assigning_policy_profiles_to_an_infrastructure_provider.md
%}

{% include_relative
_topics/removing_policy_profiles_from_an_infrastructure_provider.md
%}

{% include_relative
_topics/to_assign_policy_profiles_to_a_cluster.md %}

{% include_relative
_topics/to_remove_policy_profiles_from_a_cluster.md %}

{% include_relative
_topics/to_assign_policy_profiles_to_a_host.md %}

{% include_relative
_topics/to_remove_policy_profiles_from_a_host.md %}

{% include_relative
_topics/to_assign_policy_profiles_to_a_virtual_machine.md %}

{% include_relative
_topics/to_remove_policy_profiles_from_a_virtual_machine.md %}

{% include_relative
_topics/to_assign_policy_profiles_to_a_resource_pool.md %}

{% include_relative
_topics/to_remove_policy_profiles_from_a_resource_pool.md %}

{% include_relative
_topics/assigning_policy_profiles_to_a_cloud_provider.md %}

{% include_relative
_topics/removing_policy_profiles_from_a_cloud_provider.md %}

{% include_relative
_topics/assigning_policy_profiles_to_a_network_provider.md %}

{% include_relative
_topics/removing_policy_profiles_from_a_network_provider.md %}

{% include_relative
_topics/assigning_policy_profiles_to_a_container_provider.md %}

{% include_relative
_topics/removing_policy_profiles_from_a_container_provider.md %}

{% include_relative
_topics/assigning_policy_profiles_to_a_replicator.md %}

{% include_relative
_topics/removing_policy_profiles_from_a_replicator.md %}

{% include_relative _topics/assigning_policy_profiles_to_a_pod.md
%}

{% include_relative
_topics/removing_policy_profiles_from_a_pod.md %}

{% include_relative
_topics/assigning_policy_profiles_to_a_container_node.md %}

{% include_relative
_topics/removing_policy_profiles_from_a_container_node.md %}

{% include_relative
_topics/assigning_policy_profiles_to_a_container_image.md %}

{% include_relative
_topics/removing_policy_profiles_from_a_container_image.md %}

{% include_relative
_topics/assigning_policy_profiles_to_an_instance.md %}

{% include_relative
_topics/removing_policy_profiles_from_an_instance.md %}

{% include_relative _topics/to_disable_a_policy.md %}

{% include_relative _topics/to_view_policy_simulation_rsop.md %}

{% include_relative
_topics/exporting_and_importing_analysis_profiles.md %}
