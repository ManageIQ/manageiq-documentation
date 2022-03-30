## Preparing the Kubernetes namespace
The operator directory referenced below can be found [here]({{ site.data.product.operator_directory }})

1. Search for the Custom Resource Definition (CRD) and create it if it doesn't already exist.

        $ oc get crds | grep {{ site.data.product.operator_custom_resource_definition_name_plural }}.{{ site.data.product.operator_namespace }}
        $ oc create -f config/crd/bases/{{ site.data.product.operator_namespace }}_{{ site.data.product.operator_custom_resource_definition_name_plural }}.yaml

2. Create your namespace

        # Openshift:
        $ oc new-project your-project
        # --- OR ---
        # Kubernetes:
        $ kubectl create namespace your-project
        $ kubectl config set-context --current --namespace=your-project

3. Set up RBAC.

        $ oc create -f config/rbac/role.yaml
        $ oc create -f config/rbac/role_binding.yaml
        $ oc create -f config/rbac/service_account.yaml

4. Deploy the operator in your namespace.

        $ oc create -f config/manager/manager.yaml
