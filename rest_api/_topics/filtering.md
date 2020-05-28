#### Filtering

`GET` requests against collections support the following query
parameters to enable filtering:

  - `filter[]`: The SQL filter to use for querying the collection.

<!-- end list -->

    GET /api/resources?filter[]=name='myservice%25'

The query above requests resources that begin with the name `myservice`.
String values must be contained in single or double quotes. Special
characters within the quotes must be URL encoded. In the example above,
the database wildcard character, `%`, is encoded as `%25`.
