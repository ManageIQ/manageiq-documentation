---
---

## Deprecated Resource Attributes

This page lists the resource attributes that have been deprecated in
earlier releases and have been either renamed to newer attribute names
or simply removed.

### API v2.2.0 ⇒ v2.3.0

For Hardware:

| Old Attribute Name | New Attribute Name |
| ------------------ | ------------------ |
| numvcpus           | cpu\_sockets       |
| memory\_cpu        | memory\_mb         |

For Metrics:

| Old Attribute Name              | New Attribute Name                  |
| ------------------------------- | ----------------------------------- |
| v\_derived\_logical\_cpus\_used | v\_derived\_cpu\_total\_cores\_used |

For Provision Workflows:

| Old Attribute Name                      | New Attribute Name |
| --------------------------------------- | ------------------ |
| allowed\_datastore\_aggregate           | **removed**        |
| allowed\_datastore\_storage\_controller | **removed**        |

For all:

| Old Attribute Name       | New Attribute Name           |
| ------------------------ | ---------------------------- |
| cores\_per\_socket       | cpu\_cores\_per\_socket      |
| logical\_cpus            | cpu\_total\_cores            |
| aggregate\_logical\_cpus | aggregate\_cpu\_total\_cores |
