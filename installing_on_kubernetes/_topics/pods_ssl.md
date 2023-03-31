## Using TLS to encrypt connections between pods inside the cluster:

### Create a secret containing all of the certificates
The certificates should all be signed by a CA and that CA certificate should be in uploaded as `root_crt` so that it can be used to verify connection validity.  If the secret is named `internal-certificates-secret`, no changes are needed in the CR, if you choose a different name, that should be set in the `internalCertificatesSecret` field of the CR.

```sh
    oc create secret generic internal-certificates-secret \
      --from-file=root_crt=./certs/root.crt \
      --from-file=httpd_crt=./certs/httpd.crt \
      --from-file=httpd_key=./certs/httpd.key \
      --from-file=kafka_truststore=<path>/kafka.truststore.jks \
      --from-file=kafka_keystore=<path>/kafka.keystore.jks \
      --from-literal=kafka_keystore_pass=<keystore-password> \
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

### Generating Kafka certificate stores:
In order to enable TLS for Kafka, Java KeyStore files (`.jks`) containing the CA (i.e. `root_crt`) will need to be provided alongside the password for the keystores. The keystores should following naming conventions `kafka.truststore.jks` and `kafka.keystore.jks` as well as use the same password for both. If you want a script to generate the keystores for you, see: https://github.com/ManageIQ/manageiq-pods/blob/master/tools/keystore_generator.sh

**Note:** If using the script, you will need to provide the paths to your CA certificate and key (`root.crt` and `root.key` if using `cert_generator.rb`) as well as the keystore password of your choice.
```sh
manageiq-pods % ./tools/keystore_generator.sh
Enter CA cert path:
./tools/certs/root.crt
Enter CA key path:
./tools/certs/root.key
Set Keystore password:
******
```
