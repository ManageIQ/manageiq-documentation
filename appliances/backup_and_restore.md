---
---

# Backup
Creating a backup of the appliance will be done using SSH or the console.

1. Launch `appliance_console`
   1. Select `Stop EVM Server Processes` to stop the server processes
   2. Select `Create Database Backup` and choose a backup location (/tmp/evm_db.backup is the default)
   3. Select `Quit` to return to the shell
2. For convenience, create a TGZ containing all files required to restore the database
   ```bash
     tar -czvf /root/backup.tgz /tmp/evm_db.backup /var/www/miq/vmdb/GUID /var/www/miq/vmdb/certs/v2_key
   ```

3. Save and/or rename `/root/backup.tgz`

# Scheduling Database Backups
Scheduling a database backup using crontab and pg_dump.
This example will create a backup file in `/tmp` named something like `db_dump20231009T145028.dump`.
Before adding the cron job it would be best practice to mount an external storage and adjust the example accordingly.

1. SSH into the appliance and edit the root user crontab `crontab -e`
2. Press `i` to insert and add a line with the desired schedule to run the backup job. Examples:
   ```bash
     # Every hour on the hour
     0 * * * * pg_dump -Fc vmdb_production > /tmp/db_dump$(date +\%Y\%m\%dT\%H\%M\%S).dump
     # Every day at midnight
     0 0 * * * pg_dump -Fc vmdb_production > /tmp/db_dump$(date +\%Y\%m\%dT\%H\%M\%S).dump
     # Every week at midnight on Sunday
     0 0 * * 0 pg_dump -Fc vmdb_production > /tmp/db_dump$(date +\%Y\%m\%dT\%H\%M\%S).dump
   ```
3. Press `Esc` to exit insert mode then `:wq` and hit `Enter` to write and quit.  If successful, it will output `crontab: installing new crontab`
4. Done. If needed, logs can be found at `/var/log/cron`

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
   1. If this is a brand new appliance and the database has not yet been initialized, select `Configure Application`. If this is an existing database appliance, this step can be skipped.
      1. When prompted to configure the database, select `Create Internal Database`
      2. When prompted to configure messaging, select `Make No messaging changes`
      3. Choose a database disk
      4. Answer y or n to "Should this appliance run as a standalone database server?"
      5. Enter a region number (0), this is not important and will be overwritten on restore
      6. Set a database password
      7. Wait for database initialization to complete.
   2. Select `Stop EVM Server Processes`
   3. Select `Restore Database From Backup`
      - Decide whether you want to delete the backup file in /tmp after restore. (Yes)
   4. Select `Start EVM Server Processes`
4. After a few minutes, you can log into the web UI and see all of the data contained in the backup.
