# Instances and Images

**Images** are the static templates containing the software
configuration from which you provision a running **Instance** - a
virtual machine, with which you can interact - on your cloud provider.

The **Instance** and **Images** containers, combined with the ability to
analyze information inside each instance or image, provides in-depth
information across the cloud environment. This rich set of information
enables {{ site.data.product.title_short }} users to improve problem resolution times and
effectively manage instances and images in their cloud environment.

The **Instances** and **Images** pages display all instances and images
the server discovered from your cloud providers. The taskbar on each
page is a menu driven set of buttons that provide access to functions
related to instances and images.

![image features](../images/image_features.png)

1.  History button

2.  Refresh screen button

3.  Taskbar

4.  Download buttons

5.  View buttons

6.  Name search bar/Advanced Search button

7.  Sort dropdown

8.  Navigation bar

9.  Main area in List View

10. Cloud/Filter Navigation

Console uses Virtual Thumbnails to describe instances and images. Each
thumbnail contains four quadrants by default. This allows you to glance
at an instance or image for a quick view of its contents.

![3393](../images/3393.png)

1.  Top left quadrant: Operating system of the Instance

2.  Bottom left quadrant: Instance Cloud Provider

3.  Top right quadrant: Power state of Instance or Status icon

4.  Bottom right quadrant: Number of Snapshots for this Instance

| Icon                      | Description                                                                              |
| ------------------------- | ---------------------------------------------------------------------------------------- |
| ![2138](../images/2138.png) | Template: Cloud Image                                                                    |
| ![2139](../images/2139.png) | Retired: Instance has been retired                                                       |
| ![2140](../images/2140.png) | Archived: Instance has no provider or availability zone associated with it.              |
| ![2141](../images/2141.png) | Orphaned: Instance has no availability zone but does have a provider associated with it. |
| ![2142](../images/2142.png) | Disconnected: Instance is disconnected.                                                  |
| ![2143](../images/2143.png) | On: Instance is powered on.                                                              |
| ![2144](../images/2144.png) | Off: Instance is powered off.                                                            |
| ![2145](../images/2145.png) | Suspended: Instance has been suspended.                                                  |

The **Instances** page has four accordions organizing your instances and
images in different ways. All of these accordions share a set of common
controls:

  - Use **Instances by Provider** and **Images by Provider** to view
    your instances and images organized by provider. In addition, you
    can see archived and orphaned items here.

  - Use the **Instances** to view, apply filters, and collect
    information about all of your instances.

  - Use **Images** to view, apply filters, and collect information about
    all of your images.

Through the console, you can view your instances and images in multiple
ways:

  - Filter instances

  - Change views

  - Sort

  - Create a report

  - Search by Tags

  - Search by collected data

## Filtering Instances and Images

The **Instance Filter** accordion is provided so that you can easily
navigate through groups of instances. You can use the ones provided or
create your own through **Advanced Filtering** capabilities.

{% include_relative _topics/using_an_instance_or_image_filter.md
%}

{% include_relative
_topics/creating_an_instance_or_image_filter.md %}

{% include_relative
_topics/loading_a_report_filter_or_search_expression.md %}

{% include_relative
_topics/changing_views_for_instances_and_images.md %}

{% include_relative _topics/sorting_instances_and_images.md %}

{% include_relative
_topics/creating_an_instance_or_image_report.md %}

{% include_relative _topics/searching_for_instances_or_images.md
%}

{% include_relative _topics/analyzing_instances_and_images.md %}

## Comparing Instances and Images

You can compare multiple instances in {{ site.data.product.title_short }} server. This
allows you to see how different instances are from their original image.
This helps detect missing patches, unmanaged user accounts, or
unauthorized services.

Use the comparison feature to:

  - Compare multiple instances from different hosts

  - Compare multiple instances side-by-side

  - Quickly see similarities and differences among multiple instances
    and a base

  - Narrow the comparison display to categories of properties

  - Print or export in the comparison results to a PDF or CSV file

Compare instances and images:

1.  Browse to menu: **Compute > Clouds > Instances**.

2.  Click the accordion for the items to analyze.

3.  Click the checkboxes for the items to compare.

4.  Click **Configuration**, and then
    ![2148](../images/2148.png) (**Compare Selected items**). The
    comparison displays in a compressed view with a limited set of
    properties listed.

5.  To delete an item from the comparison, click
    ![1861](../images/1861.png)(**Remove this VM from the comparison**) at
    the bottom of the items column.

6.  To view many items on one screen, go to a compressed view by
    clicking ![2024](../images/2024.png) (**Compressed View**). To return
    to an expanded view, click ![2023](../images/2023.png) (**Expanded
    View**).

7.  To limit the mode of the view, there are two buttons in the task
    bar.

      - Click ![2022](../images/2022.png) (**Details Mode**) to see all
        details for an attribute.

      - Click ![2025](../images/2025.png) (**Exists Mode**) to limit the
        view to if an attribute exists compared to the base or not. This
        only applies to attributes that can have a boolean property. For
        example, a user account exists or does not exist, or a piece of
        hardware that does or does not exist.

8.  To change the base instance that all the others are compared to,
    click its label at the top of its column.

9.  To go to the summary screen for an instance, click its **Virtual
    Thumbnail** or icon.

{% include_relative
_topics/creating_an_instance_comparison_report.md %}

{% include_relative _topics/refreshing_instances_and_images.md %}

{% include_relative
_topics/extracting_running_processes_from_instances_and_images.md
%}

{% include_relative
_topics/setting_ownership_for_instances_and_images.md %}

{% include_relative
_topics/removing_instances_and_images_from_the_vmdb.md %}

{% include_relative _topics/tagging_instances_and_images.md %}

{% include_relative _topics/reviewing_an_instance_or_image.md %}

{% include_relative
_topics/viewing_running_processes_after_collection.md %}

{% include_relative _topics/managing_security_groups.md %}

{% include_relative
_topics/editing_instance_or_image_properties.md %}

{% include_relative
_topics/controlling_the_power_state_of_an_instance.md %}

{% include_relative _topics/right_sizing_an_instance.md %}

## Resizing an Instance

{% include_relative _topics/resizing_an_instance_change_flavor.md
%}

## Migrating a Live Instance

{% include_relative _topics/instance_live_migration.md %}

## Evacuating an Instance

{% include_relative _topics/instance_evacuation.md %}

{% include_relative
_topics/viewing_capacity_and_utilization_charts_for_an_instance.md
%}

{% include_relative
_topics/viewing_the_instance_or_image_timeline.md %}

{% include_relative _topics/instance_or_image_summary.md %}

{% include_relative
_topics/viewing_a_user_information_for_an_instance_or_image.md
%}

{% include_relative
_topics/viewing_a_group_information_for_an_instance_or_image.md
%}

{% include_relative
_topics/viewing_genealogy_of_an_instance_or_image.md %}

{% include_relative
_topics/detecting_drift_on_instances_or_images.md %}

{% include_relative
_topics/creating_a_drift_report_for_an_instance_or_image.md %}

{% include_relative
_topics/viewing_analysis_history_for_an_instance_or_image.md %}

{% include_relative
_topics/viewing_event_logs_for_an_instance_or_image.md %}
