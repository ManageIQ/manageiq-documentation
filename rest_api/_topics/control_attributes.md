#### Control Attributes

The controls are specified in the GET URL as attribute value pairs as
follows:

    GET /api/resources?ctl1=val1&ctl2=val2

| Category | Attribute                           | Semantics                                                                                                                                        |
| -------- | ----------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------ |
| Paging   |                                     |                                                                                                                                                  |
|          | offset                              | 0-based offset of first item to return                                                                                                           |
|          | limit                               | number of items to return. If 0 is specified then the remaining items are returned                                                               |
| Scope    |                                     |                                                                                                                                                  |
|          | filter\[\]                          | One or more filters to search on. See [Filtering](#filtering) below.                                                                             |
|          | attributes=atr1,atr2,…​             | Which attributes in addition to id and href to return. If not specified or *all* (default is attributes=*all*), then all attributes are returned |
|          | expand=resources                    | To expand the resources returned in the collection and not just the href. See [Expanding Collection](#expanding_collections1) below              |
| Sorting  |                                     |                                                                                                                                                  |
|          | sort\_by=atr1,atr2,…​               | By which attribute(s) to sort the result by                                                                                                      |
|          | sort\_order=ascending or descending | Order of the sort                                                                                                                                |

  - The `count` attribute in a collection always denotes the total
    number of items in the collection, not the number of items returned.

  - The `subcount` attribute in a collection denotes the number of items
    from the collection that were returned, for example as the result of
    a paged request.
