# Automation Management Providers

In {{ site.data.product.title_short }}, an automation management provider is a management
tool that integrates with {{ site.data.product.title_short }} to simplify automation
operations for your resources. This chapter describes the automation
management providers that you can use with {{ site.data.product.title_short }}, and how to
work with them.

{{ site.data.product.title_short }} provides automation management features through the
following:

**Automate** enables real-time, bi-directional process integration. This
provides you with a method to implement adaptive automation for
management events and administrative or operational activities.

**Ansible** integration delivers out-of-the-box support for backing
service, alert and policy actions using Ansible playbooks. Sync your
existing playbook repositories with {{ site.data.product.title_short }}, add
credentials to access providers, and create service catalog items for
actions ranging from creating and retiring VMs, updating security
software, or adding additional disks when space runs low.

**Ansible Tower** is a management tool integrated with
{{ site.data.product.title_short }}, designed to help automate infrastructure
operations utilizing existing Ansible Tower providers in your inventory.
{{ site.data.product.title_short }} allows you to execute Ansible Tower jobs using
service catalogs and Automate. Using Ansible Tower, you can schedule
Ansible playbook runs and monitor current and historical results,
allowing for troubleshooting or identification of issues before they
occur.

## Ansible

Ansible integrates with {{ site.data.product.title_short }} to provide automation solutions,
using playbooks, for Service, Policy and Alert actions. Ansible
playbooks consist of series of *plays* or tasks that define automation
across a set of hosts, known as the inventory.

Ranging from simple to complex tasks, Ansible playbooks can support
cloud management:

  - **Services** - allow a playbook to back a {{ site.data.product.title_short }}
    service catalog item.

  - **Control Actions** - {{ site.data.product.title_short }} policies can execute
    playbooks as actions based on events from providers.

  - **Control Alerts** - set a playbook to launch prompted by a
    {{ site.data.product.title_short }} alert.

Ansible is built into {{ site.data.product.title_short }} so there is nothing to
install. The basic workflow when using Ansible in {{ site.data.product.title_short }} is as
follows:

1.  Enable the **Embedded Ansible** server role.

2.  Add a source control repository that contains your playbooks.

3.  Establish credentials with your inventory.

4.  Back your services, alerts and policies using available playbooks.

### Enabling the Embedded Ansible Server Role

In {{ site.data.product.title_short }}, the **Embedded Ansible** role is disabled by
default. Enable this server role to utilize Ansible Automation Inside.

**Note:**

Configure your {{ site.data.product.title_short }} appliance network identity (hostname/IP address) before enabling the Embedded Ansible server role.
Restart the `evmserverd` service on the appliance with the enabled Embedded Ansible server role after making any changes to the hostname or IP address.

1.  Browse to the settings menu, then **Configuration** →
    **Settings**.

2.  Select the desired server under **Zones**.

3.  Set the **Server Role** for **Embedded Ansible** to **On**.

### Verifying the Embedded Ansible Worker State

Verify that the Embedded Ansible worker has started to utilize its
features.

1.  Browse to the settings menu, then **Configuration** →
    **Diagnostics** and click on the desired server.

2.  Click on the **Workers** tab.

A table of all workers and current status will appear from which you can
confirm the state of your embedded Ansible worker.

### Adding a Playbook Repository

Add a repository so that {{ site.data.product.title_short }} can discover and make available
your playbooks.

1.  Browse to menu: **Automation > Ansible > Repositories**.

2.  Click **Add**.

3.  Provide a Repository Name in the **Name** field.

4.  Add a description for the repository in the **Description** field.

5.  Select an **SCM Type** from the drop-down menu.

6.  Add a **URL** or IP Address for the repository.

7.  Select the appropriate **SCM Credentials** from the drop-down menu.

8.  Provide a branch name in the **SCM Branch** field.

9.  Check the appropriate box for any **SCM Update Options**.

10. Click **Add**.

Once you have synced a repository, its playbooks will become available
to {{ site.data.product.title_short }}.

### Refreshing Repositories

{{ site.data.product.title_short }} allows you to refresh a targeted playbook repository or
all repositories in your inventory to ensure your playbooks are current.

Refresh a targeted repository:

1.  Browse to menu: **Automation > Ansible > Repositories**.

2.  Click on a repository.

3.  Click **Configuration**, then
    ![Refresh this Repository](../images/2003.png) (**Refresh this
    Repository**).

Alternately, you can refresh some or all repositories from the list
view:

1.  Browse to menu: **Automation > Ansible > Repositories**.

2.  Check those repositories to refresh. Click **Check All** to select
    all repositories.

