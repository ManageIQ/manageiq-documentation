---
---

This document presents the currently available features and capabilities
of the REST API.

## Authentication

| Type                         | Mechanism                                       |
| ---------------------------- | ----------------------------------------------- |
| Basic Authentication         | Basic HTTP Authorization with user and password |
| Token Based Authentication   |                                                 |
| \- Acquiring Token           | /api/auth with Basic Authentication             |
| \- Authenticating with Token | X-Auth-Token Header                             |

## HTTP Headers

| Header        | Value                                            |
| ------------- | ------------------------------------------------ |
| Authorization | Basic base64\_encoded(user:password)             |
| X-Auth-Token  | Token provided by /api/auth                      |
| X-MIQ-Group   | Group to authorize externally authenticated user |
| Accept        | application/json                                 |
| Content-Type  | application/json                                 |

## Listing and Querying Collections and Sub-Collections

| Feature                       | Path                                          |
| ----------------------------- | --------------------------------------------- |
| Listing Available Collections | /api                                          |
| Listing Collections           | /api/\<collection\>                           |
| Listing Sub-Collections       | /api/\<collection\>/\<id\>/\<sub-collection\> |

| Querying Capability       | Query Parameters                                                  |
| ------------------------- | ----------------------------------------------------------------- |
| Paging                    | offset, limit                                                     |
| Sorting                   | sort\_by=attr, sort\_order=asc|desc                               |
|                           | Can sort by database columns and SQL friendly virtual attributes  |
| Filtering                 | filter\[\]=…​                                                     |
| Querying by Tag           | i.e. by\_tag=/department/finance                                  |
| Querying by Multiple Tags | i.e. by\_tag=/department/finance,/department/engineering          |
| Expanding Results         | expand=\<what\>, i.e. expand=resources,tags,service\_templates,…​ |
| Selecting Attributes      | attributes=\<attr1\>,\<attr2\>,…​ i.e. attributes=id,name,type,…​ |
|                           | Attributes can be:                                                |
|                           | Database columns                                                  |
|                           | Virtual attributes                                                |
|                           | Relationships                                                     |

[Example Queries](../examples/queries.html)

## Collection Queries:

For a complete list of supported primary collections please refer to the
[Primary Collections](../reference/collections.html)

## Sub-Collection Queries

When applicable, the following subcollections are available:

| Sub-Collection                                         | URL                                           |
| ------------------------------------------------------ | --------------------------------------------- |
| Tagging                                                | /api/\<collection\>/:id/tags                  |
| Policies                                               | /api/\<collection\>/:id/policies              |
| Policy Profiles                                        | /api/\<collection\>/:id/policy\_profiles      |
|                                                        |                                               |
| Service Requests                                       | /api/service\_templates/:id/service\_requests |
| Request Tasks                                          |                                               |
|                                                        | /api/service\_requests/:id/request\_tasks     |
|                                                        | /api/automation\_requests/:id/request\_tasks  |
|                                                        | /api/provision\_requests/:id/request\_tasks   |
| Request Tasks can also be accessed via the tasks alias |                                               |
|                                                        | /api/service\_requests/:id/tasks              |
|                                                        | /api/automation\_requests/:id/tasks           |
|                                                        | /api/provision\_requests/:id/tasks            |
