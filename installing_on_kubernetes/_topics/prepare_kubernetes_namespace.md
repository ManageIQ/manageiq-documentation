## Preparing the Kubernetes namespace
The deploy directory referenced below can be found [here]({{ site.data.product.operator_directory }}/deploy)

1. Search for the Custom Resource Definition (CRD) and create it if it doesn't already exist.

        $ oc get crds | grep {{ site.data.product.operator_custom_resource_definition_name_plural }}.{{ site.data.product.operator_namespace }}
        $ oc create -f deploy/crds/{{ site.data.product.operator_namespace }}_{{ site.data.product.operator_custom_resource_definition_name_plural }}_crd.yaml

2. Set up RBAC.

        $ oc create -f deploy/role.yaml
        $ oc create -f deploy/role_binding.yaml
        $ oc create -f deploy/service_account.yaml

3. Deploy the operator in your namespace.

        $ oc create -f deploy/operator.yaml
