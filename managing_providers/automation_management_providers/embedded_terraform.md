---
---

# Embedded Terraform

OpenTofu is an open source infrastructure as code tool, which can be used to build, change, and version the infrastructure. You can use OpenTofu to define infrastructure resources in human-readable configuration files that you can use to version, reuse, and share.

OpenTofu is built into {{ site.data.product.title_short }} so you do not need to install any additional components.

If you want to use the Embedded Terraform feature in {{ site.data.product.title_short }} that is deployed as a virtual machine appliance, then you need to manually import the Terraform image on an appliance:

## Importing OpenTofu image on an appliance

**Note**: Follow this section if you have {{ site.data.product.title_short }} that is deployed as a virtual appliance. These steps are not applicable to a containerized deployment (podified) of {{ site.data.product.title_short }}.

Use the following command to import the OpenTofu image on your appliance server.

``` bash
{{ site.data.product.import_opentofu }}
```

Where `{{ site.data.product.opentofu_image_name }}` is the name of your OpenTofu image.

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

   - In Provisioning, if you want to enter additional information when you run the task, **Service Catalog** must be selected. A dialog is required if **Display in Catalog** is chosen.

   - In Provisioning, you have two options to create a Service Dialog:

     * **Use Existing**: When you select **Use Existing** option, you can select the Service Dialog that you previously created.
     * **Create new**: When you select **Create new** option, you can create a new Service Dialog by providing a name. When the catalog item is saved, the new Service Dialog is created with section for **Terraform Template Variables**. The **Terraform Template Variables** section contains the text box inputs for each of the input variables from the Terraform Template. To modify the dialog, navigate to **Automation** > **Automate** > **Customization** > **Service Dialogs**, select **Service Dialog**, and from the Configuration menu, select **Edit this dialog** to make the required changes.
     * **Create new**: When you select **Create new** option, you can create a new Service Dialog by providing a name. When the catalog item is saved, the new Service Dialog is created with section for **Terraform Template Variables**. The **Terraform Template Variables** section contains input fields for each of the input variables from the Terraform Template. Under the **Terraform Template Variables** section, the boolean field displays as a checkbox. Number field displays as a textbox with regex validation for the number value. JSON fields display as multi-line text area field, with JSON value prettified. String fields display as single line textbox fields.

     To modify the dialog, navigate to **Automation** > **Automate** > **Customization** > **Service Dialogs**, select **Service Dialog**, and from the Configuration menu, select **Edit this dialog** to make the required changes.

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
