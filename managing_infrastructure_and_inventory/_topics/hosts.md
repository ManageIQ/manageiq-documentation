# Hosts

The **Hosts** page under menu:Compute\[Infrastructure\] displays the
hosts discovered in your enterprise environment.

**Note:**

Any applied filters will be in effect here.

![2212](../images/2212.png)

After adding or sorting your hosts, click on one to examine it more closely and see its virtual machines, SmartProxy settings, and properties.

![2222](../images/2222.png)

1.  Top left quadrant: Number of virtual machines on this host

2.  Bottom left quadrant: Virtual machine software

3.  Top right quadrant: Power state of host

4.  Bottom right quadrant: Authentication status

| Icon                      | Description                                                                    |
| ------------------------- | ------------------------------------------------------------------------------ |
| ![2190](../images/2190.png) | Validated: Valid authentication credentials have been added.                   |
| ![2191](../images/2191.png) | Invalid: Authentication credentials are invalid                                |
| ![2192](../images/2192.png) | Unknown: Authentication status is unknown or no credentials have been entered. |

## Filtering Hosts

The Host Filter accordion is provided to easily navigate through the
hosts. Use the ones provided or create your own. In addition, you can
set a default filter.

{% include_relative _topics/to_set_a_default_host_filter.md %}

{% include_relative _topics/to_create_a_host_filter.md %}

{% include_relative
_topics/performing_smartstate_analysis_on_hosts.md %}

## Comparing Hosts

{{ site.data.product.title_short }} allows you to compare hosts and check operating systems,
host software and version information, and hardware.

1.  Navigate to menu:Compute\[Infrastructure \> Hosts\].

2.  Check the hosts to compare.

3.  Click ![1847](../images/1847.png) (**Configuration**), and then
    ![2148](../images/2148.png) (**Compare selected Hosts**). The
    comparison displays in a default expanded view, which lists a
    limited set of properties.

4.  To remove a host from the comparison, click
    ![1861](../images/1861.png) (**Remove this Host from the comparison**)
    at the bottom of the column.

5.  To go to a compressed view, click ![2024](../images/2024.png)
    (**Compressed View**). To return to an expanded view, click
    ![2023](../images/2023.png) (**Expanded View**).

6.  To limit the mode of the view, there are two buttons in the taskbar.

      - Click ![2022](../images/2022.png) (**Details Mode**) to see all
        details for an attribute.

      - Click ![2025](../images/2025.png) (**Exists Mode**) to limit the
        view to if an attribute exists compared to the base or not. This
        only applies to attributes that can have a Boolean property. For
        example, a user account exists or does not exist, or a piece of
        hardware that does or does not exist.

7.  To change the base host that compare to the other hosts, click its
    label at the top of its column.

8.  To go to the summary screen for a host, click its virtual thumbnail
    or icon.

{% include_relative _topics/host_comparison_sections.md %}

{% include_relative _topics/to_use_host_comparison_sections.md %}

{% include_relative _topics/to_create_a_comparison_report2.md %}

{% include_relative _topics/refreshing_multiple_hosts.md %}

{% include_relative _topics/adding_a_single_host.md %}

{% include_relative _topics/editing_hosts.md %}

{% include_relative _topics/reviewing_a_host.md %}

{% include_relative _topics/tagging_multiple_hosts.md %}

{% include_relative _topics/removing_hosts.md %}

## Scaling Down Compute Hosts

{% include_relative _topics/scaling_down_compute.md %}

{% include_relative
_topics/refreshing_relationships_and_power_states_for_a_host.md
%}

{% include_relative
_topics/viewing_capacity_and_utilization_charts_for_a_host.md %}

{% include_relative _topics/viewing_the_host_timeline.md %}

{% include_relative _topics/host_virtual_summary.md %}

{% include_relative _topics/viewing_host_device_information.md %}

{% include_relative _topics/viewing_host_network_information.md %}

{% include_relative _topics/viewing_storage_adapters.md %}

{% include_relative _topics/detecting_drift_on_hosts.md %}

{% include_relative _topics/to_create_a_drift_report2.md %}
