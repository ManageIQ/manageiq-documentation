**Note:**

  - Before creating an Ansible service, at least one repository, one playbook, and one credential
    must exist in the {{ site.data.product.title_short }} inventory. Check your inventory and add
    the appropriate resources before creating an Ansible service. For more information, see
    [Automation Management Providers](../managing_providers/index.html#automation-management-providers)
    in *Managing Providers*.

  - Debugging verbosity is available for Ansible playbook catalog items. Selecting a higher
    verbosity value provides more detailed output as the playbook executes. **0 (Normal**) is the
    default value. **1 (Verbose**) will yield return data while a value of **3 (Debug**) provides
    connection attempt and task invocation details. Higher levels, such as **4 (Connection**) can
    be useful for debugging SSH connections. Use **5 (WinRM Debug**) when debugging WinRM
    connections.

  - Using Ansible playbooks to populate dynamic dialog fields is not recommended due to delay times
    caused by the overhead of interaction between systems.

  - Only users with administrator privileges can run a service dialog based on a playbook.

1.  Browse to menu: **Services > Catalogs**.

2.  In the **Catalog Items** accordion, click on the **All Catalog Items**.

3.  Click **Configuration**, then ![1862](../images/1862.png)(**Add a New Catalog Item**).

4.  Select **Ansible Playbook** from the **Catalog Item Type** drop-down list.

5.  Type a **Name** and **Description** for the new service catalog item.

6.  Click **Display in Catalog**.

7.  Select the appropriate **Catalog** from the drop-down list.

8.  In the **Provisioning** tab, set parameters for your catalog item to use by configuring a
    Playbook to back your service item:

    1.  Choose a **Repository** from the drop-down list.

    2.  Select the **Ansible Playbook** to use.

    3.  Assign the appropriate **Machine Credentials** from the drop-down list.

    4.  Add **Cloud** or **Network Credentials** from the drop-down lists.

    5.  Choose the **Host** against which to run the service item.

    6.  Set the **Max TTL** in minutes. The Time To Live (TTL) field allows you to set the maximum
        execution time for the playbook to run.

    1.  Use the **Escalate Privilege** toggle switch to enable user privilege escalation if called
        for in credentials during the playbook run.

    1.  Choose a **Verbosity** value to set the debug level for playbook execution.

    2.  Add key value pairs for **Variables** and their corresponding **Default Values**.

    3.  In the **Dialog** options, choose an existing dialog from the **Use Existing** drop-down
        list or select **Create New** to add a new dialog.

9.  In the **Retirement** tab, set parameters for your catalog item to use by selecting values for
    the following:

    1.  Choose a **Repository** from the drop-down list.

    2.  Select the **Ansible Playbook** to use.

    3.  Assign the appropriate **Machine Credentials** from the drop-down list.

    4.  Add **Cloud** or **Network Credentials** from the drop-down lists.

    5.  Choose the **Host** against which to run the service item.

    6.  Set the **Max TTL** in minutes. The Time To Live (TTL) field allows you to set the maximum
        execution time for the playbook to run.

    1.  Use the **Escalate Privilege** toggle switch to enable user privilege escalation if called
        for in credentials during the playbook run.

    1.  Choose a **Verbosity** value to set the debug level for playbook execution.

    2.  Add key value pairs for **Variables** and their corresponding **Default Values**.

    3.  In the **Dialog** options, choose an existing dialog from the **Use Existing** drop-down
        list or select **Create New** to add a new dialog.

1.  Click **Add**.
