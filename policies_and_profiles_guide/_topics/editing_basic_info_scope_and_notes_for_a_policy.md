#### Editing Basic Information, Scope, and Notes for a Policy

As your enterprise’s needs change, you can change the name of a policy or its scope. If the items that are being evaluated are out of scope, policy processing stops and no actions run.

1. Browse to menu: **Control > Explorer**.

2. Click the **Policies** accordion, and select the policy to edit.

3. Click ![image](../images/1847.png)**Configuration**, ![image](../images/1851.png)**Edit Basic Info, Scope, and Notes**.

4. In the **Scope** area, create a general condition based on a simple attribute. Or, click an existing expression to edit it. Based on what you choose, different options appear. Configuring a **Scope** is optional for a policy.

    ![image](../images/1853.png)

      - Click **Field** to create criteria based on field values.

        ![image](../images/1854.png)

      - Click **Count of** to create criteria based on the count of something, such as the number of snapshots for a virtual
        machine, or the number of virtual machines on a host.

        ![image](../images/1855.png)

      - Click **Tag** to create criteria based on tags that are assigned to your resources. For example, you can check the power state of a virtual machine or see whether it is tagged as production.

        ![image](../images/1856.png)

      - Click **Find** to seek a particular value, and then check a property. For example, finding the **Admin** account and
        checking that it is enabled. Use the following check commands:

          - **Check Any**: The result is true if one or more of the find results satisfy the check condition.

          - **Check All**: All of the find results must match for a true result.

          - **Check Count**: If the result satisfies the expression in check count, the result is true.

            ![image](../images/1857.png)

      - Click **Registry** to create criteria based on registry values. For example, you can check whether DCOM is enabled on a Windows System. Note that this applies only to Windows operating systems. Registry will only be available if you are editing a VM Control Policy.

        ![image](../images/1858.png)

5. Click ![image](../images/1863.png)**Commit Expression Element Changes** to add the scope.

6. In the **Notes** area, make the required changes.

7. Click **Save**.
