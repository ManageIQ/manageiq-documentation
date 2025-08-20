---
---

## Query Specification

This specification identifies the controls available when querying
collections.

The controls are specified in the GET URL as attribute value pairs as
follows:

    GET /api/:collection?attr1=val1&attr2=val2&...

### Control Attributes

| Category   | Attribute                                                                                                                            | Semantics                                                                                                                                        |
| ---------- | ------------------------------------------------------------------------------------------------------------------------------------ | ------------------------------------------------------------------------------------------------------------------------------------------------ |
| Pagination |                                                                                                                                      |                                                                                                                                                  |
|            | offset                                                                                                                               | 0-based offset of first item to return                                                                                                           |
|            | limit                                                                                                                                | number of items to return. If 0 is specified then the remaining items are returned                                                               |
|            | Please refer to [Pagination](../overview/pagination.html) for details on default pagination and pagination links provided by the API |                                                                                                                                                  |
| Scope      |                                                                                                                                      |                                                                                                                                                  |
|            | filter\[\]                                                                                                                           | One or more filters to search on. See [Filtering](#filtering) below.                                                                             |
|            | attributes=atr1,atr2,…​                                                                                                              | Which attributes in addition to id and href to return. If not specified or *all* (default is attributes=*all*), then all attributes are returned |
|            | expand=resources                                                                                                                     | To expand the resources returned in the collection and not just the href. See [Expanding Collection](#expanding-collection) below                |
| Sorting    |                                                                                                                                      |                                                                                                                                                  |
|            | sort\_by=atr1,atr2,…​                                                                                                                | By which attribute(s) to sort the result by. SQL friendly virtual attributes are also supported.                                                 |
|            | sort\_order=asc or desc                                                                                                              | Order of the sort                                                                                                                                |
|            | sort\_options=ignore\_case                                                                                                           | Option for case insensitive sort                                                                                                                 |

  - The **count** attribute in a collection always denotes the total
    number of items in the collection, not the number of items returned.

  - The **subcount** attribute in a collection denotes the number of
    items from the collection that were returned. For example, as a
    result of a paged request.

### Filtering

**GET** requests against collections support the following query
parameters to enable filtering:

  - **filter**: The filter to use for querying the collection, i.e.
    filter\[\]=name='myservice%'.

<!-- end list -->

    GET /api/:collection?filter[]=name='myservice%'

For more information on filter\[\] please reference the
[Filtering](filtering.html) page

### Expanding Collection

While in the JSON serialization example the description says that the
resources might be a list of references to these resources, using the
**expand** parameter they can be expanded to return a full JSON
serialization of the resource instead:

**GET** */api/vms*

``` json
{
  "name" : "vms",
  "count" : 2,
  "subcount" : 2,
  "resources" : [
    { "href" : "http://localhost:3000/api/vms/1" },
    { "href" : "http://localhost:3000/api/vms/2" }
  ],
  "actions" : []
}
```

**GET** */api/vms?expand=resources*

``` json
{
  "name" : "vms",
  "count" : 2,
  "subcount" : 2,
  "resources" : [
    {
      "id" : "1",
      "href" : "http://localhost:3000/api/vms/1",
      "name" : "My First VM",
      ...
    },
    {
      "id" : "2",
      "href" : "http://localhost:3000/api/vms/2",
      "name" : "My Second VM",
      ...
    }
  ],
  "actions" : []
}
```

### Virtual Attributes and Relationships

When querying resources, virtual attributes (not database columns) as
well as relationships can be queried via the attributes parameter.

For example, while accounts and software are defined subcollections of
vms

    GET /api/vms/166?expand=software&attributes=ipaddresses,lans,storage

``` json
{
  "href": "http://localhost:3000/api/vms/166",
  "id": "166",
  "vendor": "vmware",
  "name": "Dev Nightly Appl",
  "location": "Nightly Appl 201.vmx",
  "host_id": "4",
  "created_on": "2014-11-20T19:37:28Z",
  "updated_on": "2015-03-07T04:32:33Z",
  "storage_id": "12",
  "guid": "a9409862-70ec-11e4-90c6-b8e85646e742",
  "uid_ems": "422f50c6-2ba6-1059-338d-423cc3daf5b4",
  "tools_status": "toolsNotRunning",
  "standby_action": "checkpoint",
  "power_state": "off",
  "state_changed_on": "2014-11-20T19:37:28Z",
  "connection_state": "connected",
  "memory_reserve": 0,
  "memory_reserve_expand": false,
  "memory_limit": -1,
  "memory_shares": 40960,
  "memory_shares_level": "normal",
  "raw_power_state": "poweredOff",
  ...
  "ipaddresses": [
    "192.168.100.1"
  ],
  "lans": [
    {
      "id": "8",
      "switch_id": "6",
      "name": "VM Network",
      "tag": "0",
      "created_on": "2014-11-20T19:37:23Z",
      "updated_on": "2014-11-20T19:37:23Z",
      "uid_ems": "VM Network",
      "computed_allow_promiscuous": false,
      "computed_forged_transmits": true,
      "computed_mac_changes": true
    }
  ],
  "storage": {
    "id": "12",
    "name": "StarM1-Dev",
    "store_type": "VMFS",
    "total_space": 2134061875200,
    "free_space": 385020329984,
    "created_on": "2014-11-20T19:37:22Z",
    "updated_on": "2015-03-09T13:36:05Z",
    "multiplehostaccess": 0,
    "location": "4e43dd32-c6b7543a-32bf-0010187f038c",
    "uncommitted": 845539212800,
    "ems_ref_obj": "--- !ruby/string:VimString\nstr: datastore-15624\nxsiType: :ManagedObjectReference\nvimType: :Datastore\n",
    "directory_hierarchy_supported": true,
    "thin_provisioning_supported": true,
    "raw_disk_mappings_supported": true,
    "master": false,
    "ems_ref": "datastore-15624"
  }
  "software": [
    {
      "href": "http://localhost:3000/api/vms/320/software/1",
      "id": "1",
      "name": "OpenOffice",
      "vendor": "OpenOffice.org",
      "vm_or_template_id": "166"
    }
  ]
}
```

As another example, one can query good details on hosts:

    GET /api/hosts/8?attributes=custom_attributes,ext_management_system,resource_pools,storages,vms,hardware

Of course, one needs to be careful with queries like these as the list of
VMs for a host could be quite large.

Virtual attributes can also be queried from one-to-one relationships via
the dot notation as follows:

    GET /api/hosts/8?attributes=ext_management_system.id,ext_management_system.guid,ext_management_system.name

``` json
{
  "href": "http://localhost:3000/api/hosts/8",
  "id": "8",
  "name": "test1.sample.com",
  "hostname": "test1.sample.com",
  "ipaddress": "test1.sample.com",
  "vmm_vendor": "vmware",
  "vmm_version": "5.0.0",
  "vmm_product": "ESXi",
  "vmm_buildnumber": "515841",
  ...
  "ext_management_system": {
    "name": "vcenter50",
    "guid": "e84e8c58-bdbd-11e4-8983-b8e85646e742",
    "id": "6"
  }
}
```

With attributes, database attributes, virtual attributes, and
relationships can be specified together as in the following example:

    GET /api/vms/166?attributes=name,raw_power_state,ipaddresses,storage.name

``` json
{
  "href": "http://localhost:3000/api/vms/166",
  "id": "166",
  "name": "Dev Nightly Appl",
  "raw_power_state": "poweredOff",
  "ipaddresses": [
    "192.168.253.1"
  ],
  "storage": {
    "name": "StarM1-Dev"
  }
}
```

This is helpful when specific information is needed out of resources and
helps with response time when querying large number of resources as in
the following example:

``` data
GET /api/vms?limit=1000&offset=1000&expand=resources&
    attributes=name,raw_power_state,ipaddresses,storage.name
```
