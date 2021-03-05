## Configuring Network Routers

{{ site.data.product.title_short }} enables configuration for Red Hat OpenStack Platform
provider cloud network routing services using an SDN-based virtual
router.

  - Routers are a requirement for your instances to communicate with
    external subnets, including those out in the physical network.

  - Routers and subnets connect using interfaces, with each subnet
    requiring its own interface to the router.

  - A router’s default gateway defines the next hop for any traffic
    received by the router.

  - A router’s network is typically configured to route traffic to the
    external physical network using a virtual bridge.

{% include_relative _topics/adding_network_router.md %}

{% include_relative _topics/editing_a_network_router.md %}

{% include_relative
_topics/adding_an_interface_to_network_router.md %}

{% include_relative _topics/removing_an_interface.md %}

{% include_relative _topics/deleting_a_router.md %}
