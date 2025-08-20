---
---

## Bulk Querying

While the capability to fetch an individual resource via
/api/:collection/:id is available, fetching multiple resources via a
filtered search is possible but has limitations on GET url limits and is
cumbersome on the filtering syntax.

The Bulk Queries provides this capability by implementing a *query* POST
action on the primary collections.

``` data
POST /api/vms
```

``` json
{
  "action" : "query",
  "resources" : [
    { "guid" : "...." },
    { "guid" : "...." },
    ...
  ]
}
```

The *query* interface is flexible in that it allows resources to be
specified by different relevant attributes. These include:

| Identifying Attributes |
| ---------------------- |
| href                   |
| id                     |
| guid (*if applicable*) |

Some other attributes can also be used as identifying attributes as
shown in the following table:

| Collection  | Optional Identifying Attributes |
| ----------- | ------------------------------- |
| /api/groups | description                     |
| /api/roles  | name                            |
| /api/tags   | name                            |
| /api/users  | name, userid                    |

As with regular GETs, queries return expanded resources, but also
support other query parameters as in the following example:

``` data
POST /api/vms?attributes=name,raw_power_state
```

``` json
{
  "action" : "query",
  "resources" : [
    { "id" : 10 },
    { "id" : 20 },
    { "id" : 23 },
    { "id" : 28 },
    { "id" : 30 }
  ]
}
```

Sample response:

``` json
{
  "results": [
    {
      "href": "http://localhost:3000/api/vms/10",
      "id": "10",
      "name": "test_vm_1",
      "raw_power_state": "down"
    },
    {
      "href": "http://localhost:3000/api/vms/20",
      "id": "20",
      "name": "demo_server_A",
      "raw_power_state": "down"
    },
    {
      "href": "http://localhost:3000/api/vms/23",
      "id": "23",
      "name": "demo_server_B",
      "raw_power_state": "down"
    },
    {
      "href": "http://localhost:3000/api/vms/28",
      "id": "28",
      "name": "aab_dev_vm",
      "raw_power_state": "up"
    },
    {
      "href": "http://localhost:3000/api/vms/30",
      "id": "30",
      "name": "ipa_dev",
      "raw_power_state": "down"
    }
  ]
}
```
