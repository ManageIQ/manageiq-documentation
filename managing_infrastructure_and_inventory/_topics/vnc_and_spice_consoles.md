# Remote Consoles

A console is a graphical window that allows you to view the start up
screen, shut down screen, and desktop of a virtual machine, and to
interact with that virtual machine in a similar way to a physical
machine.

{{ site.data.product.title }} offers the following support for HTML5-based VNC, SPICE,
and WebMKS consoles:

  - VNC and SPICE consoles for Red Hat Virtualization Manager with
    websocket proxy.

  - VMware’s WebMKS HTML5-based console type.

  - VNC consoles for OpenStack using OpenStack-supplied websocket proxy.

**Note:**

  - VMware no longer supports the MKS console type. Also, VMRC is no
    longer a browser plugin but a native desktop application. As a
    result, the VMware MKS and the VMRC plugin options have been
    disabled in {{ site.data.product.title_short }}.

  - Currently, attempting to connect to the VMware WebMKS console for a
    virtual machine fails when the server security type is set to `2`
    for that virtual machine.

  - Due to VMware licensing restrictions, Red Hat cannot ship the WebMKS
    SDK in {{ site.data.product.title_short }}. For information on how to configure
    WebMKS support in {{ site.data.product.title_short }}, see [Configuring WebMKS
    Support in {{ site.data.product.title_short }}](#configuring-the-webmks-support).

</div>

All of the above make use of the websocket protocol supported by all
recent versions of browsers, and can use SSL to encrypt the websocket
connection.

  - OpenStack
    {{ site.data.product.title }} only makes an API call to get the URL for the
    console and open that console in a web browser; see [Directly
    Connect to a VNC
    Console](https://access.redhat.com/documentation/en/red-hat-openstack-platform/8/single/instances-and-images-guide/#connect_to_an_instance)
    in the Red Hat OpenStack Platform *Instances and Images Guide* for
    more details.

  - Red Hat Enterprise Virtualization Manager and VMware
    By default, the websocket connection runs over HTTPS or HTTP based
    on how the application was accessed. Under an appliance, you will
    most likely use HTTPS, and, therefore, the websocket connection will
    be wss:// (websocket with SSL).

    When configuring Red Hat Virtualization Manager for virtual machine
    console access, set the display type for each virtual machine to
    `noVNC` or `SPICE HTML5`. For more information on configuring
    console options, see [Configuring Console
    Options](https://access.redhat.com/documentation/en-us/red_hat_virtualization/4.2/html-single/virtual_machine_management_guide/index#sect-Configuring_Console_Options)
    in the Red Hat Virtualization *Virtual Machine Management Guide*.

## Configuring Console Access to VMware ESXi Hosts At A Network Layer

When configuring access to the VNC or HTML5 console, make sure that at a
network layer:

  - All VNC ports (5900-6000) are opened from the machine on which you
    access the {{ site.data.product.title }} Console to the {{ site.data.product.title }}.

  - All VNC ports (5900-6000) are opened from the {{ site.data.product.title }} to
    each VMware ESXi host running virtual machines that you want to
    access.

  - The firewall on VMware ESXi hosts is enabled and that the VMware
    ESXi host firewall ports are opened.

  - The VNC service (`gdbserver`) is running and that the `gdbserver`
    service has an association with ports 5900-6000 usually defined with
    a `/etc/vmware/firewall/service.xml` firewall rules configuration.

    The `gdbserver` ruleset must be enabled on each ESXi host running
    virtual machines that will be accessed through the HTML5 console or
    VNC console on the {{ site.data.product.title }}. The ruleset can be configured on
    the host itself, or using the VMware vCenter web user interface.

The following procedures apply to VMware vCenter 5.0 and later.

### Using SSH to Configure VMware ESXi Hosts to Enable Console Access

Configure the `gdbserver` ruleset on the host using SSH.

1.  Access the host:

        # ssh host@example.com

2.  Set the `gdbserver` parameter:

        # esxcli network firewall ruleset set --ruleset-id gdbserver --enabled true

3.  Confirm that the ruleset is active:

        # esxcli network firewall ruleset list

### Using the VMware vCenter Web Interface to Configure ESXi Hosts to Enable Console Access

Configure the `gdbserver` ruleset on the host using the VMware vCenter
web user interface.

1.  Select the ESXi host in the VMware vCenter web interface.

2.  Click the **Manage** tab.

3.  Click the **Settings** sub tab.

4.  Click menu:System\[Security Profile\] from the list on the left.

5.  Click **Edit**.

6.  Select the `gdbserver` ruleset, and then click **OK**.

### Configuring the VMware ESXi Host Firewall Ports for Console Access

Follow these steps to configure the VMware ESXi host firewall ports for
HTML5 or VNC console access to guest virtual machine consoles. The
firewall ports must be enabled on each VMware ESXi host running virtual
machines that will be accessed through the HTML5 or VNC console on the
{{ site.data.product.title }}.

1.  Log in to your vSphere Client and select menu:Home\[Inventory \>
    Hosts and Clusters\].

2.  In the **Hosts/Clusters** tree view, select the VMware ESXi host you
    want to configure for HTML5 or VNC console access.

3.  Select the **Configuration** tab and open the **Software** box.

4.  Select **Security Profile**.

5.  Navigate to the **Firewall Properties** dialog window by selecting
    the **Properties** link from the **Firewall** section.

6.  In the **Firewall Properties**, scroll down to **GDB Server** and
    select it.

7.  Click **OK**.

## Configuring WebMKS Support in {{ site.data.product.title_short }}

Complete the following steps to enable WebMKS support in
{{ site.data.product.title_short }}.

1.  Log in to the {{ site.data.product.title_short }} user interface appliance
    console as the root user.

2.  On the {{ site.data.product.title_short }} user interface appliances, create a
    folder titled `webmks` in the `/var/www/miq/vmdb/public/` directory.

        /var/www/miq/vmdb/public/webmks

3.  Download and extract the contents of [VMware WebMKS
    SDK](https://www.vmware.com/support/developer/html-console/) into
    the `webmks` folder.

4.  Log in to the {{ site.data.product.title_short }} user interface as an
    administrative user. If you are already logged in, refresh the
    settings page in the {{ site.data.product.title_short }} user interface for the
    changes to take effect.

5.  Click ![config gear](../images/config-gear.png) (**Configuration**).

6.  Click on the **Settings** accordion, then click **Zones**.

7.  Click the zone where the {{ site.data.product.title_short }} server is located.

8.  Click on the server.

9.  Under **VMware Console Support**, select **VMware WebMKS** from the
    **Use** list.

10. Click **Save**.

## Opening a Console for a Virtual Machine

Open a web-based VNC or SPICE console for a virtual machine.

1.  Navigate to menu:Compute\[Infrastructure \> Virtual Machines\].

2.  Click on the virtual machine that you want to access.

3.  Click ![screen](../images/screen.png) (**Access**) and select **VM
    Console** or **Web Console**.

The virtual machine console opens in a new tab in your browser.
