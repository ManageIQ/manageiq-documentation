In [???](#provisioning-an-openstack-instance-from-an-image), you
provisioned instance manually by entering values in provisioning dialogs
such as name, size, image, CPUs, etc. *Catalogs* are used to create
groups of instances for provisioning. {{ site.data.product.title_short }} enables
users to provision instances via a single **Order** button.

Creating a *service catalog* involves:

1.  Creating a **Service Dialog**. This is a UI interface element that
    allows users to interact with the service (for example, a drop-down
    list).

2.  Creating a **Catalog Item** for each instance that will be part of
    the service.

3.  Creating a *method* for the **Service Dialog**. This method defines
    what each option means to each individual cloud instances for the
    service. This method is called from a service provisioning instance
    in the **Automate** model.

<div class="note">

For more information about catalogs and services, see [Catalogs and
Services](https://access.redhat.com/documentation/en/red-hat-cloudforms/4.7/single/provisioning-virtual-machines-and-hosts/#catalogs-services)
from the [Provisioning Virtual Machines and
Hosts](https://access.redhat.com/documentation/en-us/red_hat_cloudforms/4.7/html-single/provisioning_virtual_machines_and_hosts/)
guide.

</div>

### Creating a Service Dialog

When provisioning a service, input will be needed from the requester.
**Service Dialogs** are used to take input from the user. This input is
connected to a method in the **Automate** model that defines how user
input is translated into the provision request. Before creating a
**Service Dialog**, be sure to plan what items you need the user to
input.

{% include service-dialog-creation.md %}

### Creating a Catalog

A catalog is a way to organize or categorize catalog items and bundles.
Before you can associate a catalog item into a catalog, create an empty
catalog first:

1.  Navigate to menu:Services\[Catalogs\].

2.  Click the **Catalogs** accordion.

3.  Click ![1847](../images/1847.png)(**Configuration**), and then
    ![1862](../images/1862.png)(**Add a New Catalog**).

4.  Enter a **Name** and **Description**, leaving everything else blank.

5.  Click **Add**.

#### Creating a Catalog Item

{% include_relative _topics/catalog-item-creation-openstack.md %}

#### Ordering a Catalog Item

{% include catalog-order.md %}
