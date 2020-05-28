## OpenShift Prometheus Alerts

<div class="note">

This feature is currently available as a technology preview only. For
more information on the support scope for features marked as technology
preview, see [Technology Preview Features Support
Scope](https://access.redhat.com/support/offerings/techpreview).

</div>

Prometheus is used as an external alerting component.
{{ site.data.product.title_short }} integrates Prometheus alerts for use with
OpenShift Container Platform. {{ site.data.product.title_short }} collects events
from Prometheus, generates alerts based on these events, and then
attaches alerts to inventory objects.

It is possible to view ongoing alerts in {{ site.data.product.title_short }} by
navigating to menu:Monitor\[Alerts\] and manage their life cycle,
including the ability to:

  - View active alerts per provider in the **Overview** screen.

  - View alert data and related objects.

  - Comment, assign, and acknowledge alerts in the **All Alerts**
    screen.

<div class="important">

Network utilization metrics for OpenShift Container Platform are only
collected for `eth0` network interfaces. Therefore, network utilization
trend will not be displayed for network interfaces other than `eth0` on
the overview screen of the provider.

</div>

### Configuring Prometheus Alerts in {{ site.data.product.title_short }}

Configuring and enabling Prometheus alerts in {{ site.data.product.title_short }}
comprises the following steps:

1.  Deploying and configuring Prometheus on OpenShift.

2.  Assigning Prometheus alert profiles to the enterprise in
    {{ site.data.product.title_short }}.

3.  Adding an OpenShift Containers Provider with a Prometheus alert
    endpoint in {{ site.data.product.title_short }}.

#### Deploying and Configuring Prometheus on OpenShift

1.  Deploy Prometheus on OpenShift by following the steps covered in
    [Prometheus on OpenShift Container
    Platform](https://docs.openshift.com/container-platform/3.7/install_config/cluster_metrics.html#openshift-prometheus).

2.  Add Prometheus to an OpenShift cluster and configure alert
    definitions. See the example code block below for configuring alerts
    (currently must be done on the Prometheus side):

        $ oc edit configmap -n openshift-metrics prometheus
        # Supported labels:
        # severity: ERROR|WARNING|INFO. defaults to ERROR.
        # Supported annotations:
        # description: The error message displayed on the screen
        # miqTarget: ContainerNode|ExtManagementSystem, defaults to ContainerNode.
        # miqIgnore: "true|false", should ManageIQ pick up this alert, defaults to true.
          prometheus.rules: |
            groups:
            - name: example-rules
              interval: 30s # defaults to global interval
              rules:
              - alert: "NodeDown" << Alert starts here
                expr: up{job="kubernetes-nodes"} == 0
                annotations:
                  miqTarget: "ContainerNode"
                  severity: "ERROR"
                  url: "https://www.example.com/node_down_fixing_instructions"
                  description: "Node {{$labels.instance}} is down"
              - alert: "TooManyRequests"
                expr: rate(authenticated_user_requests[2m]) > 12
                annotations:
                  miqTarget: "ExtManagementSystem"
                  severity: "ERROR"
                  url: "https://www.example.com/too_many_requests_fixing_instructions"
                  description: "Too many authenticated requests"

3.  Reload the Prometheus configuration. You can do this by deleting the
    Prometheus pod, then redeploying with the new configuration.

#### Assigning Prometheus Alert Profiles to the Enterprise

Complete the following procedure to assign Prometheus alert profiles to
the enterprise using the {{ site.data.product.title_short }} user interface.

<div class="note">

Both Node and Provider alert profiles are created automatically during
the installation, so it is not required to create these profiles.

</div>

1.  Navigate to menu:Control\[Explorer\], then click **Alert Profiles**
    in the accordion menu.

2.  Click to expand **Node Alert Profiles**, then click **Prometheus
    Node Profile**.

3.  Click ![Configuration](/images/1847.png) (**Configuration**), then
    click ![1851](/images/1851.png) (**Edit assignments for this Alert
    Profile**). Assign the profile to **The Enterprise** from the
    **Assign To** list.

4.  Click **Save**.

5.  Click to expand **Provider Alert Profiles**, then click **Prometheus
    Provider Profile**.

6.  Click **Configuration**, then click **Edit assignments for this
    Alert Profile**. Assign the profile to **The Enterprise** from the
    **Assign To** list.

7.  Click **Save**.

    <div class="note">

    Alerts triggered before assigning the profiles to the enterprise
    will not appear in {{ site.data.product.title_short }} at all.

    </div>

#### Adding an OpenShift Containers Provider with a Prometheus Alert Endpoint

Complete the following procedure to add an OpenShift Containers Provider
with a Prometheus Alert Endpoint using the {{ site.data.product.title_short }} user
interface.

{% include provider-ocp-add-container.md %}

Once you have completed the procedure, you will have OpenShift
Prometheus alerts enabled in {{ site.data.product.title_short }}, and can manage
their life cyle from the menu:Monitor\[Alerts\] screen in the user
interface.
