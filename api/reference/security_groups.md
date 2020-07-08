---
---

## Security Groups

Management of Security Groups is available via the following collection:

``` data
/api/security_groups
```

### Querying Security Groups

Querying all available Security Groups:

    GET /api/security_groups

Getting details on a specific Security Group:

    GET /api/security_groups/:id

Querying the Security Groups of a specific resource is also possible for
the following collections:

| Collection          |
| ------------------- |
| /api/cloud\_tenants |
| /api/instances      |
| /api/providers      |
| /api/vms            |

    GET /api/cloud_tenants/:id/security_groups
    GET /api/cloud_tenants/:id/security_groups/:security_group_id

    GET /api/instances/:id/security_groups
    GET /api/instances/:id/security_groups/:security_group_id

    GET /api/providers/:id/security_groups
    GET /api/providers/:id/security_groups/:security_group_id

    GET /api/vms/:id/security_groups
    GET /api/vms/:id/security_groups/:security_group_id

### Managing Security Groups

Management of Security Groups is available for Instances with the
following actions:

| Action                            | Description                                |
| --------------------------------- | ------------------------------------------ |
| [add](#add-security-groups)       | Add security group(s) to the Instance      |
| [remove](#remove-security-groups) | Remove security group(s) from the Instance |

### Add Security Group

Security Groups can be added to Instances individually:

``` data
POST /api/instances/:id/security_groups
```

``` json
{
  "action" : "add",
  "resource" : {
    "name" : "security_group_a"
  }
}
```

Or in bulk as follows:

``` json
{
  "action" : "add",
  "resources" : [
    { "name" : "security_group_a" },
    { "name" : "security_group_b" }
  ]
}
```

### Remove Security Group

Security groups can be removed from Instances individually:

``` data
POST /api/instances/:id/security_groups
```

``` json
{
  "action" : "remove",
  "resource" : {
    "name" : "security_group_c"
  }
}
```

Or in bulk as follows:

``` json
{
  "action" : "remove",
  "resources" : [
    { "name" : "security_group_d" },
    { "name" : "security_group_e" },
    { "name" : "security_group_f" }
  ]
}
```
