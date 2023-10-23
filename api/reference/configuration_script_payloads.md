---
---

## Configuration Script Payloads

Management of configuration script payloads is provided through the following
collection:

``` data
/api/configuration_script_payloads
```

The following actions on configuration script payloads are available:

- [Querying Configuration Script Payloads](#querying-configuration-script-payloads)

- [Editing Configuration Script Payloads](#editing-configuration-script-payloads)

- [Updating Configuration Script Payloads](#updating-configuration-script-payloads)

- [Querying Configuration Script Payload Authentication](#querying-configuration-script-payload-authentication)

- [Creating Configuration Script Payload Authentication](#creating-configuration-script-payload-authentication)

### Querying Configuration Script Payloads

Query all configuration script payloads in the system:

    GET /api/configuration_script_payloads

Get the details on a specific configuration script payload:

    GET /api/configuration_script_payloads/:id

### Editing configuration script payloads

Configuration script payloads can be edited by using a POST to the configuration script payloads collection:

    POST /api/configuration_script_payloads

### Updating configuration script payloads

Configuration script payloads can be updated by using a PUT method or PATCH method.

PUT method:

    PUT /api/configuration_script_payloads/:id

Patch method:

    PATCH /api/configuration_script_payloads/:id

### Querying Configuration Script Payload Authentication

Query the authentication credentials for a specific configuration script payload:

    GET /api/configuration_script_payloads/:id/authentications

Get the details on a specific authentication credential for a configuration script payload:

    GET /api/configuration_script_payloads/:id/authentications/:id

### Creating Configuration Script Payload Authentication

Authentication credentials for a configuration script payload can be created by using a POST to the configuration script payload collection:

    POST /api/configuration_script_payloads/:id/authentications
