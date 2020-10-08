Configuring {{ site.data.product.title_short }} involves two steps:

1.  [Configuring {{ site.data.product.title_short }} Capacity and Utilization](../deployment_planning_guide/index.html#capacity-and-utilization-collection), and

2.  [Enabling SmartState Analysis](#enabling-smartstate-analysis)

These steps are required to allow {{ site.data.product.title_short }} to collect
metrics from OpenShift Container Platform [Enabling OpenShift Container Platform Metrics](#enabling-openshift-container-platform-metrics) and use
them to perform a SmartState analysis. You can choose different servers
to perform either function; the following sections assume that you will.

## Configuring {{ site.data.product.title_short }} Capacity and Utilization

{% include cap-util-note-metrics-collection.md %}

To enable these server roles:

{% include cap-util-assign-server-roles.md %}

For more information, see [Capacity and Utilization
Collection](https://www.ibm.com/support/knowledgecenter/SSFC4F_2.0.0/Infra_mgmt/deployment_planning_guide/index.html#capacity-and-utilization-collection)
in the *Deployment Planning Guide*.
