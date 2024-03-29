---
---

## Tags & Tagging

  - [Tag Management](#tag-management)

  - [Querying Tags](#querying-tags)

  - [Querying Tags of a Resource](#querying-tags-of-resources)

  - [Assigning Tags](#assigning-tags)

  - [Tag Specification](#tag-specification)

  - [Assigning Tags to a Resource](#assigning-tags-to-a-resource)

  - [Unassigning Tags from a
    Resource](#unassigning-tags-from-a-resource)

  - [Bulk Assigning Tags](#bulk-assigning-tags)

  - [Bulk Unassigning Tags](#bulk-unassigning-tags)

### Tag Management

Management of Tags is provided in the following forms:

  - Querying of tags via the primary collection:

<!-- end list -->

``` data
/api/tags
```

  - Assigning and Unassigning tags to resources via the tags
    subcollection of a resource

<!-- end list -->

``` data
/api/:collection/:id/tags
```

and posting **assign** or **unassign** actions to the tags
subcollection.

### Querying Tags

Querying all tags in the system is simply:

    GET /api/tags

However, that only gives us the href’s of the tags:

``` json
{
  "name": "tags",
  "count": 1385,
  "subcount": 1385,
  "resources": [
    {
      "href": "http://localhost:3000/api/tags/1"
    },
    {
      "href": "http://localhost:3000/api/tags/2"
    },
    {
      "href": "http://localhost:3000/api/tags/3"
    }
    ...
  ]
}
```

Which is not too useful.

Expanding the resources, does provide us with the tag name as follows:

    GET /api/tags?expand=resources

``` json
{
  "name": "tags",
  "count": 1385,
  "subcount": 1385,
  "resources": [
    {
      "href": "http://localhost:3000/api/tags/1",
      "id": "1",
      "name": "/managed/roles/change_managers"
    },
    {
      "href": "http://localhost:3000/api/tags/2",
      "id": "2",
      "name": "/managed/roles/operators"
    },
    {
      "href": "http://localhost:3000/api/tags/3",
      "id": "3",
      "name": "/managed/roles/cfme_administrators"
    },
    {
      "href": "http://localhost:3000/api/tags/4",
      "id": "4",
      "name": "/managed/location"
    },
    {
      "href": "http://localhost:3000/api/tags/5",
      "id": "5",
      "name": "/managed/location/ny"
    }
    ...
  ]
}
```

For additional details on tags, the **category** and **classification**
attributes can be queried on tags as follows:

    GET /api/tags/5?attributes=category,classification

Additionally, a compound attribute called **categorization** is provided
to return key information from both **category** and **classification**
of tags as follows:

    GET /api/tags/5?attributes=categorization

``` json
{
  "href": "http://localhost:3000/api/tags/5",
  "id": "5",
  "name": "/managed/location/ny",
  "categorization": {
    "name": "ny",
    "description": "New York",
    "category": {
      "name": "location",
      "description": "Location"
    },
    "display_name": "Location: New York"
  }
}
```

### Querying Tags of a Resource

To find out which tags are assigned to a resource, the tags
subcollection can be expanded for that particular resource as follows:

    GET /api/vms/320?expand=tags

This will provide the id, href and name of the tags:

``` json
{
  "href": "http://localhost:3000/api/vms/320",
  "id": "320",
  "vendor": "vmware",
  "name": "aab-vm1",
  "description": "this is a test",
  "raw_power_state": "poweredOn",
  ...
  "tags": [
    {
      "href": "http://localhost:3000/api/vms/320/tags/81",
      "id": "81",
      "name": "/managed/quota_max_cpu/4"
    },
    {
      "href": "http://localhost:3000/api/vms/320/tags/61",
      "id": "61",
      "name": "/managed/cc/001"
    },
    ...
  ]
}
```

Optionally, one can also query just the tags subcollection of the
resource to get additional information about them like the
categorization:

    GET /api/vms/320/tags?expand=resources&attributes=categorization

``` json
{
  "name": "tags",
  "count": 1385,
  "subcount": 5,
  "resources": [
    {
      "href": "http://localhost:3000/api/vms/320/tags/81",
      "id": "81",
      "name": "/managed/quota_max_cpu/4",
      "categorization": {
        "name": "4",
        "description": "4",
        "category": {
          "name": "quota_max_cpu",
          "description": "Quota - Max CPUs"
        },
        "display_name": "Quota - Max CPUs: 4"
      }
    },
    {
      "href": "http://localhost:3000/api/vms/320/tags/61",
      "id": "61",
      "name": "/managed/cc/001",
      "categorization": {
        "name": "001",
        "description": "Cost Center 001",
        "category": {
          "name": "cc",
          "description": "Cost Center"
        },
        "display_name": "Cost Center: Cost Center 001"
      }
    },
    ...
  ]
}
```

### Assigning Tags

Tag management on resources can be done by POSTing **assign** and
**unassign** actions to the tags subcollection of resources. Tags can be
managed as subcollections of the following primary collections:

| Collection              |
| ----------------------- |
| /api/categories         |
| /api/clusters           |
| /api/data\_stores       |
| /api/generic\_objects   |
| /api/groups             |
| /api/hosts              |
| /api/lans               |
| /api/providers          |
| /api/resource\_pools    |
| /api/services           |
| /api/service\_templates |
| /api/templates          |
| /api/tenants            |
| /api/users              |
| /api/vms                |

#### Tag specification

Tags can be specified using one of the following forms:

By Tag category and name:

``` json
{
  "category" : "department",
  "name"     : "finance"
}
```

By Tag path:

``` json
{
  "path" : "/managed/department/finance"
}
```

By Tag href:

``` json
{
  "href" : "http://localhost:3000/api/tags/10"
}
```

#### Assigning tags to a resource

    POST /api/vms/320/tags

``` json
{
  "action" : "assign",
  "resources" : [
    { "category" : "department", "name" : "finance" },
    { "category" : "cc", "name" : "001" }
  ]
}
```

##### Response:

``` json
{
  "results": [
    {
      "success": true,
      "message": "Assigning Tag: category:'department' name:'finance'",
      "href": "http://localhost:3000/api/vms/320",
      "tag_category": "department",
      "tag_name": "finance",
      "tag_href": "http://localhost:3000/api/tags/81"
    },
    {
      "success": true,
      "message": "Assigning Tag: category:'cc' name:'001'",
      "href": "http://localhost:3000/api/vms/320",
      "tag_category": "cc",
      "tag_name": "001",
      "tag_href": "http://localhost:3000/api/tags/91"
    }
}
```

#### Unassigning tags from a resource

    POST /api/vms/320/tags

``` json
{
  "action" : "unassign",
  "resources" : [
    { "category" : "department", "name" : "finance" },
    { "category" : "cc", "name" : "001" }
  ]
}
```

##### Response:

``` json
{
  "results": [
    {
      "success": true,
      "message": "Unassigning Tag: category:'department' name:'finance'",
      "href": "http://localhost:3000/api/vms/320",
      "tag_category": "department",
      "tag_name": "finance",
      "tag_href": "http://localhost:3000/api/tags/81"
    },
    {
      "success": true,
      "message": "Unassigning Tag: category:'cc' name:'001'",
      "href": "http://localhost:3000/api/vms/320",
      "tag_category": "cc",
      "tag_name": "001",
      "tag_href": "http://localhost:3000/api/tags/91"
    }
}
```

Additional Tag Management examples can be found on the main REST API
Examples section.

#### Bulk Assigning Tags

While the general URL for tag assignment via the subcollection as
follows:

    POST /api/vms/320/tags

allows one to assign multiple tags to a single resource in one call, it
does not provide the ability to assign tags to multiple resources in one
call.

Bulk assignment of tags is available via the *assign\_tags* action to
the following collections:

| Collection    |
| ------------- |
| /api/vms      |
| /api/services |

The *assign\_tags* action allows adding one or more tags to one or more
resources.

    POST /api/vms

``` json
{
  "action" : "assign_tags",
  "resources" : [
    {
      "href" : "http://localhost:3000/api/vms/11",
      "tags" : [
        { "category" : "department", "name" : "finance" }
      ]
    },
    {
      "href" : "http://localhost:3000/api/vms/12",
      "tags" : [
        { "category" : "cc", "name" : "001" }
      ]
    }
  ]
}
```

##### Response:

``` json
{
  "results": [
    {
      "success": true,
      "message": "Assigning Tag: category:'department' name:'finance'",
      "href": "http://localhost:3000/api/vms/11",
      "tag_category": "department",
      "tag_name": "finance",
      "tag_href": "http://localhost:3000/api/tags/81"
    },
    {
      "success": true,
      "message": "Assigning Tag: category:'cc' name:'001'",
      "href": "http://localhost:3000/api/vms/12",
      "tag_category": "cc",
      "tag_name": "001",
      "tag_href": "http://localhost:3000/api/tags/91"
    }
  ]
}
```

#### Bulk Unassigning Tags

Tags can also be unassigned in bulk from multiple resources for the
following collections via the *unassign\_tags* action:

| Collection    |
| ------------- |
| /api/vms      |
| /api/services |

    POST /api/services

``` json
{
  "action" : "unassign_tags",
  "resources" : [
    {
      "href" : "http://localhost:3000/api/services/5",
      "tags" : [
        { "href" : "http://localhost:3000/api/services/5/tags/81" }
      ]
    },
    {
      "href" : "http://localhost:3000/api/services/6",
      "tags" : [
        { "category" : "cc", "name" : "001" }
      ]
    }
  ]
}
```

##### Response:

``` json
{
  "results": [
    {
      "success": true,
      "message": "Unassigning Tag: category:'department' name:'finance'",
      "href": "http://localhost:3000/api/services/5",
      "tag_category": "department",
      "tag_name": "finance",
      "tag_href": "http://localhost:3000/api/tags/81"
    },
    {
      "success": true,
      "message": "Unassigning Tag: category:'cc' name:'001'",
      "href": "http://localhost:3000/api/services/6",
      "tag_category": "cc",
      "tag_name": "001",
      "tag_href": "http://localhost:3000/api/tags/91"
    }
  ]
}
```
