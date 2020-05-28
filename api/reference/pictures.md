---
---

## Picture Management

Management of Pictures adds support of the following actions:

  - [Creating a Picture](#creating-picture)

  - [Querying Pictures](#querying-pictures)

### Creating a Picture

``` data
POST /api/pictures
```

``` json
{
  "extension": "<extension of image>",
  "content": "<base 64 encoded image here>"
}
```

Supported extensions include:

| Extension |
| --------- |
| jpg       |
| png       |
| svg       |

### Querying Pictures

Querying pictures like any other collection:

``` data
GET /api/pictures?expand=resources
```

``` json
{
  "name": "pictures",
  "count": 5,
  "subcount": 5,
  "resources": [
    {
      "href": "http://localhost:3000/api/pictures/1",
      "id": "1",
      "image_href" : "http://localhost:3000/pictures/1.jpg",
      "extension" : "jpg"
    },
    ...
    {
      "href": "http://localhost:3000/api/pictures/4",
      "id": "4",
      "image_href" : "http://localhost:3000/pictures/4.png",
      "extension" : "png",
      "resource_id": "1",
      "resource_type": "ServiceTemplate"
    },
    {
      "href": "http://localhost:3000/api/pictures/5",
      "id": "5",
      "image_href" : "http://localhost:3000/pictures/5.jpg",
      "extension" : "jpg"
    }
  ],
  "actions": [
    {
      "name": "create",
      "method": "post",
      "href": "http://localhost:3000/api/pictures"
    }
  ]
}
```

This query does not return the pictures themselves, simply metadata
about the pictures.

Actually fetching the particular picture is done by getting the image by
its image\_href.

``` data
GET /api/pictures/4
```

``` json
{
  "href": "http://localhost:3000/api/pictures/4",
  "id": "4",
  "resource_id": "1",
  "resource_type": "ServiceTemplate",
  "image_href": "http://localhost:3000/pictures/4.jpg"
}
```

In which case the image can simply be downloaded with a GET:

``` data
GET http://localhost:3000/pictures/4.jpg
```

For fetching information about pictures pertaining to services, see the
section [Querying
Pictures](../reference/service_queries.html#querying-pictures) for
details.
