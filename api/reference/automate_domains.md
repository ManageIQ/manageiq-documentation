---
---

## Automate Domains

Querying the Automate Domains and triggering actions on domains is
provided via the following entrypoint:

``` data
/api/automate_domains
```

  - [Querying Domains](#query-domains)

  - [Accessing Domains](#accessing-domains)

  - [Refresh From Source](#refresh-from-source)

### Querying Domains

Querying the Automate Domains can be done via GET on the
/api/automate\_domains entrypoint and can be queried like any other
collection:

``` data
GET /api/automate_domains
```

``` json
{
  "name": "automate_domains",
  "count": 9,
  "subcount": 9,
  "resources": [
    {
      "href": "http://localhost:3000/api/automate_domains/2352"
    },
    {
      "href": "http://localhost:3000/api/automate_domains/2347"
    },
    ...
  ],
  "actions": [
    {
      "name": "query",
      "method": "post",
      "href": "http://localhost:3000/api/automate_domains"
    },
    {
      "name": "refresh_from_source",
      "method": "post",
      "href": "http://localhost:3000/api/automate_domains"
    }
  ]
}
```

### Accessing Domains

Accessing individual domains can be done via their numeric id or their
name (*case sensitive*) as follows:

``` data
GET /api/automate_domains/2352
```

``` data
GET /api/automate_domains/ManageIQ
```

### Refresh From Source

When Automate domains are imported from external sources, i.e. Git, the
*refresh\_from\_source* will re-fetch the Automate domain from external
source and refresh the automate domain. This will refetch the Domain
from the same reference, i.e. branch or tag and name.

``` data
POST /api/automate_domains/SampleDomain
```

``` json
{
  "action": "refresh_from_source"
}
```

All refresh\_from\_source actions are done asynchronously and the
related Task id and href are returned as follows:

``` json
{
  "success": true,
  "message": "Refreshing Automate Domain id:2347 name:'SampleDomain' from git repository",
  "task_id": "61",
  "task_href": "http://localhost:3000/api/tasks/61",
  "href": "http://localhost:3000/api/automate_domains/SampleDomain"
}
```

If the Domain needs to be refreshed from a different branch or tag and
name, the following can be passed in with the *refresh\_from\_source*
action:

``` json
{
  "action": "refresh_from_source",
  "resource" : {
    "ref_type" : "branch" | "tag",
    "ref" : "other_branch_or_tag_name"
  }
}
```
