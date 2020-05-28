## Provisioning a Virtual Machine Using the Self Service User Interface

1.  Log in to the Self Service User Interface at
    <https://<your_cloudforms_appliance>/self_service>.

2.  Click the **Service Catalog** tab.

3.  Click the service you created.

4.  In the **Service and VM Name**:

    1.  Enter the service name in **Service Name**.

    2.  Enter the virtual machine name in **VM Name**.

    3.  Enter the virtual machine description in **VM Description**.

5.  In **VM Characteristics**, enter **Number of CPUs** and **VM
    Memory**.

6.  Click **Add to Shopping Cart** and access the shopping cart by
    clicking its icon on the upper-right corner of the screen.

7.  Click **Order**.

You have ordered a new provisioning request. You can follow its progress
and see additional details of the order request by selecting it from the
**Orders** tab.

Also, see the [Self Service User Interface
Guide](https://access.redhat.com/documentation/en-us/red_hat_cloudforms/4.7/html-single/self_service_user_interface_guide/)
for more information about using the Self Service user interface.

**Summary.**

As part of the above sample service, you created a provisioning dialog
that defines the options that can be set on a virtual machine. Then, you
created a service dialog which allows us to expose certain options to be
set by the user. For our example, the service name, virtual machine
name, virtual machine description, and virtual machine characteristics
are configurable. Additionally, you created a service catalog and
finally a catalog item. The catalog item combines the service dialog
with all of the options in the provisioning dialog. Lastly, you
provisioned a Red Hat Virtualization virtual machine using the Self
Service user interface.
