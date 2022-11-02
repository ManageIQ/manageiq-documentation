## New Installation

### Create the Custom Resource

Make any necessary changes (i.e applicationDomain) that apply to your environment then create the CR (Custom Resource).
The operator will take action to deploy the application based on the information in the CR.
It may take several minutes for the database to be initialized and the workers to enter a ready state.

```bash
$ oc create -f config/samples/_{{ site.data.product.operator_api_version }}_{{ site.data.product.operator_custom_resource_definition_name_singular }}.yaml
```

### Logging In

If using internal authentication, you can now login to the MIQ web interface using the default username and password (`admin`/`smartvm`).
If using external authentication, you can now login as a user that is a member of the `initialAdminGroupName` specified in the CR.
