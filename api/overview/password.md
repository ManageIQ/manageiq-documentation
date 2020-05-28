---
---

### Password Updates

When the appliance is configured for Database authentication, users can
update their passwords via the REST API.

Note that if an authenticated REST API user is entitled to edit users,
they can edit other users' passwords, e.g. admin account.

Passwords can be updated via the **edit** post action on the user’s
resource as follows:

    POST /api/users/:id

``` json
{
  "action" : "edit",
  "resource" : { "password" : "<new_password>" }
}
```

So for updating one’s password, the */api/users/:id* being updated must
be the authenticated REST API user’s object.
