## Creating a custom TLS secret

It is possible to run with a custom TLS certificate. To do this, create the required secret with the correct parameters using the folowing example and provide that secret name as `tlsSecret` in the CR.

```bash
$ oc create secret tls tls-secret --cert=tls.crt --key=tls.key`
```
