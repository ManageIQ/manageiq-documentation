# Data Optimization

{{ site.data.product.title }} optimization functions allow you to view utilization
trends in your environment. In addition, you can predict where you have
capacity for additional virtual machines, see [Planning Where to Put a
New Virtual
Machine](https://access.redhat.com/documentation/en-us/red_hat_cloudforms/4.7/html-single/deployment_planning_guide/#planning-where-to-put-a-new-virtual-machine)
in the *Deployment Planning Guide*.

<div class="note">

  - To access the utilization report features, you will first need to
    enable data collection in {{ site.data.product.title }}; see the following
    sections in the *Deployment Planning Guide*:

      - [Assigning the Capacity and Utilization Server
        Roles](https://www.manageiq.org/docs/reference/latest/deployment_planning_guide/index.html#assigning-the-capacity-and-utilization-server-roles)

      - [Capacity and Utilization Data
        Collected](https://www.manageiq.org/docs/reference/latest/deployment_planning_guide/index.html#capacity-and-utilization-data-collected)

</div>

## Utilization Trends

{{ site.data.product.title }} allows you to view the resource utilization of your
clusters, providers, and datastores. You can choose from summary,
details, or report view.

### Viewing a Utilization Trend Summary

This procedure shows you how to view a utilization trend summary.

1.  Navigate to menu:Overview\[Utilization\].

2.  Click **Summary** if it is not already selected.

3.  Expand the tree on the left side, until you can see the desired
    providers, clusters, or datastores.

4.  Click on the item.

5.  Use the **Options** section in the **Summary** tab to change the
    characteristics of the data.

      - Use **Trends** to select how far back you want to calculate the
        trend.

      - Use **Selected Day** for the date you want to see percent
        utilization for in the chart on the **Summary** tab.

      - Use **Classification** to only see trends for a specific applied
        tag.

      - Use **Time Profile** to select an existing time profile. If the
        logged on user does not have any time profiles available, this
        option will not show.

      - Select a **Time Zone**.

### Viewing Detail Lines of a Utilization Trend

This procedure shows you how to view detail lines of a utilization
trend.

1.  Navigate to menu:Overview\[Utilization\].

2.  Expand the tree on the left side, until you can see the desired
    providers, clusters, or datastores.

3.  Click on the item.

4.  Click **Details** if it is not already selected.

5.  From the **Options** area, select how far back you want to view the
    trends for and any classifications you want to use.

### Viewing a Report of a Utilization Trend

To find out more about resource utilization, view utilization trend
reports.

1.  Navigate to menu:Overview\[Utilization\].

2.  Expand the tree on the left side, until you can see the desired
    providers, clusters, or datastores.

3.  Click on the item.

4.  Click **Report** if it is not already selected.

5.  From the **Options** area, select how far back you want to view the
    trends for and any classifications you want to use.
