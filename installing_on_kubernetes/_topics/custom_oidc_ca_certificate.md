## Configuring OpenID-Connect with a CA Certificate

To configure OpenID-Connect with a CA certificate follow these steps:

Acquire the CA certificate (precisely how to obtain the CA certificate is beyond the scope of this document) and store it in a secret using the following example.
```bash
$ oc create secret generic <name of your openshift OIDC CA cert> --from-file=<path to your OIDC CA cert file>
```
Modify the CR to identify the secret just created.
```yaml
oidcCaCertSecret: <name of your openshift OIDC CA cert>
```