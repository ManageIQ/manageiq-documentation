# Example: Using Amazon CloudFormation Template for Service Provisioning

Cloud orchestration is a service that allows you to create, update, and
manage cloud resources and their software components as a single unit
and then deploy them in an automated, repeatable way through a template.
The deployed instances and associated collection of resources are
referred to as stack. {{ site.data.product.title_short }} supports Amazon
CloudFormation orchestration templates that make deploying complex
services easier in the cloud.

# Creating an Orchestration Template

Complete the following procedure to add new orchestration templates.

1.  Navigate to **Services > Catalogs** and select **Orchestration
    Templates** in the accordion menu.

2.  Click ![Configuration](../images/1847.png) **Configuration**, then
    click ![Green\_Plus\_Sign](../images/1848.png) **Create a new
    Orchestration Template**.

3.  Enter a **Name** and **Description** for your template.

4.  Select **Amazon CloudFormation** from the **Template Type** list.

5.  Select **Draft** to create a draft template.

6.  Add your template in the area below for the selected **Template
    Type**. You can author your own stack template, or you can copy and
    paste from an existing text file.

7.  Click **Add**.

You can add this template as a catalog item to a service catalog. Stacks
can then be created from templates and launched from the service catalog
using a service dialog.

# Creating a Service Dialog from an Orchestration Template

Complete the following procedure to create a service dialog based on the
input parameters defined in the orchestration template.

1.  Navigate to **Services > Catalogs** and click **Orchestration
    Templates** in the accordion menu.

2.  Expand **All Orchestration Templates**, then click the orchestration
    template you created using the above procedure, that you want to
    create a service dialog from.

3.  Click ![Configuration](../images/1847.png)**Configuration**, then
    click ![Green\_Plus\_Sign](../images/1848.png)**Create Service Dialog
    from Orchestration Template**.

4.  Enter a name for the service dialog in **Service Dialog Name**.

5.  Click **Save**.

# Creating a Catalog

Complete the following procedure to create a new catalog.

1.  Navigate to **Services > Catalogs** and select **Catalogs** in the
    accordion menu.

2.  Click ![Configuration](../images/1847.png) **Configuration**, then
    click ![Green\_Plus\_Sign](../images/1848.png) **Add a New Catalog**.

3.  In **Basic Info**, add **Name** and **Description** for the new
    catalog.

4.  You can assign catalog items in **Assign Catalog Item**.

5.  Click **Add**.

# Creating an Orchestration Catalog Item

Complete the following procedure to create a new orchestration catalog
item.

1.  Navigate to **Services > Catalogs** and select **Catalog Items**
    in the accordion menu.

2.  Click ![Configuration](../images/1847.png) **Configuration**, then
    click ![Green\_Plus\_Sign](../images/1848.png) **Add a New Catalog
    Item**.

3.  Select **Orchestration** from the **Catalog Item Type** list.

4.  Enter the basic details in the **Basic Info**:

    1.  Enter a **Name** and **Description** for the new service catalog
        item.

    2.  Select **Display in Catalog** box.

    3.  Select the appropriate catalog from the **Catalog** list.

    4.  Select the appropriate dialog from the **Dialog** list.

    5.  Select the orchestration template from the **Orchestration
        Template** list.

5.  Click **Add**.

# Ordering a Service

Complete the following procedure to order your catalog item from the
service catalog.

1.  Navigate to **Services > Catalogs** and select **Service
    Catalogs** in the accordion menu.

2.  Expand **All Services**, then click the catalog item you want to
    order from the service catalog.

3.  Click **Order**. You will see the **Order Service** window with
    **Options** and **Parameters**.

4.  Enter the name of the stack in **Stack Name**.

5.  Select the value of **On Failure** if stack creation fails. The
    default is **Rollback**.

6.  Optionally, enter **Timeout** in minutes.

7.  Set the remaining parameters as needed that will vary depending on
    the dialog.

8.  Click **Submit**.

The provisioning service request is submitted. Once a request has been
approved, the various stages of fulfillment will be processed. You can
monitor the request status and other details in
**Services > Requests**.

# Orchestration Stacks

1.  Once the status of the provisioning request in
    **Services > Requests** is **Finished**, click
    **Compute > Clouds > Stacks** to see the newly deployed stack.

2.  Click the stack to see a summary of its properties, resources, among
    other details including the running instances that are part of the
    stack. ![Catalog\_Item\_State](../images/7180.png)
    ![Stack\_Summary](../images/7181.png)

You have now deployed instances and associated collection of resources
(referred to as a stack) using an orchestration template.
