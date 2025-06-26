---
---

# Terraform Enterprise

Terraform Enterprise (also known as HCP Terraform) is an application that helps teams use Terraform together. It manages Terraform runs in a consistent and reliable environment, and includes easy access to shared state and secret data, access controls for approving changes to infrastructure, a private registry for sharing Terraform modules, detailed policy controls for governing the contents of Terraform configurations, and more.

HCP Terraform can be added to {{ site.data.product.title_short }} and Workspaces can be collected and used in the {{ site.data.product.title_short }} Service Catalog.

### Adding a Terraform Enterprise Provider

In order to integrate with Terraform Enterprise you must first add it as a provider.

1. Browse to menu: **Automation > Providers** and under **Configuration**, click ![Add a new Provider](../../images/1862.png) **Add a new Provider**.

2. Select **Terraform Enterprise** as the **Type**

3. Enter a **Name** for the new provider.

4. Add a **Zone** for the provider.

5. If you are using Terraform Enterprise enter the URL of your Terraform Enterprise self-hosted instance.  If you are using HCP Terraform then leave the URL as `https://app.terraform.io`

6. Select the appropriate **SSL Verification** option

7. Add the API Token that you would like to use in the **API Token** section.

8. Click **Validate** to verify credentials.

9. Click **Add**.

### Viewing Terraform Enterprise Workspaces

Workspaces represent infrastructure managed by Terraform.  They are collected in inventory as Automation Templates (Configuration Scripts) in {{ site.data.product.title_short }}

1. Browse to menu: **Automation > Templates** to display a list of Terraform Enterprise Workspaces.

2. Select a specific Terraform Enterprise Workspace to view additional details.

### Viewing Terraform Enterprise Runs

A run performs a plan and apply, using a configuration version and the workspace’s current variables.  To view runs in {{ site.data.product.title_short }}:

1. Browse to menu: **Automation > Jobs** to display a list of Terraform Enterprise runs.

2. Select a specific Terraform Enterprise Run to view additional details.


### Execute a Terraform Enterprise Workspace from a Service Catalog

You can plan and apply a Terraform Enterprise Workspace from {{ site.data.product.title_short }} by creating a service catalog item.

First, create a catalog:

1. Browse to menu: **Services > Catalogs** and click **Catalogs**.

2. Click **Configuration**, then ![Add a New Catalog](../../images/1862.png) (**Add a New Catalog**)

3. Enter a **Name** and **Description** for the catalog.

4. Click **Add**.

Next create a Terraform Enterprise Service Catalog Item:

1. Browse to menu: **Services > Catalogs** and click **Catalog Items**.

2. Click **Configuration**, then ![Add a New Catalog Item](../../images/1862.png) (**Add a New Catalog Item**) to create a new catalog item with the following details, at minimum:

   - For **Catalog Item type**, select **Terraform Enterprise**.

   - Enter a **Name** for the service catalog item.

   - Select **Display in Catalog**.

   - In **Catalog**, select the catalog you created previously.

   - In **Dialog**, select a service dialog you created previously.  To ask the user to enter extra information when running the task, **Service Dialog** must be selected. A dialog is required if **Display in Catalog** is chosen.

   - In **Provider**, select your Terraform Enterprise provider. This brings up the **Terraform Template** option where you can select which Terraform Workspace you want to use.

   - Add configuration information for **Reconfigure Entry Point** and **Retirement Entry Point** as applicable.

   - Select your desired **Terraform Template** from the list.

3. Click **Add**. The catalog item you created will appear in the **All Service Catalog Items** list.

To execute the Terraform Enterprise job:

1. Browse to menu: **Service > Catalogs** and click on **Service Catalogs** then click **Terraform Enterprise catalog**.

   ![order at catalog item](../../images/order_at_catalog_item.png)

2. Click **Order** for the catalog item.

3. Enter any variables requested and click **Submit**.

{{ site.data.product.title_short }} takes you to the **Requests** queue page and show the status of the job.

The service item’s details can be viewed in menu: **Services > My Services** in {{ site.data.product.title_short }}.