3.  Click **Configuration**, then
    ![Refresh Selected Ansible Repositories](../images/2003.png)
    (**Refresh Selected Ansible Repositories**).

{% include_relative _topics/ansible_credentials.md %}

{% include_relative _topics/tagging_ansible_elements.md %}

{% include_relative _topics/optimizing_playbooks.md %}

### Ansible Tower

Ansible Tower is a management tool integrated with {{ site.data.product.title_short }},
designed to help automate infrastructure operations. {{ site.data.product.title_short }}
allows you to execute Ansible Tower jobs or workflows using service
catalogs and Automate. No custom configuration or Ruby scripting is
needed in {{ site.data.product.title_short }}, as configuration is done in Ansible
Tower using playbooks.

You can use the large library of existing Ansible playbooks as
{{ site.data.product.title_short }} state machines to automate tasks such as
deployments, backups, package updates, and maintenance in your
{{ site.data.product.title_short }} environment. This can be particularly useful for quickly
applying changes across large environments with many virtual machines or
instances.

Using Ansible Tower, you can schedule Ansible playbook runs and monitor
current and historical results, allowing for troubleshooting or
identification of issues before they occur.

{{ site.data.product.title_short }} supports Ansible Tower API v2 provider
integration.

#### Working with an Ansible Tower Provider

The basic workflow when using {{ site.data.product.title_short }} with an Ansible Tower
provider is as follows:

1.  Create an Ansible playbook which performs a specific task.

2.  A new Ansible Tower job template is created from the playbook (or
    workflow template created from disparate jobs), which is then
    retrieved by {{ site.data.product.title_short }}.

3.  From the Ansible Tower job or workflow template, create a new
    catalog item in {{ site.data.product.title_short }}, optionally with a service
    dialog that allows the user to enter parameters if needed.

4.  The user orders the service from the {{ site.data.product.title_short }} user
    interface, and fills out any additional arguments (for example,
    limiting the task to run on a specific set of virtual machines).

5.  The job or workflow executes.

