## Creating a Service Dialog

Using a service dialog you can determine which options users get to change. When users access a
service, the majority of options available to them are preset and cannot be altered. A service
dialog exposes some of those options to the user so that even if they are ordering a basic RHEL 7
machine, for example, they can at least choose the amount of memory, virtual CPUs, or other options
available to the instance theyvorder. In cases where certain fields must be unique, such as the
name of virtual machines in Red Hat Virtualization, users must enter their own unique name for the
virtual machine they choose or the operation will fail, so this field must be exposed.

**Note:**

A service requires an assigned service dialog, regardless of exposing details to user. A simple
service dialog with a **Submit** and **Cancel** button is required at minimum.

A service dialog contains three components:

  - One or more **Tabs**.

  - Inside the tabs, one or more **Sections**. Note that in the previous method of creating a
    service dialog using the {{ site.data.product.title_short }} user interface, **Sections** were
    referred to as **Boxes**.

  - Inside the sections, one or more **Elements**. Elements are controls that accept input.
    Elements contain methods, like check boxes, drop-down lists or text fields, to fill in the
    options on the provisioning dialog.

<div class="important">

The names of the elements must correspond to the options used in the provisioning dialog.

</div>

The following procedure outlines how to create a service dialog for your sample service:

1.  Browse to menu: **Automation > Automate > Customization**.

2.  Click the **Service Dialogs** accordion.

3.  Click **Configuration**, and then ![1862](../images/1862.png)(**Add a new Dialog**).

4.  Enter basic information for your dialog under **General**:

    1.  Enter `Provision RHV VM` in **Dialog’s name**, and enter a description for the dialog in
        **Dialog’s description**.

5.  Add a new tab to the dialog:

    1.  Click ![1862](../images/1862.png)(**Create Tab**). Then, click the
        ![pencil](../images/1851.png)icon on the new tab to edit tab information.

    1.  Enter `General` in **Label**.

    2.  Optional: Enter a description for the tab in **Description**.

    3.  Click **Save**.

6.  Add a new section to the tab:

    1.  Click ![1862](../images/1862.png)(**Add Section**). Then, click the
        ![pencil](../images/1851.png)icon on the upper-right to edit section details.

    2.  Enter `Service and VM Name` in **Label**.

    3.  Optional: Enter a description for the section in **Description**.

    4.  Click **Save**.

7.  Add a **Text Box** element to the section for the service name:

    1.  From the list of elements on the left, click the **Text Box** element, then drag-and-drop
        it inside the section. Then, click the ![pencil](../images/1851.png)icon next to the
        element to edit its field details.

    1.  Enter `Service Name` in **Label**.

    2.  Enter `service_name` in **Name**.

    3.  Click **Options**, then select **String** from the **Value Type** list.

    4.  Click **Save**.

8.  Add a **Text Box** element to the section for the virtual machine name:

    1.  From the list of elements on the left, click the **Text Box** element, then drag-and-drop
        it inside the section. Then, click the ![pencil](../images/1851.png)icon next to the
        element to edit its field details.

    1.  Enter `VM Name` in **Label**.

    2.  Enter `vm_name` in **Name**.

    3.  Click **Options**, then select **String** from the **Value Type** list.

    4.  Click **Save**.

9.  Add a **Text Box** element to the section for the virtual machine description:

    1.  From the list of elements on the left, click the **Text Box** element, then drag-and-drop
        it inside the section. Then, click the ![pencil](../images/1851.png)icon next to the
        element to edit its field details.

    1.  Enter `VM Description` in **Label**.

    2.  Enter `vm_description` in **Name**.

    3.  Click **Options**, then select **String** from the **Value Type** list.

    4.  Click **Save**.

1.  Add a new section to the tab:

    1.  Click ![1862](../images/1862.png**)Add Section**. Then, click the
        ![pencil](../images/1851.png)icon on the upper-right to edit section details.

    1.  Enter `VM Characteristics` in **Label**.

    2.  Optional: Enter a description for the section in **Description**.

    3.  Click **Save**.

2.  Add a **Dropdown** element to the section for the number of CPUs:

    1.  From the list of elements on the left, click the **Dropdown** element, then drag-and-drop
        it inside the section. Then, click the ![pencil](../images/1851.png)icon next to the
        element to edit its field details.

    1.  Enter `Number of CPUs` in **Label**.

    2.  Enter `option_0_cores_per_socket` in **Name**.

    3.  Click **Options**. Next to **Entries**, click + to add individual entries for the values
        `1`, `2`, and `4`, and their description.

    1.  Click **Save**.

3.  Add a **Dropdown** element to the section for the virtual machine memory:

    1.  From the list of elements on the left, click the **Dropdown** element, then drag-and-drop
        it inside the section.

    1.  Click the ![pencil](../images/1851.png)icon next to the element to edit its field details.

    2.  Enter `VM Memory` in **Label**.

    3.  Enter `option_0_vm_memory` in **Name**.

    4.  Click **Options**. Next to **Entries**, click + to add individual entries for the values
        `1024`, `2048`, and `4096` and their description.

    1.  Click **Save**.

4.  Click **Save** to save the dialog.

Your service dialog is now added in the **Service Dialogs** accordion.
