# Installing VMware VDDK on {{ site.data.product.title }}

Execution of SmartState Analysis on virtual machines within a VMware
environment requires the Virtual Disk Development Kit (VDDK).
{{ site.data.product.title }} supports VDDK 5.5.

1.  Download VDDK 5.5 (`VMware-vix-disklib-5.5.0-1284542.x86_64.tar.gz`
    at the time of this writing) from the VMware website.

    <div class="note">

    If you do not already have a login ID to VMware, then you will need
    to create one. At the time of this writing, the file can be found by
    navigating to menu:Downloads\[All Downloads, Drivers & Tools \>
    VMware vSphere \> Drivers & Tools\]. Expand **Automation Tools and
    SDKs**, and select **vSphere Virtual Disk Development Kit 5.5**.
    Alternatively, find the file by searching for it using the *Search*
    on the VMware site.

    </div>

2.  Download and copy the
    `VMware-vix-disklib-5.5.0-1284542.x86_64.tar.gz` file to the `/root`
    directory of the appliance.

3.  Start an `SSH` session into the appliance.

4.  Extract and install `VDDK 5.5`. using the following commands:

        # cd /root
        # tar -xvf VMware-vix-disklib-5.5.0-1284542.x86_64.tar.gz
        # cd vmware-vix-disklib-distrib
        # ./vmware-install.pl

5.  Accept the defaults during the installation.

        Installing VMware VIX DiskLib API.
        You must read and accept the VMware VIX DiskLib API End User License Agreement to continue.
        Press enter to display it.
        Do you accept? (yes/no) yes

        Thank you.
        What prefix do you want to use to install VMware VIX DiskLib API?
        The prefix is the root directory where the other folders such as man, bin, doc, lib, etc. will be placed.
        [/usr]

        [userinput]#(Press Enter)#

        The installation of VMware VIX DiskLib API 5.5.0 build-1284542 for Linux completed successfully. You can decide to remove this software from your system at any time by invoking the following command: "/usr/bin/vmware-uninstall-vix-disklib.pl".
        Enjoy,
        --the VMware team

6.  Run `ldconfig` in order for {{ site.data.product.title }} to find the newly
    installed VDDK library.

    <div class="note">

    Use the following command to verify the VDDK files are listed and
    accessible to the appliance:

        # ldconfig -p | grep vix

    </div>

7.  Restart the {{ site.data.product.title }} appliance.

The VDDK is now installed on the {{ site.data.product.title }} appliance. This enables
use of the SmartState Analysis Server Role on the appliance.
