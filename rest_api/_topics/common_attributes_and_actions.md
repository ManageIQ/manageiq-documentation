#### Common Attributes and Actions

The following describes attributes and actions that are shared by all
resources and collections defined in this API.

| Attribute | Type      | Description                                       |
| --------- | --------- | ------------------------------------------------- |
| id        | Integer   | An integer identifier for the referenced resource |
| href      | Ref(self) | A unique self reference                           |
| name      | String    | A human name of the resource                      |

Attributes

    {
      "href" : "https://hostname/api/resources/1",
      "id" : 1,
      "name" : "first_resource"
    }

| Action | HTTP method    | Description                           |
| ------ | -------------- | ------------------------------------- |
| create | POST           | Create new resource in the collection |
| edit   | PUT/PATCH/POST | Edit attributes in resource           |
| delete | DELETE         | Delete resource                       |

Actions

**Note:**

The availability of these common actions depends on the role and
permissions that the current API user has for a particular resource.

</div>
