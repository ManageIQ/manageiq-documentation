#### Refreshing a Provider

##### Request:

    POST /api/providers/105

``` json
{
  "action" : "refresh"
}
```

##### Response:

``` json
{
  "success": true,
  "message": "Provider id:105 name:'rhevm105' refreshing",
  "href": "https://hostname/api/providers/105"
}
```
