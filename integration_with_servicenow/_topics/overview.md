## Overview

{{ site.data.product.title_short }} integration with ServiceNow enables authentication with
an existing ServiceNow database and **add/amend** items in the
ServiceNow database during state machine processing, such as the virtual
machine provisioning state machine. Note that information in this guide
assumes you have credentials and access to a ServiceNow database
instance.

The following new namespace and class delivers support for the
management of **ServiceNow Configuration Management Database** (CMDB)
records using **ServiceNow’s RESTful** web service.

    /Integration/ServiceNow/CMDB

You can manage records in the **CMDB\_CI\_SERVER** table, including
`create`, `update`, and/or `delete`. The following methods are included:

| Method        | Action                                                                    |
| ------------- | ------------------------------------------------------------------------- |
| create        | Create record in specified ServiceNow table.                              |
| delete        | Delete record in specified ServiceNow table.                              |
| get           | Get record from specified ServiceNow table and list its attributes.       |
| get\_all      | Get all records in ServiceNow and list attributes.                        |
| update        | Get specified record, update required attributes and post updated record. |
| update\_patch | Post required attributes to specified record.                             |

**Note:**

Configuration item (CI) and record are used interchangeably and refer to
items in a ServiceNow database table.
