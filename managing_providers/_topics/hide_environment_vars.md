# Hiding Environment Variables for Containers Providers

You can restrict users from viewing container provider environment
variables by configuring user roles.

This is useful as the environment variables panel can expose sensitive
information, such as passwords, that you may not want certain users to
view.

<div class="note">

The default user roles in {{ site.data.product.title_short }} are read-only. To
customize a role’s settings, create a new role or a copy of an existing
role.

</div>

You can view role information and the product features the role can
access (marked by a checkmark) by clicking on any role in **Access
Control**. Expand the categories under **Product Features** to see
further detail.

To configure user access to container environment variables:

1.  Click ![config gear](../images/config-gear.png) (**Configuration**).

2.  Click the **Access Control** accordion, then click **Roles**.

3.  Select a existing custom role from the **Access Control Roles**
    list, and click ![1847](../images/1847.png) (**Configuration**), then
    ![1851](../images/1851.png) (**Edit the selected Role**).

    Alternatively, to create a new custom role, select a role from the
    **Access Control Roles** list, and click ![1847](../images/1847.png)
    (**Configuration**), then ![1851](../images/1851.png) (**Copy this
    Role to a new Role**).

4.  Edit the name for the role if desired.

5.  For **Access Restriction for Services, VMs, and Templates**, select
    if you want to limit users with this role to only see resources
    owned by the user or their group, owned by the user, or all
    resources (**None**).

6.  Expand the **Product Features (Editing)** tree options to show
    menu:Everything\[Compute \> Containers \> Containers Explorer \> All
    Containers \> View Containers\].

7.  Clear the **Environment Variables** checkbox to restrict the user
    role from viewing container environment variables.

    ![restrict env vars](../images/restrict_env_vars.png)

8.  Click **Save**.

For more information about user roles, see
[Roles](https://access.redhat.com/documentation/en-us/red_hat_cloudforms/4.7/html-single/general_configuration/#roles)
in *General Configuration*.
