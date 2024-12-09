# Automation Management Providers

In {{ site.data.product.title_short }}, an automation management provider is a management tool that integrates with {{ site.data.product.title_short }} to simplify automation operations for your resources. The following chapter describes the automation management providers that you can use with {{ site.data.product.title_short }}, and how to work with them.

{{ site.data.product.title_short }} provides automation management through the following features:

**Automate** enables real-time, bidirectional process integration. This embedded automate feature provides you with a method to implement adaptive automation for management events and administrative or operational activities.

**Embedded Workflows** provide the capability to simplify service catalog creation and improve the overall service catalog experience through a step-based automation system. Workflows can run docker containers to accomplish a task that the user requires as part of the state machine. Workflows are imported from Git repository content into {{ site.data.product.title_short }} where they are made available for users to run. *Embedded Workflows* are an alternative to the *Embedded Automate* capability for authoring and running automation. With *Embedded Workflows*, you can continue to use the *Embedded Automate* feature for service catalog creation and management.

**Ansible** integration delivers out-of-the-box support for backing service, alert, and policy actions by using Ansible playbooks. Sync your existing playbook repositories with {{ site.data.product.title_short }}, add credentials to access providers, and create service catalog items for actions ranging from creating and retiring VMs, updating security software, or adding more disks when space runs low.

**Ansible Tower** is a management tool that is integrated with {{ site.data.product.title_short }}, designed to help automate infrastructure operations utlizizing existing Ansible Tower providers in your inventory. {{ site.data.product.title_short }} allows you to execute Ansible Tower jobs by using service catalogs and Automate. Using Ansible Tower, you can schedule Ansible playbook runs and monitor current and historical results, allowing for troubleshooting or identification of issues before they occur.

{% include_relative _topics/embedded_workflows.md %}

## Ansible

Ansible integrates with {{ site.data.product.title_short }} to provide automation solutions, using playbooks, for Service, Policy and Alert actions. Ansible playbooks consist of series of *plays* or tasks that define automation across a set of hosts, which is known as the inventory.

Ranging from simple to complex tasks, Ansible playbooks can support cloud management:

- **Services** - allow a playbook to back a {{ site.data.product.title_short }} service catalog item.

- **Control Actions** - {{ site.data.product.title_short }} policies can execute playbooks as actions based on events from providers.

- **Control Alerts** - set a playbook to launch prompted by a {{ site.data.product.title_short }} alert.

Ansible is built into {{ site.data.product.title_short }} so there is nothing to install. The basic workflow when using Ansible in {{ site.data.product.title_short }} is as follows:

1. Enable the **Embedded Ansible** server role.

2. Add a source control repository that contains your playbooks.

3. Establish credentials with your inventory.

4. Back your services, alerts, and policies using available playbooks.

### Enabling the Embedded Ansible Server Role

In {{ site.data.product.title_short }}, the **Embedded Ansible** role is disabled by default. Enable this server role to utilize Ansible Automation Inside.

**Note:** Configure your {{ site.data.product.title_short }} appliance network identity (hostname/IP address) before enabling the Embedded Ansible server role. Restart the `evmserverd` service on the appliance with the enabled Embedded Ansible server role after making any changes to the hostname or IP address.

1. Browse to the settings menu, then **Configuration > Settings**.

2. Select the desired server under **Zones**.

3. Set the **Server Role** for **Embedded Ansible** to **On**.

### Verifying the Embedded Ansible Worker State

Verify that the Embedded Ansible worker has started to utilize its features.

1. Browse to the settings menu, then **Configuration > Diagnostics** and click on the desired server.

2. Click on the **Roles by Servers** tab.

A table of all workers and current status will appear from which you can confirm the state of your embedded Ansible worker.

### Adding a Playbook Repository

Add a repository so that {{ site.data.product.title_short }} can discover and make available your playbooks.

1. Browse to menu: **Automation > Ansible > Repositories**.

2. Click **Configuration**, then ![Add New Repository](../images/1862.png) (**Add New Repository**).

3. Provide a Repository Name in the **Name** field.

4. Add a description for the repository in the **Description** field.

5. Add a **URL** or IP Address for the repository.

6. Select the appropriate **SCM Credentials** from the drop-down menu.

7. Provide a branch name in the **SCM Branch** field.

8. Click **Save**.

Once you have synced a repository, its playbooks will become available to {{ site.data.product.title_short }}.

