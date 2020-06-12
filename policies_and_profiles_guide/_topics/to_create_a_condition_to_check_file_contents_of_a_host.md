#### Creating a Compliance Condition to Check Host File Contents

{{ site.data.product.title }} Control provides the ability to create a compliance condition that checks file contents. Use this to be sure that internal operating system settings meet your security criteria. Regular expressions are used to create the search pattern. Test your regular expressions thoroughly before using them in a production environment.

Note that to search file contents you need to have collected the file using a host analysis profile.

1. Browse to menu: **Control > Explorer**.

2. Click the **Conditions** accordion, and select **Host Conditions**.

3. Click ![image](../images/1847.png)**Configuration**, ![image](../images/1862.png)**Add a New Host Condition**.

4. In **Basic Information**, type in a **Description** for the condition.

    ![image](../images/1937.png)

5. Editing the **Scope** area is not necessary for this procedure. Skip editing any **Scope** conditions.

6. If the **Expression** area is not automatically opened, click ![image](../images/1851.png)**Edit this Expression**, then edit the condition area to create a general condition based on a simple attribute. Based on what you choose, different options appear.

      - Click **Find**, then **Host.Files : Name**, and the parameters to select the file that you want to check.

      - Click **Check Any**, **Contents**, **Regular Expression Matches**, and type the expression. For example, if you want to
        make sure that permit root login is set to no, type `^\s*PermitRootLogin\s+no`.

        ![image](../images/1936.png)

7. Click ![image](../images/1863.png)**Commit expression element changes** to add the expression.

8. In **Notes** area, type in a detailed explanation of the condition.

9. Click **Add**.
