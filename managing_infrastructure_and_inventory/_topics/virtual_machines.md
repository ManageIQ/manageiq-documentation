# Virtual Machines

The heterogeneous virtual machine container and guest support combined
with the ability to analyze information inside the virtual machine -
such as disk space, patch level or installed applications - provides
in-depth information across the virtual environment. This rich set of
information enables {{ site.data.product.title_short }} users to improve problem resolution
times and effectively manage virtual machines.

The **Virtual Machines** pages display all virtual machines that were
discovered by your server. Note that if you have applied a filter to a
user, it will be in effect here. The **Virtual Machines** taskbar is a
menu driven set of buttons that provide access to functions related to
virtual machines.

![2124](../images/2124.png)

1.  History button

2.  Refresh screen button

3.  Taskbar

4.  Name search bar/Advanced Search button

5.  View buttons

6.  Download buttons

7.  Navigation bar

8.  Sort dropdown

9.  Main area in Grid View

10. Provider/Filter Navigation

The console uses **Virtual Thumbnails** to describe virtual machines and
templates. Each thumbnail contains four quadrants by default. This
allows you to glance at a virtual machine for a quick view of its
contents.

![2137](../images/2137.png)

1.  Top left quadrant: Operating system of the Virtual Machine

2.  Bottom left quadrant: Virtual Machine Hosts software

3.  Top right quadrant: Power state of Virtual Machine or Status icon

4.  Bottom right quadrant: Number of Snapshots for this Virtual Machine

| Icon                      | Description                                                                                                                                                                                                                                                                                                                                                                                                                               |
| ------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| ![2138](../images/2138.png) | Template: Virtual Template                                                                                                                                                                                                                                                                                                                                                                                                                |
| ![2139](../images/2139.png) | Retired: When a virtual machine or instance is no longer required, it can be retired. Once a virtual machine or instance reaches its retirement date and time, it is immediately shut down and not allowed to restart. If an attempt to restart is made, {{ site.data.product.title_short }} will shut down the virtual machine or instance.                                                                                                                  |
| ![2140](../images/2140.png) | Archived: An archived virtual machine has no host or datastore associated with it. Archiving is done to move virtual machines to a low cost storage, either on demand or during retirement, if requested, to avoid incurring extra cost on a virtualized infrastructure due to virtual machine sprawl.                                                                                                                                    |
| ![2141](../images/2141.png) | Orphaned: An orphaned virtual machine has no host but has a datastore associated with it. Orphaned virtual machines are those that have been removed from their providers but still exist on the storage. An orphaned virtual machine is unable to identify the associated host. A virtual machine also shows as orphaned if it exists on a different host than the host expected by the provider’s server.                               |
| ![2142](../images/2142.png) | Disconnected: A disconnected virtual machine is one that has lost connection to either the provider’s storage, host, or both. A disconnect is usually a result of network issues on the provider side. For instance, if during virtual machine provisioning the storage is not set up or deleted, the virtual machine will still exist on the provider, but will not run on the host as it has lost connection to its provider’s storage. |
| ![2143](../images/2143.png) | On: Virtual Machine is powered on.                                                                                                                                                                                                                                                                                                                                                                                                        |
| ![2144](../images/2144.png) | Off: Virtual Machine is powered off.                                                                                                                                                                                                                                                                                                                                                                                                      |
| ![2145](../images/2145.png) | Suspended: Virtual Machine has been suspended.                                                                                                                                                                                                                                                                                                                                                                                            |

The **Virtual Machines** page has three accordions organizing your
virtual machines and templates in different ways. All of these
accordions share a set of common controls:

  - Use **VMs and Templates** to view your virtual machines and
    templates organized by Provider. In addition, you can see archived
    and orphaned items here.

  - Use **VMs** to view, apply filters, and collect information about
    all of your virtual machines.

  - Use **Templates** to view, apply filters, and collect information
    about all of your templates.

Through the console, you are able to view your virtual machines in
multiple ways. For your virtual machines, you can:

  - Filter virtual machines

  - Change views

  - Sort

  - Create a report

  - Search by MyTags

  - Search by collected data

## Filtering Virtual Machines and Templates

The **Virtual Machine Filter** accordion is provided so that you can
easily navigate through groups of virtual machines. You can use the ones
provided or create your own through **Advanced Filtering** capabilities.

1.  Browse to menu: **Compute > Infrastructure > Virtual Machines**.

2.  Go to the **VMs** or **Templates** accordion.

3.  Click on the desired filter from the left pane.

{% include_relative
_topics/to_create_a_virtual_machine_or_template_filter.md %}

{% include_relative
_topics/to_load_a_report_filter_or_search_expression.md %}

{% include_relative _topics/changing_views.md %}

{% include_relative
_topics/sorting_virtual_machines_and_templates.md %}

{% include_relative
_topics/creating_a_virtual_machine_or_template_report.md %}

{% include_relative
_topics/searching_by_virtual_machine_or_template_name.md %}

## Analyzing Virtual Machines and Templates

Analyze a virtual machine to collect metadata such as user accounts,
applications, software patches, and other internal information. If
{{ site.data.product.title_short }} is not set up for automatic analysis, perform a manual
analysis of a virtual machine. To perform a SmartState analysis,
{{ site.data.product.title_short }} requires a running SmartProxy with visibility to the
virtual machine’s storage location. If the virtual machine is associated
with a host or provider, ensure the virtual machine is registered with
that system to be properly analyzed; the server requires this
information since a snapshot might be created.

