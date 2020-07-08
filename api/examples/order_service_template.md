---
---

### Order a Service Template

#### Request:

    POST /api/service_catalogs/:c_id/service_templates/:s_id

``` json
{
  "action": "order",
  "field1": "field 1 value",
  "field2": "field 2 value"
}
```

#### Response:

``` json
{
  "href": "/api/service_requests/:id",
  "approval_state": "pending_approval",
  "requester_name": "<requester name>",
  "request_state": "pending",
  ...
}
```
