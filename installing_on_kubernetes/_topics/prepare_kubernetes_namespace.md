## Preparing the Kubernetes namespace
Prerequisite:
If you are using OpenShift, our operator will leverage the OpenShift catalog to install Strimzi for you automatically.
If not running on OpenShift, manual installation of Strimzi Kafka is required. [Strimzi](https://strimzi.io/) installation steps can be found [here](https://strimzi.io/docs/operators/latest/deploying#deploy-tasks_str). Only the Strimzi cluster operator needs to be deployed, our operator will then make the necessary requests for the resources needed from Strimzi.

The operator directory referenced below can be found [here]({{ site.data.product.operator_directory }})

1. Search for the Custom Resource Definition (CRD) and create it if it doesn't already exist.

   ```bash
   $ oc get crds | grep {{ site.data.product.operator_custom_resource_definition_name_plural }}.{{ site.data.product.operator_namespace }}
   $ oc create -f config/crd/bases/{{ site.data.product.operator_namespace }}_{{ site.data.product.operator_custom_resource_definition_name_plural }}.yaml
   ```

2. Create your namespace

   ```bash
   # Openshift:
   $ oc new-project your-project
   # --- OR ---
   # Kubernetes:
   $ kubectl create namespace your-project
   $ kubectl config set-context --current --namespace=<your project>
   ```

3. Set up RBAC.

   ```bash
   $ oc create -f config/rbac/role.yaml
   $ oc create -f config/rbac/role_binding.yaml
   $ oc create -f config/rbac/service_account.yaml
   ```

4. Deploy the operator in your namespace.

   ```bash
   $ oc create -f config/manager/manager.yaml
   ```
