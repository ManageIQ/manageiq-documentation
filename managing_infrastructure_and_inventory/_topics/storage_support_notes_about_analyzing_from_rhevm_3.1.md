# SmartState Analysis on Red Hat Enterprise Virtualization Manager 3.1 and Above - Storage Support Notes

Note the following requirements when performing SmartState Analysis on
Red Hat Enterprise Virtualization Manager 3.1 and above.

  - NFS

      - The {{ site.data.product.title_short }} appliance requires a mount to the NFS
        datastore.

  - iSCSI / FCP

      - For Red Hat Enterprise Virtualization 3.1 and 3.2, clusters must
        use full Red Hat Enterprise Linux hosts and not Red Hat
        Enterprise Virtualization Hypervisor hosts. You can use either
        type of host in Red Hat Enterprise Virtualization 3.3 and above.

      - Each {{ site.data.product.title_short }} appliance performing SmartState Analysis
        requires sharable, non-bootable DirectLUN access to each
        attached iSCSI/FCP storage domain. In order to perform smart
        analysis, the appliance must mount the data storage as a
        DirectLUN disk.

      - A {{ site.data.product.title_short }} appliance **must** reside in each datacenter
        with the iSCSI / FCP storage type.

  - Other Notes

      - The **Edit Management Engine Relationship** option enables the
        VM SmartState Analysis job to determine the datacenter where a
        {{ site.data.product.title_short }} appliance is running and thus to identify what
        storage it has access to in a Red Hat Enterprise Virtualization
        environment.

          - After setting up a {{ site.data.product.title_short }} appliance and performing
            a refresh of the provider, find the {{ site.data.product.title_short }}
            appliance in the **Virtual Machine** accordion list and view
            its summary screen.

          - Click menu: **Configuration > Edit Management Engine Relationship**.

          - Select the server that relates to this instance of the
            {{ site.data.product.title_short }} appliance.

<div class="important">

If you attach a DirectLUN disk after configuring the {{ site.data.product.title_short }}
database, access the appliance in a terminal and run `pvscan` to detect
the DirectLUN disk. Alternatively, in {{ site.data.product.title_short }} 5.2.1 and above,
you can restart the appliance to detect the disk automatically.

</div>
