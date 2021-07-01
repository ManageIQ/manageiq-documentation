## Configuring ServiceNow Connection

Configure the connection to the ServiceNow database by specifying the
credentials in the **CMDB schema** or instances within.

The following methods are included:

|                |                                                         |
| -------------- | ------------------------------------------------------- |
| snow\_server   | ServiceNow database IP address or resolvable hostname.  |
| snow\_user     | ServiceNow user account with the necessary permissions. |
| snow\_password | Associated user account password.                       |

The table name cannot be changed unless there is a specific requirement to manage records
elsewhere. Entries in this table appear in the menu: **Configuration > Base Items > Servers** menu
in the ServiceNow web user interface.

|             |                                             |
| ----------- | ------------------------------------------- |
| table\_name | ServiceNow cmdb\_ci\_server database table. |
