---
---

## Collection Filtering

When querying collections, filters can be specified by providing one or
more filter\[\]=…​ parameter.

    GET /api/:collection?filter[]=...&filter[]=...&filter[]=...

Syntax for a filter is as follows:

    filter[]=attribute op value

By default, filters are logically *anded* together, for a logical or,
prefix the attribute with *or* as follows:

    filter[]=or attribute op value

Where op supports the following operators:

<table>
<colgroup>
<col style="width: 20%" />
<col style="width: 20%" />
<col style="width: 60%" />
</colgroup>
<thead>
<tr class="header">
<th>Operator</th>
<th>Description</th>
<th>Operands</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p>=</p></td>
<td><p>Equality</p></td>
<td><p>Numeric or string. For String, supports % or * as wildcard</p>
<p>NULL or nil can also be specified instead of quoted string</p></td>
</tr>
<tr class="even">
<td><p>!=</p></td>
<td><p>Inequality</p></td>
<td></td>
</tr>
<tr class="odd">
<td><p>&lt;</p></td>
<td><p>Less Than</p></td>
<td><p>Numeric</p></td>
</tr>
<tr class="even">
<td><p>&lt;=</p></td>
<td><p>Less Than or Equal</p></td>
<td><p>Numeric</p></td>
</tr>
<tr class="odd">
<td><p>&gt;=</p></td>
<td><p>Greater Than or Equal</p></td>
<td><p>Numeric</p></td>
</tr>
<tr class="even">
<td><p>&gt;</p></td>
<td><p>Greater Than</p></td>
<td><p>Numeric</p></td>
</tr>
</tbody>
</table>

When strings, value to be quoted in single or double quotes. When
datetimes, only strict comparison operators are supported.

Example Query VMs named sample\*, created\_on \> 2019-09-01, and return
name and vendor

    GET /api/vms?expand=resources&attributes=name,vendor&filter[]=created_on>2019-09-01&filter[]=name='sample%'

Example Query looking for services that are retired but have an
unspecified service\_id

    GET /api/services?expand=resources&attributes=retired&filter[]=service_id=nil&filter[]=retired=true

Attributes specified via the filter\[\] parameter can include virtual
attributes, including one level association of the virtual attribute as
follows:

The HTTP **OPTIONS** request can be used on a collection to display all
of the collection specific metadata, including the available virtual
attributes. For more information please refer to the [Collection
Metadata](../appendices/collection_metadata.html) page.

    GET /api/vms?attributes=name,vendor,hardware&filter[]=vendor='vmware'&filter[]=hardware.memory_mb>=8192

Here filtering on the virtual attribute *hardware* including the one
level association *memory\_mb* off hardware.
