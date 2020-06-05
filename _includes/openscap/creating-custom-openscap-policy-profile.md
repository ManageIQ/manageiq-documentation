The built-in OpenSCAP policy profile cannot be edited. You can, however,
assign *edited* copies of its policies to a new policy profile. This
will allow you to create a customized version of the built-in OpenSCAP
policy profile.

To do so, you will first have to copy the policy you want to customize:

1.  Navigate to menu:Control\[Explorer\].

2.  Click the **Policies** accordion, and select **Container Image
    Compliance Policies**, then click **OpenSCAP**.

3.  Click ![image](../images/1847.png)(**Configuration**), and an option
    to copy the policy should appear; for example,
    ![image](../images/1859.png) (**Copy this Container Image Policy**).

4.  Click **OK** to confirm.

The new policy is created with a prefix of **Copy of** in its
description, and it can be viewed in the Policies accordion.

![image](../images/1860-cppolicy.png)

You can now edit the copied policy. After editing copied policies, you
can add them to a new policy profile. For instructions on how to edit
policies, create a new policy profile, and add policies to it, see the
[Policies and
Profiles](https://access.redhat.com/documentation/en-us/red_hat_cloudforms/4.7/html-single/policies_and_profiles_guide)
guide. Once you have a customized policy profile, you can assign it to a
containers provider.
