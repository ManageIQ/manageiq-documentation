# Containers Providers

A containers provider is a service that manages container resources, that can be added to the {{ site.data.product.title_short }} appliance.

{{ site.data.product.title_short }} can connect to OpenShift Container Platform containers providers and manage them similarly to infrastructure and cloud providers. This allows you to gain control over different aspects of your containers environment and answer questions such as:

  - How many containers exist in my environment?

  - Does a specific node have enough resources?

  - How many distinct images are used?

  - Which image registries are used?

When {{ site.data.product.title_short }} connects to a container’s environment, it collects information on different areas of the environment:

  - Entities such as pods, nodes, or services.

  - Basic relationships between the entities, for example: Which services are serving which pods?

  - Advanced insight into relationships, for example: Which two different containers are using the same image?

  - Additional information, such as events, projects, routes, and metrics.

You can manage policies for containers entities by adding tags. All containers entities except volumes can be tagged.

**Note:**

This chapter provides details on managing containers providers. For details on working with the resources within a container environment, see [Container Entities](../managing_infrastructure_and_inventory/index.html#container-entities) in *Managing Infrastructure and Inventory*.

The {{ site.data.product.title_short }} user interface uses virtual thumbnails to represent containers providers. Each thumbnail contains four quadrants
by default, which display basic information about each provider:

![cp quad icon](../images/cp-quad-icon.png)

1.  Number of nodes

2.  Container provider software

3.  Power state

4.  Authentication status

| Icon                      | Description                                                                    |
| ------------------------- | ------------------------------------------------------------------------------ |
| ![2190](../images/2190.png) | Validated: Valid authentication credentials have been added.                   |
| ![2191](../images/2191.png) | Invalid: Authentication credentials are invalid.                               |
| ![2192](../images/2192.png) | Unknown: Authentication status is unknown or no credentials have been entered. |

Containers provider authentication status

{% include_relative _topics/tagging_containers_providers.md %}

{% include_relative _topics/removing_containers_providers.md %}

{% include_relative _topics/editing_a_containers_provider.md %}

{% include_relative _topics/hide_environment_vars.md %}

{% include_relative _topics/viewing_a_containers_providers_timeline.md %}

* [Azure Kubernetes Providers](./containers_providers/azure_kubernetes_providers.html)

* [Red Hat OpenShift Providers](./containers_providers/red_hat_openshift_providers.html)

* [IBM Cloud Kubernetes Service Providers](./containers_providers/ibm_cloud_kubernetes_service_providers.html)

* [Oracle Kubernetes Engine Providers](./containers_providers/oracle_kubernetes_engine_providers.html)

* [VMware Tanzu Providers](./containers_providers/vmware_tanzu_providers.html)
