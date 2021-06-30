Creating a database dump from the appliance console can be used to provide additional information
when raising a support case. Options exist to generate a database dump excluding specified tables
and to split the database dump into multiple parts.

Database dumps require name or location information based on the `Dump Output File Name` selection:

|                              |          |
| ---------------------------- | -------- |
| Local File                   | Location |
| Network File System (NFS)    | Location |
| Samba (SMB)                  | Location |
| Amazon S3                    | Name     |
| File Transfer Protocol (FTP) | Location |
| ftp to dropbox.redhat.com    | Name     |

To create a database dump:

1.  SSH into the appliance console as `root`.

2.  Press any key to continue.

3.  Type `appliance_console` and press `Enter`.

4.  From the Advanced Settings, select option 5, `Create a Database Dump`.

5.  Select a `Dump Output File Name` from the list.

6.  Enter the location or name to save the dump file to.

7.  (Optional) Select tables to exclude from the dump:

    1.  Enter `Y` to exclude tables. Select `N` to skip the operation.

    2.  Enter the table names in a space-separated list:

            metrics_* vim_performance_states event_streams

8.  (Optional) Split the database dump output into multiple parts:

    1.  Enter `Y` to split the database dump output. Select `N` to skip
        the operation.

    2.  Enter the size to split by, ex `250M` or `1G`.

The database dump is created and sent to the specified location.
