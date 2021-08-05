<div class="important">

Execution of SmartState Analysis on virtual machines within a VMware environment requires the Virtual Disk Development Kit (VDDK). This version of {{ site.data.product.title_short }} supports VDDK versions 6.0, 6.5, and 6.7.

</div>

To install VMware VDDK:

1. Download the required VDDK version (`VMware-vix-disklib-[version].x86_64.tar.gz`) from the VMware website.

    **Note:**

    - If you do not already have a login ID to VMware, then you will need to create one. At the time of this writing, the file can be found by browsing to menu: **Downloads > vSphere**. Select the version from the drop-down list, then click the **Drivers & Tools** tab. Expand **Automation Tools and SDKs**, and click**Go to Downloads** next to the **VMware vSphere Virtual Disk Development Kit** version. Alternatively, find the file by searching for it using the **Search** on the VMware site.

    - See VMware documentation for information about their policy concerning backward and forward compatibility for VDDK.

2. Download and copy the `VMware-vix-disklib-[version].x86_64.tar.gz` file to the `/root` directory of the appliance.

3. Start an SSH session into the appliance.

4. Extract and install the `VMware-vix-disklib-[version].x86_64.tar.gz` file using the following commands:

        # cd /root
        # tar -xvf VMware-vix-disklib-[version].x86_64.tar.gz
        # cp vmware-vix-disklib-distrib/ -rf /usr/lib/vmware-vix-disklib/
        # ln -s /usr/lib/vmware-vix-disklib/lib64/libvixDiskLib.so /usr/lib/libvixDiskLib.so
        # ln -s /usr/lib/vmware-vix-disklib/lib64/libvixDiskLib.so.6 /usr/lib/libvixDiskLib.so.6
        # ln -s /usr/lib/vmware-vix-disklib/lib64/libvixDiskLib.so.6.7.0 /usr/lib/libvixDiskLib.so.6.7.0

5. Run `ldconfig` to instruct {{ site.data.product.title_short }} to find the newly installed VDDK library.

    **Note:**

    Use the following command to verify the VDDK files are listed and accessible to the appliance:

        # ldconfig -p | grep vix

6. Restart the {{ site.data.product.title_short }} appliance.

The VDDK is now installed on the {{ site.data.product.title_short }} appliance. This enables use of the SmartState Analysis server role on the appliance.
