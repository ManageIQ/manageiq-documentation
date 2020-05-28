---
---

## Service Orders

The service orders collection and actions are provided for managing
Shopping Carts and their related service requests.

``` data
/api/service_orders
```

Available actions on service\_orders instances include:

| Action | Description                                        |
| ------ | -------------------------------------------------- |
| create | Creating the Shopping Cart                         |
| clear  | Clearing the Shopping Cart                         |
| order  | Ordering all service requests in the Shopping Cart |
| copy   | Copying the Shopping Cart                          |
| delete | Deleting the Shopping Cart                         |

Some important points on Shopping Carts:

  - There is one and only one shopping cart for the authenticated user

  - A shopping cart is an /api/service\_orders resource with a state of
    **cart**

  - Shopping carts can be referenced by their resource id or preferably
    via the alphanumeric **cart** identifier.

  - resource id’s need to be used for accessing non-cart service\_orders
    states of **wish** list and **ordered**

Items to add to a shopping cart are *service\_requests* that are
specified similarly to when services are ordered from a service
template.

  - [Querying Service Orders](#querying-service-orders)

  - [Creating Service Orders](#creating-service-orders)

  - [Adding Service Requests](#adding-service-requests)

  - [Removing Service Requests](#removing-service-requests)

  - [Clearing Service Orders](#clearing-service-orders)

  - [Copying Service Orders](#copying-service-orders)

  - [Deleting Service Orders](#deleting-service-orders)

  - [Ordering Service Orders](#ordering-service-orders)

### Querying Service Orders

All the queries listed here below return the service orders for the
authenticated user.

Getting all service\_orders:

``` data
GET /api/service_orders
```

Getting the shopping cart:

``` data
GET /api/service_orders/cart
```

Getting the shopping cart with expanded service\_requests:

``` data
GET /api/service_orders/cart?expand=service_requests,resources
```

Getting the service requests of the shopping cart:

``` data
GET /api/service_orders/cart/service_requests
```

### Creating Service Orders with multiple service requests

``` data
POST /api/service_orders
```

``` json
{
  "service_requests" : [
    {
      "service_template_href" : "http://localhost:3000/api/service_templates/3",
      "Basic_Host_Name" : "super_vm_a",
      "Basic_Host_Ip" : "192.168.120.101"
    },
    {
      "service_template_href" : "http://localhost:3000/api/service_templates/3",
      "Basic_Host_Name" : "super_vm_b",
      "Basic_Host_Ip" : "192.168.120.102"
    },
    ...
  ]
}
```

Creating a wish list service\_order:

``` data
POST /api/service_orders
```

``` json
{
  "state" : "wish",
  "service_requests" : [
    {
      "service_template_href" : "http://localhost:3000/api/service_templates/2",
      "host_name" : "sample_service_order_host_name",
      "host_ip" : "192.168.120.101"
    }
  ]
}
```

### Adding Service Requests

Adding service requests to a shopping cart can be done by either of the
create methods shown above which will all add the service requests to
the existing shopping cart:

``` data
POST /api/service_orders
```

or specifically to the shopping cart or any wish list service\_orders
via its *id* instead of **cart** as follows:

``` data
POST /api/service_orders/cart/service_requests
```

``` data
POST /api/service_orders/:id/service_requests
```

``` json
{
  "action" : "add",
  "resources" : [
    {
      "service_template_href" : "http://localhost:3000/api/service_templates/3",
      "Basic_Host_Name" : "sample_service_order_host_name_2",
      "Basic_Host_Ip" : "192.168.120.102"
    },
    {
      "service_template_href" : "http://localhost:3000/api/service_templates/3",
      "Basic_Host_Name" : "sample_service_order_host_name_3",
      "Basic_Host_Bad_Ip" : "192.168.120.103"
    },
    ...
  ]
}
```

**Note**: \* POST /api/service\_orders is atomic, requests are validated
for all requests before adding them. \* POST
/api/service\_orders/cart/service\_requests will add the requests one by
one, the action responses have the **success** field for each requests
reflecting the success or failure of each request.

### Removing Service Requests

Removing requests from the shopping cart is available via the *remove*
action:

``` data
POST /api/service_orders/cart/service_requests
```

``` json
{
  "action" : "remove",
  "resources" : [
    { "href" : "http://localhost:3000/api/service_orders/6/service_requests/56" },
    { "href" : "http://localhost:3000/api/service_orders/6/service_requests/57" }
  ]
}
```

### Clearing Service Orders

Clearing the shopping cart can be done via the *clear* action:

``` data
POST /api/service_orders/cart
```

``` json
{
  "action" : "clear"
}
```

### Copying Service Orders

A service order can be copied into a new service order via the *copy*
action:

``` data
POST /api/service_orders/:id
```

``` json
{
   "action" : "copy",
   "resource" : {
      "name" : "new_service_order_name"
   }
}
```

Service orders can also be copied in bulk as follows:

``` data
POST /api/service_orders/:id
```

``` json
{
   "action" : "copy",
   "resources" : [
      {
        "href" : "http://localhost:3000/api/service_orders/1",
        "name" : "new_service_order_name_1"
      },
      {
        "href" : "http://localhost:3000/api/service_orders/2",
        "name" : "new_service_order_name_2"
      },
      ...
   ]
}
```

### Deleting Service Orders

Deleting the shopping cart can be done via the *delete* action:

``` data
POST /api/service_orders/cart
```

``` json
{
   "action" : "delete"
}
```

or simply via the DELETE method:

``` data
DELETE /api/service_orders/cart
```

### Ordering Service Orders

Ordering the shopping cart is done via the *order* action as follows:

``` data
POST /api/service_orders/cart
```

``` json
{
   "action" : "order"
}
```
