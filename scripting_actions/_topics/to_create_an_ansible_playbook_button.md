### Creating an Ansible Playbook Button

{{ site.data.product.title }} includes an option to create an Ansible Playbook custom
button. This feature allows users to select a playbook to run as well as
an inventory target to run it against. An Ansible playbook type button
can be defined for any object type available.

**Note:**

An Ansible Playbook catalog item must exist in order to create an Ansible Playbook custom button. For more information, see [Creating an Ansible Playbook Service Catalog Item](../provisioning_virtual_machines_and_hosts/index.html#creating-an-ansible-playbook-service-catalog-item) in the Provisioning Virtual Machines and Hosts guide.

</div>

1.  Navigate to menu:Automation\[Automate \> Customization\].

2.  Click the **Buttons** accordion.

3.  From the **Object Types** tree, select the type of object you want
    to create the button for.

4.  Click **Unassigned Buttons**.

5.  Click ![image](../images/1847.png)(**Configuration**), then
    ![image](../images/1862.png) (**Add a new Button**).

    **Note:**

    If ![image](../images/1862.png) (**Add a new Button**) is not
    available, that means you have not created a button group for that
    object. To continue, see [Creating a Custom Button Group](#create-custom-button-group).

    </div>

6.  Select **Ansible Playbook** from the **Button Type** drop-down menu.

7.  From the **Playbook Catalog Item** choose a playbook-backed catalog
    item to run.

8.  Choose a host from the **Inventory** against which to run the
    playbook. If **Specific Hosts** is selected, input the IP address or
    DNS names for each host in the text field, separating each with a
    comma.

    **Note:**

    {{ site.data.product.title_short }} supports two configurations for host value
    input:

      - To allow user-provided host values, set the custom button to
        **Specific Hosts** and leave the associated text field blank.

      - To use admin-specified host values, remove the **Hosts** field when creating the dialog the service uses. In this
        configuration, the field will not appear to users. See [Service Dialogs](../provisioning_virtual_machines_and_hosts/index.html#service-dialogs) for information on generating a service dialog.

    </div>

9.  Type in a **Text** and **Hover Text**, and select the **Icon** you
    want to use.

10. Select an **Icon Color** from the color selection palette that pops
    up.

11. Check **Open URL** to open a browser window for the custom URL
    returned when the playbook is run.

12. Select display options for the Ansible Playbook button from the
    **Display for** drop-down menu. Choose for the button to display in
    the list view, for single entities, or both.

13. Choose how to submit objects to automate by selecting an option from
    the **Submit** drop-down menu. Selecting **Submit all** will pass
    all objects at once when the playbook is executed, while choosing
    **One by one** will run the the playbook each time per object.

14. Click **Add** when you have confirmed that the button accomplishes
    the task you want.