**Note:**

SmartState Analysis of a virtual machine requires access to its host. To perform a successful analysis, edit the virtual machine’s host and enter the host’s authentication credentials.

1.  Browse to menu: **Compute > Infrastructure > Virtual Machines**.

2.  Click the accordion for the items to analyze.

3.  Check the **Virtual Machines** and **Templates** to analyze.

4.  Click **Configuration**, then
    ![1942](../images/1942.png) (**Perform SmartState Analysis**).

5.  Click **OK**.

## Red Hat Enterprise Virtualization Prerequisites

{% include_relative
_topics/storage_support_notes_about_analyzing_from_rhevm_3.1.md
%}

{% include_relative
_topics/storage_support_notes_about_analyzing_from_rhevm_3.0.md
%}

## VMware vSphere Prerequisites

### Installing VMware VDDK on {{ site.data.product.title_short }}

{% include installing-vmware-vddk.md %}

## Comparing Virtual Machines and Templates

The {{ site.data.product.title_short }} Server allows you to compare multiple virtual
machines. This allows you to see how different virtual machines are from
their original template. This helps detect missing patches, unmanaged
user accounts, or unauthorized services.

Use the comparison feature to:

  - Compare multiple virtual machines from different hosts.

  - Compare multiple virtual machines side-by-side.

  - Quickly see similarities and differences among multiple virtual
    machines and a base.

  - Narrow the comparison display to categories of properties.

  - Print or export in the comparison results to a PDF or CSV file.

Compare virtual machines and templates:

1.  Browse to menu: **Compute > Infrastructure > Virtual Machines**.

2.  Click the accordion for the items to analyze.

3.  Check the items to compare.

4.  Click **Configuration**, and then
    ![2148](../images/2148.png)(**Compare Selected items**). The
    comparison displays in a compressed view with a limited set of
    properties listed.

    ![2149](../images/2149.png)

5.  To delete an item from the comparison, click
    ![1861](../images/1861.png)(**Remove this item from Inventory**)
    at the bottom of the items column. This option is only available
    when comparing more than two virtual machines.

6.  To view many items on one screen, go to a compressed view by
    clicking ![2024](../images/2024.png) (**Compressed View**). To
    return to an expanded view, click ![2023](../images/2023.png)
    (**Expanded View**).

7.  To limit the mode of the view, there are two buttons in the task
    bar.

      - Click ![2022](../images/2022.png) (**Details Mode**) to see
        all details for an attribute.

      - Click ![2025](../images/2025.png) (**Exists Mode**) to limit
        the view to if an attribute exists compared to the base or not.
        This only applies to attributes that can have a boolean
        property. For example, a user account exists or does not exist,
        or a piece of hardware that does or does not exist.

8.  To change the base virtual machine that all the others are compared
    to, click its label at the top of its column.

9.  To go to the summary screen for a virtual machine, click its
    **Virtual Thumbnail** button or icon.

{% include_relative
_topics/virtual_machine_and_templates_comparison_sections.md %}

{% include_relative _topics/to_use_comparison_sections.md %}

{% include_relative _topics/to_create_a_comparison_report.md %}

{% include_relative _topics/controlling_power_state_of_rhv_vms.md
%}

{% include_relative
_topics/refreshing_virtual_machines_and_templates.md %}

{% include_relative _topics/extracting_running_processes.md %}

{% include_relative _topics/to_set_ownership.md %}

{% include_relative
_topics/removing_virtual_machines_and_templates_from_the_vmdb.md
%}

{% include_relative
_topics/to_tag_virtual_machines_and_templates.md %}

{% include_relative _topics/viewing_vmware_storage_profiles.md %}

{% include_relative
_topics/to_view_running_processes_after_collection.md %}

{% include_relative
_topics/to_edit_virtual_machine_or_template_properties.md %}

{% include_relative
_topics/setting_ownership_of_a_virtual_machine_or_template.md %}

{% include_relative _topics/to_right-size_a_virtual_machine.md %}

{% include_relative
_topics/to_view_capacity_and_utilization_charts_for_a_virtual_machine.md
%}

{% include_relative
_topics/to_view_the_timeline_for_a_virtual_machine_or_template.md
%}

{% include_relative _topics/virtual_machine_or_template_summary.md
%}

{% include_relative
_topics/viewing_the_operating_system_properties.md %}

{% include_relative
_topics/viewing_virtual_machine_or_template_snapshot_information.md
%}

{% include_relative _topics/to_view_a_users_group_memberships.md
%}

{% include_relative _topics/to_view_a_groups_members.md %}

{% include_relative
_topics/viewing_genealogy_of_a_virtual_machine_or_template.md %}

{% include_relative _topics/to_view_and_compare_genealogy.md %}

{% include_relative
_topics/to_tag_virtual_machines_or_templates_with_a_common_genealogy.md
%}

{% include_relative
_topics/viewing_drift_on_virtual_machines_or_templates.md %}

{% include_relative _topics/to_create_a_drift_report.md %}

{% include_relative _topics/to_view_analysis_history.md %}

{% include_relative _topics/to_view_disk_information.md %}

{% include_relative _topics/reconfiguring_vms.md %}

{% include_relative _topics/to_view_event_logs.md %}

{% include_relative _topics/vnc_and_spice_consoles.md %}

{% include_relative _topics/snapshots.md %}

{% include_relative _topics/create-template-based-on-vm.md %}

{% include_relative _topics/retiring_virtual_machines.md %}

{% include_relative _topics/migrate_vms.md %}
