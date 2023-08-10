---
---

# Backup
Creating a backup of the appliance will be done using SSH or the console.

1. Launch `appliance_console`
  a. Select `Stop EVM Server Processes` to stop the server processes
  b. Select `Create Database Backup` and choose a backup location (/tmp/evm_db.backup is the default)
  c. Select `Quit` to return to the shell
2. For convenience, create a TGZ containing all files required to restore the database
   ```bash
     tar -czvf /root/backup.tgz /tmp/evm_db.backup /var/www/miq/vmdb/GUID /var/www/miq/vmdb/certs/v2_key
   ```

3. Save and/or rename `/root/backup.tgz`

# Restore
Restoring a backup of the appliance will be done using SSH or the console.

1. Download a backup TGZ and place it in `/`
2. On the command line:
   ```bash
     cd /
     tar -zxf /backup
     rm -f /backup # if desired to save space
   ```

3. Launch `appliance_console`
  a. If this is a brand new appliance and the database has not yet been initialized, select `Configure Application`. If this is an existing database appliance, this step can be skipped.
    1. When prompted to configure the database, select `Create Internal Database`
    2. When prompted to configure messaging, select `Make No messaging changes`
    3. Choose a database disk
    4. Answer y or n to "Should this appliance run as a standalone database server?"
    5. Enter a region number (0), this is not important and will be overwritten on restore
    6. Set a database password
    7. Wait for database initialization to complete.
  b. Select `Stop EVM Server Processes`
  c. Select `Restore Database From Backup`
    1. Decide whether you want to delete the backup file in /tmp after restore. (Yes)
  d. Select `Start EVM Server Processes`
4. After a few minutes, you can log into the web UI and see all of the data contained in the backup.
