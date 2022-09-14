## Configuring OpenID-Connect Authentication

To run with OpenID-Connect Authentication, customize the following example as required to fit your environment.
For this example we tested with Keycloak version 11.0

Create a secret containing the OpenID-Connect's `Client ID` and `Client Secret`.
The values for `CLIENT_ID` and `CLIENT_SECRET` come from your Keycloak client definition.

```bash
$ oc create secret generic <name of your openshift client secret> --from-literal=CLIENT_ID=<your Keycloak client ID> --from-literal=CLIENT_SECRET=<your Keycloak client secret>
````

Modify the CR with the following values:

```yaml
httpdAuthenticationType: openid-connect
oidcProviderURL: https://<your keycloak FQDN>/auth/realms/<your Keycloak Realm>/.well-known/openid-configuration
oidcClientSecret: <name of your openshift client secret>
```
