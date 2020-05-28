#### Editing Multiple Services

##### Request:

    POST /api/services

``` json
{
  "action" : "edit",
  "resources" : [
    {
      "href" : "https://hostname/api/services/81",
      "description" : "This is an updated description for service 81"
    },
    {
      "href" : "https://hostname/api/services/82",
      "description" : "This is an updated description for service 82"
    }
  ]
}
```

##### Response:

``` json
{
  "results": [
    {
      "id": 81,
      "name": "api_gen_A_81",
      "description": "This is an updated description for service 81",
      "guid": "eb6daaf8-7c9b-11e4-8a3a-b8e85646e742",
      "options": {
      },
      "created_at": "2014-12-05T16:29:43Z",
      "updated_at": "2015-04-16T22:43:37Z"
    },
    {
      "id": 82,
      "name": "api_gen_A_82",
      "description": "This is an updated description for service 82",
      "guid": "eb6de400-7c9b-11e4-8a3a-b8e85646e742",
      "options": {
      },
      "created_at": "2014-12-05T16:29:43Z",
      "updated_at": "2015-04-16T22:43:37Z"
    }
  ]
}
```