### Refreshing Repositories

{{ site.data.product.title_short }} allows you to refresh a targeted playbook repository or all repositories in your inventory to ensure your playbooks are current.

Refresh a targeted repository:

1. Browse to menu: **Automation > Ansible > Repositories**.

2. Click on a repository.

3. Click **Configuration**, then ![Refresh this Repository](../images/2003.png) (**Refresh this Repository**).

Alternately, you can refresh some or all repositories from the list view:

1. Browse to menu: **Automation > Ansible > Repositories**.

2. Check those repositories to refresh. Click **Check All** to select all repositories.

3. Click **Configuration**, then ![Refresh Selected Ansible Repositories](../images/2003.png) (**Refresh Selected Ansible Repositories**).

{% include_relative _topics/ansible_credentials.md %}

{% include_relative _topics/tagging_ansible_elements.md %}

{% include_relative _topics/optimizing_playbooks.md %}

### Ansible Tower

Ansible Tower is a management tool integrated with {{ site.data.product.title_short }}, designed to help automate infrastructure operations. {{ site.data.product.title_short }} allows you to execute Ansible Tower jobs or workflows using service catalogs and Automate. No custom configuration or Ruby scripting is needed in {{ site.data.product.title_short }}, as configuration is done in Ansible Tower using playbooks.

You can use the large library of existing Ansible playbooks as {{ site.data.product.title_short }} state machines to automate tasks such as deployments, backups, package updates, and maintenance in your {{ site.data.product.title_short }} environment. This can be particularly useful for quickly applying changes across large environments with many virtual machines or instances.

Using Ansible Tower, you can schedule Ansible playbook runs and monitor current and historical results, allowing for troubleshooting or identification of issues before they occur.

{{ site.data.product.title_short }} supports Ansible Tower API v2 provider integration.

#### Working with an Ansible Tower Provider

The basic workflow when using {{ site.data.product.title_short }} with an Ansible Tower provider is as follows:

1. Create an Ansible playbook which performs a specific task.

2. A new Ansible Tower job template is created from the playbook (or workflow template created from disparate jobs), which is then retrieved by {{ site.data.product.title_short }}.

3. From the Ansible Tower job or workflow template, create a new catalog item in {{ site.data.product.title_short }}, optionally with a service dialog that allows the user to enter parameters if needed.

4. The user orders the service from the {{ site.data.product.title_short }} user interface, and fills out any additional arguments (for example, limiting the task to run on a specific set of virtual machines).

5. The job or workflow executes.

**Notes:**

