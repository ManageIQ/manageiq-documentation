#### Simulating Policy Profiles on Virtual Machines

1. Browse to menu: **Compute > Infrastructure > Virtual Machines**, select the virtual machines that you need to evaluate.

2. Click ![image](../images/1941.png**)Policy**, and then click ![image](../images/1947.png**)Policy Simulation**.

3. From the **Select a Policy Profile to add** dropdown, click the policy that you need to apply to the selected virtual machines.

    ![image](../images/1948.png)

4. The virtual machine thumbnail displays in the **Policy Simulation** area.

      - A check sign in the virtual thumbnail shows that the virtual machine passes policy.

      - A minus sign in the virtual thumbnail shows that the virtual machine fails policy.

5. Click a virtual machine in the **Policy Simulation** area to see its details.

6. Expand a policy profile by clicking it to see its member policies and the status of the conditions.

      - Check **Show out of scope items** to show all conditions, whether the virtual machine passes the scope part of the condition. Uncheck it to hide conditions where the scope part fails.

      - Next to **Show policies**, check **Successful** to show policies that are passed and check **Failed** to see the policies that have failed. The default is to show both.

      - Items in green text passed the condition.

      - Items in red text failed the condition.

      - Items in red italics failed the condition, but do not change the outcome of the scope.

If you evaluate multiple policy profiles, you can see both policy profiles and a tree expanding down to their conditions.
