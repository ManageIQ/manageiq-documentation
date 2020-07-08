#### Collections

Resources can be grouped into collections. Each collection is unordered,
and is homogeneous so that it contains only one type of resource.
Resources can also exist outside any collection; these resources are
referred to as singleton resources. Collections are themselves resources
as well.

Collections can exist globally, at the top level of an API, and can also
be contained inside a single resource. The latter are referred to as
sub-collections. Sub-collections are usually used to express a
relationship where one resource is contained within another.

Collections are serialized in JSON in the following way:

    {
      "name" : "String",
      "count": String,
      "subcount": String,
      "resources": [ ... ],
      "actions": [ ... ]
    }

  - The `count` attribute in a collection always denotes the total
    number of items in the collection, not the number of items returned.

  - The `subcount` attribute in a collection depicts the number of items
    returned.

  - The `resources` attribute is an Array\[T\], where T might be a list
    of references to the T or, if expanded, a list of resources with all
    attributes.

  - The `actions` attribute contains an Array of actions that can be
    performed against the collection resources.
