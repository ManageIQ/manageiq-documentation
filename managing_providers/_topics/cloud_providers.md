# Cloud Providers

In {{ site.data.product.title_short }}, a cloud provider is a cloud computing
environment that you can add to a {{ site.data.product.title_short }} appliance to
manage and interact with the resources in that environment. This chapter
describes the different types of cloud providers that you can add to
{{ site.data.product.title_short }}, and how to manage them. Most cloud providers are
added individually to {{ site.data.product.title_short }}. Additionally, Amazon EC2
and Azure cloud providers can be discovered automatically by
{{ site.data.product.title_short }}.

The web interface uses virtual thumbnails to represent cloud providers.
Each thumbnail contains four quadrants by default, which display basic
information about each provider:

![cloudthumbnail](../images/cloudthumbnail.png)

1.  Number of instances

2.  Management system software

3.  Number of images

4.  Authentication status

| Icon                      | Description                                                                    |
| ------------------------- | ------------------------------------------------------------------------------ |
| ![2190](../images/2190.png) | Validated: Valid authentication credentials have been added.                   |
| ![2191](../images/2191.png) | Invalid: Authentication credentials are invalid.                               |
| ![2192](../images/2192.png) | Unknown: Authentication status is unknown or no credentials have been entered. |

Provider authentication status

## OpenStack Providers

{% include_relative _topics/adding_openstack_providers.md %}

## Azure Providers

{% include_relative _topics/adding_azure_providers.md %}

{% include_relative _topics/disabling_azure_cloud_regions.md %}

## Amazon EC2 Providers

{% include_relative _topics/amazon_ec2_providers_permissions.md %}

{% include_relative _topics/adding_amazon_ec2_providers.md %}

{% include_relative _topics/enabling_public_amis.md %}

{% include_relative _topics/enabling_aws_config_notifications.md %}

{% include_relative _topics/enabling_amazon_events.md %}

{% include_relative _topics/disabling_amazon_cloud_regions.md %}

{% include_relative _topics/refreshing_cloud_providers.md %}

{% include_relative _topics/tagging_cloud_providers.md %}

{% include_relative _topics/removing_cloud_providers.md %}

{% include_relative _topics/editing_a_cloud_provider.md %}

{% include_relative _topics/viewing_a_cloud_providers_timeline.md
%}

## IBM Power Systems Virtual Servers Providers

{% include_relative _topics/overview_ibm_cloud_powervs.md %}

{% include_relative _topics/adding_ibm_cloud_powervs_providers.md %}
