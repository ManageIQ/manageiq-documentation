{{ site.data.product.title_short }} allows you to resize an existing, active instance by
changing its flavor. This is only possible if your OpenStack deployment
has:

  - At least two Compute nodes, or with resizing to the same host
    enabled

  - Enough capacity to support the needs of the new flavor

**Note:**

Keep in mind that the instance will undergo a controlled shutdown when you change its flavor.

For more information about the requirements and underlying OpenStack process involved, see [Resize an Instance](https://access.redhat.com/documentation/en/red-hat-openstack-platform/8/single/instances-and-images-guide/#section-resize-instance)
in the Red Hat OpenStack Platform *Instances and Images Guide*.

To resize an instance through {{ site.data.product.title_short }}:

1.  Navigate to menu:Compute\[Clouds \> Instances\].

2.  Click the instance whose flavor you want to change.

3.  Click ![1847](../images/1847.png) (**Configuration**), and then
    ![1851](../images/1851.png) (**Reconfigure this Instance**).

4.  In the **Reconfigure Instance** section, select the new flavor you
    want from the **Choose Flavor** dropdown.

5.  Click **Submit**. Doing so will initiate the flavor change, and it
    might take several minutes before {{ site.data.product.title_short }} verifies whether
    the change was successful.

See [Flavors](#flavors) and [Manage Flavors](https://access.redhat.com/documentation/en/red-hat-openstack-platform/8/single/instances-and-images-guide/#section-flavors) in the Red Hat OpenStack Platform *Instances and Images Guide* for more
information.
