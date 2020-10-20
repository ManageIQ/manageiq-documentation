---
---

## Automate

Querying the Automate model is provided via the following entrypoint:

``` data
/api/automate
```

  - [Usage](#usage)

  - [Querying Domains](#query-domains)

  - [Querying By Fully Qualified Name](#query-by-fqname)

  - [Querying First Level Children Nodes](#query-children)

  - [Querying Subtree](#query-subtree)

  - [Querying State Machines Subtree](#query-state-machines-subtree)

### Usage

Querying the Automate Model via /api/automate allows queries of:

  - top level Automate Domains

  - any object in the Automate Model

  - arbitrary depth via the **depth** parameter

| depth value | data returned                                    |
| ----------- | ------------------------------------------------ |
| 0           | Just node itself                                 |
| 1           | Node itself plus its first level children nodes  |
| \#          | Node itself plus \# levels of children nodes     |
| \-1         | Node itself plus the whole subtree underneath it |

  - Automate model object tree to include state machine endpoints via
    the **search\_options** parameter with value **state\_machines**

Example queries:

``` data
GET /api/automate
GET /api/automate/manageiq
GET /api/automate/manageiq?depth=2
GET /api/automate/manageiq?depth=-1&search_options=state_machines
```

### Querying Domains

Querying the Automate Domains can be done via GET on the /api/automate
entrypoint as follows:

``` data
GET /api/automate
```

``` json
{
  "name": "automate",
  "subcount": 4,
  "resources": [
    {
      "fqname": "/ManageIQ",
      "domain_fqname": "/",
      "klass": "MiqAeDomain",
      "id": "2352",
      "name": "ManageIQ",
      "created_on": "2016-10-31T14:58:09Z",
      "updated_on": "2016-10-31T14:58:09Z",
      "description": "Base domain",
      "updated_by": "system",
      "priority": 0,
      "enabled": true,
      "tenant_id": "1",
      "source": "system"
    },
    ...
  ]
}
```

**Note:**

The fqname is always returned by this query

</div>

If desired a sub-set of attributes can be asked via as follows:

``` data
GET /api/automate?attributes=name,source
```

``` json
{
  "name": "automate",
  "subcount": 4,
  "resources": [
    {
      "fqname": "/ManageIQ",
      "name": "ManageIQ",
      "source" : "system"
    },
    ...
  ]
}
```

### Querying By Fully Qualified Name

Querying any object in the Automate Model by its fully qualified name as
follows:

**Note:**

The fqname in the query is *not* case sensitive

</div>

``` data
GET /api/automate/manageiq
```

``` json
{
  "name": "automate",
  "subcount": 1,
  "resources": [
    {
      "fqname": "/ManageIQ",
      "domain_fqname": "/",
      "klass": "MiqAeDomain",
      "id": "2352",
      "name": "ManageIQ",
      "created_on": "2016-10-31T14:58:09Z",
      "updated_on": "2016-10-31T14:58:09Z",
      "description": "Base domain",
      "updated_by": "system",
      "priority": 0,
      "enabled": true,
      "tenant_id": "1",
      "source": "system"
    }
  ]
}
```

Another example showing fetching an automate class object:

``` data
GET /api/automate/manageiq/system/request
```

``` json
{
  "name": "automate",
  "subcount": 1,
  "resources": [
    {
      "fqname": "/ManageIQ/System/Request",
      "domain_fqname": "/System/Request",
      "klass": "MiqAeClass",
      "id": "75",
      "description": "Automation Requests",
      "name": "Request",
      "created_on": "2015-12-09T20:56:44Z",
      "updated_on": "2015-12-09T20:56:44Z",
      "namespace_id": "41",
      "updated_by": "system"
    }
  ]
}
```

Automate model nodes returned include both:

  - **fqname**: the fully qualified name of the node which is rooted at
    /.

      - i.e. /ManageIQ/System/Request

  - **domain\_fqname**: the fully qualified name of the node rooted at
    the domain, which is **fqname** without the Domain prefix

      - i.e. /System/Request

### Querying First Level Children Nodes

When specifying a depth of 1, the Automate model node and its first
level children nodes are returned.

In this example, we are asking for the /ManageIQ Domain and its direct
children nodes.

``` data
GET /api/automate/manageiq?depth=1&attributes=domain_fqname,klass
```

``` json
{
  "name": "automate",
  "subcount": 9,
  "resources": [
    {
      "fqname": "/ManageIQ",
      "domain_fqname": "/",
      "klass": "MiqAeDomain"
    },
    {
      "fqname": "/ManageIQ/System",
      "domain_fqname": "/System",
      "klass": "MiqAeNamespace"
    },
    {
      "fqname": "/ManageIQ/Service",
      "domain_fqname": "/Service",
      "klass": "MiqAeNamespace"
    },
    {
      "fqname": "/ManageIQ/Infrastructure",
      "domain_fqname": "/Infrastructure",
      "klass": "MiqAeNamespace"
    },
    {
      "fqname": "/ManageIQ/GenericObject",
      "domain_fqname": "/GenericObject",
      "klass": "MiqAeNamespace"
    },
    {
      "fqname": "/ManageIQ/Deployment",
      "domain_fqname": "/Deployment",
      "klass": "MiqAeNamespace"
    },
    {
      "fqname": "/ManageIQ/Control",
      "domain_fqname": "/Control",
      "klass": "MiqAeNamespace"
    },
    {
      "fqname": "/ManageIQ/ConfigurationManagement",
      "domain_fqname": "/ConfigurationManagement",
      "klass": "MiqAeNamespace"
    },
    {
      "fqname": "/ManageIQ/Cloud",
      "domain_fqname": "/Cloud",
      "klass": "MiqAeNamespace"
    }
  ]
}
```

### Querying Subtree

When specifying a depth of -1, the Automate model node and all of the
nodes underneath it are returned.

``` data
GET /api/automate/manageiq?depth=-1&attributes=klass
```

``` json
{
  "name": "automate",
  "subcount": 935,
  "resources": [
    {
      "fqname": "/ManageIQ",
      "klass": "MiqAeDomain"
    },
    {
      "fqname": "/ManageIQ/System",
      "klass": "MiqAeNamespace"
    },
    {
      "fqname": "/ManageIQ/System/Event",
      "klass": "MiqAeNamespace"
    },
    {
      "fqname": "/ManageIQ/System/Event/RequestEvent",
      "klass": "MiqAeNamespace"
    },
    ...
  ]
}
```

### Querying State Machines Subtree

In this example, we are querying the ManageIQ Automate Domain model tree
but only asking for branches that include state machine nodes.

``` data
GET /api/automate/manageiq?depth=-1&attributes=domain_fqname,klass&search_options=state_machines
```

``` json
{
  "name": "automate",
  "subcount": 104,
  "resources": [
    {
      "fqname": "/ManageIQ",
      "domain_fqname": "/",
      "klass": "MiqAeDomain"
    },
    {
      "fqname": "/ManageIQ/System",
      "domain_fqname": "/System",
      "klass": "MiqAeNamespace"
    },
    {
      "fqname": "/ManageIQ/System/CommonMethods",
      "domain_fqname": "/System/CommonMethods",
      "klass": "MiqAeNamespace"
    },
    {
      "fqname": "/ManageIQ/System/CommonMethods/QuotaStateMachine",
      "domain_fqname": "/System/CommonMethods/QuotaStateMachine",
      "klass": "MiqAeClass"
    },
    {
      "fqname": "/ManageIQ/System/CommonMethods/QuotaStateMachine/quota",
      "domain_fqname": "/System/CommonMethods/QuotaStateMachine/quota",
      "klass": "MiqAeInstance"
    },
    ...
  ]
}
```
