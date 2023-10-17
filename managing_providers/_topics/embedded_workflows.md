## Embedded Workflows
{: #embedded_workflows}

*Embedded Workflows* provide the capability to simplify service catalog creation and improve the overall service catalog experience through a step-based automation system. Each step within a workflow runs a container to complete processes. Workflows are imported from GitHub repository content into {{ site.data.product.title_short }} where they are made available for users to run.

*Embedded Workflows* are an alternative to the *Embedded Automate* capability for authoring and running automation. With *Embedded Workflows*, you can continue to use the *Embedded Automate* feature for service catalog creation and management.

### Enabling Embedded Workflows

The Embedded Workflows functionality is not enabled and available by default. A user with administrator rights must enable the functionality by turning on a prototype flag. If you are an administrative user, you can complete the following steps to enable the functionality:

1. From the {{site.data.product.title_short }} UI, click **Settings** > **Applications Settings**. Then, click the **Advanced** tab.
2. On the *Advanced* tab, search for `ems_workflows` within the *Prototype* section. For the entry, set the `enabled` setting to `true`.
3. Click **Save**.
4. Restart the application.

When the application is restarted, the *Embedded Workflows* functionality is enabled. <!-- This functionality reuses existing API. -->

### Embedded Workflows UI additions

When the *Embedded Workflows* functionality is enabled, new **Automation** > **Embedded Workflows** pages become available for use in the UI. In addition to the *Embedded Workflows* UI, you can now select **Embedded Workflows** as a dropdown option along with **Embedded Automate** for various fields on other UI pages.

#### Embedded Workflow UI

The new *Embedded Workflows* functionality adds the following pages to the UI, which you can use to access and work with workflows. To view these pages, go to **Automation** > **Embedded Workflows** and select the page.

![Embedded Workflow UI](../images/embedworkflow_ui.png){: caption="Embedded Workflow UI" caption-side="bottom"}

- **Workflows**

   This UI page includes a summary of the available workflows. You can use different views to review the workflows:

   - Text view, which is the raw representation (JSON or YAML) of the Amazon State Languages (ASL) code.
   - Graph view, which shows an SVG visual representation of the workflow structure.

- **Repositories**

   This page lists, and provides a summary of, the added embedded workflow repositories. From this page, you can add, update, and remove repositories.
   When a repository is added and synchronized, any workflows that are found in the repository can be viewed on the **Workflows** UI page.

- **Credentials**

   Credentials are used by {{ site.data.product.title_short }} for authentication when running embedded workflows against machines, synchronizing with inventory sources, and importing project content from a version control system.

   This page lists, and provides a summary of, the credentials for accessing and using embedded workflows. From this page, you can add, update, and delete credentials.

   These credentials are tied to the provider instance, and are used by the workflow when it runs. The credential types are defined by the provider.

#### UI Field Updates
{: #field_updates}

Existing integration points are updated for the service catalog creation and management process to support choosing to use **Embedded Workflows** or **Embedded Automate**. This choice can be set when working with service catalog items and service dialogs.

* Service Dialog

   When creating a service dialog, fields that are dynamic now include the option for using **Embedded Workflows** or **Embedded Automate**.

   ![Service Dialog options](../images/embedworkflow_servicedialogdynamic.png){: caption="Service Dialog options" caption-side="bottom"}

* Service Catalog Items

   The provisioning, configuring, or retiring entry points now include the option for using **Embedded Workflows** or **Embedded Automate**.

   ![Entry Points options](../images/embedworkflow_entrypointsembedded.png){: caption="Entry Points options" caption-side="bottom"}

### Adding an Embedded Workflows Repository

As a starting point to begin authoring a workflow, you must first add the repository that includes your workflows.

To add a repository, complete the following steps:

1. Click  **Automation** > **Embedded Workflows** > **Repositories** > **Configuration** > **Add New Repository**.

   ![Add a repository](../images/embedworkflow_addnewrepository.png){: caption="Add a repository" caption-side="bottom"}

2. Enter *Name*, *Description*, and a *GitHub URL*.

3. Provide a Repository Name in the **Name** field.

4. Add a description for the repository in the **Description** field.

5. Add a **GitHub URL** for the repository.

6. Select the appropriate SCM (Source Control) credentials from the **SCM Credentials** dropdown menu. These are the credentials for how you access GitHub, and are used in different ways within embedded workflows.

7. Provide a branch name in the **SCM Branch** field for the branch that you want to pull.

8. Click **Save**. Upon saving, the repository is imported and scanned for any included workflows.

   ![Repository details](../images/embedworkflow_addnewrepository_details.png){: caption="Repository details" caption-side="bottom"}

9. Confirm that the synchronization with your repository is successful by viewing the list of workflows that are detected for the repository.

**Note:** If you are adding a repository that is not publicly available, add an SCM (source control) credential for accessing the repository. This credential is separate from the workflow credentials that you configure in the procedure for adding the repository. Source Control credentials have several attributes that can be configured:

   - **Username**: The username to use in conjunction with the source control system.
   - **Password**: The password to use in conjunction with the source control system.
   - **Private key passphrase**: If the SSH private key used is protected by a passphrase, you can configure a key passphrase for the private key.
   - **Private Key**: Copy or drag and drop the actual SSH Private Key to be used to authenticate the user to the source control system by using SSH.

### Viewing the List of Workflows in a Repository

When your repository is added, the repository shows in the *Repositories* list. You can now click the entry for the repository to open it so that you can scan for existing workflows.
If multiple workflows are found, click the corresponding number to view the list of workflows, **3** in this case.

   ![Repository workflows](../images/embedworkflow_workflownumbers.png){: caption="Repository workflows" caption-side="bottom"}

Alternatively, click **Automation** > **Embedded Workflows**. Then, click **Workflows** to see the workflows list.

### Refreshing Repositories

{{ site.data.product.title_short }} allows you to refresh a targeted repository or all repositories in your inventory to ensure that your workflows are current.

Refresh a targeted repository:

1.  Browse to the menu: **Automation** > **Embedded Workflows** > **Repositories**.

2.  Click a repository.

3.  Click **Configuration**, then ![Refresh this Repository](../images/2003.png) (**Refresh this Repository**).

Alternately, you can refresh some or all repositories from the list view:

1.  Browse to the menu: **Automation** > **Embedded Workflows** > **Repositories**.

2.  Check those repositories to refresh. Click **Check All** to select all repositories.

3.  Click **Configuration**, then ![Refresh Selected Workflow Repositories](../images/2003.png)(**Refresh Selected Workflow Repositories**).

### Adding Credentials

Credentials are used by {{ site.data.product.title_short }} for authentication when running embedded workflows against machines, synchronizing with inventory sources, and importing project content from a version control system.

{{ site.data.product.title_short }} can store credentials that are used by embedded workflows. Credentials saved in {{ site.data.product.title_short }} are matched and executed with a workflow when it runs.

1.  Browse to the menu: **Automation** > **Embedded Workflows** > **Credentials**.

2.  Click **Configuration**, then ![Add New Credential](../images/1862.png) (**Add New Credential**).

3.  Provide a **Name** for the credential.

4.  Select the **Credential Type**. More fields appear depending on the type chosen.

5.  Click **Add**.

#### Credential Types

Each credential type that is used by {{ site.data.product.title_short }} for embedded workflows is detailed in the following sections.

##### Machine

Machine credentials enable {{ site.data.product.title_short }} to invoke workflow steps on hosts under your management. You can specify the SSH username, and optionally provide a password, or an SSH key, or a key password. They define SSH and user-level privilege escalation access, and are used when running workflow steps on a remote host.

- **Username**: The username to be used for SSH authentication.

- **Password**: The actual password to be used for SSH authentication.

- **SSH Private Key**: Copy or drag-and-drop the SSH private key for the machine credential.

- **Private Key Passphrase**: If the SSH Private Key used is protected by a password, you can configure a Key Password for the private key.

- **Privilege Escalation**: Specifies the type of escalation privilege to assign to specific users. Options include **sudo**, **su**, **pbrun**, **pfexec**.

- **Privilege Escalation Username**: Enter the username to use with escalation privileges on the remote system.

- **Privilege Escalation Password**: Enter the actual password to be used to authenticate the user through the selected privilege escalation type on the remote system.

##### Network

Network credentials are used for networking modules to connect to and manage networking devices. Network credentials have several attributes that can be configured:

- **Username**: The username to use in conjunction with the network device.

- **Password**: The password to use in conjunction with the network device.

- **Authorize**: Select this from the Options field to add an Authorize password that signs the RSA key with a password.

- **Authorize password**: If **Authorize** is checked, enter a password in the **Authorize Password** field.

- **SSH Key**: Copy or drag-and-drop the actual SSH Private Key to be used to authenticate the user to the network by using SSH.

- **Private key passphrase**: The actual passphrase for the private key to be used to authenticate the user to the network by using SSH.

##### SCM

SCM (source control) credentials are used with Projects to clone and update local source code repositories from a remote revision control system such as Git, Subversion, or Mercurial. Source Control credentials have several attributes that can be configured:

- **Username**: The username to use in conjunction with the source control system.

- **Password**: The password to use in conjunction with the source control system.

- **Private key passphrase**: If the SSH private key used is protected by a passphrase, you can configure a key passphrase for the private key.

- **Private Key**: Copy or drag-and-drop the actual SSH Private Key to be used to authenticate the user to the source control system by using SSH.

##### Amazon

Selecting this credential type enables synchronization of cloud inventory with Amazon Web Services.

- **Access Key**: User credentials that allow for programmatic calls to Amazon Web Services.

- **Secret Key**: The secret key that corresponds to the user access key.

- **STS Token**: Token generated by Amazon Web Services Security Token Service.

##### Azure

Selecting this credential type enables synchronization of cloud inventory with Microsoft Azure. Microsoft Azure credentials have several attributes to configure:

- **Username**: The username to use to connect to the Microsoft Azure account.

- **Password**: The password to use to connect to the Microsoft Azure account.

- **Subscription ID**: The Subscription UUID for the Microsoft Azure account.

- **Tenant ID**: The Tenant ID for the Microsoft Azure account.

- **Client Secret**: The Client Secret for the Microsoft Azure account.

- **Client ID**: The Client ID for the Microsoft Azure account.

##### OpenStack

Selecting this credential type enables synchronization of cloud inventory with Red Hat OpenStack Platform. OpenStack credentials have several attributes that can be configured:

- **Username**: The username to use to connect to OpenStack.

- **Password (API Key)**: The password or API key to use to connect to OpenStack.

- **Host (Authentication URL)**: The host to be used for authentication.

- **Project (Tenant Name)**: The Tenant name or Tenant ID used for OpenStack. This value is usually the same as the username.

- **Domain name**: The FQDN to be used to connect to OpenStack.

##### Red Hat Virtualization

Selecting this credential type enables synchronization of cloud inventory with Red Hat Virtualization. Red Hat Virtualization credentials have several attributes that can be configured:

- **Username**: The username to use to connect to Red Hat Virtualization.

- **Password**: The password to use to connect to Red Hat Virtualization.

- **Host (Authentication URL)**: The host to be used for authentication.

   **Important**: Enter in **Host** the Red Hat Virtualization provider URL, followed by the path `/ovirt_engine/api`. Example: `https://your.rhv.com/ovirt_engine/api`

##### VMware

Selecting this credential type enables synchronization of inventory with VMware vCenter.

**Important:** If both {{ site.data.product.title_short }} and a VMware provider are located in the same IPv6-only network, use a DNS-resolvable hostname for the VMware provider in the **vCenter Host** field when adding credentials.

VMware credentials have several attributes that can be configured:

- **Username**: The username to use to connect to vCenter.

- **Password**: The password to use to connect to vCenter.

- **vCenter Host**: The vCenter hostname or IP address to connect to.

**Note:** If the VMware guest tools are not running on the instance, VMware inventory sync might not return an IP address for that instance.

### Authoring a workflow

When the *Embedded Workflows* feature is enabled, you can configure workflows for use in the following areas during service catalog creation:

- **Dynamic dialog fields** - You (or your users) can attach workflows to a field so that the field becomes populated or refreshed with the results from the running of the workflow.
- **Service Entry Points** - You (or your users) can set and use workflows for provisioning, reconfiguring, and retiring services.

The Automate model provides flexibility to not only change parts of the provisioning process, but also to allow you to automate other operational tasks. You can create and use your own embedded workflows as needed to automate your operational tasks.

Workflows must be authored in Amazon State Languages (ASL) format. As part of authoring a workflow, you (or your users) must build and support the containers that are run during each step of an embedded workflow.

1. Define the code for the workflow. If your workflow requires the use of any credentials or parameters to be specified, ensure that they are passed in the code.

   The workflow code must be in the Amazon States Language (ASL) format and follow its supported specifications. For more information about Amazon States Language and its specification, see [Amazon States Language Guide](https://states-language.net/).

   Within the workflow code, you need to specify the states that your workflow requires, including any next steps. For each of the steps in the workflow, a docker container is called. The container defines what happens for that state. For example, a docker container can run to clone a template.

2. Build the docker containers that are required for the workflow.

#### Example: Provisioning Workflow

```asl
{
  "Comment": "Provision a VMware VM.",
  "StartAt": "CloneTemplate",
  "States": {
    "CloneTemplate": {
      "Type": "Task",
      "Resource": "docker://docker.io/agrare/clone-template:latest",
      "Next": "CheckTaskComplete",
      "Credentials": {
        "api_user.$": "$.api_user",
        "api_password.$": "$.api_password",
        "vcenter_user.$": "$.vcenter_user",
        "vcenter_password.$": "$.vcenter_password"
      },
      "Parameters": {
        "PROVIDER_ID.$": "$.dialog_provider",
        "VERIFY_SSL": false,
        "TEMPLATE.$": "$.dialog_source_template",
        "NAME.$": "$.dialog_vm_name"
      }
    },

    "CheckTaskComplete": {
      "Type": "Task",
      "Resource": "docker://docker.io/agrare/check-task-complete:latest",
      "Next": "PollTaskComplete",
      "Credentials": {
        "vcenter_user.$": "$.vcenter_user",
        "vcenter_password.$": "$.vcenter_password"
      },
      "Parameters": {
        "VCENTER_HOST.$": "$.vcenter_host",
        "TASK.$": "$.task"
      }
    },

    "PollTaskComplete": {
      "Type": "Choice",
      "Choices": [
        {
          "Variable": "$.state",
          "StringEquals": "success",
          "Next": "PowerOnVM"
        },
        {
          "Variable": "$.state",
          "StringEquals": "running",
          "Next": "RetryState"
        },
        {
          "Variable": "$.state",
          "StringEquals": "error",
          "Next": "FailState"
        }
      ],
      "Default": "FailState"
    },

    "RetryState": {
      "Type": "Wait",
      "Seconds": 5,
      "Next": "CheckTaskComplete"
    },

    "PowerOnVM": {
      "Type": "Task",
      "Resource": "docker://docker.io/agrare/power-on-vm:latest",
      "Next": "SuccessState",
      "Credentials": {
        "vcenter_user.$": "$.vcenter_user",
        "vcenter_password.$": "$.vcenter_password"
      },
      "Parameters": {
        "VCENTER_HOST.$": "$.vcenter_host",
        "VM.$": "$.vm"
      }
    },

    "FailState": {
      "Type": "Fail",
      "Error": "FailStateError",
      "Cause": "No Matches!"
    },

    "SuccessState": {
      "Type": "Succeed"
    }
  }
}
```

### Viewing workflow details

When workflows are available, you can view the details for each workflow, such as to verify the payload. To view the details for a workflow:

1. Click **Automation** > **Embedded Workflows**. Then, click **Workflows** to see the workflows list.

2. Click a workflow. The default *Text* view of the workflow opens where you see the code content.

   ![Text view](../images/embedworkflow_textview.png){: caption="Text view" caption-side="bottom"}

   Alternatively, click the **Graph** tab to see a graph of the same data.

   ![Graph view](../images/embedworkflow_graphView.png){: caption="Graph view" caption-side="bottom"}

3. If your workflow has credential fields, then create a workflow credential for each of the fields. Then, map the workflow credential to the workflow.
   <!-- Add substeps from development - A.G to provide.-->

### Creating a Service Dialog using an Embedded Workflow

With Embedded Workflows enabled, fields that are *Dynamic* offer the choice of *Embedded Workflows* in addition to the original *Embedded Automate*.

Dialogs are the part of {{ site.data.product.title_short }} that you interface with when you order services.

1. To open a service dialog, click **Automation** > **Embedded Automate** > **Customization**.
2. From the *Service Dialog* section, review the list of created dialogs. Click one of the dialogs to view the details.
3. Click **Edit the dialog**. You can edit the *Name*, *Provider*, and *Template*.

   When you select to edit any of the dropdown settings, you can see a *dynamic* option. Toggle to **On** to make sure it is enabled.

4. Click the **Options** tab. You can now select between *Embedded Automate* and *Embedded Workflows* in the Automation field.

   ![Dialog Dynamic](../images/embedworkflow_servicedialogdynamic.png){: caption="Dialog Dynamic" caption-side="bottom"}

   If you choose **Embedded Workflows**, you can select the workflow to run. Complete the fields, such as *Template* (using drag and drop functionality) and click **Save** when you complete the form. The workflow now runs and refreshes the fields with data from the workflow. In this way fields are chained together. When you *order* a service catalog, the workflow runs in the background to refresh the template.

### Creating Service Catalog Items using an Embedded Workflow

You can create a generic service catalog item that uses a created dynamic dialog and an embedded workflow. To use previously set up workflows and to view a service catalog item, you need to *order* the item. Complete the following steps to order a service catalog item that uses embedded workflows:

1. Click **Services** > **Catalogs**.
2. The *Service Catalogs* section opens and you see the existing Service Catalogs. If you want to order one, click it and then **Order**.

   ![Service Dialog Dynamic](../images/embedworkflow_orderservicecatalog.png){: caption="Service Dialog Dynamic" caption-side="bottom"}

   Ensure that the *VM Name*, *Provider* and *Template* fields are correct, and then click **Submit**.

3. If you want to know more about the item first or to edit it, click the **Catalogs** section, and then click that item that is created. Click **Configuration** > **Edit this item**. For instance, one area that you can edit is the three service entry point fields. One field is for *Provisioning*, one for *Reconfiguring* and one for *Retirement*. You can now set these fields to *Embedded Workflows* instead of *Embedded Automate*. You can set the point field to the workflow that you want to use for any, or all, of the three service entry points.

   ![Entry Points Dynamic](../images/embedworkflow_entrypointsembedded.png){: caption="Entry Points Dynamic" caption-side="bottom"}

4. When you complete all your edits, click **Save**.
5. Confirm that you can order the service catalog item and that it runs the workflows to drive the dynamic dialog dropdown.

<!--
##### Add docker images to a podified deployment and appliances (workflow registries)

-->
