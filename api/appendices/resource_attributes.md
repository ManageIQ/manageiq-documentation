---
---

## Resource Attributes

This page lists the available attributes when creating resources with
the REST API

  - [Actions](#actions)

  - [Alert Definitions](#alert-definitions)

  - [Authentications](#authentications)

  - [Categories](#categories)

  - [Chargeback Rates](#chargeback-rates)

  - [Conditions](#conditions)

  - [Configuration Script Sources](#configuration-script-sources)

  - [Generic Objects](#generic-objects)

  - [Generic Object Definitions](#generic-object-definitions)

  - [Groups](#groups)

  - [Orchestration Templates](#orchestration_templates)

  - [Policies](#policies)

  - [Providers](#providers)

  - [Roles](#roles)

  - [Services](#services)

  - [Service Catalogs](#service-catalogs)

  - [Service Dialogs](#service_dialogs)

  - [Tags](#tags)

  - [Tenants](#tenants)

  - [Users](#users)

### Actions

    POST /api/actions

#### Required attributes:

| Attribute    | Type   | Description          |
| ------------ | ------ | -------------------- |
| action\_type | string | Action Type          |
| description  | string | Description (unique) |

#### Optional attributes:

| Attribute | Type   | Description |
| --------- | ------ | ----------- |
| name      | string | Name        |
| options   | hash   | Options     |

### Alert Definitions

    POST /api/alert_definitions

#### Required attributes:

| Attribute   | Type   | Description |
| ----------- | ------ | ----------- |
| description | string | Description |
| db          | string | Database    |
| expression  | hash   | Expression  |
| options     | hash   | Options     |

#### Optional attributes:

| Attribute | Type    | Description                                           |
| --------- | ------- | ----------------------------------------------------- |
| enabled   | boolean | Enable the Alert Definition or not - Defaults to true |

### Authentications

    POST /api/authentications

#### Required attributes:

| Attribute         | Type | Description              |
| ----------------- | ---- | ------------------------ |
| manager\_resource | hash | **href** of the provider |

#### Optional attributes:

| Attribute | Type   | Description          |
| --------- | ------ | -------------------- |
| type      | string | Authentication class |

**Note:**

For a complete list of authentication classes supported and the related
attributes for each type, send the *OPTIONS /api/authentications*
request.

</div>

### Category Attributes

    POST /api/categories

#### Required attributes:

| Attribute   | Type   | Description |
| ----------- | ------ | ----------- |
| name        | string | Name        |
| description | string | Description |

#### Optional attributes:

| Attribute     | Type    | Description                                             |
| ------------- | ------- | ------------------------------------------------------- |
| example\_text | string  | Detailed description                                    |
| show          | boolean | Show Category flag                                      |
| single\_value | boolean | Single Value flag                                       |
| syntax        | string  | Syntax of value, **string**, **integer** or **boolean** |

### Chargeback Rate Attributes

    POST /api/rates

#### Required attributes:

| Attribute            | Type            | Description                                                                                                          |
| -------------------- | --------------- | -------------------------------------------------------------------------------------------------------------------- |
| chargeback\_rate\_id | integer         | Reference to parent Chargeback. `<chargeback_rate>` can be used instead.                                             |
| group                | string          | Group rate belongs to, i.e. **cpu**, **memory**, **net\_io**, **disk\_io**, etc.                                     |
| source               | string          | The input value for calculation, i.e. **allocated**, **used**, etc.                                                  |
| chargeback\_tiers    | Array of hashes | Each tier is represented by hash \`{"start": 0.0, "finish": 'infinity', "fixed\_rate": 2.0, "variable\_rate": 0.0}\] |

#### Optional attributes:

| Attribute         | Type    | Description                                                                                                                              |
| ----------------- | ------- | ---------------------------------------------------------------------------------------------------------------------------------------- |
| description       | string  | Description of the chargeback rate                                                                                                       |
| enabled           | boolean | Rate enabled flag                                                                                                                        |
| friendly\_rate    | string  | Friendly name of the rate                                                                                                                |
| metric            | string  | Metrics, i.e. **derived\_memory\_available**, etc.                                                                                       |
| per\_time         | string  | Measured per time, **hourly**, **daily**, **weekly**, **monthly** or **yearly**                                                          |
| per\_unit         | string  | Measured per unit, i.e. **megabytes**, **gigabytes**, etc.                                                                               |
| chargeback\_rate  | hash    | `id` or `href` from `api/chargebacks` collection.                                                                                        |
| detail\_currency  | hash    | `id` or `href` from `api/currencies` collection. Details of related currency.                                                            |
| chargeable\_field | hash    | `id` or `href` from `api/chargeable_fields` collection. Record representing metric. Contains equivalent columns: `metric, group, source` |

### Conditions

    POST /api/conditions

#### Required attributes:

| Attribute   | Type   | Description           |
| ----------- | ------ | --------------------- |
| description | string | Condition Description |
| expression  | hash   | Expression            |
| modifier    | string | Modifier              |
| towhat      | string | Class name            |

#### Optional attributes:

| Attribute | Type   | Description    |
| --------- | ------ | -------------- |
| name      | string | Condition name |

### Configuration Script Sources

    POST /api/configuration_script_sources

#### Required attributes:

| Attribute         | Type | Description                        |
| ----------------- | ---- | ---------------------------------- |
| manager\_resource | hash | **href** or **id** of the provider |

#### Optional attributes:

| Attribute   | Type   | Description                   |
| ----------- | ------ | ----------------------------- |
| description | string | Description                   |
| name        | string | Project Name                  |
| related     | hash   | Related attributes and values |

### Generic Objects

    POST /api/generic_objects

#### Required attributes:

| Attribute                   | Type   | Description                                                                                                      |
| --------------------------- | ------ | ---------------------------------------------------------------------------------------------------------------- |
| name                        | string | Name of the generic object                                                                                       |
| generic\_object\_definition | hash   | Generic object definition to create new generic object for, requires an **href** or **id** attribute in the hash |

    POST /api/generic_object_definitions/:id/generic_objects

#### Required attributes:

| Attribute | Type   | Description                |
| --------- | ------ | -------------------------- |
| name      | string | Name of the generic object |

#### Optional attributes:

| Attribute            | Type   | Description                                                                 |
| -------------------- | ------ | --------------------------------------------------------------------------- |
| uid                  | string | Uid string                                                                  |
| property\_attributes | hash   | Attribute/Value pairs to define for the generic object                      |
| associations         | hash   | Hash containing association keys each being an array of resource references |

### Generic Object Definitions

#### Required attributes:

| Attribute | Type   | Description                           |
| --------- | ------ | ------------------------------------- |
| name      | string | Name of the generic object definition |

#### Optional attributes:

| Attribute   | Type   | Description                                                                                                                                            |
| ----------- | ------ | ------------------------------------------------------------------------------------------------------------------------------------------------------ |
| description | string | Description for the generic object definition                                                                                                          |
| properties  | hash   | Hash containing the **attributes**, **associations** and **methods** of the generic object definition                                                  |
| picture     | hash   | Picture to use, either an **href** or **id** of the picture resource, or the actual picture including the **extension** and Base64 encoded **content** |

### Group Attributes

    POST /api/groups

#### Required attributes:

| Attribute   | Type   | Description                                                                                   |
| ----------- | ------ | --------------------------------------------------------------------------------------------- |
| description | string | Description                                                                                   |
| role        | hash   | Role the group is assigned to, requires an **href**, **id** or **name** attribute in the hash |
| tenant      | hash   | Tenant the group belongs to, requires an **href** or **id** attribute in the hash             |

#### Optional attributes:

| Attribute          | Type | Description                                                                                   |
| ------------------ | ---- | --------------------------------------------------------------------------------------------- |
| filters            | hash | Hash that contains the **belongsto** and **managed** arrays of filters to assign to the group |
| filter\_expression | hash | Hash representing the expression used for filtering by Tag                                    |

##### Filters hash:

The `filters` hash can include the following keys:

  - **belongsto**

      - Array of tags representing the following types of objects:

          - VMs & Templates

          - Clusters, Datastores, Hosts, Managers & Providers

  - **managed**

      - Array of tag arrays representing:

          - My Company Tags

Example:

    "filters" : {
      "managed" : [
        ["/managed/location/ny"],
        ["/managed/environment/prod"]
      ],
      "belongsto" : [
        "/belongsto/ExtManagementSystem|dev-vc60/EmsFolder|Datacenters/EmsFolder|dev-vc60-DC/EmsFolder|vm/EmsFolder|Alberto-Dev,
        "/belongsto/ExtManagementSystem|dev-vc60/EmsFolder|Datacenters/EmsFolder|dev-vc60-DC/EmsFolder|host/EmsCluster|dev-vc60-cluster"
      ]
    }

Alternatively, company tags can be represented with an expression via
the *filter\_expression* instead of the *managed* tag array in the
*filters* element as follows:

Example with Tags based on expression:

    "filters" : {
      "managed" : null,
      "belongsto" : [
        "/belongsto/ExtManagementSystem|dev-vc60/EmsFolder|Datacenters/EmsFolder|dev-vc60-DC/EmsFolder|vm/EmsFolder|Alberto-Dev,
        "/belongsto/ExtManagementSystem|dev-vc60/EmsFolder|Datacenters/EmsFolder|dev-vc60-DC/EmsFolder|host/EmsCluster|dev-vc60-cluster"
      ]
    },
    "filter_expression" : {
      "exp": {
        "and": [
          {
            "CONTAINS": {
              "tag": "managed-location",
              "value": "ny"
            }
          },
          {
            "CONTAINS": {
              "tag": "managed-environment",
              "value": "prod"
            }
          }
        ]
      }
    }

### Orchestration Templates

    POST /api/orchestration_templates

#### Required attributes:

| Attribute | Type   | Description      |
| --------- | ------ | ---------------- |
| name      | string | Name             |
| content   | text   | Template content |

#### Optional attributes:

| Attribute   | Type    | Description           |
| ----------- | ------- | --------------------- |
| type        | string  | Type                  |
| description | string  | Description           |
| draft       | boolean | **true** or **false** |
| ems\_id     | integer | Id of the provider    |
| orderable   | boolean | **true** or **false** |

### Policies

    POST /api/policies

#### Required attributes:

| Attribute        | Type   | Description                                                                                                       |
| ---------------- | ------ | ----------------------------------------------------------------------------------------------------------------- |
| name             | string | Name                                                                                                              |
| description      | string | Description                                                                                                       |
| mode             | string | Mode (i.e. *compliance*)                                                                                          |
| towhat           | string | Target Class                                                                                                      |
| condition\_ids   | array  | Ids of Conditions to assign to the Policy                                                                         |
| policy\_contents | array  | Array of hashes including *event\_id* and *actions*, an array of hashes comprising of an *action\_id* and *opts*. |

### Provider Attributes

    POST /api/providers

#### Required attributes:

| Attribute                                 | Type          | Description                                                                                                          |
| ----------------------------------------- | ------------- | -------------------------------------------------------------------------------------------------------------------- |
| name                                      | string        | Name of the provider                                                                                                 |
| type                                      | string        | Provider class                                                                                                       |
| hostname                                  | string        | Hostname of the Provider                                                                                             |
| credentials or connection\_configurations | hash or array | Credentials information for the provider either via the **credentials** hash or **connection\_configurations** array |

#### Optional attributes:

| Attribute                       | Type    | Description                                                                                                              |
| ------------------------------- | ------- | ------------------------------------------------------------------------------------------------------------------------ |
| api\_version                    | string  | API Version for communicating with the Provider                                                                          |
| uid\_ems                        | string  | Domain for OpenStack provider. Required when "api\_version" is "v3"                                                      |
| certificate\_authority          | string  | CA for the Provider                                                                                                      |
| connection\_configurations      | array   | Endpoints for the Provider                                                                                               |
| credentials                     | hash    | Credentials to use for communicating with the Provider, see [Provider Support](../reference/providers.html) for examples |
| host\_default\_vnc\_port\_start | integer | Starting VNC port                                                                                                        |
| host\_default\_vnc\_port\_end   | integer | Ending VNC port                                                                                                          |
| ipaddress                       | string  | IP Address of the Provider                                                                                               |
| port                            | string  | Port of the Provider                                                                                                     |
| realm                           | string  | Realm of the Provider                                                                                                    |
| security\_protocol              | string  | Security Protocol                                                                                                        |
| url                             | string  | URL of the Provider                                                                                                      |
| zone                            | hash    | In which zone to add provider to, hash needs to include an **href** or **id** attribute.                                 |

Credentials hash specification attributes are:

| Type                                              | Auth Types                  | Auth Attributes             |
| ------------------------------------------------- | --------------------------- | --------------------------- |
| ManageIQ::Providers::Amazon::CloudManager         | default                     | userid, password            |
| ManageIQ::Providers::Atomic::ContainerManager     | default, password, bearer   | userid, password            |
| ManageIQ::Providers::Azure::CloudManager          | default                     | userid, password            |
| ManageIQ::Providers::Kubernetes::ContainerManager | default, password, bearer   | userid, password            |
| ManageIQ::Providers::Microsoft::InfraManager      | default                     | userid, password            |
| ManageIQ::Providers::Openshift::ContainerManager  | default, password, bearer   | userid, password, auth\_key |
| ManageIQ::Providers::Openstack::InfraManager      | default, amqp, ssh\_keypair | userid, password, auth\_key |
| ManageIQ::Providers::Openstack::CloudManager      | default, amqp               | userid, password            |
| ManageIQ::Providers::Redhat::InfraManager         | default, metrics            | userid, password            |
| ManageIQ::Providers::Vmware::InfraManager         | default                     | userid, password            |
| ManageIQ::Providers::Foreman::Provider            | default                     | userid, password            |
| ManageIQ::Providers::Openstack::Provider          | default                     | userid, password            |

### Role Attributes

    POST /api/roles

#### Required Attributes:

| Attribute | Type   | Description       |
| --------- | ------ | ----------------- |
| name      | string | Name of user role |

#### Optional Attributes:

| Attribute | Type  | Description                                                                                   |
| --------- | ----- | --------------------------------------------------------------------------------------------- |
| features  | array | Features to assign to the role. Array of { "identifier" OR "href" OR "id" : …​ }              |
| settings  | hash  | Settings for the role, normally: { "restrictions" : { "vms" : "user" OR "user\_or\_group" } } |

### Service Attributes

    POST /api/services

#### Required attributes:

| Attribute | Type   | Description |
| --------- | ------ | ----------- |
| name      | string | Name        |

#### Optional attributes:

| Attribute               | Type   | Description                                      |
| ----------------------- | ------ | ------------------------------------------------ |
| description             | string | Description                                      |
| orchestration\_template | hash   | **href** or **id** of the Orchestration Template |
| orchestration\_manager  | hash   | **href** or **id** of the Orchestration Provider |
| parent\_service         | hash   | Parent service **href** or **id** reference      |
| type                    | string | Type of Service                                  |

### Service Catalog Attributes

    POST /api/service_catalogs

| Attribute   | Type   | Description                    |
| ----------- | ------ | ------------------------------ |
| name        | string | Name of service catalog        |
| description | string | Description of service catalog |

#### Optional attributes:

| Attribute          | Type  | Description                                                                                                                                                                                                |
| ------------------ | ----- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| service\_templates | array | Array of Service Template hashes to assign to the new Service Catalog. Hash entries to include the **href** of the service\_templates to assign and must not currently be assigned to any Service Catalog. |

### Service Dialogs

    POST /api/service_dialogs

#### Required attributes:

| Attribute    | Type   | Description                           |
| ------------ | ------ | ------------------------------------- |
| label        | string | Label                                 |
| dialog\_tabs | array  | Dialog content - array of dialog tabs |

#### Optional attributes:

| Attribute   | Type   | Description |
| ----------- | ------ | ----------- |
| description | string | Description |

### Tag Attributes

    POST /api/tags

#### Required attributes:

| Attribute   | Type   | Description                                                                                                               |
| ----------- | ------ | ------------------------------------------------------------------------------------------------------------------------- |
| name        | string | Name of tag                                                                                                               |
| description | string | Description of tag                                                                                                        |
| category    | hash   | Category identifier for which the tag is getting added to, requires an **href**, **id** or **name** attribute in the hash |

**Note:**

When adding with a **create** action on the tags subcollection of the
category via /api/categories/:id/tags, the category should not be
specified in the resource.

</div>

### Tenant Attributes

    POST /api/tenants

#### Required attributes:

| Attribute | Type   | Description                                                                                                                 |
| --------- | ------ | --------------------------------------------------------------------------------------------------------------------------- |
| name      | string | Name of Tenant                                                                                                              |
| parent    | hash   | Parent tenant identifier for which the sub-tenant is getting added to, requires an **href** or **id** attribute in the hash |

#### Optional attributes:

| Attribute               | Type   | Description                                                                      |
| ----------------------- | ------ | -------------------------------------------------------------------------------- |
| description             | string | Description of Tenant                                                            |
| domain                  | string | Domain                                                                           |
| logo\_file\_name        | string | Logo file name, must be available via /uploads/**logo\_file\_name**              |
| login\_logo\_file\_name | string | Login Logo file name, must be available via /uploads/**login\_logo\_file\_name** |
| login\_text             | string | Login text                                                                       |
| subdomain               | string | Subdomain                                                                        |

### User Attributes

    POST /api/users

#### Required attributes:

| Attribute | Type   | Description                                                                                     |
| --------- | ------ | ----------------------------------------------------------------------------------------------- |
| userid    | string | Username                                                                                        |
| password  | string | Password                                                                                        |
| name      | string | Full Name                                                                                       |
| group     | hash   | Group the user belongs to, requires a **description**, **href** or **id** attribute in the hash |

#### Optional attributes:

| Attribute | Type   | Description    |
| --------- | ------ | -------------- |
| email     | string | E-mail Address |
