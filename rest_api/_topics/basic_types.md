#### Basic types

The following are basic data types and type combinators that are used
throughout:

| Name           | Explanation                                                                                                       | Example serialization                                                                                                   |
| -------------- | ----------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------- |
| **Integer**    | Integer value                                                                                                     | { "id" : 10 }                                                                                                           |
| **String**     | JSON string                                                                                                       | { "state" : "running" }                                                                                                 |
| **URL**        | Absolute URL                                                                                                      | { "href" : "http://SERVER/vms/1/start" }                                                                                |
| **Timestamp**  | Timestamp in ISO8601 format                                                                                       | { "created" : "2013-12-05T08:15:30Z" }                                                                                  |
| **Array\[T\]** | Array where each entry has type T                                                                                 | { "vms" : \[ { "id" : 1 }, { "id" : 2 }\] }                                                                             |
| **Ref\[T\]**   | A reference to a T, used to model relations, the T is a valid Resource identifier                                 | { "vm" : { "href" : URL } }                                                                                             |
| **Collection** | Array\[T\] where T represents a Ref\[T\], this might allow actions to be executed on all members as a single unit | { "vms" : { "count" : 2, "resources" : \[ { "href" : URL}, { "href" : URL } \], "actions" : \[\] }                      |
| **Struct**     | A structure with sub-attributes                                                                                   | "power\_state": {"state" : "ON", "last\_boot\_time" : "2013-05-29T15:28Z", "state\_change\_time" : "2013-05-29T15:28Z"} |
