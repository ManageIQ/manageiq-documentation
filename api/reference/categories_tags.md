---
---

## Categories & Tags

Management of Categories and Tags is provided via the following
collections:

``` data
/api/categories
```

``` data
/api/tags
```

Full CRUD actions on both cateogries and tags are made available.

  - [Querying Categories](#querying-categories)

  - [Querying Tags](#querying-tags)

  - [Creating Categories](#creating-categories)

  - [Creating Tags](#creating-tags)

  - [Editing Categories & Tags](#editing-categories-tags)

  - [Deleting Categories & Tags](#deleting-categories-tags)

### Querying Categories

Querying all categories in the system is simply:

    GET /api/categories

Or getting attributes of interest like *name*, *description* or *ns* for
the namespace:

    GET /api/categories?expand=resources&attributes=ns,name,description

### Querying Tags

Querying all tags in the system is simply:

    GET /api/tags

Querying tags of a specific category is done as follows:

    GET /api/categories/:id/tags

Example Query for Location Category:

#### Request:

    GET /api/categories/1

#### Response:

``` json
{
  "href": "http://localhost:3000/api/categories/1",
  "id": "1",
  "description": "Location",
  "read_only": false,
  "syntax": "string",
  "single_value": true,
  "example_text": "The geographic location of the resource, such as New York, Chicago, or London.",
  "tag_id": "4",
  "parent_id": "0",
  "show": true,
  "default": true,
  "name": "location",
  "actions": [
    {
      "name": "edit",
      "method": "post",
      "href": "http://localhost:3000/api/categories/1"
    },
    {
      "name": "delete",
      "method": "post",
      "href": "http://localhost:3000/api/categories/1"
    },
    {
      "name": "delete",
      "method": "delete",
      "href": "http://localhost:3000/api/categories/1"
    }
  ]
}
```

Querying all tags of the Location category:

#### Request:

    GET /api/categories/1/tags?expand=resources&attributes=name

#### Response:

``` json
{
  "name": "tags",
  "count": 1389,
  "subcount": 4,
  "resources": [
    {
      "href": "http://localhost:3000/api/categories/1/tags/8",
      "id": "8",
      "name": "/managed/location/paris"
    },
    {
      "href": "http://localhost:3000/api/categories/1/tags/7",
      "id": "7",
      "name": "/managed/location/london"
    },
    {
      "href": "http://localhost:3000/api/categories/1/tags/6",
      "id": "6",
      "name": "/managed/location/chicago"
    },
    {
      "href": "http://localhost:3000/api/categories/1/tags/5",
      "id": "5",
      "name": "/managed/location/ny"
    }
  ],
  "actions": [
    {
      "name": "create",
      "method": "post",
      "href": "http://localhost:3000/api/categories/1/tags"
    },
    {
      "name": "delete",
      "method": "post",
      "href": "http://localhost:3000/api/categories/1/tags"
    }
  ]
}
```

For additional details on tags, the **cateogy** and **classification**
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

### Creating Categories

Creating Categories can be done by posting the Category JSON to the
categories collection directly, or via the **create** action signature
as follows:

    POST /api/categories

``` json
{
  "name" : "test",
  "description" : "Test Category"
}
```

or via the **create** action:

``` json
{
  "action" : "create",
  "resource" : {
    "name" : "test",
    "description" : "Test Category"
  }
}
```

#### Response:

``` json
{
  "results": [
    {
      "id": "1430",
      "description": "Test Category",
      "read_only": false,
      "syntax": "string",
      "single_value": false,
      "tag_id": "1439",
      "parent_id": "0",
      "show": true
    }
  ]
}
```

Attributes which can also be specified when creating categories include:

|               |
| ------------- |
| example\_text |
| show          |
| single\_value |
| syntax        |

**Note:**

Please refer to the [Resource Attributes](../appendices/resource_attributes.html#categories) page for
a list of available attributes when creating Categories.

### Creating Tags

New tags for a category can be created either as a tag collection post
or via a tag subcollection **create** action to a specific category.

    POST /api/tags

``` json
{
  "name" : "test_tag",
  "description" : "Test Tag",
  "category" : { "href" : "http://localhost:3000/api/categories/1430" }
}
```

The **category** above can identify a category by specifying either one
of the **href**, **id** or **name** attributes.

Tags can optionally be created via the **create** action on the tags
subcollection of a category as follows:

    POST /api/categories/1430/tags

``` json
{
  "action" : "create",
  "resource" : {
    "name" : "test_tag",
    "description" : "Test Tag"
  }
}
```

or simply:

    POST /api/categories/1430/tags

``` json
{
  "name" : "test_tag",
  "description" : "Test Tag"
}
```

**Note:**

Please refer to the [Resource Attributes](../appendices/resource_attributes.html#tags) page for a list
of available attributes when creating Tags.

### Editing Categories & Tags

Editing Categories and Tags can be done via the **edit** action:

Example editing a category:

    POST /api/categories/1430

``` json
{
  "action" : "edit",
  "resource" : {
    "description" : "Updated Category Description"
  }
}
```

Example editing a tag:

    POST /api/tags/1441

``` json
{
  "action" : "edit",
  "resource" : {
    "name" : "updated_test_tag"
  }
}
```

### Deleting Categories & Tags

Deleting Categories and Tags can be done via either the **delete** post
action or the DELETE HTTP method.

    POST /api/categories/1430

``` json
{
  "action" : "delete"
}
```

or simply:

    DELETE /api/categories/1430

Deleting associated tag example:

    POST /api/tags/1441

``` json
{
  "action" : "delete"
}
```

or simply:

    DELETE /api/tags/1441

One can also delete the tag when accessed via the subcollection

#### Request:

    POST /api/categories/1430/tags

``` json
{
  "action" : "delete",
  "resources" : [
    { "id" : "1441" },
    { "id" : "1442" }
  ]
}
```

#### Response:

``` json
{
  "results": [
    {
      "success": true,
      "message": "tags id: 1441 deleting"
    },
    {
      "success": true,
      "message": "tags id: 1442 deleting"
    }
  ]
}
```

Tags to be deleted can be specified via the **href**, **id** or **name**
attribute.
