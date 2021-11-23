# Red Hat Satellite 6

Satellite 6 is a subscription and system management tool that provides a
way to provision hosts (both virtual and bare metal) and configure them
using a set of Puppet modules. {{ site.data.product.title_short }} provides functionality to
integrate with a Red Hat Satellite 6 server and take advantage of its
features. This includes:

  - Monitoring the inventory of your Red Hat Satellite 6 server,
    including independent hosts and hosts provisioned using hostgroups.

  - Reprovisioning existing bare metal system hosts to new host groups.

  - Applying {{ site.data.product.title_short }} policy tags to hosts.

<div class="important">

{{ site.data.product.title_short }} only reprovisions existing systems in a Red Hat
Satellite 6 environment. Provisioning systems from Red Hat Satellite 6’s
bare metal discovery service is planned for a future release.

</div>

{% include_relative _topics/defining_the_workflow.md %}

{% include_relative _topics/defining_the_hostgroup_hierarchy.md %}

{% include_relative _topics/adding_a_satellite_6_provider.md %}

{% include_relative _topics/triggering_a_refresh_of_a_satellite_6_provider.md %}

{% include_relative _topics/displaying_red_hat_satellite_6_contents.md %}

{% include_relative _topics/reprovisioning_a_bare_metal_host.md %}

{% include_relative _topics/tagging_a_bare_metal_host.md %}
