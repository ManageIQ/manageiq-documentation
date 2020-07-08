---
---

### Create Provider

#### Request:

    POST /api/providers

``` json
{
  "type"      : "ManageIQ::Providers::Redhat::InfraManager",
  "name"      : "rhevm101",
  "hostname"  : "rhevm101",
  "ipaddress" : "100.200.300.101",
  "credentials" : {
    "userid"    : "admin_account",
    "password"  : "admin_password"
  }
}
```

#### Response:

``` json
{
  "results": [
    {
      "id": "105",
      "href" : "http://localhost:3000/api/providers/105",
      "name": "rhevm101",
      "hostname": "rhevm101",
      "ipaddress": "100.200.300.101",
      "created_on": "2015-05-05T15:47:41Z",
      "updated_on": "2015-05-05T15:47:41Z",
      "guid": "10360312-f33e-11e4-86c7-b8e85646e742",
      "zone_id": "1",
      "type": "ManageIQ::Providers::Redhat::InfraManager"
    }
  ]
}
```
