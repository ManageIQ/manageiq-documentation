---
---

## Virtual Machine Management

Management of virtual machines adds support of the following actions:

| Action                | Description                                           |
| --------------------- | ----------------------------------------------------- |
| start                 | Starts a virtual machine                              |
| stop                  | Stops a virtual machine                               |
| suspend               | Suspends a virtual machine                            |
| refresh               | Refreshes a virtual machine                           |
| request\_retire       | Retires a virtual machine                             |
| reset                 | Resets a virtual machine                              |
| reboot\_guest         | Reboots guest in virtual machine                      |
| shutdown\_guest       | Shuts down guest in virtual machine                   |
| scan                  | Scans a virtual machine (Perform SmartState Analysis) |
| set\_miq\_server      | Sets the server of a virtual machine                  |
| set\_owner            | Sets the owner of a virtual machine                   |
| add\_event            | Adding an event to a virtual machine                  |
| add\_lifecycle\_event | Add a life cycle event to a virtual machine           |
| edit                  | Edits a virtual machine                               |
| delete                | Deletes a virtual machine in the appliance            |

  - [Targeting VMs](#targeting-vms)

  - [Querying VMs](#querying-vms)

  - [Starting a VM](#start-vm)

  - [Stopping a VM](#stop-vm)

  - [Suspending a VM](#suspend-vm)

  - [Refreshing a VM](#refresh-vm)

  - [Retiring a VM](#retire-vm)

  - [Resets a VM](#reset-vm)

  - [Reboots guest in VM](#reboot-guest-vm)

  - [Shuts down guest in VM](#shutdown-guest-vm)

  - [Scanning a VM](#scan-vm)

  - [Setting Server of a VM](#set-miq-server-vm)

  - [Setting Owner of a VM](#set-owner-vm)

  - [Adding an Event to a VM](#add-event-vm)

  - [Adding a Lifecycle Event to a VM](#add-lifecycle-event-vm)

  - [Editing a VM](#edit-vm)

  - [Deleting a VM](#delete-vm)

### Targeting Virtual Machines

These actions can be triggered on individual virtual machine resources:

``` data
/api/vms/:id
```

As simply as POSTing the following action to a virtual machine.

``` json
{
  "action" : "start"
}
```

Requests can also be made on multiple vms by targetting the primary
collection:

``` data
/api/vms
```

``` json
{
  "action" : "start",
  "resources" : [
    { "href" : "http://localhost:3000/api/vms/11" },
    { "href" : "http://localhost:3000/api/vms/12" },
    ...
  ]
}
```

### Querying Virtual Machines

Virtual machines are queried via the primary collection URL:

``` data
/api/vms
```

Filtering, sorting and paging as mentioned on the
[Querying](../overview/query.html) page.

When querying vms, expanding the resources themselves as well as the
following subcollections:

|          |
| -------- |
| accounts |
| software |

For example:

    GET /api/vms?expand=resources,accounts,software

Or querying an individual virtual machine

    GET /api/vms/:id?expand=accounts,software

### Starting a Virtual Machine

``` json
{
  "action" : "start"
}
```

### Stopping a Virtual Machine

``` json
{
  "action" : "stop"
}
```

### Suspending a Virtual Machine

``` json
{
  "action" : "suspend"
}
```

### Refreshing a Virtual Machine

``` json
{
  "action" : "refresh"
}
```

### Retiring a Virtual Machine

``` json
{
  "action" : "request_retire"
}
```

### Resetting a Virtual Machine

``` json
{
  "action" : "reset"
}
```

### Rebooting guest in Virtual Machine

``` json
{
  "action" : "reboot_guest"
}
```

### Shutting Down Guest in a Virtual Machine

``` json
{
  "action" : "shutdown_guest"
}
```

### Scanning a Virtual Machine

``` json
{
  "action" : "scan"
}
```

### Setting Server of a Virtual Machine

``` json
{
  "action" : "set_miq_server",
  "resource" : {
    "miq_server" : { "href" : "http://localhost:3000/api/servers/5" }
  }
}
```

``` json
{
  "action" : "set_miq_server",
  "resource" : {
    "miq_server" : { "id" : "6" }
  }
}
```

To remove the server from the virtual machine, pass in an empty
reference as follows:

``` json
{
  "action" : "set_miq_server",
  "resource" : {
    "miq_server" : {}
  }
}
```

### Setting Owner of a Virtual Machine

``` json
{
  "action" : "set_owner",
  "resource" : {
    "owner" : "admin"
  }
}
```

### Adding an Event to a Virtual Machine

``` json
{
  "action" : "add_event",
  "resource" : {
    "event_type" : "...",
    "event_message" : "...",
    "event_time" : "UTC Time"
  }
}
```

**Note:**

event\_time above is optional. If skipped, current time will be used.

### Adding a Lifecycle Event to a Virtual Machine

``` json
{
  "action" : "add_lifecycle_event",
  "resource" : {
    "event" : "...",
    "status" : "...",
    "message" : "...",
    "created_by" : "..."
  }
}
```

### Editing a Virtual Machine

Basic information of virtual machines can be edited. This includes the
following:

| VM Info           | Attribute                                            |
| ----------------- | ---------------------------------------------------- |
| description       | description                                          |
| custom attributes | custom\_1 …​ custom\_9                               |
| parent resource   | parent\_resource - resource href reference           |
| child resources   | child\_resources - array of resource href references |

Virtual machine resources can be edited as follows:

``` data
POST /api/vms/:id
```

``` json
{
  "action" : "edit",
  "resource" : {
    "description" : "Updated VM Description",
    "custom_1" : "custom_attribute_1",
    "parent_resource" : { "href" : "http://localhost:3000/api/vms/11" },
    "child_resources" : [
      { "href" : "http://localhost:3000/api/vms/101" },
      { "href" : "http://localhost:3000/api/vms/102" },
      { "href" : "http://localhost:3000/api/vms/103" },
      { "href" : "http://localhost:3000/api/vms/104" }
    ]
  }
}
```

Virtual machines can also be edited in bulk as follows:

``` data
POST /api/vms
```

``` json
{
  "action" : "edit",
  "resources" : [
    {
      "href" : "http://localhost:3000/api/vms/11",
      "custom_9" : "vm_class_a"
    },
    {
      "href" : "http://localhost:3000/api/vms/12",
      "custom_9" : "vm_class_a"
    },
    {
      "href" : "http://localhost:3000/api/vms/13",
      "custom_9" : "vm_class_a"
    }
  ]
}
```

### Deleting a Virtual Machine

``` json
{
  "action" : "delete"
}
```

Or simply doing the following:

    DELETE /api/vms/:id

See the main REST API examples section for additional virtual machine
management examples.
