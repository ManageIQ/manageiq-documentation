#### Paging Queries

This series of requests shows paging queries and the expected responses
for each subsequent page.

##### Request:

    GET /api/vms?offset=0&limit=500
        &sort_order=asc&sort_by=name
        &expand=resources&attributes=name

##### Response:

``` json
{
  "name": "vms",
  "count": 1912,
  "subcount": 500,
  "resources": [
    {
      "href": "https://hostname/api/vms/176",
      "id": 176,
      "name": "53 Zone1"
    },
    ...
    {
      "href": "https://hostname/api/vms/1575",
      "id": 1575,
      "name": "VmEmpty-3de98f0f-c6f3-4f8b-a932-554713a61067"
    }
  ],
  "actions": [
  ]
}
```

##### Request:

    GET /api/vms?offset=500&limit=500
        &sort_order=asc&sort_by=name
        &expand=resources&attributes=name

##### Response:

``` json
{
  "name": "vms",
  "count": 1912,
  "subcount": 500,
  "resources": [
    {
      "href": "https://hostname/api/vms/1574",
      "id": 1574,
      "name": "VmEmpty-3e13ff43-6907-4a22-8f95-58aeb1bffa0b"
    },
    ...
    {
      "href": "https://hostname/api/vms/1076",
      "id": 1076,
      "name": "VmEmpty-9a885181-7771-4f91-9805-245c7606d833"
    }
  ],
  "actions": [
  ]
}
```

##### Request:

    GET /api/vms?offset=1000&limit=500
        &sort_order=asc&sort_by=name
        &expand=resources&attributes=name

##### Response:

``` json
{
  "name": "vms",
  "count": 1912,
  "subcount": 500,
  "resources": [
    {
      "href": "https://hostname/api/vms/1074",
      "id": 1074,
      "name": "VmEmpty-9ab9e101-92b0-4b6b-864e-e196538da8a8"
    },
    ...
    {
      "href": "https://hostname/api/vms/575",
      "id": 575,
      "name": "VmEmpty-f251f135-01c8-4d44-b8e1-37b30844a9dd"
    }
  ],
  "actions": [
  ]
}
```

##### Request:

    GET /api/vms?offset=1500&limit=500
        &sort_order=asc&sort_by=name
        &expand=resources&attributes=name

##### Response:

``` json
{
  "name": "vms",
  "count": 1912,
  "subcount": 412,
  "resources": [
    {
      "href": "https://hostname/api/vms/574",
      "id": 574,
      "name": "VmEmpty-f28912f3-b096-487f-9763-97b39b67364b"
    },
    ...
    {
      "href": "https://hostname/api/vms/1907",
      "id": 1907,
      "name": "yy_vm"
    }
  ],
  "actions": [
  ]
}
```

**Note:**

In this last request, the **subcount** was less than the requested page size, thus denoting the last page of data being returned.

