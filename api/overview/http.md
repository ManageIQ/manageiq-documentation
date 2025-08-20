---
---

## HTTP Basics

  - [REST Entry Point](#rest-api-entry-point)

      - [Entry Point Details](#entry-point-details)

  - [Supported Content Types](#supported-content-types)

  - [URL Paths](#url-paths)

  - [Methods and related URLs](#methods-and-related-urls)

  - [Updating resources](#updating-resources)

  - [Return Codes](#return-codes)

## REST API Entry Point

The REST API is made available via the /api URL prefix. It can be
accessed on the Appliance server directly via HTTP using the default
port as follows:

    http://localhost:3000/api

Or external to the Appliance as follows:

    https://<applianceHost_fqdn>/api

### Response:

``` json
{
  "name" : "API",
  "description" : "REST API",
  "version" : "2.3.0",
  "versions" : [
    {
      "name" : "2.3.0",
      "href" : "http://localhost:3000/api/v2.3.0"
    }
  ],
  ...
  "collections" : [
    ...
    {
      "name" : "providers",
      "href" : "http://localhost:3000/api/providers",
      "description" : "Providers"
    },
    ...
    {
      "name" : "vms",
      "href" : "http://localhost:3000/api/vms",
      "description" : "Virtual Machines"
    },
    ...
  ]
}
```

  - Version is the Current API version, accessible via either of the
    following:

  - /api/

  - /api/v2.0.0/

  - Versions lists current and any earlier API versions that are still
    exposed via their respective entry points:

  - /api/v**Version**/

### Entry Point Details

An authenticated request of the entry point:

``` data
GET /api
```

returns the following structure:

``` json
{
  "name": "API",
  "description": "REST API",
  "version": "2.3.0",
  "versions": [
    {
      "name": "2.3.0",
      "href": "http://localhost:3000/api/v2.3.0"
    }
  ],
  "settings": {
  },
  "identity": {
    "userid": "admin",
    "name": "Administrator",
    "user_href": "http://localhost:3000/api/users/1",
    "group": "EvmGroup-super_administrator",
    "group_href": "http://localhost:3000/api/groups/2",
    "role": "EvmRole-super_administrator",
    "role_href": "http://localhost:3000/api/roles/1",
    "tenant": "My Company",
    "groups": [
      "EvmGroup-super_administrator"
    ]
  },
  "server_info": {
    "version": "master",
    "build": "20161104133757_01d7244",
    "appliance": "EVM"
  },
  "product_info": {
    "name": "ManageIQ",
    "name_full": "ManageIQ",
    "copyright": "Copyright (c) 2014-present ManageIQ Authors.",
    "support_website": "http://www.manageiq.org",
    "support_website_text": "ManageIQ.org"
  },
  "collections": [
    {
      "name": "actions",
      "href": "http://localhost:3000/api/actions",
      "description": "Actions"
    },
    ...
    {
      "name": "vms",
      "href": "http://localhost:3000/api/vms",
      "description": "Virtual Machines"
    },
    {
      "name": "zones",
      "href": "http://localhost:3000/api/zones",
      "description": "Zones"
    }
  ]
}
```

Where **settings** and **identity** are specific to the authenticated
user.

## Supported Content Types

Requests:

    Accept: application/json

Responses:

    Content-Type: application/json

## URL Paths

The recommended convention for URLs is to use alternate collection /
resource path segments, relative to the API entry point as described in
the following example:

| URL                                 | Description                                                 |
| ----------------------------------- | ----------------------------------------------------------- |
| /api                                | The REST API entry point                                    |
| /api/v**Version**                   | The REST entry point for a specific version of the REST API |
| /api/:collection                    | A top-level collection                                      |
| /api/:collection/:id                | A specific resource of that collection                      |
| /api/:collection/:id/:subcollection | Sub-collection under the specific resource                  |

## Methods and related URLs

The basic HTTP Methods used for the API are GET, POST, PUT, PATCH,
OPTIONS and DELETE.

<table>
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<thead>
<tr class="header">
<th>URL</th>
<th>Semantic</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p>GET /api/:collection</p></td>
<td><p>Return all resources of the collection</p></td>
</tr>
<tr class="even">
<td><p>GET /api/:collection/:id</p></td>
<td><p>Return the specific resource</p></td>
</tr>
<tr class="odd">
<td><p>POST /api/:collection</p></td>
<td><p>Create a resource in the collection</p></td>
</tr>
<tr class="even">
<td><p>POST /api/:collection/:id</p></td>
<td><p>Perform an Action on a resource in the collection</p></td>
</tr>
<tr class="odd">
<td><p>PUT /api/:collection/:id</p></td>
<td><p>Update a specific resource</p></td>
</tr>
<tr class="even">
<td><p>PATCH /api/:collection/:id</p></td>
<td><p>Update a specific resource</p></td>
</tr>
<tr class="odd">
<td><p>OPTIONS /api/:collection</p></td>
<td><p>Return metadata about the collection</p>
<p>Please refer to <a href="../appendices/collection_metadata.html">Collection Metadata</a> for details</p></td>
</tr>
<tr class="even">
<td><p>DELETE /api/:collection/:id</p></td>
<td><p>Delete a specific resource</p></td>
</tr>
</tbody>
</table>

There, :collection represents specific Appliance entities like services,
hosts, vms, etc.

## Updating resources

As shown in the above table, there are a couple of ways to update
attributes in a resource. These are:

  - Update a resource via the PUT HTTP Method

  - Update a resource via a POST Method with an *edit* action.

  - Update a resource via the PATCH HTTP Method

While the PUT is the common method, the PATCH mechanism gives better
control on which attribute to edit, add as well as remove which is not
available with the other two methods.

## Modifying Resource attributes

    PUT /api/services/42

``` json
{
  "name" : "The new Service name",
  "description" : "A Description for the new Service"
}
```

    POST /api/services/42

``` json
{
  "action" : "edit",
  "resource" : {
    "name" : "A new Service name",
    "description" : "A Description for the new Service"
  }
}
```

    PATCH /api/services/42

``` json
[
  { "action": "edit", "path": "name", "value": "A new Service name" },
  { "action": "add", "path": "description", "value": "A Description for the new Service" },
  { "action": "remove", "path": "display" }
]
```

## Return Codes

  - [Success](#success)

  - [Client Errors](#client-errors)

  - [Server Errors](#server-errors)

### Success

  - **200 OK** - The request has succeeded without errors, this code
    should be returned for example when retrieving a collection or a
    single resource.

  - **201 Created** - The request has been fulfilled and resulted in a
    **new resource being created**. The resource is available before
    this status code is returned. The response includes the HTTP body of
    the newly created resource.

  - **202 Accepted** - The request has been accepted for processing, but
    the processing has not been completed. Like, resource is not fully
    available yet. This status code is usually returned when the
    resource creation happens asynchronously. In this case the HTTP
    response includes a pointer to *monitor* or a *job* where the client
    can query to get the current status of the request and the estimate
    on when the request will be actually fulfilled.

  - **204 No Content** - The server has fulfilled the request but does
    not need to return an entity-body, and might want to return updated
    meta information. This HTTP response is commonly used for the DELETE
    requests, as the resource that was deleted does not exist anymore.

### Client Errors

  - **400 Bad Request** - The request could not be understood by the
    server due to malformed syntax. The client SHOULD NOT repeat the
    request without modifications. In REST API this status code should
    be returned to client when the client uses the wrong combination of
    attributes, like expanding the non-existing collection, or using the
    pagination parameter incorrectly. Another use-case could be creating
    or performing actions on the resource, when the wrong JSON
    serialization of the resource or action is used.

  - **401 Unauthorized** - The request requires user authentication. The
    response MUST include a *Authenticate* header field containing a
    challenge applicable to the requested resource. If the request
    includes an *Authenticate* header, then this HTTP status code might
    indicate that the current user is **not authorized** to perform
    given action or to access given resource.

  - **403 Forbidden** - The server understood the request, but is
    refusing to fulfill it. Authorization will not help in this case.
    This HTTP status code might indicate that the action performed is
    not supported for this resource or collection.

  - **404 Not Found** - In this case, the server has not found anything
    that matches with the URL.

  - **415 Unsupported Media Type** - The server is refusing to service
    the request because the entity of the request is in a format not
    supported by the requested resource for the requested method. This
    error must be returned, when the client is explicitly asking for
    format other than JSON (application/json).

### Server Errors

  - **500 Internal Server Error** - The server encountered an unexpected
    condition which prevented it from fulfilling the request. This error
    code must be used when an exception is raised in the application and
    the exception has nothing to do with the client request.
