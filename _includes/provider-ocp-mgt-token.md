Run the following to obtain the token needed to add a Red Hat OpenShift provider:

1. Obtain the service account token name:
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

    oc describe secret -n $project_name $service_account_name-secret
    Data
    ====
    service-ca.crt:  8422 bytes
    token:           eyJhbGciOiJSUzI1N...
    ```
2. Select and describe one of the tokens to retrieve the full token
   output, replacing `management-admin-token-0f3fh` with the name of
   your token:

   ```bash
   oc describe secret -n $project_name $service_account_name-secret
   ...
   Data
   ====
   service-ca.crt:  8422 bytes
   token:           eyJhbGciOiJSUzI1N...
   ```
