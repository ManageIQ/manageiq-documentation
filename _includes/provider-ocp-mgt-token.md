Run the following to obtain the token needed to add a Red Hat OpenShift provider:

1. Create the service account token
    ```bash
    oc apply -f - <<EOF
    apiVersion: v1
    kind: Secret
    metadata:
     name: $service_account_name-secret
     namespace: $project_name
     annotations:
       kubernetes.io/service-account.name: $service_account_name
    type: kubernetes.io/service-account-token
    EOF
    ```
2. Describe the secret to retrieve the full token value:

   ```bash
   oc get secret -o template --template {{.data.token}} -n $project_name $service_account_name-secret
   eyJhbGciOiJSUzI1N...
   ```
