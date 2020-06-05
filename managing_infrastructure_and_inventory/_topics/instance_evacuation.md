If a Compute node is shut down, you can *evacuate* instances hosted on
it. This is only useful if the instances use shared storage or block
storage volumes. See [Evacuate
Instances](https://access.redhat.com/documentation/en/red-hat-openstack-platform/8/single/instances-and-images-guide/#section-migration-evacuation)
in the Red Hat OpenStack Platform *Instances and Images Guide* for
details on the underlying OpenStack process.

To evacuate an instance:

1.  Navigate to menu:Compute\[Clouds \> Instances\].

2.  On the right pane, click the instance to be evacuated. Use the
    **Instances by Provider** accordion to filter instances by provider
    and/or availability zone.

3.  Click ![2007](../images/2007.png)(**Lifecycle**), then
    ![2097](../images/2097.png)(**Evacuate selected Instance**).

4.  On the **Evacuate Host** section, select your preferred evacuation
    options:

      - **Auto-select Host?**: let the OpenStack provider automatically
        choose a destination Compute node. If you prefer to choose a
        specific node, uncheck this option and choose from the
        **Destination Host** dropdown.

      - **On Shared Storage**: leave this checked to indicate that all
        instance files are on shared storage.

5.  Click **Submit**.

Once the evacuation initiates, the instance list will reload with a
message indicating that the selected instance is being evacuated. Upon
completion, the instance list will reload and the evacuated instance
will be displayed as ![2143](../images/2143.png) (**On**).
