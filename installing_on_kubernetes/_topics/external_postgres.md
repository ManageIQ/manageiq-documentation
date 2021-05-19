## External postgresql

Running with an external Postgres server is an option, if you want the default internal Postgres you can skip this step. Additionally, if you want to secure the connection, you need to include the optional parameters `sslmode=verify-full` and `rootcertificate` when you create the secret. To do this, manually create the secret and substitute your values before you create the CR.

        $ oc create secret generic postgresql-secrets \
          --from-literal=dbname=vmdb_production \
          --from-literal=hostname=YOUR_HOSTNAME \
          --from-literal=port=5432 \
          --from-literal=password=YOUR_PASSWORD_HERE \
          --from-literal=username=YOUR_USERNAME_HERE \
          --from-literal=sslmode=verify-full \ # optional
          --from-file=rootcertificate=path/to/optional/certificate.pem # optional

Note: If wanted, the secret name is also customizable by setting `databaseSecret` in the CR.
