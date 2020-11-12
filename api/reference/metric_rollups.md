---
---

## Metric Rollups

Querying of Metric Rollups is made available via the following
collection:

``` data
/api/metric_rollups
```

Supported query parameters:

| Parameter         | Examples                                                                |
| ----------------- | ----------------------------------------------------------------------- |
| resource\_type    | VmOrTemplate, Service or any resource type that supports Metric Rollups |
| resource\_ids\[\]     | id1
| resource\_ids\[\]     | id2
| resource\_ids\[\]     | ...                                             |
| capture\_interval | hourly, daily                                                           |
| start\_date       | 2018-01-10, 2018-01-10T11:20:00Z                                        |
| end\_date         | 2018-01-17, 2017-12-31T23:59:00Z                                        |

### Getting 60 Daily Metric Rollups

``` data
GET /api/metric_rollups?resource_type=VmOrTemplate
                       &resource_ids[]=101
                       &resource_ids[]=102
                       &resource_ids[]=103
                       &capture_interval=daily
                       &start_date='2017-10-01'
                       &limit=60
```

### Getting Hourly Metric Rollups for a range of Dates

``` data
GET /api/metric_rollups?resource_type=Service
                       &resource_ids[]=55
                       &resource_ids[]=56
                       &capture_interval=hourly
                       &start_date='2017-11-15'
                       &end_date='2017-11-18'
```

Metric rollups can also be obtained for a specific resource as a
subcollection:

``` data
/api/vms/:id/metric_rollups
```

``` data
/api/services/:id/metric_rollups
```

### Getting Hourly Metric Rollups for a Service

``` data
GET /api/services/57/metric_rollups?capture_interval=hourly&start_date='2017-06-15'
```

### Getting 30 Daily Metric Rollups for a Vm

``` data
GET /api/vms/104/metric_rollups?capture_interval=daily&start_date='2017-01-01'&limit=30
```
