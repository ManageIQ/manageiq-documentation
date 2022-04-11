In order for {{ site.data.product.title_short }} to collect OpenShift Container Platform node, pod, and container, you must first enable *cluster
metrics* for your OpenShift cluster. This involves running the OpenShift
Metrics services inside your cluster. If cluster metrics are already
enabled on OpenShift, skip this section and proceed to
[Retrieving the OpenShift Container Platform Management Token](#retrieving-the-openshift-container-platform-management-token).

**Note:** This section is an abridged version of a more detailed chapter, namely
[Enabling Cluster Metrics](https://access.redhat.com/documentation/en-us/openshift_container_platform/3.9/html/installation_and_configuration/install-config-cluster-metrics) from the OpenShift Container Platform *Installation and Configuration* documentation. Refer to that chapter for more information.

## Configuring the Required Service Accounts

Cluster metrics requires the following service accounts:

  - **metrics-deployer**

  - **heapster**

<div class="important">

If you deployed OpenShift using `openshift-ansible-3.0.20`, then the
service account and roles required for enabling metrics will already be
installed. You can skip this section and go to [Configuring Metrics
Components](#ocp-metrics-storage).

</div>

To create these accounts:

1.  Log in as an administrator to any node within the OpenShift
    Container Platform cluster.

2.  Open a terminal.

3.  Switch to the **openshift-infra** project:

        $ oc project openshift-infra

4.  Create a service account for the Metrics Deployer named
    **metrics-deployer**:

        $ oc create -f - <<API
          apiVersion: v1
          kind: ServiceAccount
          metadata:
            name: metrics-deployer
          secrets:
          - name: metrics-deployer
          API

5.  As described in [Configuring Metrics Components](#ocp-metrics-storage), the Metrics Deployer uses the
    **metrics-deployer** service account. Configure the
    **metrics-deployer** account to have **edit** permissions in the
    **openshift-infra** project:

    ```
    $ oc adm policy add-role-to-user \
    edit system:serviceaccount:openshift-infra:metrics-deployer
    ```

6.  The **heapster** account will be automatically created in [Deploying the Metrics Components](#ocp-metrics-deploy). However, pre-emptively
    grant it **cluster-reader** permission to the **openshift-infra**
    project:


    ```
    oc adm policy add-cluster-role-to-user \
    cluster-reader system:serviceaccount:openshift-infra:heapster
    ```


## Configuring Metrics Components

The Metrics Deployer installs and configures the components required for
OpenShift Container Platform metrics. By default, the Metrics Deployer
uses *self-signed certificates* to secure communication between
components. This document assumes that you will use this default. For
information on alternative secure communication configurations, see
[Using Secrets](https://access.redhat.com/documentation/en-us/openshift_container_platform/3.9/html/installation_and_configuration/install-config-cluster-metrics#metrics-using-secrets)
from the OpenShift Container Platform *Installation and Configuration*
documentation.

**Note:**

This section is an abridged version of a more detailed chapter, namely [Metrics Data Storage](https://access.redhat.com/documentation/en-us/openshift_container_platform/3.9/html/installation_and_configuration/install-config-cluster-metrics#metrics-data-storage)
in the OpenShift Container Platform *Installation and Configuration* documentation. Refer to that chapter for more information on how to deploy the metrics plug-in using persistent and non-persistent storage.

### Deploying the Metrics Components

OpenShift Container Platform uses *Hawkular Metrics* as its metrics
engine. The Metrics Deployer will install the Hawkular Metrics service;
however, you need to provide the external hostname so that
{{ site.data.product.title_short }} can reach the Hawkular Metrics service. The base configuration of the Metrics Deployer is defined in the
`/usr/share/openshift/examples/infrastructure-templates/enterprise/metrics-deployer.yaml`
file.

Before deploying OpenShift metrics, choose a storage option, then log in
as an administrator to any node within the OpenShift Container Platform
cluster. From there, open a terminal and run the corresponding command:

  - Deploying with persistent storage
    With *persistent storage*, OpenShift metrics will be stored on a
    persistent volume. This offers metrics data protection by allowing
    it to survive a pod recreation or restart. OpenShift metrics
    requires a specifically configured persistent volume; see
    [Persistent Volumes](https://access.redhat.com/documentation/en-us/openshift_container_platform/3.9/html/architecture/additional-concepts#persistent-volumes)
    in the OpenShift Container Platform *Architecture* documentation.

        $ oc new-app \
            -f /usr/share/openshift/examples/infrastructure-templates/enterprise/metrics-deployer.yaml \
            -p HAWKULAR_METRICS_HOSTNAME=HAWKULARHOST

  - Deploying with non-persistent storage
    With *non-persistent storage*, any stored metrics will be deleted
    when the pod is deleted. While it is much easier to run cluster
    metrics with non-persistent data, it does come with the risk of
    permanent data loss. So, while you no longer need to provision and
    configure a volume to store metric data, this does not offer the
    same protection as persistent storage.

        $ oc new-app \
            -f /usr/share/openshift/examples/infrastructure-templates/enterprise/metrics-deployer.yaml \
            -p HAWKULAR_METRICS_HOSTNAME=HAWKULARHOST \
            -p USE_PERSISTENT_STORAGE=false

For either command, replace *HAWKULARHOST* with the external hostname
that {{ site.data.product.title_short }} will use to reach the Hawkular Metrics
service. *HAWKULARHOST* must be a fully-qualified domain name.

Either storage method deploys the required metrics components and
creates the necessary service accounts. In particular, the metrics
components will be configured to also use the specified *HAWKULARHOST*
as its public endpoint.

### Applying the Hawkular Metrics Settings to OpenShift Container Platform

After deploying the metrics components, configure OpenShift Container
Platform to use them:

1.  Open the OpenShift Master Configuration file at
    `/etc/origin/master/master-config.yaml`. Add the
    **metricsPublicURL** parameter to the **assetConfig** section,
    specifying the *HAWKULARHOST* you specified in [Deploying the
    Metrics Components](#ocp-metrics-deploy):

        assetConfig:
            ...
            metricsPublicURL: "https://HAWKULARHOST/hawkular/metrics"

2.  Restart your OpenShift Container Platform master host:

        $ sudo systemctl restart atomic-openshift-master
