## Assigning the Policy Profile to a Virtual Machine

Assign the policy profile you created in [Creating a Policy Profile and Assigning the Virtual Machine Control Policy](#create-policy-profile-assign-vm-control-policy) to a virtual machine, and initiate SmartState analysis.

**Note:**

Policy profiles can be specified at multiple levels. If you assign a policy profile to a provider (Amazon EC2 or OpenStack for example), the profile will apply to all hosts or virtual machines for that provider.

1. Browse to menu: **Compute > Clouds > Instances** or menu: **Compute > Infrastructure > Virtual Machines**. Select the virtual machine or instance.

2. Click ![image](../images/1941.png) **Policy**, then ![image](../images/1851.png) **Manage Policies**.

3. Under **Select Policy Profiles**, select the policy profile created in [Creating a Policy Profile and Assigning the Virtual Machine Control Policy](#create-policy-profile-assign-vm-control-policy). It will turn blue to show the selection. Click the triangle next to the policy profile to see its member policies.

4. Click **Save**.

5. Click ![image](../images/1847.png) **Configuration**, then ![image](../images/smartstate-icon.png) **Perform SmartState Analysis**. A pop-up window appears to confirm the action.

6. Click **OK**. SmartState analysis is initiated for the selected virtual machine or instance from the {{ site.data.product.title_short }} database.

SmartState analysis will now report back findings specified by the custom virtual machine analysis profile.
