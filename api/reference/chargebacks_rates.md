---
---

## Chargebacks, Rates & Assignments

Queries of Chargebacks and Management of Rates is provided via the
following collections:

``` data
/api/chargebacks
```

``` data
/api/rates
```

  - [Querying Chargebacks](#querying-chargebacks)

  - [Creating Chargeback Rates](#creating-rates)

  - [Updating Chargeback Rates](#updating-rates)

  - [Deleting Chargeback Rates](#deleting-rates)

  - [Querying Assigned Chargeback Rates](#querying-assignments)

  - [Assign action for Chargeback Rates](#creating-assignments)

  - [Unassign action for Chargeback Rates](#deleting-assignments)

  - [Example of Chargeback Flow](#chargeback-flow)

### Querying Chargebacks

Querying all chargebacks in the system is simply:

    GET /api/chargebacks

or Query a specific chargeback, for example:

    GET /api/chargebacks/1

``` json
{
  "href": "http://localhost:3000/api/chargebacks/1",
  "id": "1",
  "guid": "b47a0ef0-4335-11df-aba8-001d09066d98",
  "description": "Default",
  "rate_type": "Compute",
  "created_on": "2014-11-20T19:10:03Z",
  "updated_on": "2014-11-20T19:10:03Z",
  "default": true
}
```

Optionally, one can query the rates details for a chargeback as follows:

    GET /api/chargebacks/:id/rates

Example getting additional rates details(attributes)

#### Request:

    GET /api/chargebacks/1/rates?expand=resources&attributes=description,metric,group,source,friendly_rate

#### Response:

``` json
{
  "name": "rates",
  "count": 10,
  "subcount": 8,
  "resources": [
    {
      "href": "http://localhost:3000/api/chargebacks/1/rates/8",
      "id": "8",
      "description": "Fixed Compute Cost 2",
      "group": "fixed",
      "source": "compute_2",
      "friendly_rate": "0.0 Hourly"
    },
    {
      "href": "http://localhost:3000/api/chargebacks/1/rates/7",
      "id": "7",
      "description": "Fixed Compute Cost 1",
      "group": "fixed",
      "source": "compute_1",
      "friendly_rate": "1.0 Hourly"
    },
    {
      "href": "http://localhost:3000/api/chargebacks/1/rates/6",
      "id": "6",
      "description": "Used Disk I/O in KBps",
      "group": "disk_io",
      "metric": "disk_usage_rate_average",
      "source": "used",
      "friendly_rate": "Hourly @ 0.0 + 1.0 per Kbps from 0.0 to Infinity"
    },
    {
      "href": "http://localhost:3000/api/chargebacks/1/rates/5",
      "id": "5",
      "description": "Used Network I/O in KBps",
      "group": "net_io",
      "metric": "net_usage_rate_average",
      "source": "used",
      "friendly_rate": "Hourly @ 0.0 + 0.0 per Kbps from 0.0 to Infinity"
    },
    {
      "href": "http://localhost:3000/api/chargebacks/1/rates/4",
      "id": "4",
      "description": "Allocated Memory in MB",
      "group": "memory",
      "metric": "derived_memory_available",
      "source": "allocated",
      "friendly_rate": "Hourly @ 0.0 + 1.0 per Megabytes from 0.0 to Infinity"
    },
    {
      "href": "http://localhost:3000/api/chargebacks/1/rates/3",
      "id": "3",
      "description": "Used Memory in MB",
      "group": "memory",
      "metric": "derived_memory_used",
      "source": "used",
      "friendly_rate": "Hourly @ 0.0 + 0.0 per Megabytes from 0.0 to Infinity"
    },
    {
      "href": "http://localhost:3000/api/chargebacks/1/rates/2",
      "id": "2",
      "description": "Allocated CPU Count",
      "group": "cpu",
      "metric": "derived_vm_numvcpus",
      "source": "allocated",
      "friendly_rate": "Hourly @ 0.0 + 1.0 per Cpu from 0.0 to Infinity"
    },
    {
      "href": "http://localhost:3000/api/chargebacks/1/rates/1",
      "id": "1",
      "description": "Used CPU in MHz",
      "group": "cpu",
      "metric": "cpu_usagemhz_rate_average",
      "source": "used",
      "friendly_rate": "Hourly @ 0.0 + 0.0 per Megahertz from 0.0 to Infinity"
    }
  ]
}
```

Example getting additional of rates details(relations)

#### Request:

    GET /api/rates?expand=resources&attributes=chargeback_rate,detail_measure,detail_currency,chargeable_field,chargeback_tiers

#### Response:

``` json
----{
    "name": "rates",
    "count": 138,
    "subcount": 138,
    "pages": 1,
    "resources": [
        {
            "href": "http://localhost:3090/api/rates/544",
            "id": "544",
            "enabled": true,
            "description": "Allocated CPU Count",
            "group": "cpu",
            "source": null,
            "metric": "derived_vm_numvcpus",
            "per_time": "hourly",
            "per_unit": "cpu",
            "friendly_rate": "Hourly @ 1.0 + 0.0 per Cpu from 0.0 to Infinity",
            "chargeback_rate_id": "8",
            "created_on": "2018-06-01T11:24:52Z",
            "updated_on": "2018-06-01T11:24:52Z",
            "chargeback_rate_detail_measure_id": null,
            "chargeback_rate_detail_currency_id": "1",
            "chargeable_field_id": "3",
            "sub_metric": null,
            "chargeback_rate": {
                "id": "8",
                "guid": "52a70f67-7ab8-47a0-ba36-7808ac2449e0",
                "description": "solinux1",
                "rate_type": "Compute",
                "created_on": "2018-06-01T11:24:52Z",
                "updated_on": "2018-06-01T11:24:52Z",
                "default": false
            },
            "detail_currency": {
                "id": "1",
                "code": "USD",
                "name": "United States Dollar",
                "full_name": "United States Dollar",
                "symbol": "$",
                "unicode_hex": "36",
                "created_at": "2019-06-13T18:10:32Z",
                "updated_at": "2019-07-09T13:42:36Z"
            },
            "chargeable_field": {
                "id": "3",
                "chargeback_rate_detail_measure_id": null,
                "metric": "derived_vm_numvcpus",
                "group": "cpu",
                "source": "allocated",
                "description": "Allocated CPU Count"
            },
            "chargeback_tiers": [
                {
                    "id": "11010",
                    "chargeback_rate_detail_id": "544",
                    "start": 0.0,
                    "finish": null,
                    "fixed_rate": 1.0,
                    "variable_rate": 0.0
                }
            ],
            "actions": [
                {
                    "name": "edit",
                    "method": "post",
                    "href": "http://localhost:3090/api/rates/544"
                },
                {
                    "name": "edit",
                    "method": "patch",
                    "href": "http://localhost:3090/api/rates/544"
                },
                {
                    "name": "edit",
                    "method": "put",
                    "href": "http://localhost:3090/api/rates/544"
                },
                {
                    "name": "delete",
                    "method": "post",
                    "href": "http://localhost:3090/api/rates/544"
                },
                {
                    "name": "delete",
                    "method": "delete",
                    "href": "http://localhost:3090/api/rates/544"
                }
            ]
        },
        {
            "href": "http://localhost:3090/api/rates/510",
            "id": "510",
            "enabled": true,
            "description": "Allocated CPU Count",
            "group": "cpu",
            "source": null,
            "metric": null,
            "per_time": "hourly",
            "per_unit": "cpu",
            "friendly_rate": "Hourly @ 1.0 + 0.0 per Cpu from 0.0 to Infinity",
            "chargeback_rate_id": "7",
            "created_on": "2018-03-28T10:00:13Z",
            "updated_on": "2018-03-28T10:00:13Z",
            "chargeback_rate_detail_measure_id": null,
            "chargeback_rate_detail_currency_id": "3",
            "chargeable_field_id": "3",
            "sub_metric": null,
            "chargeback_rate": {
                "id": "7",
                "guid": "a72fd416-26ec-4aa0-bc94-0b741379dfcd",
                "description": "teamA_compute_all",
                "rate_type": "Compute",
                "created_on": "2018-03-28T10:00:13Z",
                "updated_on": "2018-03-28T10:00:13Z",
                "default": false
            },
            "detail_currency": {
                "id": "3",
                "code": "GBP",
                "name": "British Pound",
                "full_name": "British Pound",
                "symbol": "£",
                "unicode_hex": "163",
                "created_at": "2019-06-13T18:10:32Z",
                "updated_at": "2019-07-09T13:42:35Z"
            },
            "chargeable_field": {
                "id": "3",
                "chargeback_rate_detail_measure_id": null,
                "metric": "derived_vm_numvcpus",
                "group": "cpu",
                "source": "allocated",
                "description": "Allocated CPU Count"
            },
            "chargeback_tiers": [
                {
                    "id": "10115",
                    "chargeback_rate_detail_id": "510",
                    "start": 0.0,
                    "finish": 'infinity',
                    "fixed_rate": 1.0,
                    "variable_rate": 0.0
                }
            ]
        },
        {
            "href": "http://localhost:3090/api/rates/1859",
            "id": "1859",
            "enabled": true,
            "description": "My CPU allocation rate",
            "group": "cpu",
            "source": "allocated",
            "metric": null,
            "per_time": "daily",
            "per_unit": "megahertz",
            "friendly_rate": "Daily @ 2.0 + 0.0 per Megahertz from 0.0 to 1.0\nDaily @ 2.0 + 0.0 per Megahertz from 1.0 to Infinity",
            "chargeback_rate_id": "1",
            "created_on": "2020-05-26T10:34:39Z",
            "updated_on": "2020-05-26T10:34:39Z",
            "chargeback_rate_detail_measure_id": "1",
            "chargeback_rate_detail_currency_id": "5",
            "chargeable_field_id": "3",
            "sub_metric": null,
            "chargeback_rate": {
                "id": "1",
                "guid": "b47a0ef0-4335-11df-aba8-001d09066d98",
                "description": "Default",
                "rate_type": "Compute",
                "created_on": "2020-04-23T14:43:50Z",
                "updated_on": "2020-04-23T15:00:29Z",
                "default": true
            },
            "detail_measure": {
                "id": "1",
                "name": "Bytes Units",
                "units": [
                    "bytes",
                    "kilobytes",
                    "megabytes",
                    "gigabytes",
                    "terabytes"
                ],
                "units_display": [
                    "B",
                    "KB",
                    "MB",
                    "GB",
                    "TB"
                ],
                "step": 1024,
                "created_at": "2020-04-23T14:43:50Z",
                "updated_at": "2020-04-23T15:00:28Z"
            },
            "detail_currency": {
                "id": "5",
                "code": "AUD",
                "name": "Australian Dollar",
                "full_name": "Australian Dollar",
                "symbol": "$",
                "unicode_hex": null,
                "created_at": "2019-06-13T18:10:32Z",
                "updated_at": "2019-07-09T13:42:35Z"
            },
            "chargeable_field": {
                "id": "3",
                "chargeback_rate_detail_measure_id": null,
                "metric": "derived_vm_numvcpus",
                "group": "cpu",
                "source": "allocated",
                "description": "Allocated CPU Count"
            },
            "chargeback_tiers": [
                {
                    "id": "13114",
                    "chargeback_rate_detail_id": "1859",
                    "start": 0.0,
                    "finish": 1.0,
                    "fixed_rate": 2.0,
                    "variable_rate": 0.0
                },
                {
                    "id": "13115",
                    "chargeback_rate_detail_id": "1859",
                    "start": 1.0,
                    "finish": 'infinity',
                    "fixed_rate": 2.0,
                    "variable_rate": 0.0
                }
            ]
        },
        ...
----
```

### Creating Chargeback Rates

Creating a Chargeback Rate is done by posting a new resource or *create*
action to the rates collection.

Example follows:

#### Request:

    POST /api/rates

``` json
{
  "per_time" : "daily",
  "chargeback_rate_id" : "1",
  "chargeable_field_id" : "1",
  "description": "My CPU allocation rate",
  "group" : "cpu",
  "per_unit" : "megahertz",
  "source" : "allocated",
  "chargeback_tiers": [
       {
          "start": 0.0,
          "finish": "infinity",
          "fixed_rate": 2.0,
          "variable_rate": 0.0
        }
   ]
}
```

#### Response:

``` json
{
    "results": [
        {
            "href": "http://localhost:3090/api/rates/1866",
            "id": "1866",
            "enabled": true,
            "description": "My CPU allocation rate",
            "group": "cpu",
            "source": "allocated",
            "metric": null,
            "per_time": "daily",
            "per_unit": "megahertz",
            "friendly_rate": "Daily @ 2.0 + 0.0 per MHz from 0.0 to Infinity",
            "chargeback_rate_id": "1",
            "created_on": "2020-05-28T13:28:15Z",
            "updated_on": "2020-05-28T13:28:15Z",
            "chargeback_rate_detail_measure_id": null,
            "chargeback_rate_detail_currency_id": null,
            "chargeable_field_id": "1",
            "sub_metric": null
        }
    ]
}
```

<div class="note">

Please refer to the [Resource
Attributes](../appendices/resource_attributes.html#chargeback-rates)
page for a list of available attributes when creating Chargeback Rates.

</div>

### Updating Chargeback Rates

Updating rates can be done by posting **edit** actions on the rates
resource.

#### Request:

    POST /api/rates/16

``` json
{
  "action" : "edit",
  "resource" : { "description" : "Allocated NICs", "per_time": "hourly" }
}
```

#### Response:

``` json
{
    "href": "http://localhost:3090/api/rates/1800",
    "id": "1800",
    "description": "Allocated NICs",
    "per_time": "hourly",
    "chargeback_rate_id": "1",
    "chargeable_field_id": "3",
    "enabled": true,
    "group": "net_io",
    "source": null,
    "metric": null,
    "per_unit": "cpu",
    "friendly_rate": "Hourly @ 2.0 + 0.0 per Cpu from 0.0 to Infinity",
    "created_on": "2020-04-23T15:00:29Z",
    "updated_on": "2020-05-28T13:24:33Z",
    "chargeback_rate_detail_measure_id": "1",
    "chargeback_rate_detail_currency_id": "5",
    "sub_metric": null
}
```

### Deleting Chargeback Rates

Deleting Chargeback Rates can be done via either the **delete** post
action or the DELETE HTTP method.

#### Request:

    POST /api/rates/16

``` json
{
  "action" : "delete"
}
```

#### Response:

``` json
{
  "success": true,
  "message": "rates id: 16 deleting",
  "href": "http://localhost:3000/api/rates/16"
}
```

or simply:

    DELETE /api/rates/16

### Querying Assigned Chargeback Rates

#### Assigned chargeback rates on single rate:

    GET /api/chargebacks/16?attributes=assigned_to

#### Response:

``` json
{
    "href": "http://localhost:3090/api/chargebacks/2",
    "id": "2",
    "guid": "7d7aaf20-5214-11df-a888-001d09066d98",
    "description": "Default",
    "rate_type": "Storage",
    "created_on": "2019-08-07T16:48:04Z",
    "updated_on": "2020-04-20T13:27:07Z",
    "default": true,
    "assigned_to": [
        {
            "tag": {
                "href": "http://localhost:3090/api/tags/48",
                "name": "finance",
                "category": "department"
            }
        },
        {
            "tag": {
                "href": "http://localhost:3090/api/tags/26",
                "name": "test",
                "category": "environment"
            }
        }
    ]
}
```

#### Assigned chargeback rates on collection:

    GET /api/chargebacks?expand=resources&attributes=assigned_to

#### Response:

``` json
{
    "name": "chargebacks",
    "count": 10,
    "subcount": 2,
    "subquery_count": 2,
    "pages": 1,
    "resources": [
        {
            "href": "http://localhost:3090/api/chargebacks/1",
            "id": "1",
            "guid": "b47a0ef0-4335-11df-aba8-001d09066d98",
            "description": "Default",
            "rate_type": "Compute",
            "created_on": "2019-08-07T16:48:04Z",
            "updated_on": "2020-05-13T09:36:21Z",
            "default": true,
            "assigned_to": [
                {
                    "object": {
                        "id": "1",
                        "name": "Enterprise",
                        "description": "Enterprise Root Object",
                        "created_on": "2017-10-06T16:35:32Z",
                        "updated_on": "2017-10-06T16:35:32Z",
                        "settings": null
                    }
                }
            ]
        },
        {
            "href": "http://localhost:3090/api/chargebacks/2",
            "id": "2",
            "guid": "7d7aaf20-5214-11df-a888-001d09066d98",
            "description": "Default",
            "rate_type": "Storage",
            "created_on": "2019-08-07T16:48:04Z",
            "updated_on": "2020-05-13T09:36:21Z",
            "default": true,
            "assigned_to": [
                {
                    "object": {
                        "id": "31",
                        "type": "ManageIQ::Providers::Vmware::InfraManager::Storage",
                        ...

                    }
                },
                {
                    "object": {
                        "id": "19",
                        "type": "ManageIQ::Providers::Vmware::InfraManager::Storage"
                         ...
                    }
                },
                {
                    "object": {
                        "id": "27",
                        "type": "ManageIQ::Providers::Vmware::InfraManager::Storage"
                         ...
                    }
                },
                {
                    "object": {
                        "id": "14",
                        "type": "ManageIQ::Providers::Vmware::InfraManager::Storage"
                        ...
                    }
                }
            ]
        }
    ]
}
```

### Assign action for Chargeback Rates

Assignments could be done for two rate types: "Compute" and "Storage".
There are few assignments type under each rates type:

### "Compute" Rate Type

  - [Enterprise](#enterprise)

  - [Selected Providers](#providers)

  - [Selected Clusters](#clusters)

  - [Tagged VMs and Instances](#tagged-vms)

  - [Tagged Container Images](#containers)

  - [Labeled Container Images](#labels)

  - [Tenants](#tenants)

### "Storage" Rate Type

  - [Enterprise](#enterprise-storage)

  - [Selected Datastores](#data-stores)

  - [Tagged Datastores](#tagged-data-stores)

  - [Tenants](#tenants-storage)

Example (chargebacks collection) - assign storage to chargeback rate
with id 2 :

``` json
{
    "action" : "assign",
    "assignments" : [
        {
            "chargeback":
            {
                "id" : 2
            },
            "resource":
            {
                "href": "http://localhost:3090/api/data_stores/12"
            }
        }
    ]
}
```

#### Response:

``` json
{
    "success": true,
    "message": "Rates assigned successfully",
    "result": [
        {
            "chargeback": {
                "href": "http://localhost:3090/api/chargebacks/2",
                "description": "Default"
            },
            "resource": {
                "href": "http://localhost:3090/api/data_stores/12",
                "name": "EXPORT"
            }
        }
    ]
}
```

### Basic Template for single chargeback request

    POST /api/chargebacks/<chargeback_id>

``` json
{
    "action" : "assign",
    "assignments" : [
        {
            <resource>
        }
    ]
}
```

### Basic Template for chargebacks collection request

    POST /api/chargebacks

``` json
{
    "action" : "assign",
    "assignments" : [
        {
            "chargeback":
            {
                <chargeback>
            },
            <resource>
        }
    ]
}
```

`<chargeback>` is same for all types of assignments. For `<chargeback>`
can be used `href` or `id`:

  - `{"href": "http://localhost:3090/api/chargebacks/1"}`

  - `{"id": "1"}`

`<resource>` can be different across types of assignments - formats are
described in next section.

### Enterprise

`<resource>:`

    "href": "http://localhost:3090/api/enterprises/1"

    POST /api/chargebacks

``` json
{
    "action" : "assign",
    "assignments" : [
        {
            "chargeback":
            {
                "id" : 2
            },
            "resource":
            {
                "href": "http://localhost:3090/api/enterprises/1"
            }
        }
    ]
}
```

Response

``` json
{
    "success": true,
    "message": "Rates assigned successfully",
    "result": [
        {
            "chargeback": {
                "href": "http://localhost:3090/api/chargebacks/2",
                "description": "Default"
            },
            "resource": {
                "href": "http://localhost:3090/api/enterprises/1",
                "name": "Enterprise"
            }
        }
    ]
}
```

### Selected Providers

`<resource>:`

    "href": "http://localhost:3090/api/enterprises/1"

### Selected Clusters

`<resource>:`

    "href": "http://localhost:3090/api/clusters/1"

### Tagged VMs and Instances

Identification can be done by tag’s name and tag’s category, by `id` or
by `href`.

`assignment_prefix` is string which partly determines type of
assignment. In this case for "VMs and Instances" value for
`assignment_prefix` is `vm`.

`<resource>:`

    - "tag": {
                "category" : "department",
                "name" : "finance",
                "assignment_prefix": "vm"
             }
    - "tag": {
                "id" : 28,
                "assignment_prefix": "vm"
             }
    - "tag": {
                "href" : 'http://localhost:3090/api/tags/28,
                "assignment_prefix": "vm"
             }

Request

    POST /api/chargebacks

    {
      "action" : "assign",
      "assignments" : [
       {
           "chargeback": { "id" : 1},
           "tag": { "category" : "department", "name" : "finance", "assignment_prefix": "vm" }
         },
         {
           "chargeback": { "id" : 1},
           "tag": { "id" : 2}
         },
         {
           "chargeback": { "id" : 3},
           "tag": { "href" : "http://localhost:3090/api/tags/28", "assignment_prefix": "vm" }
         }
      ]
    }

### Tagged Container Images

Identification can be done by tag’s name and tag’s category, by `id` or
by `href`.

`assignment_prefix` is string which partly determines type of
assignment. - In this case for "Container Images" value for
`assignment_prefix` is `container_image`

`<resource>:`

    "tag":
    {
        "category" : "department",
        "name" : "finance",
        "assignment_prefix": "container_image"
    }

or

    "tag":
    {
        "id" : 28,
        "assignment_prefix": "container_image"
    }

or

    "tag":
    {
        "href" : 'http://localhost:3090/api/tags/28,
        "assignment_prefix": "container_image"
    }

Request

    POST /api/chargebacks

    {
      "action" : "assign",
      "assignments" : [
       {
           "chargeback": { "id" : 1},
           "tag": { "category" : "department", "name" : "finance", "assignment_prefix": "vm" }
         },
         {
           "chargeback": { "id" : 1},
           "tag": { "id" : 2}
         },
         {
           "chargeback": { "id" : 3},
           "tag": { "href" : "http://localhost:3090/api/tags/28", "assignment_prefix": "vm" }
         }
      ]
    }

### Labeled Container Images

`<resource>:`

    "href": "http://localhost:3090/api/container_images/934/custom_attributes/30331"

This resource represents custom attributes on container images, so
called "labels".

Request

    POST /api/chargebacks

    {
      "action" : "assign",
        "assignments" :
        [
          {
            "chargeback": { "id" : 1},
            "resource": { "href": "http://localhost:3090/api/container_images/934/custom_attributes/30331" }
          },
          {
            "chargeback": { "id" : 1},
            "resource": { "href": "http://localhost:3090/api/container_images/934/custom_attributes/30324" }
          }
        ]
    }

### Tenants

`<resource>:`

    "href": "http://localhost:3090/api/tenants/1"

Example

Request

    POST /api/chargebacks

    {
        "action" : "assign",
        "assignments" : [
            {
                "chargeback": {
                    "id" : 2
                },
                "resource": {
                    "href": "http://localhost:3090/api/tenants/1"
                }
            },
            {
                "chargeback": {
                    "id" : 2
                },
                "resource": {
                    "href": "http://localhost:3090/api/tenants/2"
                }
            }
        ]
    }

Response

    {
        "success": true,
        "message": "Rates assigned successfully",
        "result": [
            {
                "chargeback": {
                    "href": "http://localhost:3090/api/chargebacks/2",
                    "description": "Default"
                },
                "resource": {
                    "href": "http://localhost:3090/api/tenants/1",
                    "name": "My Company"
                }
            },
            {
                "chargeback": {
                    "href": "http://localhost:3090/api/chargebacks/2",
                    "description": "Default"
                },
                "resource": {
                    "href": "http://localhost:3090/api/tenants/2",
                    "name": "OpenStack Cloud Provider OpenStack"
                }
            }
        ]
    }

### Enterprise

`<resource>:`

    "resource" :
    {
        href": "http://localhost:3090/api/enterprises/1"
    }

Request

    POST /api/chargebacks

``` json
{
    "action" : "assign",
    "assignments" : [
        {
            "chargeback":
            {
                "id" : 2
            },
            "resource":
            {
                "href": "http://localhost:3090/api/enterprises/1"
            }
        }
    ]
}
```

### Selected Datastores

`<resource>:`

    "resource":
    {
        "href": "http://localhost:3090/api/enterprises/1"
    }

Example

Request

    POST /api/chargebacks

``` json
{
    "action" : "assign",
    "assignments" : [
        {
            "chargeback" :
            {
                "id" : 2
            },
            "resource" :
            {
                "href" : "/api/data_stores/1"
            }
        }
    ]
}
```

Response

``` json
{
    "success": true,
    "message": "Rates assigned successfully",
    "result": [
        {
            "chargeback": {
                "href": "http://localhost:3090/api/chargebacks/2",
                "description": "Default"
            },
            "resource": {
                "href": "http://localhost:3090/api/data_stores/1",
                "name": "Shared-NFS"
            }
        }
    ]
}
```

### Tagged Datastores

`<resource>:`

``` json
"tag":
{
    "href": "http://localhost:3090/api/tags/26",
    "assignment_prefix": "storage"
}
```

or

``` json
"tag":
{
    "category" : "department",
    "name" : "finance",
    "assignment_prefix": "storage"
}
```

or

``` json
"tag":
{
    "id" : "26",
    "assignment_prefix": "storage"
}
```

Example

Request

    POST /api/chargebacks

``` json
{
    "action" : "assign",
    "assignments" : [
        {
            "tag": {
                "category" : "department",
                "name" : "finance",
                "assignment_prefix": "storage"
            }
        }
    ]
}
```

Response

``` json
{
    "success": true,
    "message": "Rates assigned successfully",
    "result": [
        {
            "chargeback": {
                "href": "http://localhost:3090/api/chargebacks/2",
                "description": "Default"
            },
            "tag": {
                "href": "http://localhost:3090/api/tags/48",
                "name": "finance",
                "category": "department",
                "assignment_prefix": "storage"
            }
        }
    ]
}
```

### Tenants

`<resource>:`

    "href": "http://localhost:3090/api/tenants/1"

Request

    POST /api/chargebacks

``` json
{
    "action" : "assign",
    "assignments" : [
        {
            "chargeback": {
                "id" : 2
            },
            "resource": {
                "href": "http://localhost:3090/api/tenants/1"
            }
        },
        {
            "chargeback": {
                "id" : 2
            },
            "resource": {
                "href": "http://localhost:3090/api/tenants/2"
            }
        }
    ]
}
```

Response

``` json
{
    "success": true,
    "message": "Rates assigned successfully",
    "result": [
        {
            "chargeback": {
                "href": "http://localhost:3090/api/chargebacks/2",
                "description": "Default"
            },
            "resource": {
                "href": "http://localhost:3090/api/tenants/1",
                "name": "My Company"
            }
        },
        {
            "chargeback": {
                "href": "http://localhost:3090/api/chargebacks/2",
                "description": "Default"
            },
            "resource": {
                "href": "http://localhost:3090/api/tenants/2",
                "name": "OpenStack Cloud Provider OpenStack"
            }
        }
    ]
}
```

### Unassign action for Chargeback Rates

Unassign action has same signature as assign action and action is
'unassign'.

Example

Request

    POST

``` json
{
  "action" : "unassign",
  "assignments" : [
     {
       "chargeback": { "id" : 3},
       "tag": { "category" : "prov_max_retirement_days", "name" : "30", "assignment_prefix": "vm" }
     }
  ]
}
```

### Example of Chargeback Flow

  - [Create Chargeback Report](#create-report)

  - [Create Chargeback Rates](#creating-chargeback-rates)

  - [Assign Chargeback Rates](#assign-rates)

  - [Run Chargeback Report](#run-report)

  - [Results of Chargeback Report](#report-results)

### Create Chargeback Report

    POST api/reports

    {
      "action" : "import",
      "resource" : {
        "report" : {
            "rpt_group"  : "Custom",
            "rpt_type"   : "Custom",
            "menu_name"  : "Chargeback Flow Example",
            "col_order"  : ["vm_name", "display_range", ..],
            "cols"       : ["start_date", "display_range", "vm_name", ..],
            "headers"    : ["VM Name", "Date Range", ..],
            "title"      : "Chargeback Flow Example",
            "db"         : "ChargebackVm",
            "group"      : "y",
            "sortby"     : ["vm_name", "start_date"],
            "template_type" : "report",
            "order"         : "Ascending",
            "db_options" : {
                "rpt_type" : "ChargebackVm",
                "options"  : {
                   <report_options>
                }
            }
        },
        "options" : { "save" : true }
      }
    }

Attribute `"report"` contains JSON with report definition which can be
obtained by exporting a chargeback report.

  - `db` is type of report for chargeback purposes. Possible values are
    `ChargebackVm, ChargebackContainerProject,
    ChargebackContainerImage`.

#### Chargeback Report Options

Chargeback Report Options are present on index `options` in request
json. There are also some options about filtering and grouping which are
described in this section. Default attributes are described first and
then there is explanation of attributes according to chargeback type of
report(attribute `db`).

Example Request with `options`

    POST /api/chargebacks

    "db_options" : {
            "rpt_type" : "ChargebackVm",
            "options"  : {
                "interval" : "monthly",
                "interval_size" : 12,
                "end_interval_offset" : 1,
                "tenant_id" : "1",
                "method_for_allocated_metrics" : "max",
                "include_metrics:" : true,
                "cumulative_rate_calculation" : false,
                "groupby" : "date",
                "groupby_tag" : null,
                "groupby_label" : null
            }
    }
    ...,

  - `method_for_allocated_metrics` - `max` or `avg`

  - `include_metrics` - `true` or `false` - enable/disable whether to
    include metrics data, when disable it uses current values of metric
    data or charged resources

  - `cumulative_rate_calculation` - `true` or `false` enable/disable
    cumulative calculation for tagged resources

  - `interval` is which time detail is used for the report. Possible
    values are `monthly, weekly, daily`

Metric data for chargeback report are taken from this interval:

    `<Time.now-interval_size,  Time.now-end_interval_offset>`

  - `interval_size, end_interval_offset` - attributes in `options`.
    there is used unit according to interval parameter, for example:
    when interval is "daily" then `interval_size=3` and
    `end_interval_offset=2` mean that generated report will be based on
    metrics starting 3 days ago to 1 day ago.

Request

    POST /api/chargebacks

    "report" : {
        "db_options" : {
            "options" : {
                ...
            }
        },
        ...
    }

### Filtering according to resource

This is part of json used in request below.

Each section lists possible options to filter according to resource’s
type. There are used `ids` for identification each type of resource and
and those `ids` are used in attributes according to type of resources.
Name of attributes can be find in following sections. Attributes are
located in json for request(example with tenant) on indexes `report,
db_options and options`:

Request

    POST /api/chargebacks

    "report" : {
        "db_options" : {
            "options" : {
                "tenant_id" : 1,
                ...
            }
        },
        ...
    }

#### Chargeback for VMs (db=ChargebackVm)

`tenant_id` - Tenant id

or

`owner` - `userid` of user which owns VMs.

Request

    POST /api/chargebacks

    "report" : {
        "db_options" : {
            "options" : {
                "owner" : "admin",
                ...
            }
        },
        ...
    }

or

`tag` - tag\_path of tag

Request

    POST /api/chargebacks

    "report" : {
        "db_options" : {
            "options" : {
                "tag" : "/managed/prov_max_cpu/2",
                ...
            }
        },
        ...
    }

#### Chargeback for Projects (db=ChargebackContainerProject)

`tag` - tag\_path of tag

Request

    POST /api/chargebacks

    "report" : {
        "db_options" : {
            "options" : {
                "tag" : "/managed/prov_max_cpu/2",
                ...
            }
        },
        ...
    }

or

`provider_id` - "all" or Openshift Provider id

`entity_id` - "all" or Container Project id

    "report" : {
        "db_options" : {
            "options" : {
                "provider_id" : "41",
                "entity_id" : "21",
                ...
            }
        },
        ...
    }

#### Chargeback for Container Images (db=ChargebackContainerImage)

`provider_id` - "all" or Openshift Provider id

`entity_id` - "all" or Container Image id

Request

    POST /api/chargebacks

    "report" : {
        "db_options" : {
            "options" : {
                "provider_id" : "all",
                "entity_id" : "all",
                ...
            }
        }
    }

### Grouping Report Options

#### Chargeback for VMs (db=ChargebackVm)

`groupby` - specifies a grouping option

Possible values for `groupby`:

`date` - grouping by date and Vms

`date-only` - grouping only by date

`tenant` - grouping by tenants

`tag` - name of tag category - attribute `groupby_tag` needs to be also
specified. Values for `groupby_tag` are names of tag category which can
be retrieved in `resources`

    GET
    /api/categories?expand=resources&attributes=name

#### Chargeback for Projects (db=ChargebackContainerProject)

`groupby` - specifies a grouping option

Possible values for `groupby`:

`date` - grouping by date and container projects

`date-only` - grouping only by date

`project` - grouping by container projects

`tag` - - name of tag category - attribute `groupby_tag` needs to be
also specified. Values for `groupby_tag` are names of tag category which
can be retrieved in `resources`

    GET
    /api/categories?expand=resources&attributes=name

#### Chargeback for Container Images (db=ChargebackContainerImage)

`groupby` - specifies a grouping option

Possible values for `groupby`:

`date` - grouping by date and containers

`date-only` - grouping only by date

`project` - grouping by container images

`label` - grouping by container labels and when this value is set -
attribute `groupby_tag` needs to be also specified. Values for
`groupby_tag` are names of labels which can be retrieved by
`api/container_images/:id/custom_attributes` endpoint (attribute=name)
for single container image.

Example request

    GET
    /api/container_images/934/custom_attributes?expand=resources&attributes=name&filter[]=section=docker_labels

Response

``` json
{
    "name": "custom_attributes",
    "count": 2041860,
    "subcount": 11,
    "subquery_count": 11,
    "pages": 1,
    "resources": [
        {
            "href": "http://localhost:3090/api/container_images/934/custom_attributes/30322",
            "name": "build-date",
            "id": "30322"
        },
        {
            "href": "http://localhost:3090/api/container_images/934/custom_attributes/30324",
            "name": "architecture",
            "id": "30324"
        }
    ],
    ...
}
```

#### Example of request to create chargeback report

Request

    POST /api/chargebacks

``` json
{
  "action" : "import",
  "resource" : {
    "report" : {
        "rpt_group"  : "Custom",
        "rpt_type"   : "Custom",
        "menu_name"  : "Chargeback Flow Example 1",
        "col_order"  : ["vm_name", "display_range", "chargeback_rates", "memory_allocated_metric", "memory_allocated_cost", "memory_allocated_rate", "memory_cost"],
        "cols"       : ["start_date", "display_range", "vm_name", "chargeback_rates", "memory_allocated_metric", "memory_allocated_cost", "memory_allocated_rate", "memory_cost"],
        "headers"    : ["VM Name", "Date Range", "Chargeback Rates", "Memory Allocated over Time Period", "Memory Allocated Cost" , "Memory Allocated Rate","Memory Total Cost"],
        "title"      : "Chargeback Flow Example 1",
        "db"         : "ChargebackVm",
        "group"      : "y",
        "sortby"     : ["vm_name", "start_date"],
        "template_type" : "report",
        "order"         : "Ascending",
        "db_options" : {
            "rpt_type" : "ChargebackVm",
            "options"  : {
                "interval" : "monthly",
                "interval_size" : 12,
                "end_interval_offset" : 1,
                "tenant_id" : "1",
                "method_for_allocated_metrics" : "max",
                "include_metrics:" : true,
                "cumulative_rate_calculation" : false,
                "groupby" : "date",
                "groupby_tag" : null,
                "groupby_label" : null
            }
        }
    },
    "options" : { "save" : true }
  }
}
```

Response

``` json
{
    "results": [
        {
            "success": true,
            "message": "Imported Report: [Chargeback Flow Example 1]",
            "result": {
                "id": "553",
                "name": "Chargeback Flow Example 1",
                "title": "Chargeback Flow Example 1",
                "rpt_group": "Custom",
                "rpt_type": "Custom",
                "priority": null,
                "db": "ChargebackVm",
                "cols": [
                    "start_date",
                    "display_range",
                    "vm_name",
                    "chargeback_rates",
                    "memory_allocated_metric",
                    "memory_allocated_cost",
                    "memory_allocated_rate",
                    "memory_cost"
                ],
                "include": null,
                "col_order": [
                    "vm_name",
                    "display_range",
                    "chargeback_rates",
                    "memory_allocated_metric",
                    "memory_allocated_cost",
                    "memory_allocated_rate",
                    "memory_cost"
                ],
                "headers": [
                    "VM Name",
                    "Date Range",
                    "Chargeback Rates",
                    "Memory Allocated over Time Period",
                    "Memory Allocated Cost",
                    "Memory Allocated Rate",
                    "Memory Total Cost"
                ],
                "conditions": null,
                "order": "Ascending",
                "sortby": [
                    "vm_name",
                    "start_date"
                ],
                "group": "y",
                "graph": null,
                "dims": null,
                "created_on": "2020-05-19T12:16:31Z",
                "updated_on": "2020-05-19T12:16:31Z",
                "filename": null,
                "file_mtime": null,
                "categories": null,
                "timeline": null,
                "template_type": "report",
                "where_clause": null,
                "db_options": {
                    "rpt_type": "ChargebackVm",
                    "options": {
                        "interval": "monthly",
                        "interval_size": 12,
                        "end_interval_offset": 1,
                        "tenant_id": "1",
                        "method_for_allocated_metrics": "max",
                        "include_metrics:": true,
                        "cumulative_rate_calculation": false,
                        "groupby": "date",
                        "groupby_tag": null,
                        "groupby_label": null
                    }
                },
                "generate_cols": null,
                "generate_rows": null,
                "col_formats": null,
                "tz": null,
                "time_profile_id": null,
                "display_filter": null,
                "col_options": null,
                "rpt_options": null,
                "miq_group_id": "2",
                "user_id": "1"
            }
        }
    ]
}
```

### Create Chargeback Rates

Chargeback rate is complex structure. Create chargeback rate requires
two endpoints: `/api/chargebacks` and `/api/rates`. Endpoint
`/api/chargebacks` manage top level rate entity which aggregate other
relations like rate details(`api/rates`), currencies(`api/currencies`),
measures(`api/measures`), chargeable\_fields(`api/chargeable_fields`)
and chargeback tiers. This entity is also used to [assigning
rates](#assign-rates) to any resource.

### Create Chargebacks (top-level rate entity)

Request

    POST /api/chargebacks

``` json
{
  "guid" : "daily",
  "description" : "1",
  "rate_type" : "Compute"
}
```

Response

``` json
{
    "results": [
        {
            "href": "http://localhost:3090/api/chargebacks/14",
            "id": "14",
            "guid": "daily",
            "description": "1",
            "rate_type": "Compute",
            "created_on": "2020-05-26T12:15:51Z",
            "updated_on": "2020-05-26T12:15:51Z",
            "default": false
        }
    ]
}
```

Now we need to create rate details(`api/rates`) which includes
chargebable\_fields, currenies, measures and tiers. It is also important
assign rate details to chargeback top level entity by `chargeback_rate`
attribute.

Request

    POST /api/rates

``` json
{
  "per_time" : "daily",
  "chargeback_rate" : {"href": "http://localhost:3090/api/chargebacks/14"},
  "chargeable_field_id" : "1",
  "description": "My CPU allocation rate",
  "group" : "cpu",
  "per_unit" : "megahertz",
  "source" : "allocated",
  "chargeback_rate_detail_measure_id": 1,
  "detail_currency" : {"id": 5},
  "detail_measure" : {"href": "http://localhost:3090/api/measures/3"},
  "chargeable_field" : {"href": "http://localhost:3090/api/chargeable_fields/3"},
  "chargeback_tiers" : [
    {
      "start": 0.0,
      "finish":1,
      "fixed_rate": 2.0,
      "variable_rate": 0.0
    },
    {
      "start": 1,
      "finish": "infinity",
      "fixed_rate": 2.0,
      "variable_rate": 0.0
    }
  ]
}
```

Response

``` json
{
    "results": [
        {
            "href": "http://localhost:3090/api/rates/1862",
            "id": "1862",
            "enabled": true,
            "description": "My CPU allocation rate",
            "group": "cpu",
            "source": "allocated",
            "metric": null,
            "per_time": "daily",
            "per_unit": "megahertz",
            "friendly_rate": "Daily @ 2.0 + 0.0 per Megahertz from 0.0 to 1.0\nDaily @ 2.0 + 0.0 per Megahertz from 1.0 to Infinity",
            "chargeback_rate_id": "14",
            "created_on": "2020-05-26T12:36:32Z",
            "updated_on": "2020-05-26T12:36:32Z",
            "chargeback_rate_detail_measure_id": "3",
            "chargeback_rate_detail_currency_id": "5",
            "chargeable_field_id": "3",
            "sub_metric": null
        }
    ]
}
```

### Assign Chargeback Rate

There are examples in those sections:

  - [Querying Assigned Chargeback Rates](#querying-assignments)

  - [Assign action for Chargeback Rates](#creating-assignments)

  - [Unassign action for Chargeback Rates](#deleting-assignments)

### Run Chargeback Report

Please refer to [Run Report](../reference/reports.html#running-reports)
section for details on how to run chargeback report. Running report
requires report id or report href:

Report id or report href can be obtained by [chargeback report
creation](#example-create-chargeback-report) or by listing chargeback
reports:

Request

    GET /api/reports?expand=resources&attributes=db&filter[]=db='ChargebackVm'&filter[]=or db='ChargebackContainer%'

Response

``` json
{
    "name": "reports",
    "count": 519,
    "subcount": 47,
    "subquery_count": 47,
    "pages": 1,
    "resources": [
        {
            "href": "http://localhost:3090/api/reports/157",
            "db": "ChargebackContainerImage",
            "id": "157"
        },
        {
            "href": "http://localhost:3090/api/reports/152",
            "db": "ChargebackVm",
            "id": "152"
        },
...
}
```

### Results of Chargeback Report

There is request which list of report result.

Allowed parameters:

`hash_attribute=value` - enables hash sorting and pagination for value
column `sort_by` - column from MiqReportResult\#report\#col\_order
`sort_order` - `asc` or `desc` `limit` - count of records for one page
`offset` - result will start form \<offset\>th record `filter_column` -
chosen column for filtering `filter_string` - this string value is used
for filtering on `<filter_column>`, record of report result will be
returned in API when `<filter_string>` is contained in value of
`<filter_column>` .

There is possibility to filter according to more columns. We need to add
other filter parameters with suffix `_X` where `X` is number
(`..&filter_column_1=name&filter_string_1=TIE&filter_column_2=hostname&filter_string_2=test`)

Request

    GET /api/results/23039?hash_attribute=result_set&sort_by=&sort_order=&limit=20&offset=0&filter_string=windemo

Response

``` json
{
    "href": "http://localhost:3090/api/results/23039",
    "id": "23039",
    "name": "Chargeback - Demo",
    ...,
    "result_set": [
        {
            "start_date": "01/01/19 00:00:00 UTC",
            "display_range": "Jan 2019",
            "vm_name": "windemo",
            "owner_name": "Cloud Operators",
            "provider_name": "vCenter",
            "total_cost": "$48,303.51",
            "cpu_cost": "$935.65",
            "cpu_used_cost": "$191.65",
            "cpu_used_metric": "12.88 MHz",
            "memory_cost": "$1,609.69",
            "memory_used_cost": "$1,609.69",
            "memory_used_metric": "108.18 MB",
            "net_io_used_cost": "$372.00",
            "net_io_used_metric": "0.00 KBps",
            "chargeback_rates": "Default"
        },
        {
            "start_date": "02/01/19 00:00:00 UTC",
            "display_range": "Feb 2019",
            "vm_name": "windemo",
            "owner_name": "Cloud Operators",
            "provider_name": "vCenter",
            "total_cost": "$43,851.09",
            "cpu_cost": "$861.44",
            "cpu_used_cost": "$189.44",
            "cpu_used_metric": "14.09 MHz",
            "memory_cost": "$1,659.73",
            "memory_used_cost": "$1,659.73",
            "memory_used_metric": "123.49 MB",
            "net_io_used_cost": "$336.00",
            "net_io_used_metric": "0.00 KBps",
            "chargeback_rates": "Default"
        },
        {
            "start_date": "03/01/19 00:00:00 UTC",
            "display_range": "Mar 2019",
            "vm_name": "windemo",
            "owner_name": "Cloud Operators",
            "provider_name": "vCenter",
            "total_cost": "$28,906.99",
            "cpu_cost": "$553.43",
            "cpu_used_cost": "$113.43",
            "cpu_used_metric": "12.89 MHz",
            "memory_cost": "$1,231.94",
            "memory_used_cost": "$1,231.94",
            "memory_used_metric": "139.99 MB",
            "net_io_used_cost": "$220.00",
            "net_io_used_metric": "0.00 KBps",
            "chargeback_rates": "Default"
        }
    ],
    "count": 3,
    "subcount": 3,
    "pages": 1
}
```
