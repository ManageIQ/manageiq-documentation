## Step 1. Remove the CR that was created in Step 6

WARNING: This includes Persistent Volume Claims and secrets, so all data stored by the application will be removed.
The following command removes everything except for the operator:
```bash
$ oc delete -f config/samples/_{{ site.data.product.operator_api_version }}_{{ site.data.product.operator_custom_resource_definition_name_singular }}.yaml
```
## Step 2. Remove the Operator deployment

If you deployed the operator using Step 4 option 1 or 2, run the following to remove it:
```bash
$ oc delete -f config/manager/manager.yaml
```
## Step 3. Remove the RBAC that was added in Step 3
```bash
$ oc delete -f config/rbac/role.yaml
$ oc delete -f config/rbac/role_binding.yaml
$ oc delete -f config/rbac/service_account.yaml
```
## Step 4. Remove the Namespace created in Step 2 if it is no longer needed (optional)
```bash
$ oc delete project your-project
```
## Step 5. Remove the CRD (optional)

WARNING: Ensure that there are no other application instances in any other namespace in the cluster since this is a cluster-wide change.
```bash
$ oc delete -f config/crd/bases/{{ site.data.product.operator_namespace }}_{{ site.data.product.operator_custom_resource_definition_name_plural }}.yaml
```
