---
---

## Settings Management

Management of advanced settings is available on servers, zones and
regions. They are provided with the following collection:

``` data
/api/settings
```

for the server processing the API, or for a particular server, zone or
region as follows:

``` data
/api/servers/:id/settings
```

``` data
/api/zones/:id/settings
```

``` data
/api/regions/:id/settings
```

The following actions are available with advanced settings:

  - [Querying Settings](#querying-settings)

  - [Updating Settings](#updating-settings)

  - [Deleting Settings](#deleting-settings)

### Querying Settings

Settings can be queried as follows:

``` data
GET /api/servers
```

``` data
GET /api/servers/:id/settings
```

``` data
GET /api/zones/:id/settings
```

``` data
GET /api/regions/:id/settings
```

**Note:**

<div class="title">

Authorization

</div>

  - For users with an *EvmGroup-super\_administrator* role, the complete advanced settings are returned.

  - For users with roles that include the *Configuration Settings* feature, only a whitelisted set of settings are returned.

  - Requests from all other users will be rejected with a Forbidden error.

### Updating Settings

Updating settings can only be performed by users with an
*EvmGroup-super\_administrator* role.

Updates to settings is available with the HTTP PATCH method as follows:

``` data
PATCH /api/servers/:id/settings
```

``` data
PATCH /api/zones/:id/settings
```

``` data
PATCH /api/regions/:id/settings
```

The following is an example updating the policy\_events’s
purge\_window\_size:

#### Request:

``` data
PATCH /api/servers/1/settings
```

``` data
{
  “policy_events” : {
    “purge_window_size” : 500
  }
}
```

#### Response:

The complete updated settings is returned:

``` data
{
  "ems": {
    "ems_ansible_tower": {
      "blacklisted_event_names": [

      ],
  ...
  “policy_events” : {
    "history": {
      "keep_policy_events": "6.months",
      "purge_window_size": 1000
    },
    “purge_window_size” : 500
  },
  ...
}
```

### Deleting Settings

Deleting settings can only be performed by users with an
*EvmGroup-super\_administrator* role.

Deleting settings is available with the HTTP DELETE method as follows:

``` data
DELETE /api/servers/:id/settings
```

``` data
DELETE /api/zones/:id/settings
```

``` data
DELETE /api/regions/:id/settings
```

Requests must include an array representing the path of the setting to
delete.

#### Example:

``` data
DELETE /api/servers/1/settings
```

``` data
[ "policy_events", "purge_window_size" ]
```

This request deletes the policy\_event’s purge\_window\_size setting for
/api/servers/1 and its value would revert to its default.
