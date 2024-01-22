---
---

# Red Hat OpenShift

## Obtaining an OpenShift Container Platform Management Token

First you have to create a service-account with the proper permissions for {{ site.data.product.title_short }}.

1. Create a namespace for the service account
   ```
   project_name="management-manageiq" # Pick a name for your project
   oc adm new-project $project_name --description="ManageIQ Project"
   ```

2. Create a service account in that project
   ```
   service_account_name="management-admin"
   oc create serviceaccount $service_account_name -n $project_name
   ```

3. Create the cluster role
   ```
   echo '{"apiVersion": "authorization.openshift.io/v1", "kind": "ClusterRole", "metadata": {"name": "management-manageiq-admin"}, "rules": [{"resources": ["pods/proxy"], "verbs": ["*"]}]}' | oc create -f -
   ```

4. Apply roles and policies to the service account
   ```
   oc policy add-role-to-user -n $project_name admin -z $service_account_name
   oc policy add-role-to-user -n $project_name management-manageiq-admin -z $service_account_name
   oc adm policy add-cluster-role-to-user cluster-reader system:serviceaccount:$project_name:$service_account_name
   oc adm policy add-scc-to-user privileged system:serviceaccount:$project_name:$service_account_name
   oc adm policy add-cluster-role-to-user self-provisioner system:serviceaccount:$project_name:$service_account_name
   ```

**Note:**

See the [OpenShift Container Platform documentation](https://docs.openshift.com/container-platform/4.5/authentication/using-rbac.html#default-roles_using-rbac)
for a list of the default roles.

Run the following to obtain the token needed to add an OpenShift Container Platform provider:

{% include provider-ocp-mgt-token.md %}

## Adding an OpenShift Container Platform Provider

After initial installation and creation of a {{ site.data.product.title_short }}
environment, add an OpenShift Container Platform provider using the
token obtained in
[Obtaining an OpenShift Container Platform Management Token](#obtaining-an-openshift-container-platform-management-token) and following the procedure below.

{% include provider-ocp-add-container.md %}

## Enabling OpenShift Cluster Metrics

Use the OpenShift Cluster Metrics plug-in to collect node, pod, and container metrics into one location. This helps track usage and find common issues.

  - Configure {{ site.data.product.title_short }} to allow for all three [Capacity & Utilization server roles](../deployment_planning_guide/index.html#assigning-the-capacity-and-utilization-server-roles).

  - Enable cluster metrics using the [OpenShift Container Platform documentation](https://access.redhat.com/documentation/en-us/openshift_container_platform/3.5/html-single/installation_and_configuration/#install-config-cluster-metrics).
