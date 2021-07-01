# Container Entities

This chapter provides information on managing resources on your containers providers.

## The Containers Overview Page

The containers overview page shows information on all containers providers and entities known to
{{ site.data.product.title_short }}. The **Overview** page provides links to other summary pages
which contain further information on the containers providers and entities. The **Overview** page
also provides metrics for **Aggregated Node Utilization**, **Network Utilization Trend**,
**New Image Usage Trend**, **Node Utilization**, and **Pod Creation and Deletion Trends**.

![Containers Overview](../images/containers-overview.png)

1.  Browse to menu: **Compute > Containers > Overview**.

2.  Click the desired containers entity, or provider, if applicable, for viewing the summary with further information.

**Note:**

To reliably associate pods and images, {{ site.data.product.title_short }} requires information
from the `docker-pullable` field, added in OpenShift 3.3.1.2. This can affect the results of the
**Chargeback by Image** report for older OpenShift providers, and potentially cause image
inspection (done as part of Smart State Analysis) to fail due to associating a container to the
wrong image. Consequently, {{ site.data.product.title_short }} may not report accurate information
about pods and images in OpenShift providers before version 3.3.1.2.

{% include_relative _topics/viewing_an_object_summary.md %}

## Using the Topology Widget

The **Topology** widget is an interactive topology graph, showing the status and relationships
between the different entities of the containers providers and projects to which
{{ site.data.product.title_short }} has access.

  - The topology graph includes pods, containers, services, nodes, virtual machines, hosts, routes,
    and replicators within the overall containers provider environment.
    {% include topology_widget.md %}

### Viewing the Topology for Container Providers

1.  Browse to menu: **Compute > Containers > Providers**.

2.  Click the desired containers provider for viewing the provider summary.

3.  On the provider summary page, click **Topology** in the **Overview**
    box on the right side of the page.

### Viewing the Topology for Container Provider Projects

The project topology page displays the project as the center node,
surrounded by its related entities.

1.  Browse to menu: **Compute > Containers > Projects**.

2.  Click on a project.

3.  On the project summary page, click
    ![Topology View button](../images/topologyviewbutton.png) (**Topology View**) on the
    top right side of the page.

### Limiting the Number of Containers Shown in the Topology View

1.  Navigate to the settings menu, then **My Settings**, and click on the **Visual** tab.

2.  Select the number of container items from the drop-down under
    **Topology Default Items in View**.

3.  Click **Save**.

## Analyzing Container Images with SmartState Analysis

Perform a SmartState Analysis of a container image to inspect the packages included in an image.

1.  Browse to menu: **Compute > Containers > Container Images**.

2.  Check the container image to analyze. You can check multiple images.

3.  Click **Configuration**, and then ![Perform SmartState Analysis](../images/1942.png) **Perform SmartState Analysis**.

The container image is scanned. The process will copy over any required files for the image. After
reloading the image page, all new or updated packages are listed.

To monitor the status of container image SmartState Analysis tasks, navigate to the settings menu,
then **Tasks**. The status of each task is displayed including time started, time ended, what part
of the task is currently running, and any errors encountered.

**Note:**

See
[*Scanning Container Images in {{ site.data.product.product.title_short }} with OpenSCAP*](https://access.redhat.com/documentation/en-us/red_hat_cloudforms/4.7/html-single/scanning_container_images_in_cloudforms_with_openscap/)
for details on scanning container images using OpenSCAP policies.

## Configuring Automatic Tagging for Container Entities

Container object labels in OpenShift can be used to automatically create tags and tag categories in
{{ site.data.product.title_short }}. This is done by mapping {{ site.data.product.title_short }}
tags to existing OpenShift or Kubernetes labels.

Labels from OpenShift can be mapped to {{ site.data.product.title_short }} tags for the
following container entities:

  - Projects

  - Nodes

  - Routes

  - Replicators

  - Container services

  - Pods

  - Container builds

**Note:**

Tags automatically created from OpenShift labels are completely managed by the
{{ site.data.product.title_short }} system and cannot be manually assigned or unassigned. Deleting
a mapping rule from {{ site.data.product.title_short }} immediately deletes the resulting tags.

You can view a container entity’s OpenShift labels on the entity’s details page under **Labels**.

The following example shows how to configure tagging for a node, but the same steps can be used for
mapping labels to tags on other container entities.

To configure automatic tagging on container entities using labels:

1.  Note the *key* of the OpenShift label you want to map to a {{ site.data.product.title_short }} tag. OpenShift labels consist of two parts: a *key* and a *value*.

    1.  Browse to menu: **Compute > Containers > Container Nodes**.

    2.  Select a node to open its summary page.

    3.  Under **Labels**, note the label(s) to map to {{ site.data.product.title_short }} tag(s).
        Any OpenShift labels will list the *key* in the left column of the **Labels** table, and
        the *value* in the right column of the **Labels** table.

        This node has six labels (key/value pairs) that were created in
        OpenShift and collected in the {{ site.data.product.title_short }} inventory:

        ![ocpnode summary](../images/ocpnode-summary.png)

        **Note:**

        To create an OpenShift label, see
        [Developer CLI Operations](https://docs.openshift.com/container-platform/4.7/cli_reference/openshift_cli/developer-cli-commands.html)
        in the OpenShift Container Platform *CLI Reference* guide. A new label added in OpenShift
        will only show up in {{ site.data.product.title_short }} after the next OpenShift provider
        refresh.

2.  Navigate to **Configuration** and select the region.

3.  Click the **Map Tags** tab.

4.  Click **Add** to create a new mapping rule.

    1.  Select a container entity to tag from the **Entity** list, or select **All** to tag all entities.

    2.  Specify the *key* from the OpenShift label you noted earlier in the **Label** field.

    3.  Specify a {{ site.data.product.title_short }} tag category in **Category** to map the
        label to. If the tag category does not exist yet in {{ site.data.product.title_short }}, it
        will be created automatically.

        ![add label mapping](../images/add_label_mapping.png)

    4.  Click **Add**. The mapping will show in the table on the **Map Tags** tab.

5.  Refresh the provider to complete the mapping:

    1.  Browse to menu: **Compute > Containers > Providers**.

    2.  Select the provider to refresh.

    3.  Click **Configuration**, and then
        ![2003](../images/2003.png) **Refresh Items and Relationships**.

The label will display on the entity’s summary page under **Smart Management** under
**Company Tags** as `<Category> : <value>`.

![ocp autotagged](../images/ocp-autotagged.png)

Any container entity with the OpenShift `zone` label will be tagged automatically as `category1` in
{{ site.data.product.title_short }}. If the *value* for `zone` is `south`, for example, the entity
will be tagged as `category1 : south`.

You can use these tags to create reports. See
[Monitoring, Alerts, and Reporting](../monitoring_alerts_and_reporting/index.html)
for details on creating reports.
