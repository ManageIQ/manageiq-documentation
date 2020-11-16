## My Services Tab

The **My Services** tab lists all service requests individually with a summary of information associated with each service, including the **Service Name**, its current **Power State** represented by an icon, **Number of VMs**, **Owner**, date **Created**, and **Retires** date. Additionally, you can see the chargeback cost per service for a virtual machine’s month-to-date usage. You can filter or sort services by those entities, and by **Relative Cost**.

On the same screen, you have the option to edit the service name and description, edit tags, set ownership, retire the service now or at a later date, or remove the service by clicking more options *(represented by three dots)* next to the service. You also have options to perform power operations, that is start, stop, or suspend, at the service level. You can choose to click on a service where you can perform all of these actions at the service level using the designated buttons located at the top of the screen, as well as access the virtual machine dashboard, manage snapshots, and open the virtual machine and web console from under the **Resources** section. You can also control power operations and life cycle of virtual machine resources via more options
*(represented by three dots)*.

![ssui my services](../images/ssui-my-services.png)

![ssui my service details](../images/ssui-my-service-details.png)

**Virtual Machine Dashboard:.**

From the **My Services** screen, click on a service and then on the virtual machine name or **View Details** under more options *(represented by three dots)* to access the virtual machine dashboard.
The dashboard displays the following information about the virtual machine resource:

  - Compliance

  - Retirement

  - Snapshots

  - Timeline of power events

  - Utilization of CPU, Memory, and Storage

  - Smart State analysis

  - Tags

  - Custom attributes

  - Disk usage

Additionally, you can also control the virtual machine power operations, and manage snapshots from the dashboard. A snapshot is a copy of the virtual machine’s disk file (VMDK) that captures the entire state of the
virtual machine at a point in time.

### Setting a Retirement Date for a Service