**Note:**

  - For more information on Ansible playbooks, see the [Ansible playbook documentation](https://docs.ansible.com/ansible/latest/user_guide/playbooks.html).

  - For more information on worklows, see
    [Workflows](https://docs.ansible.com/ansible-tower/latest/html/userguide/workflows.html)
    in the Ansible Tower *User Guide*.

#### Adding an Ansible Tower Provider

To access your Ansible Tower inventory from {{ site.data.product.title_short }}, you must
add Ansible Tower as a provider.

**Note:**

  - Ensure **ENABLE HTTP BASIC AUTH** is set to **On** in the Ansible
    Tower configuration settings before adding the provider. See [Tower
    Configuration](https://docs.ansible.com/ansible-tower/latest/html/administration/configure_tower_in_tower.html)
    in the Ansible Tower *Administration Guide*.

  - A trailing slash is **not** required at the end of the Ansible Tower
    provider URL. Adding the trailing slash to the provider URL may
    result in a validation error.

1.  Browse to menu: **Automation > Ansible Tower > Explorer** and click on the **Providers** accordion tab.

2.  Under **Configuration**, click
    ![Add a new Provider](../images/1862.png) **Add a new Provider**.

3.  In the **Add a new Provider** area:

    ![Add\_Ansible\_Provider](../images/add-ansible-tower-provider.png)

    1.  Enter a **Name** for the new provider.

    2.  Add a **Zone** for the provider.

    3.  Enter the **URL** location or IP address to the Ansible Tower server. Add a trailing slash to the end of the Ansible Tower provider URL.

4.  Select the **Verify Peer Certificate** checkbox if desired.

5.  In the **Credentials** area, provide the **Username** and
    **Password**, and **Confirm Password**.

6.  Click **Validate** to verify credentials.

7.  Click **Add**.

After adding the Ansible Tower provider, refresh its relationships and power states in order to view the current inventory.

#### Refreshing an Ansible Tower Provider

Refresh relationships of all items related to an existing Ansible Tower configuration management provider including inventory, hosts, virtual machines, and clusters.

You can refresh inventory from {{ site.data.product.title_short }}, or by enabling the
**Update on Launch** option for inventory groups in Ansible Tower. The
**Update on Launch** option allows Ansible Tower to automatically update inventory using a dynamic inventory script before launching an Ansible Tower job from a playbook. See the [Ansible Tower documentation](http://docs.ansible.com/ansible-tower/index.html) for more information.

**Important**

It can take a long time to retrieve information from providers containing many virtual machines or instances. The Ansible Tower dynamic inventory script can be modified to limit updates to specific items and
reduce refresh time.

To refresh an Ansible Tower provider’s inventory in {{ site.data.product.title_short }}:

1.  Browse to menu: **Automation > Ansible Tower > Explorer** and click the **Providers** accordion tab.

2.  Select the checkboxes for the Ansible Tower providers to refresh under **All Ansible Tower Providers**.

3.  Click **Configuration**, and
    then ![Refresh Relationships and Power States](../images/2003.png)
    (**Refresh Relationships and Power States**).

4.  Click **OK**.

{{ site.data.product.title_short }} then queries the Ansible Tower API and obtains an
inventory of all available hosts, job and workflow templates.

#### Viewing Ansible Tower Providers and Inventory

{{ site.data.product.title_short }} automatically updates its inventory from Ansible Tower.
This includes system groups (known as Inventories in Ansible Tower),
basic information about individual systems, and available Ansible Tower
job or workflow templates to be executed from the service catalog or
Automate.

**Note:**

To view and access Ansible Tower inventories and job or workflow templates in {{ site.data.product.title_short }}, you must first create them in Ansible Tower.

To view a list of Ansible Tower providers and inventory:

1.  Browse to menu: **Automation > Ansible Tower > Explorer**.

2.  select the **Providers** accordion menu to display a list of **All Ansible Tower Providers**.

3.  Select your Ansible Tower provider to expand and list the inventory groups on that Ansible Tower system. The inventory groups can be expanded to view the systems contained within each group, as well as configuration details for these systems.

Similarly, all discovered job and workflow templates are accessed under the provider by expanding the menu: **Automation > Ansible Tower > Explorer** and click the **Templates** accordion menu.

#### Viewing Ansible Tower Configured Systems

To view the systems in your Ansible Tower inventory:

1.  Browse to menu: **Automation > Ansible Tower > Explorer** and click **Configured Systems**.

2.  Under **All Ansible Tower Configured Systems**, select **Ansible Tower Configured Systems** to display a list.

#### Executing an Ansible Tower Job or Workflow Template from a Service Catalog

You can execute an Ansible Tower playbook from {{ site.data.product.title_short }} by creating a service catalog item from an Ansible Tower job or workflow template.

**Important:**

You must first create the job or workflow template in Ansible Tower. The job or workflow templates are automatically discovered by {{ site.data.product.title_short }} when refreshing your Ansible Tower provider’s inventory.

First, create a catalog:

1.  Browse to menu: **Services > Catalogs** and click **Catalog Items**.

2.  Click **Configuration**, then
    ![Add a New Catalog](../images/1862.png) (**Add a New Catalog**)

3.  Enter a **Name** and **Description** for the catalog.

4.  Click **Add**.

Then, create an Ansible Tower service catalog item:

1.  Browse to menu: **Automation > Ansible Tower > Explorer**, then click the **Templates** according menu.

2.  Click **Ansible Tower Templates** and select an Ansible Tower job or workflow template.

3.  Click **Configuration**, then
    ![Create Service Dialog from Template](../images/1862.png) (**Create Service Dialog from this Template**).

4.  Enter a **Service Dialog Name** (for example,
    *ansible\_tower\_job*)and click **Save**.

5.  Browse to menu: **Services > Catalogs** and click **Catalog Items**.

6.  Click **Configuration**, then
    ![Add a New Catalog Item](../images/1862.png) (**Add a New Catalog Item**) to create a new catalog item with the following details, at minimum:

      - For **Catalog Item type**, select **Ansible Tower**.

      - Enter a **Name** for the service catalog item.

      - Select **Display in Catalog**.

      - In **Catalog**, select the catalog you created previously.

      - In **Dialog**, select the service dialog you created previously
        (in this example, *ansible\_tower\_job*). To ask the user to enter extra information when running the task, **Service Dialog** must be selected. A dialog is required if **Display in Catalog** is chosen.

      - In **Provider**, select your Ansible Tower provider. This brings up the **Ansible Tower Template** option and configures the
        **Provisioning Entry Point State Machine** automatically.

      - Add configuration information for **Reconfigure Entry Point** and **Retirement Entry Point** as applicable.

      - Select your desired **Ansible Tower Template** from the list.
        Generally, this is the Ansible Tower job or workflow template previously used to create the service dialog.

7.  Click **Add**. The catalog item you created will appear in the **All Service Catalog Items** list.

To execute the Ansible Tower job:

1.  Browse to menu: **Service > Catalogs** and click on **Service Catalogs** then click **Ansible Tower catalog**.

    ![order at catalog item](../images/order_at_catalog_item.png)

2.  Click **Order** for the catalog item.

3.  Enter any variables requested and click **Submit**.

{{ site.data.product.title_short }} takes you to the **Requests** queue page and show the
status of the job.

The service item’s details can be viewed in menu: **Services > My Services** in {{ site.data.product.title_short }}.

**Note:**

Instead of running a single job at a time, multiple service catalog items can also be grouped together as a catalog bundle to create one deployment with multiple job templates. See [Catalogs and Services](../provisioning_virtual_machines_and_hosts/index.html#catalogs-and-services) in *Provisioning Virtual Machines and Hosts* for more information.

#### Executing an Ansible Tower Job Using a Custom Automate Button

{{ site.data.product.title_short }} can execute Ansible Tower jobs on virtual machines or
instances using custom buttons in Automate.

Ansible Tower jobs can either be non-customizable, which do not require any extra configuration from the user, or alternatively, they can allow the user to specify a parameter (for example, a package name to install). In Ansible Tower jobs containing a dialog, {{ site.data.product.title_short }} accepts additional information from the user and adds it to the appropriate API call in Automate, and then sends it into Ansible Tower.

**Prerequisites.**

Before creating an Automate button to execute an Ansible Tower job, the following must be configured:

  - An Ansible playbook in Ansible Tower. See the [Ansible Tower documentation](https://docs.ansible.com/) for instructions.

  - Ansible Tower must be able to reach virtual machines or instances deployed by {{ site.data.product.title_short }} at the IP level.

  - The virtual machine template must have the Ansible Tower environment’s public SSH key injected. For cloud instances, `cloud-init` can be used and the public SSH key can be passed without rebuilding the image.

  - Any dynamic inventory scripts used must be configured to return the virtual machine names exactly as they are stored in {{ site.data.product.title_short }}, without the UUID appended.

**Executing an Ansible Tower Job using a Custom Automate Button.**

To configure a custom button to execute an Ansible Tower job on a virtual machine or instance, first create the button:

1.  Browse to menu: **Automation > Automate > Customization**.

2.  Click the **Buttons** accordion menu.

3.  Click menu: **VM and Instance** > **Unassigned Buttons**. This configures the button to run on virtual machines or instances.

4.  Click **Configuration**, then click
    ![1862](../images/1862.png) (**Add a new Button**).

      - In the **Adding a new Button** screen, configure the **Action** parameters as desired. **Dialog** can be left blank if the playbook does not require extra variables. To ask the user to enter extra information when running the task, **Service Dialog** must be selected.

      - Configure **Object Details** fields with the following request details:

          - For **System/Process**, select **Request**.

          - For **Message**, enter **create**.

          - For **Request**, enter **Ansible\_Tower\_Job**.

      - Configure **Attribute/Value Pairs** with the following
        parameters:

          - **job\_template\_name** is the Ansible Tower job template
            name to associate with the button. The
            **job\_template\_name** field is mandatory; other parameters
            are provided by the Tower job dialog.

      - Configure **Visibility** to all users, or limit visibility by
        role as desired.

        ![add button](../images/add_button.png)

      - Click **Add**.

If you do not have an existing button group to assign the new button to, create a new button group:

1.  From menu: **Automation > Automate > Customization**, browse to menu: **Buttons** and click **VM and Instance > Add a new Button Group**, and configure the following:

      - Configure **Basic Info** as desired. For example, name the button group `VM Actions`.

      - In **Assign Buttons**, select the button you just created from
        the **Unassigned** list and click ![1876](../images/1876.png) to
        assign it to **Selected**.

        ![create button group](../images/create_button_group.png)

      - Click **Add**.

To assign the button to an existing button group:

1.  Browse to menu: **Buttons > VM and Instance > VM Actions > Edit this Button Group**.

2.  In **Assign Buttons**, select the button you just created from the **Unassigned** list and click ![1876](../images/1876.png) to assign it to **Selected**.

3.  Click **Add**.

To use the button to run an Ansible Tower job on a virtual machine:

1.  Browse to menu: **Compute > Infrastructure > Virtual Machines**.

2.  Select the virtual machine to run the Ansible Tower job template on.

3.  Click the **VM Actions** button to show the button you created, and
    click the button from the list to run the Ansible Tower job
    template.

    ![run update button](../images/run_update_button.png)

4.  Click **Submit** to execute the job.

{{ site.data.product.title_short }} then confirms the job has been executed.

If you selected a service dialog to run when creating the button,
{{ site.data.product.title_short }} will then prompt you to enter variables to complete the
task. After entering your desired parameters, {{ site.data.product.title_short }} takes you
to the **Requests** page.

The service item’s details can be viewed in menu: **Services > My Services** in {{ site.data.product.title_short }}.
