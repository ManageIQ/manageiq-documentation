You can also configure {{ site.data.product.title_short }} to perform a *SmartState
Analysis*. This type of analysis collects details such as accounts,
drivers, network information, hardware, and security patches on assets
managed by the OpenStack provider. Enabling SmartState Analysis involves
two steps:

1.  [Configuring {{ site.data.product.title_short }} Capacity and
    Utilization](#cf-caputils), and

2.  [Enabling SmartState Analysis](#cf-smartproxy)

These steps are required to allow {{ site.data.product.title_short }} to collect
metrics from OpenStack and use them to perform a SmartState analysis.
You can choose different servers to perform either function; the
following sections assume that you will.

#### Configuring {{ site.data.product.title_short }} Capacity and Utilization

{% include cap-util-note-metrics-collection.md %}

To enable these server roles:

{% include cap-util-assign-server-roles.md %}

For more information, see [Capacity and Utilization
Collection](https://access.redhat.com/documentation/en/red-hat-cloudforms/4.1/deployment-planning-guide/#capacity_and_utilization_collection)
from the *Deployment Planning Guide*.

#### Enabling SmartState Analysis

{% include smartstate.md %}
