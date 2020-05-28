#### Expanding Collections

While in the JSON serialization example the description says that the
resource might be a list of references to the resource, using the
`expand` parameter returns a full JSON serialization of the resource
instead:

**GET** `/api/vms`

    {
      "name" : "vms"
      "count": 2,
      "subcount": 2,
      "resources": [
        { "href" : "https://hostname/api/vms/1" },
        { "href" : "https://hostname/api/vms/2" }
      ],
      "actions": []
    }

**GET** `/api/vms?expand=resources`

    {
      "name" : "vms"
      "count": 2,
      "subcount": 2,
      "resources": [
        {
          "href" : "https://hostname/api/vms/1",
          "id" : 1,
          "name" : "My First VM",
          ...
        },
        {
          "href" : "https://hostname/api/vms/2",
          "id" : 2,
          "name" : "My Second VM",
          ...
        }
      ],
      "actions": []
    }
