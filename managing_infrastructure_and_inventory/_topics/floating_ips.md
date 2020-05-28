## Creating Floating IPs

Floating IP addresses allow you to direct ingress network traffic to
your cloud network instances. Define a pool of validly routable external
IP addresses, which can then be dynamically assigned to an instance. All
incoming traffic destined for that floating IP is routed to the instance
to which it has been assigned.

<div class="note">

Red Hat OpenStack Networking allocates floating IP addresses to all
projects (tenants) from the same IP ranges/CIDRs. As a result, every
subnet of floating IPs is consumable by any and all projects. Manage
this behavior using quotas for specific projects.

</div>

{% include_relative _topics/adding_floating_ips.md %}

{% include_relative _topics/editing_a_floating_ip.md %}

{% include_relative _topics/deleting_a_floatingip.md %}
