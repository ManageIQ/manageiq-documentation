---
---

# Managing Providers

{{ site.data.product.title }} can manage a variety of external environments, known as
providers and managers. A provider or manager is any system that
{{ site.data.product.title_short }} integrates with for the purpose of collecting
data and performing operations.

In {{ site.data.product.title_short }}, a *provider* is an external virtualization,
cloud, or containers environment that manages multiple virtual machines
or instances residing on multiple hosts. One example is Red Hat
Virtualization, a platform that manages multiple hosts and virtual
machines.

In {{ site.data.product.title_short }}, a *manager* is an external management
environment that manages more than one type of resource. One example of
a manager is OpenStack, which manages infrastucture, cloud, network, and
storage resources.

This guide covers working with providers and managers in
{{ site.data.product.title_short }}, which include:

  - Infrastructure providers

  - Configuration management providers

  - Automation management providers

  - Cloud providers

  - Networking management providers

  - Middleware management providers

  - Container providers

  - Storage managers

For information on working with the resources contained by a provider or
manager, see [Managing Infrastructure and
Inventory](https://www.manageiq.org/docs/reference/latest/managing_infrastructure_and_inventory/index.html).

{% include_relative _topics/infrastructure_providers.md %}

{% include_relative _topics/configuration_management_providers.md %}

{% include_relative _topics/automation_management_providers.md %}

{% include_relative _topics/cloud_providers.md %}

{% include_relative _topics/networking_providers.md %}

{% include_relative _topics/containers_providers.md %}

{% include_relative _topics/storage_managers.md %}

# Appendix

{% include app-self_signed_ca.md %}
