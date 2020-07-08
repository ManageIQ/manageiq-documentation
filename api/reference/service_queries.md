---
---

## Service Queries

Queries to services and related service dialogs are provided via the
following collections:

| Path                    | Description       |
| ----------------------- | ----------------- |
| /api/services           | Services          |
| /api/service\_requests  | Service Requests  |
| /api/service\_templates | Service Templates |
| /api/service\_dialogs   | Service Dialogs   |

  - [Querying Pictures](#querying-pictures)

  - [Querying Provision Dialogs](#querying-provision-dialogs)

  - [Querying Resource Actions](#querying-resource-actions)

  - [Querying Service and Provision
    Dialogs](#querying-service-provision-dialogs)

  - [Querying Service Dialogs](#querying-service-dialogs)

  - [Querying Users](#querying-users)

  - [Querying VMs](#querying-vms)

  - [Querying Orchestration Stacks](#querying-orchestration-stacks)

### Querying Pictures pertaining to services

Access to pictures for service related collections is made available
with the *picture* virtual attribute and related *image\_href*
attribute.

Querying all resources:

    GET /api/services?expand=resources&attributes=picture,picture.image_href

    GET /api/service_requests?expand=resources&attributes=picture,picture.image_href

    GET /api/service_templates?expand=resources&attributes=picture,picture.image_href

Querying specific resources:

    GET /api/services/:id?attributes=picture,picture.image_href

    GET /api/service_requests/:id?attributes=picture,picture.image_href

    GET /api/service_templates/:id?attributes=picture,picture.image_href

### Querying Provision Dialogs on services and service requests

Querying provision dialogs on ordered services and related
service\_requests is provided by the *provision\_dialog* virtual
attribute:

    GET /api/services/:id?attributes=provision_dialog

    GET /api/service_requests/:id?attributes=provision_dialog

### Querying Resource Actions

Querying resource\_actions is provided as a subcollection of
service\_templates as follows:

    GET /api/service_templates/:id/resource_actions

This allows queries like:

    GET /api/service_templates/:id/resource_actions
    GET /api/service_templates/:id/resource_actions/:resource_action_id
    GET /api/service_templates/:id/resource_actions?expand=resources
    GET /api/service_templates/:id/resource_actions?expand=resources&filter[]=action='Provision'

### Querying Service and Provision Dialogs

Access to service and provision dialogs is provided by the primary
collections:

|                         |
| ----------------------- |
| /api/service\_dialogs   |
| /api/provision\_dialogs |

### Querying Service Dialogs

Service dialogs can be queried directly from the primary collection:

    GET /api/service_dialogs
    GET /api/service_dialogs/:id
    GET /api/service_dialogs/:id?resource_action_id=:ra_id
                                &target_id=:target_id
                                &target_type=:target_type

<div class="note">

Above :target\_type would be a valid resource type containing the
service dialog like *service\_template* or *service*.

</div>

Or from the Service Template where they are defined and from the related
ordered services as follows:

    GET /api/service_templates/:id/service_dialogs
    GET /api/service_templates/:id/service_dialogs/:service_dialog_id

    GET /api/services/:id/service_dialogs
    GET /api/services/:id/service_dialogs/:service_dialog_id

### Querying Users that ordered services

This is made available via the *user* virtual attribute which reflect
the user object.

    GET /api/services/:id?attributes=user

    GET /api/service_requests/:id?attributes=user

Optionally, specific user attribute can also be queried as follows:

    GET /api/services/:id?attributes=user.name,user.email
    GET /api/services/:id?attributes=user.name,user.email

### Querying VMs of Services

This is made available via the *vms* subcollection of services as
follows:

    GET /api/services/:id/vms

    GET /api/services/:id?expand=vms

It is also possible to fetch additional attributes for the vms of a
service all within the same request by using the *vms.* prefix in the
attributes specification as follows:

    GET /api/services/:id?expand=vms&attributes=vms.num_cpu

Accessing decorators for VM resources is also made available here as
follows:

    GET /api/services/:id?expand=vms
                         &attributes=vms.num_cpu
                         &decorators=vms.supports_console?,vms.supports_cockpit?,vms.supports_vnc_console?

### Querying Orchestration Stacks of Services

This is made available via the *orchestration\_stacks* subcollection of
services as follows:

    GET /api/services/:id/orchestration_stacks

Fetching the orchestration stacks in addition to the service as follows:

    GET /api/services/:id?expand=orchestration_stacks

Accessing a specific orchestration stack of a service as follows:

    GET /api/services/:id/orchestration_stacks/:orchestration_stack_id
