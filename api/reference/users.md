---
---

## User Management

Management of Users is provided via the following collection:

``` data
/api/users
```

Full CRUD actions on users is available:

  - [Querying Users](#querying-users)

  - [Creating Users](#creating-users)

  - [Editing Users](#editing-users)

  - [Editing Authenticated User](#editing-authenticated-user)

  - [Deleting Users](#deleting-users)

### Querying Users

Querying all users in the system is simply:

    GET /api/users

Getting details on a specific user:

    GET /api/users/:id

### Creating Users

Users can be created via a POST to the users collection or via the
**create** action signature which also allows creation of multiple users
in a single request.

    POST /api/users

``` json
{
  "userid" : "testuser",
  "password" : "secret",
  "name" : "Test User",
  "group" : { "id" : "11" }
}
```

**Note:**

group can be specified via **description**, **href**, or **id**

</div>

or creating multiple users:

``` json
{
  "action" : "create",
  "resources" : [
    { "userid" : "testuser1", "name" : "Test User1", ... },
    { "userid" : "testuser2", "name" : "Test User2", ... },
    ...
  ]
}
```

**Note:**

Please refer to the [Resource
Attributes](../appendices/resource_attributes.html#users) page for a
list of available attributes when creating Users.

</div>

### Editing Users

    POST /api/users/:id

``` json
{
  "action" : "edit",
  "resource" : {
    "group" : { "id" : "12" }
  }
}
```

or editing multiple users:

    POST /api/users

``` json
{
  "action" : "edit",
  "resources" : [
    {
      "href" : "http://localhost:3000/api/users/101",
      "group" : { "href" : "http://localhost:3000/api/groups/15" }
    },
    {
      "href" : "http://localhost:3000/api/users/102",
      "group" : { "href" : "http://localhost:3000/api/groups/15" }
    },
    {
      "href" : "http://localhost:3000/api/users/103",
      "group" : { "href" : "http://localhost:3000/api/groups/15" }
    },
    ...
  ]
}
```

### Editing Authenticated User

An API Authenticated User can edit some of their own attributes without
having general user edit permissions. Editable attributes for the
authenticated user are:

|          |
| -------- |
| password |
| email    |
| settings |

Users can also update their currently selected group with the
**set\_current\_group** action as follows:

    POST /api/users/:id

``` json
{
  "action" : "set_current_group",
  "resource" : {
    "group" : { "description" : "EvmGroup-auditor" }
  }
}
```

**Note:**

The group reference can be via **description**, **href** or **id**.
Also, only a group that the user belongs to can be specified.

</div>

### Deleting Users

users can be deleted via either the **delete** POST action or via the
DELETE HTTP method.

    POST /api/users/101

``` json
{
  "action" : "delete"
}
```

or simply:

    DELETE /api/users/101

Deleting multiple users can be done as follows:

    POST /api/users

``` json
{
  "action" : "delete",
  "resources" : [
    { "href" : "http://localhost:3000/api/users/101" },
    { "href" : "http://localhost:3000/api/users/102" },
    ...
  ]
}
```
