### Configuring the Database to use SSL

{{ site.data.product.title_short }} initially connects to the database through an unencrypted communication. If you are using multiple appliances that are connecting to a single database appliance, you can set up the database connection to use SSL. An SSL connection encrypts the communication between the {{ site.data.product.title_short }} and the database.

The procedures in this section use the SSL certificate and the following key files. These files can be found on your main {{ site.data.product.title_short }} database appliance.

**Note:**

The appliance image ships with a default SSL certificate and it is recommended to change this certificate. You can use a certificate that is signed by a trusted CA, or generate a self-signed certificate.

For more information, see [Generating SSL Certificates for Your Appliance and Database](#generating-ssl-certificates-for-your-appliance-and-database).

  - `/var/www/miq/vmdb/certs/server.cer` - Signed or self-signed certificate for the database appliance.
  - `/var/www/miq/vmdb/certs/server.cer.key` - Private key for server certificate.

It is also recommended to stop all {{ site.data.product.title_short }} services before configuring the database to use SSL.

#### Configure SSL on the database appliance

To configure SSL on the database appliance:

1.  Log in as `root` to the appliance where the database resides.

2.  Stop the `evmserverd` and `postgresql` services:

        $ systemctl stop evmserverd
        $ systemctl stop postgresql.service

3.  Install the server key file in the correct location and set the ownership and permissions for it:

        $ install -m 600 -o postgres -g postgres \
        /var/www/miq/vmdb/certs/server.cer.key /var/lib/pgsql/data/postgres.key

4.  Install the server certificate file in the correct location and set the ownership and permissions for it:

        $ install -m 644 -o postgres -g postgres \
        /var/www/miq/vmdb/certs/server.cer /var/lib/pgsql/data/postgres.crt

5.  Open the `/var/lib/pgsql/data/postgresql.conf` file and uncomment and edit the `ssl` option:

        ssl=on

    In the same file, locate the options `ssl_cert_file` and `ssl_key_file` that specify the location of SSL
    certificates and edit them so that they are uncommented and point to the correct certificate files:

        ssl_cert_file = 'postgres.crt'  # (change requires restart)
        ssl_key_file  = 'postgres.key'  # (change requires restart)

6.  Open the `/var/lib/pgsql/data/pg_hba.conf` file and locate the two lines that contain:

        host      all      all   all           md5
        #hostssl  all      all   all           md5

    Modify the two lines to comment the `host` entry and uncomment the `hostssl` entry:

        #host     all      all   all           md5
        hostssl   all      all   all           md5

    This changes the incoming communication protocol to use SSL and refuse any unencrypted PostgreSQL connections.

7.  Start the `postgresql` and `evmserverd` services so that the changes take effect:

        $ systemctl start postgresql.service
        $ systemctl start evmserverd

#### Configure SSL on all connected appliances

The database appliance now accepts only connections from connecting appliances that use SSL. The following procedure sets up connecting appliances to communicate to the database by using SSL. Use this procedure for each connecting appliance:

1.  Log in as `root` to the connecting appliance.

2.  Copy the root certificate file from the database to the operating system's list of valid certificates:

        $ DATABASE=[database_appliance_fqdn]
        $ scp root@${DATABASE}:/var/www/miq/vmdb/certs/root.crt /etc/pki/ca-trust/source/anchors/${DATABASE}-postgres
        $ update-ca-trust extract
        $ export PGSSLROOTCERT=/etc/pki/tls/certs/ca-bundle.crt

    Where `[database_appliance_fqdn]` is the fully qualified domain name of the database appliance.

3.  Test the certificate got added to the certificate database:

        $ openssl x509 -in /etc/pki/tls/certs/ca-bundle.crt -text -noout

4.  Test the connection between the connecting appliance and the database appliance by using the `psql`command:

        $ PGSSLMODE=verify-full psql -h [database_appliance_fqdn] -d vmdb_production \
          -c "SELECT * from pg_stat_ssl WHERE pid=pg_backend_pid()"
        Password: ********
        psql (9.2.8)
        SSL connection (cipher: DHE-RSA-AES256-SHA, bits: 256)
        Type "help" for help.

        vmdb_production=#

    The `psql` displays information about the SSL connection, which indicates that the configuration succeeded. Enter `\q` to leave `psql`.
    The `PGSSLMODE` variable forces a certain level of SSL. To learn more, please see [postgress sslmode documentation].

    [postgress sslmode documentation]: https://www.postgresql.org/docs/current/libpq-connect.html#LIBPQ-CONNECT-SSLMODE
 
5.  Ensure `/etc/default/manageiq.properties` has the proper ssl key file location defined:

        $ grep PGSSLROOTCERT /etc/default/manageiq.properties || \
        echo PGSSLROOTCERT=/etc/pki/tls/certs/ca-bundle.crt >> /etc/default/manageiq.properties

    The standard `manageiq.properties` should already have the `PGSSLROOTCERT` defined.
    The above command adds an entry to `manageiq.properties` if it is not already present.

Complete this procedure for each external appliance. This enhances the security of all database transactions in your {{ site.data.product.title_short }} infrastructure.

#### Hardening TLS Protocol Version

After configuring the database to use SSL, protocol TLS version 1.2 is used as default. The older versions of this protocol (TLS 1.0 and 1.1) are still available for clients to choose. You can disable older versions by inserting the following lines into
`/var/lib/pgsql/data/postgresql.conf`:

    ssl_ciphers = 'TLSv1.2:!aNULL'
    ssl_prefer_server_ciphers=true