Follow this procedure to schedule retirement for a service at a later date. For retiring a service immediately, see [Retiring a Service](#retiring-service).

1.  From the **Services** screen, click on the required service you want to schedule retirement for.

2.  Click the ![Service Retire Button](../images/ssui-retirement-button.png) button located on the
    upper-right corner of the screen, then select **Set Retirement Dates**. The **Schedule Service Retirement** window will appear. ![ssui schedule service retirement](../images/ssui-schedule-service-retirement.png)

3.  Set the **Retirement Date**.

4.  Select the **Retirement Warning** from the list.

5.  Click **Save**.

### Retiring a Service

Follow this procedure to retire a service immediately. For retiring a service at a later date, see [Setting a Retirement Date for a Service](#schedule-retirement).

1.  From the **Services** screen, click on the service you want to retire now.

2.  Click the ![Service Retire Button](../images/ssui-retirement-button.png) button located on the
    upper right corner of the screen, then select **Retire**. The **Retire Service Now** window will appear to confirm your action.
    ![ssui retire service now](../images/ssui-retire-service-now.png)

3.  Click **Yes, Retire Service Now**.

### Setting Ownership of a Service

Follow this procedure to set ownership of a service.

1.  From the **Services** screen, click on the more options button next to the service you want set ownership for, then click **Set Ownership**. Alternatively, click on the service. Click the ![ssui service settings button](../images/ssui-service-settings-button.png)
    button located on the upper-right corner of the screen, then select **Set Ownership**. ![ssui set service ownership](../images/ssui-set-service-ownership.png)

2.  Select an owner from the list.

3.  Select a group from the list.

4.  Click **Save**.

### Adding and Editing Tags

Follow this procedure to add or edit tags for a service.

1.  From the **Services** screen, click on more options next to the service you want add or edit tags for, then click **Edit Tags**. Alternatively, click on the service. Click the ![ssui edit tags button](../images/ssui-edit-tags-button.png) button located on the
    upper-right corner of the screen, then select **Edit Tags**. ![ssui add edit tags](../images/ssui-add-edit-tags.png)

2.  To add a tag, select the tag category and value from the lists, then click the blue plus (+) sign as shown in the screen capture.

3.  To edit tags, simply change the value assigned to a category, or click on the cross sign in the tag to delete an existing tag.

4.  Click **Save**.

### Removing a Service

Follow this procedure to remove a service.

1.  From the **Services** screen, click on more options next to the service you want to remove, then click **Remove**. Alternatively, click on the service. Click the ![ssui service settings button](../images/ssui-service-settings-button.png) button located on the upper-right corner of the screen, then select **Remove**. A confirmation window appears.

2.  Click **Yes, Remove Service**.

### Editing a Service

Follow this procedure to edit the name and description of a service.

1.  From the **My Services** screen, click on more options next to the service you want to edit, then click **Edit**. Alternatively, click on the service. Click the ![ssui service settings button](../images/ssui-service-settings-button.png) button located on the upper-right corner of the screen, then select **Edit**. An **Edit Service** screen appears.

2.  Edit the name and description of the service as required. ![ssui edit service](../images/ssui-edit-service.png)

3.  Click **Save**.

### Controlling Virtual Machine Power States

Follow this procedure to perform power operations on virtual machines, such as start, stop, or suspend, depending on the current state of the virtual machine.

1.  From the **My Services** screen, click on the required service.

2.  Under **Resources**, click more options *(represented by three dots)* where you have the option to start, stop, or suspend the virtual machine. Alternatively, click on the virtual machine name to see more details about the resource, including the **Power Operations** button.

### Creating Virtual Machine Snapshots

To create a snapshot from the Services screen:

1.  From the **My Services** screen, click on the service associated with the virtual machine you want to create a snapshot for.

2.  In **Resources**, click **Snapshots** next to the virtual machine you want to create a snapshot for, then select **Create** to create a snapshot. The **Create Snapshot** window appears.

3.  Enter a name for the snapshot.

4.  Optional: Select **Memory** if you want to capture the state of the virtual machine’s memory.

5.  Optional: Enter a **Description**.

6.  Click **Create**.

To create a snapshot from the Resources screen:

1. From the **My Services** screen, click on the service associated with the virtual machine you want to create a snapshot for.

2. In **Resources**, click on the virtual machine you want to create a snapshot for.

3. On the virtual machine dashboard, click the **Snapshots** button, then select **Create**. The **Create Snapshot** window appears.

4. Enter a name for the snapshot.

5. Optional: Select **Memory** if you want to capture the state of the virtual machine’s memory.

6. Optional: Enter a **Description**.

7. Click **Create**.

### Viewing Virtual Machine Snapshots

1. From the **My Services** screen, click on the service associated with the virtual machine you want to view snapshots for.

2. In **Resources**, click **Snapshots** next to the virtual machine and select **View** to view available snapshots. Alternatively, click on the virtual machine, then click **Snapshots** to view available snapshots.

**Note:**

You can revert or delete a snapshot only from the snapshot summary screen. To do so, navigate to **Snapshots** \> **View**, click more options *(represented by three dots)* next to the snapshot you want to revert or delete, and then click **Revert** or **Delete** as required.
Revert returns a virtual machine to a previous state when you took the snapshot.

### Accessing the Virtual Machine Console

Follow this procedure to open a console window to the virtual machine. The console is the remote control system that enables you to interact directly with your virtual machines.

1. From the **Services** screen, click on the required service.

2. In **Resources**, click the ![Access Button](../images/ssui-access-button.png) button next to the virtual
    machine and select **VM Console**.

The virtual machine console will open in a new window of your web browser. Note that you may have to enable the pop-up settings in your browser to access the console.

### Web Console (Cockpit) Integration

The Web console (Cockpit) is an interactive Linux server administrative interface. You can perform simple administration tasks such as starting
containers, storage administration, network configuration, and inspecting logs. While Cockpit allows you to monitor and administer several servers at the same time, your browser connects to a primary server that runs the Cockpit web service through which connections to
additional servers can be established.

The {{ site.data.product.title }} full administrative user interface and the Self Service user interface have enabled for users to access the Web console
(Cockpit interface) for a given virtual machine.

#### Accessing the Web Console

**Note:**

Launching of Cockpit requires as IP address for the virtual machine. It must be pre-configured and running on the virtual machine.

You can open the Web console (Cockpit) for a virtual machine from the ![Access Button](../images/ssui-access-button.png) button.

1. From the **My Services** screen, click on the service associated with the virtual machine you want to open the Web console for.

2. In **Resources**, click **Access** next to the virtual machine and select **Web Console**. A notification will appear to show the Cockpit interface is loading.

3. The Cockpit interface for the virtual machine will open in a new browser window. If you get a security warning by the browser, you will need to add this connection to the security exceptions. Click **Advanced → Add Exception → Confirm Security Exception**. After that, you will see the login screen. ![Cockpit Login](../images/cockpit-login-nb.png)

4. Once you have logged in, you will see the tabs for the dashboard and the individual machines added to Cockpit. ![Cockpit UI](../images/cockpit-ui-nb.png)
