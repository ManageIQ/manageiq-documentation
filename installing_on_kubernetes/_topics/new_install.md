## New Installation

### Create the Custom Resource
Make any necessary changes (i.e applicationDomain) that apply to your environment then create the CR (Custom Resource).
The operator will take action to deploy the application based on the information in the CR.
It may take several minutes for the database to be initialized and the workers to enter a ready state.

        $ oc create -f deploy/crds/{{ site.data.product.operator_namespace }}_{{ site.data.product.operator_api_version }}_{{ site.data.product.operator_custom_resource_definition_name_singular }}_cr.yaml
