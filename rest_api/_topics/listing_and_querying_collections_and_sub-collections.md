### Listing and Querying Collections and Sub-Collections

| Feature                       | Path                                          |
| ----------------------------- | --------------------------------------------- |
| Listing Available Collections | /api                                          |
| Listing Collections           | /api/\<collection\>                           |
| Listing Sub-Collections       | /api/\<collection\>/\<id\>/\<sub-collection\> |

| Querying Capability  | Query Parameters                                                  |
| -------------------- | ----------------------------------------------------------------- |
| Paging               | offset, limit                                                     |
| Sorting              | sort\_by=attr, sort\_order=asc|desc                               |
| Filtering            | filter\[\]="…​"                                                   |
| Querying by Tag      | i.e. by\_tag=/department/finance                                  |
| Expanding Results    | expand=\<what\>, i.e. expand=resources,tags,service\_templates,…​ |
| Selecting Attributes | attributes=\<attr1\>,\<attr2\>,…​ i.e. attributes=id,name,type,…​ |
|                      | Attributes can be:                                                |
|                      | Database columns                                                  |
|                      | Virtual attributes                                                |
|                      | Relationships                                                     |
