## Migrating from Kubernetes to Appliances

### Prerequisites
1. Deploy an appliance with a database disk.  It is recommended that the appliance being deployed is the same code version as the kubernetes environment.

1. Configure the hostname and ip address on the appliance.


### Collect data from the Kubernetes environment
1. Disable the running environment to prepare for migration
   ```bash
   $ oc patch deployment orchestrator -p '{"spec":{"template":{"spec":{"containers":[{"name":"orchestrator","args": ["-c", "sleep 1d"], "command":["/bin/sh"]}]}}}}'
   ```

1. Take a backup of the database
   ```bash
   # Check for enough free disk space
   $ psql -d vmdb_production -c "SELECT pg_size_pretty(pg_database_size('vmdb_production'));"
   $ pg_dump -Fc -d vmdb_production > /var/lib/pgsql/data/postgres.dump
   # Copy the database backup to the appliance (usually under /tmp/ or somewhere that has enough space)
   ```

1. Extract the database password, encryption key, server GUID and region number
   ```bash
   $ oc rsh deploy/orchestrator
   sh-5.1$ cd /var/www/miq/vmdb/
   sh-5.1$ source ./container_env

   # Extract the database password from the database config file
   sh-5.1$ cat config/database.yml
   ---
   production:
     adapter: postgresql
     username: root
     password: xxxxxxxxxxxxxxxx
     host: postgresql
   ...

   # Extract the encryption key
   sh-5.1$ cat certs/v2_key
   ---
   :algorithm: aes-256-cbc
   :key: xxxxxxxxxlKmYTe4FijZ6TNrvZq/vg+0BUasCWTSf08=

   # Extract the server GUID
   sh-5.1$ cat GUID
   xxxxxxxx-xxxx-4f37-b1d3-03c3231689ed

   # sh-5.1$ echo $DATABASE_REGION
   0
   ```


### Configure the appliance
1. Create the encryption key
   ```bash
   # Use vi or nano to create the v2_key file with the content extracted from the orchestrator pod above
   vi /var/www/miq/vmdb/certs/v2_key
   chmod 400 /var/www/miq/vmdb/certs/v2_key
   chown manageiq:manageiq /var/www/miq/vmdb/certs/v2_key
   ```

1. Create the GUID file
   ```bash
   # Use vi or nano to create the GUID file with the content extracted from the orchestrator pod above
   vi /var/www/miq/vmdb/GUID
   chmod 644 /var/www/miq/vmdb/GUID
   chown root:root /var/www/miq/vmdb/GUID
   ```

1. Run the `appliance_console` to configure the appliance
   a. Select "Configure Application"
   b. Select "1) Create Internal Database" to create a new database.
   c. Select "3) Make No messaging changes" to skip messaging configuration for now.
   d. Choose the database disk
   e. Choose whether this will be a standalone database server
   f. Enter the region number
   g. Enter the database password from the kubernetes environment

1. Restore the database from the backup from the `appliance_console`
   a. Select "Restore Database From Backup"
   b. Enter the full path to the database backup file.  i.e. /tmp/postgres.dump
   c. Choose whether you would like to delete the dump file after the database is restored
   d. Confirm that you would like to restore the database.

1. Configure messaging through the `appliance_console`
   a. Select "Configure Application"
   b. Select "5) Make No Database Changes"
   c. Select "1) Configure this appliance as a messaging server"
   d. When prompted, Yes, you want to unconfigure messaging first.
   e. Enter the hostname, username, password and whether you would like to configure another disk for the messaging service


### Followup
1. Depending on the authentication configuration on the kubernetes environment, you may need to clear out authentication settings
   ```bash
   cd /var/www/miq/vmdb/
   bin/rails console
   # In the rails console:
   SettingsChange.all.select {|s| s.key.start_with?("/authentication")}.each {|s| s.destroy}'
   # When complete, `exit`
   ```
