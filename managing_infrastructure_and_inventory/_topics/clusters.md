# Clusters

Clusters provide high availability and load balancing for a group of
hosts. The **Clusters** page under menu:Compute\[Infrastructure\]
displays the clusters discovered in your enterprise environment.

**Note:**

Any filter applied will be in effect here.

</div>

![2202](../images/2202.png)

Use the **Clusters Taskbar** to manage the analysis and tagging of your
clusters. These buttons manage multiple clusters at one time. To manage
one cluster, click on that cluster in the main area of the screen.

{% include_relative
_topics/performing_smartstate_analysis_on_clusters.md %}

## Comparing Clusters

{{ site.data.product.title }} provides features to compare properties of clusters.

1.  Navigate to menu:Compute\[Infrastructure \> Clusters\].

2.  Check the clusters to compare.

3.  Click ![1847](../images/1847.png) (**Configuration**), and then
    ![2148](../images/2148.png) (**Compare Selected items**). The
    comparison displays in a default expanded view and lists a limited
    set of properties.

    ![2203](../images/2203.png)

4.  To delete a cluster from the comparison, click
    ![1861](../images/1861.png)(**Remove this Cluster from the
    Comparison**).

5.  To go to a compressed view, click ![2024](../images/2024.png)
    (**Compressed View**). To return to an expanded view, click
    ![2023](../images/2023.png) (**Expanded View**).

6.  To change the base cluster that all other clusters compare to, click
    its label at the top of its column.

7.  To go to the cluster summary screen, click its virtual thumbnail or
    icon.

8.  There are three buttons in the taskbar to limit the type of views:

      - Click ![2178](../images/2178.png) (**All attributes**) to see all
        attributes.

      - Click ![2204](../images/2204.png) (**Attributes with different
        values**) to see only the attributes that are different across
        clusters.

      - Click ![2148](../images/2148.png) (**Attributes with the same
        values**) to see only the attributes that are the same across
        clusters.

9.  To limit the mode of the view, there are two taskbar buttons.

      - Click ![2022](../images/2022.png) (**Details Mode**) to see all
        details for an attribute.

      - Click ![2025](../images/2025.png) (**Exists Mode**) to only see if
        an attribute exists compared to the base or not. This only
        applies to attributes that can have a Boolean property. For
        example, a user account exists or does not exist, or a piece of
        hardware that does or does not exist.

This creates a comparison between clusters. Export this data or create a
report from your comparison for analysis using external tools.

{% include_relative _topics/to_create_a_comparison_report1.md %}

{% include_relative _topics/reviewing_a_cluster.md %}

{% include_relative _topics/tagging_clusters.md %}

{% include_relative
_topics/viewing_capacity_and_utilization_charts_for_a_cluster.md
%}

{% include_relative _topics/viewing_cluster_timeline.md %}

{% include_relative _topics/detecting_drift_on_clusters.md %}

{% include_relative _topics/to_create_a_drift_report1.md %}

{% include_relative _topics/removing_clusters.md %}
