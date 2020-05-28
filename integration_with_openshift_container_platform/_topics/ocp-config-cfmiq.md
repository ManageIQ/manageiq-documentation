Configuring {{ site.data.product.title_short }} involves two steps:

1.  [Configuring {{ site.data.product.title_short }} Capacity and
    Utilization](#cf-caputils), and

2.  [???](#cf-smartproxy)

These steps are required to allow {{ site.data.product.title_short }} to collect
metrics from OpenShift Container Platform ([???](#ocp-metrics)) and use
them to perform a SmartState analysis. You can choose different servers
to perform either function; the following sections assume that you will.

## Configuring {{ site.data.product.title_short }} Capacity and Utilization

{% include cap-util-note-metrics-collection.md %}

To enable these server roles:

{% include cap-util-assign-server-roles.md %}

For more information, see [Capacity and Utilization
Collection](https://access.redhat.com/documentation/en-us/red_hat_cloudforms/4.7/html-single/deployment_planning_guide/#capacity-and-utilization-collection)
in the *Deployment Planning Guide*.
