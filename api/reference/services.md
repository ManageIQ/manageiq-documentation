---
---

## Service Management

Service management is provided via the following collections:

| Path                    | Description                             |
| ----------------------- | --------------------------------------- |
| /api/service\_catalogs  | [Service Catalogs](#service-catalogs)   |
| /api/service\_templates | [Service Templates](#service-templates) |
| /api/services           | [Services](#services)                   |
| /api/service\_requests  | [Service Requests](#service-requests)   |

### Service Catalogs

Full CRUD is available on service catalogs.

  - [Creating Service Catalogs](#creating-service-catalogs)

  - [Editing Service Catalogs](#editing-service-catalogs)

  - [Assigning Service Templates](#assigning-service-templates)

  - [Ordering Services](#ordering-services)

  - [Refresh Service Dialog Fields](#refresh-service-dialog-fields)

  - [Deleting Service Catalogs](#deleting-service-catalogs)

#### Creating Service Catalogs

``` data
/api/service_catalogs
```

Creating service catalog is provided via the following actions:

| Method | Versions   | Comment   |
| ------ | ---------- | --------- |
| create | 2.0.0      | Preferred |
| add    | since v1.0 |           |

Example of creating service catalog with *create* method:

    POST /api/service_catalogs

``` json
{
   "action" : "create",
   "resource" : {
     "name" : "Sample Service Catalog",
     "description" : "Description of Sample Service Catalog",
     "service_templates" : [
       { "href" : "http://localhost:3000/api/service_templates/3" },
       { "href" : "http://localhost:3000/api/service_templates/4" }
     ]
   }
}
```

Optionally without the create action signature:

``` json
{
  "name" : "Sample Service Catalog",
  "description" : "Description of Sample Service Catalog",
  "service_templates" : [
    { "href" : "http://localhost:3000/api/service_templates/3" },
    { "href" : "http://localhost:3000/api/service_templates/4" }
  ]
}
```

**Note:**

Please refer to the [Resource Attributes](../appendices/resource_attributes.html#service-catalogs)
page for a list of available attributes when creating Service Catalogs.

#### Editing Service Catalogs

Editing a service catalog via the *edit* action as follows:

    POST /api/service_catalogs/:id

``` json
{
  "action" : "edit",
  "resource" : {
    "description" : "Updated Description of Third Service Catalog"
   }
}
```

#### Assigning Service Templates

Assign and Unassigning service templates to service catalogs is done via
the *assign* and *unassign* actions as follows:

    POST /api/service_catalogs/:id

``` json
{
  "action" : "assign",
  "resources" : [
    { "href" : "http://localhost:3000/api/service_templates/5" },
    { "href" : "http://localhost:3000/api/service_templates/6" }
  ]
}
```

    POST /api/service_catalogs/:id

``` json
{
  "action" : "unassign",
  "resources" : [
    { "href" : "http://localhost:3000/api/service_templates/1" },
    { "href" : "http://localhost:3000/api/service_templates/2" }
  ]
}
```

#### Ordering Services

Ordering services is done by triggering an *order* action on service
templates in a service catalog as follows:

    POST /api/service_catalogs/:id/service_templates

``` json
{
  "action" : "order",
  "resource" : {
    "href" : "http://localhost:3000/api/service_templates/3",
    "option_0_vm_target_name" : "test-vm-0001",
    "option_0_vm_target_hostname" : "test-vm-0001"
  }
}
```

**Note:** If you need to include a password in the call to the Ordering Services, you can use the `password::dialog_password` field to supply the password as a parameter. This password is passed as a `string` datatype.


``` json
{
  "action" : "order",
  "resource" : {
    "href" : "http://localhost:3000/api/service_templates/3",
    "option_0_vm_target_name" : "test-vm-0001",
    "option_0_vm_target_hostname" : "test-vm-0001",
    "password::dialog_password" : "password"
  }
}
```

#### Refresh Service Dialog Fields

Refreshing dialog fields is done via a *refresh\_dialog\_fields* action
as shown in the following cases:

##### Refresh Dialog Fields of Service Templates Service Dialogs

Refreshing dialog fields for a service template service dialogs is done
as follows:

    POST /api/service_catalogs/:id/service_templates

``` json
{
  "action" : "refresh_dialog_fields",
  "resource" : {
    "href" : "http://localhost:3000/api/service_templates/3",
    "dialog_fields" : {
      "my_field1" : "my field1 value",
      "my_field2" : "my field2 value",
      "my_field3" : "my field3 value",
      ...
    },
    "fields" : [ "my_field1", "my_field3" ]
  }
}
```

##### Refresh Dialog Fields of Service Dialogs

Refreshing dialog fields for a service dialog is done as follows:

    POST /api/service_dialogs/:id

``` json
{
  "action" : "refresh_dialog_fields",
  "resource" : {
    "dialog_fields" : {
      "my_field1" : "my field1 value",
      "my_field2" : "my field2 value",
      "my_field3" : "my field3 value",
      ...
    },
    "fields" : [ "my_field1", "my_field3" ]
  }
}
```

#### Deleting Service Catalogs

Single service catalogs can simply be deleted via the DELETE method as
follows:

    DELETE /api/service_catalogs/:id

Multiple service catalogs can also be deleted with a single request as
follows:

    POST /api/service_catalogs

``` json
{
  "action" : "delete",
  "resources" : [
    { "href" : "http://localhost:3000/api/service_catalogs/11" },
    { "href" : "http://localhost:3000/api/service_catalogs/12" },
    { "href" : "http://localhost:3000/api/service_catalogs/13" }
  ]
}
```

### Service Templates

Management of Service Templates is available via the following
collection:

``` data
/api/service_templates
```

Full CRUD is available on service templates.

  - [Creating Service Templates](#creating-service-templates)

  - [Editing Service Templates](#editing-service-templates)

  - [Deleting Service Templates](#deleting-service-templates)

#### Creating Service Templates

Service Templates can be created via a POST to the
/api/service\_templates collection:

``` data
/api/service_templates
```

``` json
{
  "name" : "Atomic Service Template",
  "service_type" : "atomic",
  "prov_type"    : "amazon",
  "display"      : "false",
  "config_info"  : {
    "miq_request_dialog_name" : "Dialog_Name",
    "placement_auto"          : [true, 1],
    "number_of_vms"           : [1, "1"],
    "src_vm_id"               : [11, "test_vm"],
    "vm_name"                 : "AtomicVMName",
    "schedule_type"           : ["immediately", "Immediately on Approval"],
    "instance_type"           : [21, "instance_flavor"],
    "src_ems_id"              : [5, "test_provider"],
    "provision"               : {
      "fqname"    : "/Sample/System/ProvisionEndpoint",
      "dialog_id" : "21"
    },
    "retirement"              : {
      "fqname"    : "/Sample/System/RetirementEndpoint",
      "dialog_id" : "22"
    }
  }
}
```

#### Editing Service Templates

Editing a single service template as follows:

    POST /api/service_templates/:id

``` data
{
  "action" : "edit",
  "resource" : {
    "name" : "svc_template_01",
    "description" : "This is a sample service template"
  }
}
```

#### Deleting Service Templates

Deleting single service template via the DELETE method:

``` data
DELETE /api/service_templates/:id
```

or via the *delete* action as follows:

``` data
POST /api/service_templates/:id
```

``` json
{
  "action" : "delete"
}
```

Multiple service templates can also be deleted in bulk as follows:

    POST /api/service_templates

``` data
{
  "action" : "delete",
  "resources" : [
    { "href" : "http://localhost:3000/api/service_templates/11" },
    { "href" : "http://localhost:3000/api/service_templates/12" }
  ]
}
```

### Services

Accessing services is via the **services** collection as follows:

``` data
/api/services
```

or addressing an individual Service via the **services** resource:

``` data
/api/services/:id
```

#### Creating Services

In general, services are created once ordered from service catalogs.

Service resources can also be created as follows:

``` data
POST /api/services
```

``` json
{
  "action" : "create",
  "resource" : {
    "name" : "test_service_name",
    "description" : "Test Service",
    "parent_service" : { "href" : "http://localhost:3000/api/services/15" }
  }
}
```

In the above example *parent\_service* is an *href* or *id* reference to
an existing service.

**Note:**

Please refer to the [Resource Attributes](../appendices/resource_attributes.html#services) page for a
list of available attributes when creating Services.

#### Service Actions

Once services are ordered from a catalog, they can be:

  - [Edited](#service-editing) (Basic)

  - [Retired now](#service-retiring-now)

  - [Retired in future](#service-retiring-future)

  - [Reconfigured](#service-reconfiguring)

  - [Started](#starting-services)

  - [Stopped](#stopping-services)

  - [Suspended](#suspending-services)

  - [Deleted](#deleting-services)

Additional Service actions include:

  - [Adding and Removing Resources from Services](#adding-and-removing-resources-from-services)

  - [Adding Provider VMs to Services](#adding-provider-vms-to-services)

  - [Requesting a Chargeback Report for a Service](#requesting-a-chargeback-report-for-a-service)

Other than service creates and edits, service actions return the action
response as in the following example:

Request:

    POST /api/services/12

``` json
{
  "action" : "start"
}
```

Response:

``` json
{
  "success": true,
  "message": "Service id:12 name:'SampleService' starting",
  "task_id": "62",
  "task_href": "http://localhost:3000/api/tasks/62",
  "href": "http://localhost:3000/api/services/12"
}
```

#### Service Editing

    POST /api/services/:id

``` json
{
   "action" : "edit",
   "resource" : {
     "name" : "Updated Service Name",
     "description" : "Updated Service Description"
   }
}
```

#### Adding and Removing Resources from Services

Adding and removing resources from services is made available with the
following actions:

| Action                 |
| ---------------------- |
| add\_resource          |
| remove\_resource       |
| remove\_all\_resources |

The following example adds a single resource to a service:

    POST /api/services/:id

``` json
{
  "action" : "add_resource",
  "resource" : { "resource" : { "href" : "http://localhost:3000/api/vms/11" } }
}
```

The following example bulk adds resources to multiple services:

    POST /api/services

``` json
{
   "action" : "add_resource",
   "resources" : [
      {
        "href" : "http://localhost:3000/api/services/3",
        "resource" : { "href" : "http://localhost:3000/api/vms/11" }
      },
      {
        "href" : "http://localhost:3000/api/services/3",
        "resource" : { "href" : "http://localhot:3000/api/vms/12" }
      },
      {
        "href" : "http://localhost:3000/api/services/4",
        "resource" : { "href" : "http://localhost:3000/api/vms/21" }
      },
      {
        "href" : "http://localhost:3000/api/services/5",
        "resource" : { "href" : "http://localhost:3000/api/vms/22" }
      }
   ]
}
```

The following example removes a single resource from a service:

    POST /api/services/:id

``` json
{
  "action" : "remove_resource",
  "resource" : { "resource" : { "href" : "http://localhost:3000/api/vms/11" } }
}
```

The following example removes resources in bulk from multiple services:

    POST /api/services

``` json
{
  "action" : "remove_resource",
  "resources" : [
    {
      "href" : "http://localhost:3000/api/services/3",
      "resource" : { "href" : "http://localhost:3000/api/vms/11" }
    },
    {
      "href" : "http://localhost:3000/api/services/3",
      "resource" : { "href" : "http://localhot:3000/api/vms/12" }
    },
    {
      "href" : "http://localhost:3000/api/services/4",
      "resource" : { "href" : "http://localhost:3000/api/vms/21" }
    },
    {
      "href" : "http://localhost:3000/api/services/5",
      "resource" : { "href" : "http://localhost:3000/api/vms/22" }
    }
  ]
}
```

The following example removes all resources from a single service:

    POST /api/services/:id

``` json
{
  "action" : "remove_all_resources"
}
```

The following example removes all resources in bulk from multiple
services:

    POST /api/services

``` json
{
  "action" : "remove_all_resources",
  "resources" : [
    { "href" : "http://localhost:3000/api/services/11" },
    { "href" : "http://localhost:3000/api/services/12" },
    { "href" : "http://localhost:3000/api/services/13" }
  ]
}
```

#### Adding Provider VMs to Services

For cases where VMs are created externally, i.e. via Ansible Playbooks,
this action allows the system to identify the VMs created and link those
VMs back to the service.

``` data
POST /api/services/:id
```

``` json
{
  "action" : "add_provider_vms",
  "resource" : {
    "provider" : { "href" : "http://localhot:3000/api/providers/11" }
    "uid_ems" : [
      "provider_vm_id1",
      "provider_vm_id2",
      ...
    ]
  }
}
```

#### Requesting a Chargeback Report for a Service

This action will request a chargeback report for the service.

    POST /api/services/:id

``` json
{
  "action" : "queue_chargeback_report"
}
```

The queue\_chargeback\_report action will return an action response
which includes the task reference as shown here:

``` json
{
  "success": true,
  "message": "Queued chargeback report generation for Service id:1 name:'test_service1'",
  "task_id": "39",
  "task_href": "http://localhost:3000/api/tasks/39"
}
```

The task\_href can be queried and upon completion of the task, the
chargeback report for the service can be queried as follows:

    GET /api/services/:id?attributes=chargeback_report

#### Service Retiring (now)

    POST /api/services/:id

``` json
{
  "action" : "request_retire"
}
```

#### Service Retiring (future)

    POST /api/services/:id

``` json
{
  "action" : "request_retire",
  "resource" : { "date" : "10/30/2015", "warn" : "5" }
}
```

#### Service Reconfiguring

When a service is defined with a Reconfigure Automation Entrypoint, the
*reconfigure* action is shown as a valid action for that service.

This action takes any of the dialog fields the service supports during
reconfiguration.

    POST /api/services/:id

``` json
{
  "action" : "reconfigure",
  "resource" : {
    "field1" : "updated field1 value",
    "field2" : "updated field2 value",
    ...
  }
}
```

#### Starting Services

    POST /api/services/:id

``` json
{
  "action" : "start"
}
```

#### Stopping Services

    POST /api/services/:id

``` json
{
  "action" : "stop"
}
```

#### Suspending Services

    POST /api/services/:id

``` json
{
  "action" : "suspend"
}
```

#### Deleting Services

    DELETE /api/services/:id

Or via the delete action for deleting multiple services:

    POST /api/services

``` json
{
  "action" : "delete",
  "resources" : [
    { "href" : "http://localhost:3000/api/services/101",
    { "href" : "http://localhost:3000/api/services/102",
    { "href" : "http://localhost:3000/api/services/103"
    ...
  ]
}
```

### Service Requests

  - [Querying Service Requests](#querying-service-requests)

  - [Approving or Denying ServiceRequests](#approving-or-denying-service-requests)

  - [Adding Approvers to Service Requests](#adding-approvers-to-service-requests)

  - [Removing Approvers to Service Requests](#removing-approvers-to-service-requests)

  - [Editing Request Tasks](#editing-request-tasks)

#### Querying Service Requests

Once services are ordered from a catalog, service requests can be
monitored as follows:

    GET /api/service_requests/:id

**Note:**

The request tasks of service requests can be queried by expanding the
request\_tasks as follows:

    GET /api/service_requests/:id?expand=request_tasks

or by fetching them directly as follows:

    GET /api/service_requests/:id/request_tasks?expand=resources

#### Approving or Denying Service Requests

If a service request is not auto approved, it can be approved or denied
via the actions *approve* and *deny* on the service request resource.

##### Approving a Service Request

``` data
POST /api/service_requests/:id
```

``` json
{
  "action" : "approve",
  "reason" : "reason for approval"
}
```

#### Denying a Service Request

``` data
POST /api/service_requests/:id
```

``` json
{
  "action" : "deny",
  "reason" : "reason for denial"
}
```

#### Adding Approvers to Service Requests

Approvers can be added to service requests with the *add\_approver*
action. Approvers can be specified by *user\_id* or *user* reference
including an *href* or *id* of the approver.

``` data
POST /api/service_requests/:id
```

``` json
{
  "action" : "add_approver",
  "resource" : {
    "user_id" : 11
  }
}
```

Or one of the following signatures:

``` json
{
  "action" : "add_approver",
  "resource" : {
    "user" : { "id" : 11  }
  }
}
```

``` json
{
  "action" : "add_approver",
  "resource" : {
    "user" : { "href" : "http://localhost:3000/api/users/11" }
  }
}
```

Approvers can also be added in bulk as follows:

``` data
POST /api/service_requests
```

``` json
{
  "action" : "add_approver",
  "resources" : [
    {
      "href" : "http://localhost:3000/api/service_requests/101",
      "user_id" : "11"
    },
    {
      "href" : "http://localhost:3000/api/service_requests/102",
      "user" : { "id" : 11 }
    },
    {
      "href" : "http://localhost:3000/api/service_requests/103",
      "user" : { "href" : "http://localhost:3000/api/users/11" }
    }
  ]
}
```

#### Removing Approvers from Service Requests

Approvers can be removed from service requests with the
*remove\_approver* action. Approvers can be specified by *user\_id* or
*user* reference including an *href* or *id* of the approver.

``` data
POST /api/service_requests/:id
```

``` json
{
  "action" : "remove_approver",
  "resource" : {
    "user_id" : "11"
  }
}
```

Approvers can also be removed in bulk as follows:

``` data
POST /api/service_requests
```

``` json
{
  "action" : "remove_approver",
  "resources" : [
    {
      "href" : "http://localhost:3000/api/service_requests/101",
      "user_id" : "11"
    },
    {
      "href" : "http://localhost:3000/api/service_requests/102",
      "user" : { "id" : "11" }
    },
    {
      "href" : "http://localhost:3000/api/service_requests/103",
      "user" : { "href" : "http://localhost:3000/api/users/11" }
    }
  ]
}
```

### Editing Request Tasks

Request tasks of Service Requests can be updated as follows:

    POST /api/service_requests/:id/request_tasks/:request_task_id

``` json
{
  "action" : "edit",
  "resource" : {
    "options" : {
      "request_param_a" : "value_a",
      "request_param_b" : "value_b"
    }
  }
}
```
