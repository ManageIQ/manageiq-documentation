# Configuration Management Providers

In {{ site.data.product.title_short }}, a configuration management provider is a
systems management product that you can add to a {{ site.data.product.title_short }}
appliance to manage the lifecycle of your resources. Configuration
management providers are useful for uniformly applying changes and
updates across providers, and for recording and reporting status and
change activity. They can also help eliminate the confusion and error
brought about by the existence of different providers.

This chapter describes the different types of configuration management
providers available to {{ site.data.product.title_short }}, and how to manage them.
Configuration management providers must be added individually to
{{ site.data.product.title_short }}.

## Red Hat Satellite 6

Satellite 6 is a subscription and system management tool that provides a
way to provision hosts (both virtual and bare metal) and configure them
using a set of Puppet modules. {{ site.data.product.title }} provides functionality to
integrate with a Red Hat Satellite 6 server and take advantage of its
features. This includes:

  - Monitoring the inventory of your Red Hat Satellite 6 server,
    including independent hosts and hosts provisioned using hostgroups.

  - Reprovisioning existing bare metal system hosts to new host groups.

  - Applying {{ site.data.product.title }} policy tags to hosts.

<div class="important">

{{ site.data.product.title }} only reprovisions existing systems in a Red Hat
Satellite 6 environment. Provisioning systems from Red Hat Satellite 6’s
bare metal discovery service is planned for a future release.

</div>

{% include_relative _topics/defining_the_workflow.md %}

{% include_relative _topics/defining_the_hostgroup_hierarchy.md %}

{% include_relative _topics/adding_a_satellite_6_provider.md %}

{% include_relative
_topics/triggering_a_refresh_of_a_satellite_6_provider.md %}

{% include_relative
_topics/displaying_red_hat_satellite_6_contents.md %}

{% include_relative _topics/reprovisioning_a_bare_metal_host.md %}

{% include_relative _topics/tagging_a_bare_metal_host.md %}
