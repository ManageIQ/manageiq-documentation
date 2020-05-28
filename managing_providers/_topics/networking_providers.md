# Network Managers

In {{ site.data.product.title }}, a network manager is an inventory of networking
entities on existing cloud and infrastructure providers managed by your
{{ site.data.product.title_short }} appliance.

This provider type exposes software-defined networking (SDN) providers
including *OpenStack Network (Neutron)*, *Azure Network*, and *Amazon
EC2 Network*, which enables software-defined networking inventory
collection. The OpenStack Network provider collects inventory of
floating IPs from OpenStack so that IPs can be allocated without
querying OpenStack database every time. Also, it refreshes all Neutron
data from both OpenStack and OpenStack Infrastructure, and extracts the
Neutron logic to a shared place. Note that management via the network
providers configuration is currently disabled.

This chapter describes the different types of network managers available
to {{ site.data.product.title_short }}, and how to manage them. Network managers are
discovered automatically by {{ site.data.product.title_short }} from other connected
providers.

{% include_relative _topics/adding_viewing_network_providers.md %}

{% include_relative _topics/refreshing_network_providers.md %}

{% include_relative _topics/tagging_network_providers.md %}

{% include_relative _topics/removing_network_providers.md %}

{% include_relative _topics/viewing_network_providers_timeline.md
%}

You can also assign policy profiles to network providers, or remove
them. The method for doing so is similar to that of any normal policy
profile.

{% include_relative _topics/network_topology.md %}
