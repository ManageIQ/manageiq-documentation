---
---

## Pagination

Pagination is enabled by default. When querying collections and the
*limit* query parameter is not specified, only 1000 resources are
returned by default. This is driven by the new advanced setting:

``` data
:api:
  :max_results_per_page: 1000
```

Example GET with offset and limit specified.

``` data
GET /api/vms?offset=2&limit=2&sort_by=name&expand=resources
```

``` json
{
  "name"      : "vms",
  "count"     : 7,
  "subcount"  : 2,
  "pages"     : 4,
  "resources" : [
    {
      "href"   : "http://localhost:3000/api/vms/7254",
      "id"     :  "7254",
      "vendor" : "vmware",
      "name"   : "test-vm1",
      ...
    },
    {
      "href"   : "http://localhost:3000/api/vms/7257",
      "id"     : "7257",
      "vendor" : "vmware",
      "name"   : "test-vm2",
      ...
    }
  ],
 "actions" : [
    ...
  ],
 "links" : {
   "self"     : "http://localhost:3000/api/vms?offset=2&limit=2&sort_by=name&expand=resources",
   "next"     : "http://localhost:3000/api/vms?offset=4&limit=2&sort_by=name&expand=resources",
   "previous" : "http://localhost:3000/api/vms?offset=0&limit=2&sort_by=name&expand=resources",
   "first"    : "http://localhost:3000/api/vms?offset=0&limit=2&sort_by=name&expand=resources",
   "last"     : "http://localhost:3000/api/vms?offset=6&limit=2&sort_by=name&expand=resources"
 }
}
```

With pagination enabled by default, collection queries now return the
following:

  - "pages" metadata which is the total number of pages for the *limit*
    specified (or the default 1000).

  - "links" metadata section which includes the necessary URL’s for
    fetching the current page, next and previous pages, as well as the
    first and last pages.

*Notes:*

  - When the page being returned is the first page (i.e. offset = 0),
    the *previous* link is not returned.

  - When the page being returned is the last page, the *next* page link
    is not returned.

  - For small result sets where *limit* is less than
    max_results_per_page, the *limit* will be honored.

  - For large result sets where the *limit* is greater than
    max_results_per_page, *limit* will be ignored and the result will
    be limited to the first max_results_per_page resources.

### About max_results_per_page

If the default value for max_results_per_page does not meet your
needs, it can be changed using the Advanced Settings feature in the UI.
However, it is *NOT* recommended to set it to some arbitrarily large
number in an effort to circumvent the pagination feature. The pagination
feature is designed to prevent excessive load on the API workers, which
is easy to do with large collections such as metric rollups and event
streams that may have millions of records.
