## Configuring OpenID-Connect Authentication

To run with OpenID-Connect Authentication, customize the following example as required to fit your environment.
For this example we tested with Keycloak version 11.0

Create a secret containing the OpenID-Connect's `Client ID` and `Client Secret`.
The values for `CLIENT_ID` and `CLIENT_SECRET` come from your authentication provider's client definition.

```bash
$ oc create secret generic <name of your kubernetes secret> --from-literal=CLIENT_ID=<your auth provider's client ID> --from-literal=CLIENT_SECRET=<your auth provider's client secret>
````

Modify the CR with the following values:

```yaml
httpdAuthenticationType: openid-connect
oidcProviderURL: https://<your keycloak FQDN>/auth/realms/<your realm>/.well-known/openid-configuration
oidcClientSecret: <name of your kubernetes secret>
```
