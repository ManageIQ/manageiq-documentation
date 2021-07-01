#### Creating a Playbook Automate Method

{{ site.data.product.title_short }} can choose an Ansible playbook from a repository and
execute it as a method. Each playbook method can take additional input
parameters specified by the user.

**Important:**

  - You must first sync your playbook repositories before using them to create a method. See [Adding a Playbook Repository](../managing_providers/index.html#adding-a-playbook-repository) in *Managing Providers* for information on initial playbook repository set-up.

  - Using Ansible playbooks to populate dynamic dialog fields is not recommended due to delay times caused by the overhead of interaction between systems.

  - Only users with administrator privileges can run a service dialog based on a playbook automate method.

To create a playbook automate method:

1.  Browse to menu: **Automation > Automate > Explorer**, then click on a domain under **Datastore**.

2.  Under a namespace, select the class for which you want to create a new method.

3.  Click the **Methods** tab.

4.  Click **Configuration** then,
    ![image](../images/1862.png) (**Add a New Method**).

5.  In the **Main Info** area, select **Playbook** from the **Type** dropdown menu.

6.  Provide a **Name** and **Display Name**.

7.  Select a playbook **Repository** from the list.

    1.  Choose a **Playbook** to use.

    2.  Select the **Machine Credential** the playbook will use when it runs.

    3.  Select the **Vault Credential** to use.

    4.  From the **Cloud Type** list, select a cloud provider.

    5.  Choose the **Cloud Credential** that corresponds to the selected cloud type.

8.  Specify the **Hosts** on which the playbook will run. Choose **Localhost** or provide unique values in the **Specify host values** field.

9.  Set the **Max TTL** in minutes. The Time To Live (TTL) field allows you to set the maximum execution time for the playbook to run.

10. Select when to receive **Logging Output** from the options in the drop-down menu.

11. Use the **Escalate Privilege** toggle switch to enable user privilege escalation if credentials are called for during the playbook run.

12. Choose a **Verbosity** value to set the debug level for playbook execution.

13. Add required **Input Parameters** using the fields and values available. Click the ![add parameter](../images/add_parameter.png) to add additional input parameters.

    **Note:**

    Input parameters become extra vars, with substitution enabled. This overcomes the lack of a dialog which would normally allow for the input of additional information. For more information on extra vars,
    see the Ansible documentation.

14. Click **Add** when finished.

Once created, the domain including your playbook method can be exported to appliances in your testing or production environments or imported in appliances in multiple regions.

**Important:**

To import a domain with a playbook method, you must have an existing Ansible playbook on the destination environment with the same name or the import will fail.

See [Exporting All Datastore Classes](#exporting-all-datastore-classes) for information.

##### Passing variables between successive playbook methods

Automate designers can pass variables between successive Ansible playbook methods in a state machine using {{ site.data.product.title_short }}.

To pass variables between Ansible playbook methods, use the `set_stats` module in your playbooks.

**Example.**

    ---
    # This playbook prints a simple debug message
    - name: Echo Hello, Fred and Wilma
      hosts: localhost

      tasks:
      - name: "playbook1 - testing input vars"
        set_stats:
          data:
            pb_var1a: "{{ input1a }}"
            pb_var1b: "{{ input1b }}"

      - debug: msg="Hello, {{ input1a }} and {{ input1b }}"

For more information on the `set_stats` module, see the
[Ansible](https://docs.ansible.com) documentation.
