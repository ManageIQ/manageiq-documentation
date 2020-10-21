# Viewing the Operating System Properties

When you click on a specific instance or image, you will see the
**Virtual Thumbnail**, and an **operating system-specific** screen of
the item, called the **Summary**. Where applicable, click on a
subcategory of the **Summary** to see more detail on that section.

**Note:**

When you perform a SmartState Analysis on an instance or image, you get
more detailed information in these categories:

  - **Properties** include information such as the base operating
    system, hostname, IP addresses, instance vendor, cloud resources,
    and snapshots. This includes the ability to analyze multiple
    partitions, multiple disks, Linux logical volumes, extended
    partitions, and Windows drives. Some categories can be clicked on
    for additional detail. For example, click **Container** to view
    notes associated with an instance.

  - **Lifecycle** shows the date of discovery and the last analysis. If
    a retirement date or owner has been set, these display as well.

  - **Relationships** include information on the instance’s cloud
    provider, genealogy such as parent and child instances, and drift.

  - **VMsafe** shows properties of the VMsafe agent if it is enabled.

  - **Compliance** shows the status of system compliance checks and
    history of past checks.

  - **Power Management** displays the current power state, last boot
    time, and last power state change. **State Changed On** is the date
    that the instance last changed its power state. This is a container
    view of the power state, therefore a restart of the operating system
    does not cause the container power state to change and does not
    update this value.

  - **Security** includes information on users and groups.

  - **Configuration** includes information on applications, services,
    packages, init processes, and files. This section changes depending
    on the base operating system.

  - **Diagnostics** provides a link to viewing running processes and the
    information from the latest collected event logs.

  - **Smart Management** shows all tags assigned to this instance.
