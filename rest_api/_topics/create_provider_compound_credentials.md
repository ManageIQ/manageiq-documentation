#### Creating a Provider with Compound Credentials

##### Request:

    POST /api/providers

``` json
{
  "type"      : "ManageIQ::Providers::Redhat::InfraManager",
  "name"      : "rhevm102",
  "hostname"  : "rhevm102",
  "ipaddress" : "100.200.300.102",
  "credentials" : [
    {
      "userid"    : "default_userid",
      "password"  : "default_password"
    },
    {
      "userid"    : "metrics_userid",
      "password"  : "metrics_password",
      "auth_type" : "metrics"
    }
  ]
}
```

##### Response:

``` json
{
  "results": [
    {
      "id": 106,
      "name": "rhevm102",
      "hostname": "rhevm102",
      "ipaddress": "100.200.300.102",
      "created_on": "2015-05-05T15:57:44Z",
      "updated_on": "2015-05-05T15:57:44Z",
      "guid": "acbd610e-f3f6-11e4-aaba-b8e85646e742",
      "zone_id": 1,
      "type": "ManageIQ::Providers::Redhat::InfraManager"
    }
  ]
}
```
