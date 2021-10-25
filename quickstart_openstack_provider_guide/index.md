---
---

# QuickStart Guide for {{ site.data.product.title_short }} with Red Hat OpenStack Platform

{% include introduction.md %}

## Key {{ site.data.product.title_short }} Features for OpenStack Cloud Providers

{{ site.data.product.title_short }} provides several interface features specific to OpenStack cloud providers:

  - The {{ site.data.product.title_short }} **Topology** widget ([Using the Topology Widget](#using-the-topology-widget)) provides an interactive
    visualization of the OpenStack cloud.

  - {{ site.data.product.title_short }} provides a user interface for managing OpenStack storage resources ([Managing Storage](#storage_managers)).

  - *Custom buttons*, which allows you to provide automation for specific actions to OpenStack tenants. See [Creating Custom Buttons for Cloud Tenants](#creating-custom-buttons-for-cloud-tenants).

When adding an OpenStack cloud provider, you can also:

  - Enable *tenant mapping*. This creates a one-to-one association between tenants in {{ site.data.product.title_short }} and OpenStack.

  - Connect to OpenStack through the Keystone V3 API. This API enables multiple OpenStack identity domains. Domains are high-level containers for projects, users, and groups. Users of different domains can be represented in different authentication back ends.

For information about tenant mapping and the Keystone V3 API, see [Adding an OpenStack Cloud Provider](#adding-an-openstack-cloud-provider).

## Installing and Configuring {{ site.data.product.title_short }}

{% include_relative _topics/installing.md %}

### Configuring {{ site.data.product.title_short }}

{% include_relative _topics/configuration-quick.md %}

## Adding an OpenStack Infrastructure Provider

{% include openstack/adding-an-openstack-infrastructure-provider.md %}

### Configuring the Undercloud to Store Events

{% include openstack/configure-undercloud-to-store-events.md %}

## Adding an OpenStack Cloud Provider

{% include openstack/adding-an-openstack-cloud-provider.md %}

### Configuring the Overcloud to Store Events

{% include openstack/configure-overcloud-to-store-events.md %}

## Performing a SmartState Analysis

{{ site.data.product.title_short }} can analyze a cloud Instance or infrastructure host to collect metadata such as user accounts, applications, software patches, and other internal information. This key feature is called SmartState Analysis. SmartState analysis can be initiated
manually or automatically using Control Policies.

{% include smartstate-analysis-instances.md %}

## Using the Topology Widget

The **Topology** widget is an interactive topology graph, showing the status and relationships between the different resources and entities of the OpenStack providers that {{ site.data.product.title_short }} has access to.

  - The topology graph includes instances, nodes, and other cloud resources within the overall OpenStack cloud provider environment.
    {% include topology_widget.md %}

To view an OpenStack provider through the **Topology** widget:

1.  Browse to menu: **Compute > Cloud > Providers**.

2.  Click the desired OpenStack cloud provider for viewing the provider summary.

3.  On the provider summary page, click **Topology** in the **Overview** box on the right-hand side of the page.

## Managing Policies

{% include_relative _topics/managing-policies.md %}

## Managing Instances

Cloud instance provisioning goes through three phases:

1.  Request: This includes ownership information, tags, virtual hardware requirements, the operating system, and any customization required.
    See [Provisioning Requests](../provisioning_virtual_machines_and_hosts/index.html#provisioning-requests)
    from the [Provisioning Virtual Machines and Hosts](../provisioning_virtual_machines_and_hosts/index.html)
    guide for more details.

2.  Approval: Provisioning requests are then approved or denied. This phase can happen automatically or manually. See [Provisioning Request Approval Methods](../provisioning_virtual_machines_and_hosts/index.html#provisioning-request-approval-methods)
    from the [Provisioning Virtual Machines and Hosts](../provisioning_virtual_machines_and_hosts/index.html) guide for more details.

3.  Provision: Approved provisioning requests are executed. See [Working with Provisioning Requests](../provisioning_virtual_machines_and_hosts/index.html#working-with-provisioning-requests)
    from the [Provisioning Virtual Machines and Hosts](../provisioning_virtual_machines_and_hosts/index.html) guide for more details.

### Provisioning an OpenStack Instance from an Image

{% include provisioning-requests-openstack.md %}

## Managing Storage

{% include openstack/storage-manager-available.md %}

For more information, see [Storage Managers](../managing_providers/index.html#storage-managers) from the [Managing Providers](../managing_providers/index.html)
guide.

### Managing Block Storage

The OpenStack Block Storage service (`openstack-cinder`) provides and manages persistent block storage resources that OpenStack infrastructure instances can consume. {{ site.data.product.title_short }} provides an interface for
managing these resources (volumes, volume backups, and volume snapshots).

To create a volume:

{% include openstack/cinder-volume-create.md %}

To attach a volume to an instance (for example, one created through [Provisioning an OpenStack Instance from an Image](#provisioning-an-openstack-instance-from-an-image)):

{% include openstack/cinder-instance-attach.md %}

To view a timeline of storage manager events:

{% include openstack/cinder-view-timeline.md %}

To back up a volume:

{% include openstack/cinder-backup-create.md %}

To take a volume snapshot:

{% include openstack/cinder-snapshot-create.md %}

For more information about available options for block storage resources in {{ site.data.product.title_short }}, see [OpenStack Block Storage Managers](../managing_providers/index.html#openstack-block-storage-managers)
in the [Managing Providers](../managing_providers/index.html) guide.

### Managing Object Storage

The OpenStack Object Storage (`openstack-swift`) service provides cloud object storage. The object store summary page shows details including the object store’s size, parent cloud, storage manager, cloud tenant,
and the number of cloud objects on the object store.

To view the summary page of an object store:

{% include openstack/swift-view-stores.md %}

## Catalogs and Services

{% include_relative _topics/catalogs-services.md %}

## Reports

{% include_relative _topics/reports.md %}

## Chargeback

{% include_relative _topics/chargeback.md %}

{% include app-self_signed_ca.md %}

# Customizing Provisioning Dialogs

{% include provisioning-dialogs-customization.md %}

# Creating Custom Buttons for Cloud Tenants

{{ site.data.product.title_short }} also allows you to create *custom buttons* for
cloud tenants. This is useful for providing shortcuts to functionalities
and features frequently used by specific tenants.

**Note:**

This capability is made possible through the *Automate* model. See
[Understanding the Automate Model](../scripting_actions/index.html#understanding-the-automate-model) from the [Scripting Actions in {{ site.data.product.title_short }}](../scripting_actions/index.html) guide for more details.

The following subsections summarize the two main steps for creating a
custom button for cloud tenants.

# Creating a Custom Button Group

A *button group* is a label for a collection of buttons under an *object
type*. To create a button group:

{% include automate-custom-button-group.md %}

The button group will show in the **Cloud Tenant** object type. When it
does, create a custom button for any tenant within the OpenStack Cloud
(see [Creating a Custom Button](#create-a-custom-button)).

# Creating a Custom Button

{% include automate-custom-button.md %}

The button will show in the object type you added the button to. See
[Invoking Automate](../scripting_actions/index.html#invoking-automate)
from the [Scripting Actions in {{ site.data.product.product.title_short }}](../scripting_actions/index.html) guide for more in-depth coverage.

# Managing Keypairs

{% include provisioning-requests-keypairs.md %}
