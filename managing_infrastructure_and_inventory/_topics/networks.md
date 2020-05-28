## Creating and Administering Cloud Networks

Create a network to provide instances a place to communicate internally
and receive IP addresses using Dynamic Host Configuration Protocol
(DHCP). A network can also be integrated with external networks in your
Red Hat OpenStack Platform deployment or elsewhere, such as the physical
network.

<div class="note">

  - Keystone API v3 is required to create cloud tenants on Red Hat
    OpenStack Platform cloud providers. For more information, see
    [OpenStack Identity
    (keystone)](https://access.redhat.com/documentation/en-us/red_hat_openstack_platform/11/html-single/architecture_guide/#comp-identity)
    in the Red Hat OpenStack Platform *Architecture Guide*.

  - For further details on cloud network objects and administration, see
    the [*Networking
    Guide*](https://access.redhat.com/documentation/en-us/red_hat_openstack_platform/12/html-single/networking_guide/#add_an_interface)
    in the Red Hat OpenStack Platform documentation..

</div>

{% include_relative _topics/adding_a_cloud_network.md %}

{% include_relative _topics/editing_a_cloud_network.md %}

{% include_relative _topics/deleting_a_network.md %}
