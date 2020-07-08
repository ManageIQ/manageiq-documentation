---
---

## Event Streams

Querying of Event Streams is made available via the following
collection:

``` data
/api/event_streams
```

Event Streams can be queried as follows:

``` data
GET /api/event_streams
```

An individual Event Stream can also be fetched as follows:

``` data
GET /api/event_streams/:id
```

Relevant filter\[\] parameters when Event Streams are queried:

| Parameter    | Examples                                     |
| ------------ | -------------------------------------------- |
| event\_type  | event\_type=vm\_start, event\_type=vm\_stop  |
| timestamp    | timestamp\>2017-01-03, timestamp\<2017-12-31 |
| target\_type | target\_type=VmOrTemplate                    |
| target\_id   | target\_id=11                                |

### Filtering by event type

``` data
GET /api/event_streams?filter[]=event_type=vm_start
```

### Filtering by timestamp

``` data
GET /api/event_streams?filter[]=timestamp>2017-01-03
                      &filter[]=timestamp<2017-01-10
```

### Filtering by target type

``` data
GET /api/event_streams?filter[]=target_type=VmOrTemplate
```

### Filtering by target type and id

``` data
GET /api/event_streams?filter[]=target_type=VmOrTemplate
                      &filter[]=target_id=21
```
