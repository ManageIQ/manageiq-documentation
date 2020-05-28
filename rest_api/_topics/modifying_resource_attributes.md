#### Modifying Resource Attributes

`PUT /api/vms/42`

    {
      "name" : "A new VM name",
      "description" : "A Description for the new VM"
    }

`POST /api/vms/42`

    {
      "action" : "edit",
      "resource" : {
        "name" : "A new VM name",
        "description" : "A Description for the new VM"
      }
    }

`PATCH /api/vms/42`

    [
      { "action": "edit", "path": "name", "value": "A new VM name" },
      { "action": "add", "path": "description", "value": "A Description for the new VM" },
      { "action": "remove", "path": "policies/3/description" }
    ]

In the `PATCH` implementation, path either references local attributes
or attributes from a related resource in a subcollection.
