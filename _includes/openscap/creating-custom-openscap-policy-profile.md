The built-in OpenSCAP policy profile cannot be edited. However, you can assign *edited* copies of these policies to a new policy profile. This provides you the ability to create a customized version of the built-in OpenSCAP policy profile.

To do so, you must first copy the policy that you want to customize:

1. Browse to menu: **Control > Explorer**.

2. Click the **Policies** accordion, select **Container Image Compliance Policies**, and click **OpenSCAP**.

3. Click ![image](../images/1847.png)**Configuration**, and an option to copy the policy appears; for example,
    ![image](../images/1859.png)**Copy this Container Image Policy**.

4. Click **OK** to confirm.

The new policy is created with a prefix of **Copy of** in its description, and it can be viewed in the Policies accordion.

![image](../images/1860-cppolicy.png)

You can now edit the copied policy. After editing copied policies, you can add them to a new policy profile. For instructions on how to edit policies, create a new policy profile, and add policies to it, see the [Policies and Profiles](../policies_and_profiles_guide/index.html) guide. Once you have a customized policy profile, you can assign it to a containers provider.
