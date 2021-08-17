# Creating a Condition

You can create a condition either from within a policy screen or by going directly to the
expression editor in the {{ site.data.product.title_short }} console. You need to define a
description and an expression element. The expression element defines what criteria you want to
use to test the condition.

1. Browse to menu: **Control > Explorer**.

2. Click the **Conditions** accordion, and select either **Host / Node Conditions** or
   **VM and Instance Conditions** or **Replicator Conditions** or **Pod** or **Node Conditions**
   or **Image Conditions**.

3. Click **Configuration**, then
   ![image_1862](../images/1862.png) **Add a New Host / VM / Replicator / Pod / Node / Image Condition**.

4. Enter a **Description** for the condition.

   ![image_1886](../images/1886.png)

5. Click **Edit this Scope** in the **Scope** area to create a general condition based on a
   simple attribute. Based on what you choose, different options appear. Creating a scope is
   optional.

   ![image_1887](../images/1887.png)

    - Click **Field** to create criteria based on field values.

      ![image_1888](../images/1888.png)

    - Click **Count of** to create criteria based on the count of something, such as the number of
      network adapters on the host.

        ![image_1889](../images/1889.png)

    - Click **Tag** to create criteria based on tags that are assigned to your resources. For
      example, you can check the power state of a virtual machine or see whether it is tagged as
      production.

        ![image_1890](../images/1890.png)

    - Click **Find** to seek a particular value, and then check a property. For example, finding
      the Admin account and checking that it is enabled. Use the following check commands:

        - **Check Any**: The result is true if one or more of the find results satisfy the check
          condition.

        - **Check All**: All of the find results must match for a true result.

        - **Check Count**: If the result satisfies the expression in check count, the result is
          true.

            ![image_1891](../images/1891.png)

    - Click **Registry** to create criteria based on registry values. For example, you can check
      whether DCOM is enabled on a Windows System. This applies only to Windows operating systems.
      Registry will only be available if you are creating a VM Condition.

        ![image_1892](../images/1892.png)

6. Click ![image_1863](../images/1863.png) **Commit expression element changes** to add the scope.

7. Click **Edit this Expression** in the **Expression** area to create a general condition based
   on a simple attribute. Based on what you choose, different options appear.

    - Click **Field** to create criteria based on field values.

      ![image_1893](../images/1893.png)

    - Click **Count of** to create criteria based on the count of something, such as the number of
      snapshots for a virtual machine, or the number of virtual machines on a host.

        ![image_1894](../images/1894.png)

    - Click **Tag** to create criteria based on tags assigned to your resources. For example, you
      can check the power state of a virtual machine or see whether it is tagged as production.

        ![image_1895](../images/1895.png)

    - Click **Find** to seek a particular value, and then check a property. For example, finding
      the Admin account and checking that it is enabled. Use the following check commands.

        - **Check Any**: The result is true if one or more of the find results satisfy the check
          condition.

        - **Check All**: All of the find results must match for a true result.

        - **Check Count**: If the result satisfies the expression in check count, the result is
          true.

            ![image_1896](../images/1896.png)

    - Click **Registry** to create criteria based on registry values. For example, you can check
      whether DCOM is enabled on a Windows System. This applies only to Windows operating systems.

        ![image_1897](../images/1897.png)

8. Click ![image](../images/1863.png) **Commit expression element changes** to add the expression.

9. In **Notes**, type in a detailed explanation of the condition.

10. Click **Add**.
