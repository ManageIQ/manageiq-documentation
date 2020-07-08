---
---

## Automate Workspaces

Management of Automate Workspaces is provided with the following
collection:

``` data
/api/automate_workspaces
```

  - [Querying Automate Workspaces](#querying-automate-workspaces)

  - [Editing Automate Workspaces](#editing-automate-workspaces)

  - [Encrypting Automate Workspace
    Passwords](#encrypting-automate-workspace-passwords)

  - [Decrypting Automate Workspace
    Passwords](#decrypting-automate-workspace-passwords)

### Querying Automate Workspaces

It is not allowed to query the automate workspace collection, only
individual automate workspaces can be fetched by guid.

    GET /api/automate_workspaces/:guid

Example GET Request and Response:

#### Request:

    GET /api/automate_workspaces/430a66a0-b564-4341-b9b2-85d6f467f26f

#### Response:

``` json
{
  "href": "http://localhost:3000/api/automate_workspaces/430a66a0-b564-4341-b9b2-85d6f467f26f",
  "id": "2",
  "guid": "430a66a0-b564-4341-b9b2-85d6f467f26f",
  "user_id": "1",
  "tenant_id": "1",
  "input": {
    "objects": {
      "root": {
        "var1": "a",
        "var2": "b"
      }
    },
    "method_parameters": {
      "arg1": "first_argument"
    }
  },
  "actions": [
    {
      "name": "edit",
      "method": "post",
      "href": "http://localhost:3000/api/automate_workspaces/430a66a0-b564-4341-b9b2-85d6f467f26f"
    },
    {
      "name": "encrypt",
      "method": "post",
      "href": "http://localhost:3000/api/automate_workspaces/430a66a0-b564-4341-b9b2-85d6f467f26f"
    },
    {
      "name": "decrypt",
      "method": "post",
      "href": "http://localhost:3000/api/automate_workspaces/430a66a0-b564-4341-b9b2-85d6f467f26f"
    }
  ]
}
```

### Editing Automate Workspaces

Updating Automate Workspaces can be done via the *edit* action as
follows:

``` data
POST /api/automate_workspaces/:guid
```

``` json
{
  "action" : "edit",
  "resource" : {
    "objects" : {
      "root" : {
        "var3" : "c"
      }
    }
  }
}
```

### Encrypting Automate Workspace Passwords

Encrypting passwords in the automate workspace can be done as follows:

#### Request:

``` data
POST /api/automate_workspaces/:guid
```

``` json
{
  "action" : "encrypt",
  "resource" : {
    "object" : "method_parameters",
    "attribute" : "arg2",
    "value" : "unencrypted_password"
  }
}
```

#### Response:

``` json
{
  "href": "http://localhost:3000/api/automate_workspaces/430a66a0-b564-4341-b9b2-85d6f467f26f",
  "id": "2",
  "guid": "430a66a0-b564-4341-b9b2-85d6f467f26f",
  "user_id": "1",
  "tenant_id": "1",
  "input": {
    "objects": {
      "root": {
        "var1": "a",
        "var2": "b"
      }
    },
    "method_parameters": {
      "arg1": "first_argument",
      "arg2": "password::********"
    }
  }
}
```

### Decrypting Automate Workspace Passwords

Encrypted passwords in the automate workspace can be decrypted
individually as follows:

#### Request:

``` data
POST /api/automate_workspaces/:guid
```

``` json
{
  "action" : "decrypt",
  "resource" : {
    "object" : "method_parameters",
    "attribute" : "arg2"
  }
}
```

#### Response:

``` json
{
  "object" : "method_parameters",
  "attribtue" : "arg2",
  "value" : "unencrypted_password"
}
```