- For more information about Ansible playbooks, see the [Ansible playbook documentation](https://docs.ansible.com/ansible/latest/user_guide/playbooks.html).

- For more information about worklows, see [Workflows](https://docs.ansible.com/ansible-tower/latest/html/userguide/workflows.html) in the Ansible Tower *User Guide*.

#### Adding an Ansible Tower Provider

To access your Ansible Tower inventory from {{ site.data.product.title_short }}, you must add Ansible Tower as a provider.

**Notes:**

- Ensure **ENABLE HTTP BASIC AUTH** is set to **On** in the Ansible Tower configuration settings before adding the provider. See [Tower Configuration](https://docs.ansible.com/ansible-tower/latest/html/administration/configure_tower_in_tower.html) in the Ansible Tower *Administration Guide*.

- A trailing slash is **not** required at the end of the Ansible Tower provider URL. Adding the trailing slash to the provider URL may result in a validation error.

1. Browse to menu: **Automation > Ansible Tower > Explorer** and click on the **Providers** accordion tab.

2. Under **Configuration**, click ![Add a new Provider](../images/1862.png) **Add a new Provider**.

3. In the **Add a new Provider** area:

   ![Add\_Ansible\_Provider](../images/add-ansible-tower-provider.png)

   1. Enter a **Name** for the new provider.

   2. Add a **Zone** for the provider.

   3. Enter the **URL** location or IP address to the Ansible Tower server. Add a trailing slash to the end of the Ansible Tower provider URL.

4. Select the **Verify Peer Certificate** checkbox if desired.

5. In the **Credentials** area, provide the **Username** and **Password**, and **Confirm Password**.

6. Click **Validate** to verify credentials.

7. Click **Add**.

After adding the Ansible Tower provider, refresh its relationships and power states in order to view the current inventory.

#### Refreshing an Ansible Tower Provider

Refresh relationships of all items related to an existing Ansible Tower configuration management provider including inventory, hosts, virtual machines, and clusters.

You can refresh inventory from {{ site.data.product.title_short }}, or by enabling the **Update on Launch** option for inventory groups in Ansible Tower. The **Update on Launch** option allows Ansible Tower to automatically update inventory using a dynamic inventory script before launching an Ansible Tower job from a playbook. For more information, see the [Ansible Tower documentation](http://docs.ansible.com/ansible-tower/index.html).

**Important:** It can take a long time to retrieve information from providers containing many virtual machines or instances. The Ansible Tower dynamic inventory script can be modified to limit updates to specific items and reduce refresh time.

To refresh an Ansible Tower provider’s inventory in {{ site.data.product.title_short }}:

1.  Browse to menu: **Automation > Ansible Tower > Explorer** and click the **Providers** accordion tab.

2.  Select the checkboxes for the Ansible Tower providers to refresh under **All Ansible Tower Providers**.

3.  Click **Configuration**, and then ![Refresh Relationships and Power States](../images/2003.png) (**Refresh Relationships and Power States**).

4. Click **OK**.

{{ site.data.product.title_short }} then queries the Ansible Tower API and obtains an inventory of all available hosts, job, and workflow templates.

#### Viewing Ansible Tower Providers and Inventory

{{ site.data.product.title_short }} automatically updates its inventory from Ansible Tower. This includes system groups (known as Inventories in Ansible Tower), basic information about individual systems, and available Ansible Tower job or workflow templates to be executed from the service catalog or Automate.

**Note:** To view and access Ansible Tower inventories and job or workflow templates in {{ site.data.product.title_short }}, you must first create them in Ansible Tower.

To view a list of Ansible Tower providers and inventory:

1. Browse to menu: **Automation > Ansible Tower > Explorer**.

2. select the **Providers** accordion menu to display a list of **All Ansible Tower Providers**.

3. Select your Ansible Tower provider to expand and list the inventory groups on that Ansible Tower system. The inventory groups can be expanded to view the systems contained within each group, as well as configuration details for these systems.

Similarly, all discovered job and workflow templates are accessed under the provider by expanding the menu: **Automation > Ansible Tower > Explorer** and click the **Templates** accordion menu.

#### Viewing Ansible Tower Configured Systems

To view the systems in your Ansible Tower inventory:

1. Browse to menu: **Automation > Ansible Tower > Explorer** and click **Configured Systems**.

2. Under **All Ansible Tower Configured Systems**, select **Ansible Tower Configured Systems** to display a list.

#### Executing an Ansible Tower Job or Workflow Template from a Service Catalog

You can execute an Ansible Tower playbook from {{ site.data.product.title_short }} by creating a service catalog item from an Ansible Tower job or workflow template.

**Important:** You must first create the job or workflow template in Ansible Tower. The job or workflow templates are automatically discovered by {{ site.data.product.title_short }} when refreshing your Ansible Tower provider’s inventory.

First, create a catalog:

1. Browse to menu: **Services > Catalogs** and click **Catalog Items**.

2. Click **Configuration**, then ![Add a New Catalog](../images/1862.png) (**Add a New Catalog**)

3. Enter a **Name** and **Description** for the catalog.

4. Click **Add**.

Then, create an Ansible Tower service catalog item:

1. Browse to menu: **Automation > Ansible Tower > Explorer**, then click the **Templates** according menu.

2. Click **Ansible Tower Templates** and select an Ansible Tower job or workflow template.

3. Click **Configuration**, then ![Create Service Dialog from Template](../images/1862.png) (**Create Service Dialog from this Template**).

4. Enter a **Service Dialog Name** (for example, *ansible\_tower\_job*)and click **Save**.

5. Browse to menu: **Services > Catalogs** and click **Catalog Items**.

6. Click **Configuration**, then ![Add a New Catalog Item](../images/1862.png) (**Add a New Catalog Item**) to create a new catalog item with the following details, at minimum:

   - For **Catalog Item type**, select **Ansible Tower**.

   - Enter a **Name** for the service catalog item.

   - Select **Display in Catalog**.

   - In **Catalog**, select the catalog you created previously.

   - In **Dialog**, select the service dialog you created previously (in this example, *ansible\_tower\_job*). To ask the user to enter extra information when running the task, **Service Dialog** must be selected. A dialog is required if **Display in Catalog** is chosen.

   - In **Provider**, select your Ansible Tower provider. This brings up the **Ansible Tower Template** option and configures the **Provisioning Entry Point State Machine** automatically.

   - Add configuration information for **Reconfigure Entry Point** and **Retirement Entry Point** as applicable.

   - Select your desired **Ansible Tower Template** from the list. Generally, this is the Ansible Tower job or workflow template previously used to create the service dialog.

7. Click **Add**. The catalog item you created will appear in the **All Service Catalog Items** list.

To execute the Ansible Tower job:

1. Browse to menu: **Service > Catalogs** and click on **Service Catalogs** then click **Ansible Tower catalog**.

   ![order at catalog item](../images/order_at_catalog_item.png)

2. Click **Order** for the catalog item.

3. Enter any variables requested and click **Submit**.

{{ site.data.product.title_short }} takes you to the **Requests** queue page and show the status of the job.

The service item’s details can be viewed in menu: **Services > My Services** in {{ site.data.product.title_short }}.

**Note:** Instead of running a single job at a time, multiple service catalog items can also be grouped together as a catalog bundle to create one deployment with multiple job templates. For more information, see [Catalogs and Services](../provisioning_virtual_machines_and_hosts/index.html#catalogs-and-services).

#### Executing an Ansible Tower Job Using a Custom Automate Button

{{ site.data.product.title_short }} can execute Ansible Tower jobs on virtual machines or instances using custom buttons in Automate.

Ansible Tower jobs can either be noncustomizable, which do not require any extra configuration from the user, or alternatively, they can allow the user to specify a parameter (for example, a package name to install). In Ansible Tower jobs containing a dialog, {{ site.data.product.title_short }} accepts additional information from the user and adds it to the appropriate API call in Automate, and then sends it into Ansible Tower.

**Prerequisites.**

Before creating an Automate button to execute an Ansible Tower job, the following must be configured:

- An Ansible playbook in Ansible Tower. See the [Ansible Tower documentation](https://docs.ansible.com/) for instructions.

- Ansible Tower must be able to reach virtual machines or instances deployed by {{ site.data.product.title_short }} at the IP level.

- The virtual machine template must have the Ansible Tower environment’s public SSH key injected. For cloud instances, `cloud-init` can be used and the public SSH key can be passed without rebuilding the image.

- Any dynamic inventory scripts used must be configured to return the virtual machine names exactly as they are stored in {{ site.data.product.title_short }}, without the UUID appended.

**Executing an Ansible Tower Job using a Custom Automate Button.**

To configure a custom button to execute an Ansible Tower job on a virtual machine or instance, first create the button:

1. Browse to menu: **Automation > Automate > Customization**.

2. Click the **Buttons** accordion menu.

3. Click menu: **VM and Instance > Unassigned Buttons**. This configures the button to run on virtual machines or instances.

4. Click **Configuration**, then click ![1862](../images/1862.png) (**Add a new Button**).

   1. In the **Adding a new Button** screen, configure the **Action** parameters as desired. **Dialog** can be left blank if the playbook does not require extra variables. To ask the user to enter extra information when running the task, **Service Dialog** must be selected.

   2. Configure **Object Details** fields with the following request details:

     - For **System/Process**, select **Request**.

     - For **Message**, enter **create**.

     - For **Request**, enter **Ansible\_Tower\_Job**.

   3. Configure **Attribute/Value Pairs** with the following parameters:

     - **job\_template\_name** is the Ansible Tower job template name to associate with the button. The **job\_template\_name** field is mandatory; other parameters are provided by the Tower job dialog.

     - Configure **Visibility** to all users, or limit visibility by role as desired.

       ![add button](../images/add_button.png)

   4. Click **Add**.

If you do not have an existing button group to assign the new button to, create a new button group:

1. From menu: **Automation > Automate > Customization**, browse to menu: **Buttons** and click **VM and Instance > Add a new Button Group**, and configure the following:

   1. Configure **Basic Info** as desired. For example, name the button group `VM Actions`.

   2. In **Assign Buttons**, select the button you just created from the **Unassigned** list and click ![1876](../images/1876.png) to assign it to **Selected**.

     ![create button group](../images/create_button_group.png)

   3. Click **Add**.

To assign the button to an existing button group:

1. Browse to menu: **Buttons > VM and Instance > VM Actions > Edit this Button Group**.

2. In **Assign Buttons**, select the button you just created from the **Unassigned** list and click ![1876](../images/1876.png) to assign it to **Selected**.

3. Click **Add**.

To use the button to run an Ansible Tower job on a virtual machine:

1. Browse to menu: **Compute > Infrastructure > Virtual Machines**.

2. Select the virtual machine to run the Ansible Tower job template on.

3. Click the **VM Actions** button to show the button you created, and click the button from the list to run the Ansible Tower job template.

   ![run update button](../images/run_update_button.png)

4. Click **Submit** to execute the job.

{{ site.data.product.title_short }} then confirms the job has been executed.

If you selected a service dialog to run when creating the button, {{ site.data.product.title_short }} will then prompt you to enter variables to complete the task. After entering your desired parameters, {{ site.data.product.title_short }} takes you to the **Requests** page.

The service item’s details can be viewed in menu: **Services > My Services** in {{ site.data.product.title_short }}.

## Embedded Terraform (OpenTofu)

OpenTofu is an open source infrastructure as code tool, which can be used to build, change, and version the infrastructure. You can use OpenTofu to define infrastructure resources in human-readable configuration files that you can use to version, reuse, and share.

OpenTofu is built into {{ site.data.product.title_short }} so you do not need to install any additional components.

If you want to use the Embedded Terraform feature in {{ site.data.product.title_short }} that is deployed as a virtual machine appliance, then you need to manually import the Terraform image on an appliance:

## Importing OpenTofu image on an appliance

**Note**: Follow this section if you have {{ site.data.product.title_short }} that is deployed as a virtual appliance. These steps are not applicable to a containerized deployment (podified) of {{ site.data.product.title_short }}.

Use the following command to import the OpenTofu image on your appliance server.

``` bash
{{ site.data.product.import_opentofu }}
```

Where {{ site.data.product.opentofu_image_name }} is the name of your OpenTofu image.

You also need to set the docker image name in advanced settings before enabling the server role. Navigate to the **Settings** > **Application Settings** in {{ site.data.product.title_short }} UI and set the value for `workers/worker_base/opentofu_worker/container_image` field.

An example value of this field is `container_image: {{ site.data.product.container_image }}`.

## Usage of Embedded Terraform (OpenTofu)

The following sections show the usage of Embedded Terraform in {{ site.data.product.title_short }}. The following sections apply to {{ site.data.product.title_short }} that is deployed as a containerized deployment (podified) and {{ site.data.product.title_short }} that is deployed as a virtual machine appliance:

1. Enable the Embedded Terraform server role.
2. Add a source control repository that contains your templates.
3. Add credentials to access the repository.
4. Create a Service Catalog item with the desired Terraform template.

### Enabling the Embedded Terraform Server Role

In {{ site.data.product.title_short }}, the Embedded Terraform server role is disabled by default. Enable this server role to use Embedded Terraform (OpenTofu).

To enable the Embedded Terraform Server Role, use the following steps:

1. Browse to the settings menu, and click **Configuration** > **Application Settings**.
2. Select the desired server under **Zones**.
3. Set the **Server Role** for **Embedded Terraform** to `On`.

### Verifying the Embedded Terraform worker state

Verify that the Embedded Terraform worker is started to use its features:

1. Browse to the settings menu, then click **Configuration** > **Application Settings**.
2. Click **Diagnostics** and click the server that you want to choose.
2. Click **Roles by Servers** tab.

A table of all workers and their status appears from which you can confirm the state of your Embedded Terraform worker.

### Adding a Template Repository

To enable {{ site.data.product.title_short }} to discover and use your Terraform templates, add a repository to store and manage your templates.

If your repository requires credentials for access, then you need to create SCM credentials. For more information about how to create SCM credentials, see [SCM credentials](../_topics/opentofu_credentials.md#scm).

Use the following steps to add a repository:

1. Browse to the menu and click **Automation > Embedded Terraform > Repositories**.

2. Click **Configuration**, then ![Add New Repository](../images/1862.png) (**Add New Repository**).

3. Provide a Repository Name in the **Name** field.

4. Add a description for the repository in the **Description** field.

5. Add a **URL** and an optional port for the repository.

6. Select the appropriate **SCM Credentials** from the drop-down menu.

7. Provide a branch name in the **SCM Branch** field. This field is optional and default value is set to `master` branch.

8. Click **Save**.

When you save the repository, the Terraform templates are synced, and are available to {{ site.data.product.title_short }}.

### Refreshing Repositories

You can use {{ site.data.product.title_short }} to refresh specific Terraform repositories or all repositories in your inventory to make sure that your templates are up to date.

Use the following steps to refresh a specific repository:

1. Browse to the menu and click **Automation > Embedded Terraform > Repositories**.

2. Click a repository.

3. Click **Configuration**, then ![Refresh this Repository](../images/2003.png) (**Refresh this Repository**).

Alternately, you can refresh some or all of the repositories from the list view:

1. Browse to the menu and click **Automation > Embedded Terraform > Repositories**.

2. Select the repositories that you want to refresh. Click **Check All** to select all repositories.

3. Click **Configuration**, then ![Refresh Selected Terraform Templates Repositories](../images/2003.png) (**Refresh Selected Ansible Repositories**).

{% include_relative _topics/opentofu_credentials.md %}

### Running a Terraform Template from a Service Catalog

You can run a Terraform Template from {{ site.data.product.title_short }} by creating a Service Catalog item from a Terraform template.

Use the following listed steps in each section to run the Terraform Template from a Service Catalog:

1. Create a catalog
2. Create a Terraform Service Catalog item
3. Run the Terraform template

#### Create a catalog

Use the following steps to create a catalog:

1. In the navigation bar, click **Services** > **Catalogs**.

2. Click **Catalogs**.

3. Click **Configuration**, then click **Add a New Catalog**.

4. Enter a **Name** and **Description** for the catalog.

5. Click **Add**.

#### Create a Terraform Service Catalog item

Use the following steps to create a Terraform Service Catalog item:

1. In the navigation bar click **Automation** > **Embedded Automate** > **Customization**, then click **Service Dialog**.

2. Click **Configuration** > **Create Service Dialog**.

3. Enter a **Service Dialog Name** and add the required fields for the Terraform template.

4. Click **Save**.

5. In the navigation bar, click **Services** > **Catalogs** > **Catalog Items**.

6. Click **Configuration** > **Add a New Catalog Item** to create a new catalog item with the following details at minimum:

   - For **Catalog Item type**, select **Terraform Template**.

   - Enter a **Name** for the service catalog item.

   - Select **Display** in **Catalog**.

   - In Catalog, select the catalog that you created previously.

   - In Provisioning, select the repository that you previously added and select the Terraform template that you want to deploy.

   - In Provisioning, select the **Cloud Type** and then select the **credential** to connect to the cloud.

   - In Provisioning, select the **Service Dialog** that you created previously. If you want to enter additional information when you run the task, **Service Dialog** must be selected. A dialog is required if **Display in Catalog** is chosen.

6. Click **Save**.

The catalog item that you created appears in the *All Service Catalog Items* list.

#### Run the Terraform Template:

Use the following steps to run the Terraform Template.

1. In the navigation bar, click **Service** > **Catalogs** > **Service Catalogs** > **created catalog**.

2. Click **Order** for the catalog item.

3. Enter any variables that are requested and click **Submit**.

{{ site.data.product.title_short }} takes you to the *Requests queue* page and displays the status of the job.

The service item details can be viewed when you navigate to **Services** > **My Services in {{ site.data.product.title_short }}**.

#### Retire the Terraform services

When Terraform provisioned service resources are no longer required, the resources can be retired. The retirement action initiates the Terraform backend to run the `destroy` command. This action destroys all the remote resources that are managed by the Terraform configuration.

Use the following steps to retire the service instance immediately:

1. In the navigation bar, click **Services**.
2. Click **My Services**.
3. Select the service instance that you want to retire.
4. Click **Lifecycle** > **Retire the Service**.

Use the following steps to set a retirement day and time for a service instance:

1. In the navigation bar, click **Services**.
2. Click **My Services**.
3. Click **Lifecycle** > **Set Retirement Dates for this Service**.
4. In **Enter Retirement Date as** field, select **Specific Date and Time** or **Time Delay from Now** to schedule the retirement.

   - To choose a **Specific Date and Time** for Retirement, click the **Retirement Date** to open the calendar:
      1. Select a **Retirement Date** by using the calendar control.
      2. Select a **Retirement Time** (in UTC) by using the arrows.

   - To retire by using a relative time, select **Time Delay from Now**:
      1. From **Time Delay**, specify a retirement time in the form of the number of months, weeks, days, or hours in the using the arrows.

5. Select a **Retirement Warning** if needed.
6. Click **Save**.

