# SmartState Analysis on Red Hat Enterprise Virtualization Manager 3.0 - Storage Support Notes

There are two additional steps required to perform a SmartState Analysis
on Red Hat Enterprise Virtualization Manager 3.0 using `iSCSI` or `FCP`
storage. NFS storage does not have these requirements.

1.  Enable `DirectLUN` support for the host and {{ site.data.product.title }}
    appliance that performs the analysis.

      - Enable `DirectLUN` on host.

      - Enable `DirectLUN` on the {{ site.data.product.title }} appliance. To do this,
        edit the desired Red Hat Enterprise Virtualization storage and
        get the `LUNID` value. Then, on the {{ site.data.product.title }} appliance
        virtual machine in the Red Hat Enterprise Virtualization user
        interface, right-click and select menu:Edit\[Custom Properties\]
        and enter the following in the **Custom Properties** edit box:

            directlun=<LUN ID>:readonly

        If you have multiple storage domains, separate them by a comma,
        similar to:

            directlun=<LUN ID 1>:readonly,<LUN ID 2>:readonly,<LUN ID N>:readonly

        <div class="note">

        The {{ site.data.product.title }} appliance must reside in the same data
        center as the storage you are trying to connect. If you have
        multiple data centers with `iSCSI` or `FCP` storage, you need a
        {{ site.data.product.title }} appliance in each data center to support virtual
        machine scanning.

        </div>

2.  **Set Server Relationship** - This is required to allow the virtual
    machine SmartState analysis job to determine which data center a
    {{ site.data.product.title }} appliance is running and therefore identify what
    storage it has access to in a Red Hat Enterprise Virtualization
    environment.

    1.  After setting up a {{ site.data.product.title }} appliance and performing a
        refresh of the Provider, find the {{ site.data.product.title }} appliance in
        the **Virtual Machine** accordion list and view its summary
        screen.

    2.  Click ![1847](../images/1847.png) (**Configuration**), and then
        ![2146](../images/2146.png)(**Edit Server Relationship**).

    3.  Select the server that relates to this instance of the
        {{ site.data.product.title }} appliance.
