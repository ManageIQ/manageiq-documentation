## Managing Record Attributes

You can specify any attribute via the **URI** or **CMDB** class
instance. If neither exists, the value is determined from the
{{ site.data.product.title }} **VM** or **miq\_provision** objects.

The attributes can be reduced or extended as required by amending the
Ruby methods.

<div class="note">

Some attributes are not free-text (variable) fields, that is, they must
be specific values. For example, the `vendor` value must already exist
in the ServiceNow Vendor table beforehand.

</div>

### Create and Update (\_patch) Record

You can use the following attributes when creating and/or updating a
record.

#### Attribute

|                    |                                                   |
| ------------------ | ------------------------------------------------- |
| Attribute          | Value                                             |
| virtual            | Boolean true or false, set to true.               |
| name VMs           | Virtual infrastructure name.                      |
| short\_description | {{ site.data.product.title }} virtual machine GUID.             |
| host\_name         | The virtual machine’s operating system hostname.  |
| cpu\_count         | The virtual machine’s CPU count.                  |
| ram                | The virtual machine’s memory.                     |
| vendor             | The virtual machine’s hardware vendor (provider). |
| sys\_id \[1\]      | ServiceNow record unique system ID.               |

### Get and Delete Record

You can use the following attribute for getting or deleting a record.

|           |                                     |
| --------- | ----------------------------------- |
| Attribute | Value                               |
| sys\_id   | ServiceNow record unique system ID. |

### Get All Records

There are no attributes required to get all records. This method gets
all records in the specified **ServiceNow table** and writes their
attributes to `automation.log`.

1.  sys\_id attribute is not required during `create`. Its value is
    returned from the `create` request and the {{ site.data.product.title }} object
    custom attribute **servicenow\_sys\_id** is created and updated.
