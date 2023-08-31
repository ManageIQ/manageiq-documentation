## Using TLS to encrypt connections between pods inside the cluster:

### Create a secret containing all of the certificates
The certificates should all be signed by a CA and that CA certificate should be in uploaded as `root_crt` so that it can be used to verify connection validity.  If the secret is named `internal-certificates-secret`, no changes are needed in the CR, if you choose a different name, that should be set in the `internalCertificatesSecret` field of the CR.

```sh
    oc create secret generic internal-certificates-secret \
      --from-file=root_crt=./certs/root.crt \
      --from-file=root_key=./certs/root.key \
      --from-file=httpd_crt=./certs/httpd.crt \
      --from-file=httpd_key=./certs/httpd.key \
      --from-file=kafka_crt=./certs/kafka.crt \
      --from-file=kafka_key=./certs/kafka.key \
      --from-file=memcached_crt=./certs/memcached.crt \
      --from-file=memcached_key=./certs/memcached.key \
      --from-file=postgresql_crt=./certs/postgresql.crt \
      --from-file=postgresql_key=./certs/postgresql.key \
      --from-file=api_crt=./certs/api.crt \
      --from-file=api_key=./certs/api.key \
      --from-file=remote-console_crt=./certs/remote-console.crt \
      --from-file=remote-console_key=./certs/remote-console.key \
      --from-file=ui_crt=./certs/ui.crt \
      --from-file=ui_key=./certs/ui.key
```

### Generating certificates:
We need a CA and certificates for each service.  The certificates need to be valid for the internal kubernetes service name (i.e. httpd, postgres, etc.) and the services that are backing the route (ui & api) also need the certificate to include a SAN with the application domain name.  For example, the certificate for the UI needs to be valid for the hostname `ui` and also `your_application.apps.example.com`.
If you want a script that will generate these certificates for you, see: https://github.com/ManageIQ/manageiq-pods/blob/master/tools/cert_generator.rb
