### Configuring the Database to use SSL

{{ site.data.product.title }} initially connects to the database through an unencrypted communication. If you are using multiple appliances that are connecting to a single database appliance, you can set up the database connection to use SSL. An SSL connection encrypts the communication between the {{ site.data.product.title_short }} and the database.

The procedures in this section use the SSL certificate and the following key files. These files can be found on your main {{ site.data.product.title_short }} database appliance.

**Note:**

The appliance image ships with a default SSL certificate and it is recommended to change this certificate. You can use a certificate that is signed by a trusted CA, or generate a self-signed certificate.

For more information, see [Generating SSL Certificates for Your Appliance and Database](#generating-ssl-certificates-for-your-appliance-and-database).


  - `/var/www/miq/vmdb/certs/server.cer` - Signed or self-signed certificate for the database appliance.

  - `/var/www/miq/vmdb/certs/server.cer.key` - Private key for server certificate.

  - `/var/www/miq/vmdb/certs/root.crt` - The root CA certificate used to sign the CA certificate for the {{ site.data.product.title_short }} database. You can either use a self-signed certificate or a certificate that is signed by a trusted CA to generate your root certificate.

It is also recommended to stop all {{ site.data.product.title_short }} services before configuring the database to use SSL.

To configure SSL on the database appliance:

1.  Log in as `root` to the appliance where the database resides.

2.  Stop the `evmserverd` and `postgresql` services:

        [root@appliance2 ~]# systemctl stop evmserverd
        [root@appliance2 ~]# systemctl stop postgresql.service

3.  Install the server key file in the correct location and set the ownership and permissions for it:

        [root@appliance2 ~]# install -m 600 -o postgres -g postgres \
        /var/www/miq/vmdb/certs/server.cer.key /var/www/miq/vmdb/certs/postgres.key

4.  Install the server certificate file in the correct location and set the ownership and permissions for it:

        [root@appliance2 ~]# install -m 644 -o postgres -g postgres \
        /var/www/miq/vmdb/certs/server.cer /var/www/miq/vmdb/certs/postgres.crt

5.  Install the database appliance certificate file as the root certificate in the correct location and set the ownership and
    permissions for it.

    If you are using a self-signed certificate, run:

        [root@appliance2 ~]# install -m 644 -o postgres -g postgres /var/www/miq/vmdb/certs/server.cer /var/www/miq/vmdb/certs/root.crt

    If you are using a third-party certificate, edit this command to install your root certificate.

6.  Make sure that the security context is set correctly for the files in `/var/www/miq/certs`:

        [root@appliance2 ~]# restorecon -R -v /var/www/miq/vmdb/certs

7.  Open the `/var/lib/pgsql/data/postgresql.conf` file and uncomment and edit the `ssl` option:

        ssl=on

    In the same file, locate the options `ssl_cert_file`, `ssl_key_file`, and `ssl_ca_file` that specify the location of SSL
    certificates and edit them so that they are uncommented and point to the correct certificate files:

        ssl_cert_file = '/var/www/miq/vmdb/certs/postgres.crt'  # (change requires restart)
        ssl_key_file  = '/var/www/miq/vmdb/certs/postgres.key'  # (change requires restart)
        ssl_ca_file   = '/var/www/miq/vmdb/certs/root.crt'      # (change requires restart)

8.  Open the `/var/lib/pgsql/data/pg_hba.conf` file and locate the two lines that contain:

        host      all      all   all           md5
        #hostssl  all      all   all           md5

    Modify the two lines to comment the `host` entry and uncomment the `hostssl` entry:

        #host     all      all   all           md5
        hostssl   all      all   all           md5

    This changes the incoming communication protocol to use SSL and refuse any unencrypted PostgreSQL connections.

9.  Start the `postgresql` and `evmserverd` services so that the changes take effect:

        [root@{{ site.data.product.title_short_l }}1 ~]# systemctl start postgresql.service
        [root@{{ site.data.product.title_short_l }}1 ~]# systemctl start evmserverd

The database appliance now accepts only connections from connecting appliances that use SSL. The following procedure sets up connecting appliances to communicate to the database by using SSL. Use this procedure for each connecting appliance:

1.  Log in as `root` to the connecting appliance.

2.  Create the `.postgresql` directory in your `root` user home directory.

        [root@{{ site.data.product.title_short_l }}2 ~]# mkdir /root/.postgresql

    The PostgreSQL client library, which {{ site.data.product.title }} also uses, looks to this directory for custom configuration files.

3.  Copy the root certificate file from the database appliance to the `/root/.postgresql` directory on the connecting appliance:

        [root@{{ site.data.product.title_short_l }}2 ~]# scp root@[database_appliance_fqdn]:/var/www/miq/vmdb/certs/root.crt /root/.postgresql/root.crt

    Where `[database_appliance_fqdn]` is the fully qualified domain name of the database appliance.

4.  Test the connection between the connecting appliance and the database appliance by using the `psql`command:

        [root@localhost ~]# psql -h [database_appliance_fqdn] -d vmdb_production
        Password: ********
        psql (9.2.8)
        SSL connection (cipher: DHE-RSA-AES256-SHA, bits: 256)
        Type "help" for help.

        vmdb_production=#

    The `psql` displays information about the SSL connection, which indicates that the configuration succeeded. Enter `\q` to leave `psql`.

Complete this procedure for each external appliance. This enhances the security of all database transactions in your {{ site.data.product.title }} infrastructure.

#### Hardening TLS Protocol Version

After configuring the database to use SSL, protocol TLS version 1.2 is used as default. The older versions of this protocol (TLS 1.0 and 1.1) are still available for clients to choose. You can disable older versions by inserting the following lines into
`/var/lib/pgsql/data/postgresql.conf`:

    ssl_ciphers = 'TLSv1.2:!aNULL'
    ssl_prefer_server_ciphers=true
