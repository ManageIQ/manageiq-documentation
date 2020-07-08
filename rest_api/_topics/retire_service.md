#### Retiring a Service Immediately

##### Request:

    POST /api/services

``` json
{
  "action" : "request_retire",
  "resource" : { "href" : "https://hostname/api/services/35" }
}
```

##### Response:

``` json
{
  "results" : [
    {
      "href": "https://hostname/api/services/95",
      "id": 95,
      "name": "sample_service_95",
      "description": "Description for sample_service_95",
      "guid": "eb713538-7c9b-11e4-8a3a-b8e85646e742",
      "options": {
      },
      "created_at": "2014-12-05T16:29:43Z",
      "updated_at": "2015-05-08T19:32:00Z"
    }
  ]
}
```

Alternatively, this can be done by targeting the service directly:

    POST /api/services/95

``` json
{
  "action" : "request_retire"
}
```

##### Response:

``` json
{
  "href": "https://hostname/api/services/95",
  "id": 95,
  "name": "sample_service_95",
  "description": "Description for sample_service_95",
  "guid": "eb713538-7c9b-11e4-8a3a-b8e85646e742",
  "options": {
  },
  "created_at": "2014-12-05T16:29:43Z",
  "updated_at": "2015-05-08T19:32:00Z"
}
```

#### Retiring a Service at a Future Time

##### Request:

    POST /api/services/93

``` json
{
  "action" : "request_retire",
  "resource" : { "date" : "10/31/2015", "warn" : "7"  }
}
```

##### Response:

``` json
{
  "href": "https://hostname/api/services/93",
  "id": 93,
  "name": "sample_service_93",
  "description": "Description for sample_service_93",
  "guid": "eb709e02-7c9b-11e4-8a3a-b8e85646e742",
  "options": {
  },
  "created_at": "2014-12-05T16:29:43Z",
  "updated_at": "2015-05-08T19:40:19Z",
  "retired": false,
  "retires_on": "2015-10-30",
  "retirement_warn": 7
}
```
