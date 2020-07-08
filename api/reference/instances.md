---
---

## Instance Management

Management of instances adds support for the following actions:

| Action        | Description                    |
| ------------- | ------------------------------ |
| start         | Starts an Instance             |
| stop          | Stops an Instance              |
| suspend       | Suspending an Instance         |
| pause         | Pausing an Instance            |
| reboot\_guest | Rebooting Guest in an Instance |
| reset         | Resetting an Instance          |
| shelve        | Shelving an Instance           |
| terminate     | Terminating an Instance        |

  - [Targeting Instances](#targeting-instances)

  - [Querying Instances](#querying-instances)

  - [Starting an Instance](#start-instance)

  - [Stopping an Instance](#stop-instance)

  - [Suspending an Instance](#suspend-instance)

  - [Pausing an Instance](#pause-instance)

  - [Rebooting Guest in an Instance](#reboot-guest-instance)

  - [Resetting an Instance](#reset-instance)

  - [Shelving an Instance](#shelve-instance)

  - [Terminating an Instance](#terminate-instance)

### Targeting Instances

These actions can be triggered on individual instance resources:

``` data
/api/instances/:id
```

As simply as POSTing the following action to an instance.

``` json
{
  "action" : "start"
}
```

Requests can also be made on multiple instances by targeting the primary
collection:

``` data
/api/instances
```

``` json
{
  "action" : "start",
  "resources" : [
    { "href" : "http://localhost:3000/api/instances/101" },
    { "href" : "http://localhost:3000/api/instances/102" },
    ...
  ]
}
```

### Querying Instances

Instances are queried via the primary collection URL:

``` data
/api/instances
```

Filtering, sorting and paging as mentioned on the
[Querying](../overview/query.html) page.

#### Load Balancers

Load Balancers of an instance can be queried via the load\_balancers
subcollection as follows:

Query all Load Balancers of an instance:

``` data
GET /api/instances/:id/load_balancers
```

Query a specific Load Balancer of an instance:

``` data
GET /api/instances/:id/load_balancers/:load_balancer_id
```

Or expanding the Load Balancers for the specific instance as follows:

``` data
GET /api/instances/:id?expand=load_balancers
```

### Starting an Instance

``` json
{
  "action" : "start"
}
```

### Stopping an Instance

``` json
{
  "action" : "stop"
}
```

### Suspending an Instance

``` json
{
  "action" : "suspend"
}
```

### Pausing an Instance

``` json
{
  "action" : "pause"
}
```

### Terminating an Instance

``` json
{
  "action" : "terminate"
}
```

### Shelving an Instance

``` json
{
  "action" : "shelve"
}
```

### Rebooting Guest in an Instance

``` json
{
  "action" : "reboot-guest"
}
```

### Resetting an Instance

``` json
{
  "action" : "reset"
}
```
