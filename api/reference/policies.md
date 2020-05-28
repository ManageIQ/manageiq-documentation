---
---

## Policy Management

Management of policies and policy profiles is provided in the following
forms:

  - Querying of policies via the primary collection:

<!-- end list -->

``` data
/api/policies
```

  - Querying of policy profiles via the primary collection:

<!-- end list -->

``` data
/api/policy_profiles
```

  - Assigning and Unassigning policies to resources via the policies
    subcollection of a resource

<!-- end list -->

``` data
/api/:collection/:id/policies
```

and posting **assign** or **unassign** actions to the policies
subcollection.

  - Assigning and Unassigning policy profiles to resources via the
    policy\_profiles subcollection of a resource

<!-- end list -->

``` data
/api/:collection/:id/policy_profiles
```

and posting **assign** or **unassign** actions to the policy\_profiles
subcollection.

  - [Querying Policies](#querying-policies)

  - [Querying Policies of a Resource](#querying-policies-of-resources)

  - [Creating Policies](#creating-policies)

  - [Editing Policies](#editing-policies)

  - [Deleting Policies](#deleting-policies)

  - [Policy and Policy Profiles Actions](#policy-actions)

  - [Resource Policy Management](#resource-policy-management)

  - [Policy specification](#policy-specification)

  - [Assigning policies to a
    resource](#assigning-policies-to-a-resource)

  - [Unassigning policies from a
    resource](#unassigning-policies-from-a-resource)

  - [Resolving Policies of a
    Resource](#resolving-policies-of-a-resource)

  - [Resolving Policy Profiles of a
    Resource](#resolving-policy-profiles-of-a-resource)

### Querying Policies

Querying all policies in the system is simply:

    GET /api/policies

``` json
{
  "name": "policies",
  "count": 20,
  "subcount": 20,
  "resources": [
    {
      "href": "http://localhost:3000/api/policies/7"
    },
    {
      "href": "http://localhost:3000/api/policies/8"
    },
    ...
  ]
}
```

And expanding the policies, providing additional details:

    GET /api/policies?expand=resources

``` json
{
  "name": "policies",
  "count": 3,
  "subcount": 3,
  "resources": [
    {
      "href": "http://localhost:3000/api/policies/7",
      "id": "7",
      "name": "b1fd23bc-acc4-11e4-abc7-b8e85646e742",
      "description": "test_control_policy",
      "created_on": "2015-02-04T23:22:32Z",
      "updated_on": "2015-04-09T13:20:58Z",
      "towhat": "Vm",
      "guid": "b1fd23bc-acc4-11e4-abc7-b8e85646e742",
      "created_by": "admin",
      "updated_by": "admin",
      "active": true,
      "mode": "control"
    },
    {
      "href": "http://localhost:3000/api/policies/8",
      "id": "8",
      "name": "68bfaade-ad3d-11e4-8d4e-b8e85646e742",
      "description": "server_type_control_policy",
      "created_on": "2015-02-05T13:46:39Z",
      "updated_on": "2015-04-09T13:20:58Z",
      "towhat": "Vm",
      "guid": "68bfaade-ad3d-11e4-8d4e-b8e85646e742",
      "created_by": "admin",
      "updated_by": "admin",
      "active": true,
      "mode": "control"
    },
    ...
  ]
}
```

### Querying Policies of a Resource

To find out which policies are assigned to a resource, the policies
subcollection can be expanded for that particular resource as follows:

    GET /api/vms/320?expand=policies

This will provide the resources as well as the related policies

``` json
{
  "href": "http://localhost:3000/api/vms/320",
  "id": "320",
  "vendor": "vmware",
  "name": "aab-vm1",
  "description": "this is a test",
  "raw_power_state": "poweredOn",
  ...
  "policies": [
    {
      "href": "http://localhost:3000/api/vms/320/policies/7",
      "id": "7",
      "name": "b1fd23bc-acc4-11e4-abc7-b8e85646e742",
      "description": "test_control_policy",
      "created_on": "2015-02-04T23:22:32Z",
      "updated_on": "2015-04-09T13:20:58Z",
      "towhat": "Vm",
      "guid": "b1fd23bc-acc4-11e4-abc7-b8e85646e742",
      "created_by": "admin",
      "updated_by": "admin",
      "active": true,
      "mode": "control"
    }
  ]
}
```

One can also simply query the policies of a resource by the
subcollection as follows:

    GET /api/vms/320/policies

``` json
{
  "name": "policies",
  "count": 3,
  "subcount": 1,
  "resources": [
    {
      "href": "http://localhost:3000/api/vms/320/policies/7"
    }
  ],
  "actions": [
    ...
  ]
}
```

Finding the policies that are part of a policy profile is queried the
same as regular resources

    GET /api/policy_profiles/:id?expand=policies

or just the policies themselves as follows:

    GET /api/policy_profiles/:id/policies

### Creating Policies

Policies can be created via a POST to the policies collection or via the
**create** action signature which also allows creation of multiple
policies in a single request.

    POST /api/policies

``` json
{
  "name" : "sample_policy",
  "description" : "Sample Policy",
  "mode" : "compliance",
  "towhat" : "ManageIQ::Providers::Redhat::InfraManager",
  "condition_ids" : [11, 12],
  "policy_contents" : [
    {
      "event_id" : 201,
      "actions" : [
        {
          "action_id" : 3001,
          "opts" : { "qualifier" : "failure" }
        }
      ]
    }
  ]
}
```

or creating multiple policies:

``` json
{
  "action" : "create",
  "resources" : [
    { "name" : "sample_policy_1", "description" : "Sample Policy 1", ... },
    { "name" : "sample_policy_2", "description" : "Sample Policy 2", ... },
    ...
  ]
}
```

<div class="note">

Please refer to the [Resource
Attributes](../appendices/resource_attributes.html#policies) page for a
list of available attributes when creating policies.

</div>

### Editing Policies

    POST /api/policies/:id

``` json
{
  "action" : "edit",
  "resource" : {
    "description" : "Updated Policy Description"
  }
}
```

or editing multiple policies:

    POST /api/policies

``` json
{
  "action" : "edit",
  "resources" : [
    {
      "href" : "http://localhost:3000/api/policies/101",
      "description" : "Updated Policy Description 1"
    },
    {
      "href" : "http://localhost:3000/api/policies/102",
      "description" : "Updated Policy Description 2"
    },
    ...
  ]
}
```

### Deleting Policies

Policies can be deleted via either the **delete** POST action or via the
DELETE HTTP method.

    POST /api/policies/101

``` json
{
  "action" : "delete"
}
```

or simply:

    DELETE /api/policies/101

Deleting multiple policies can be done as follows:

    POST /api/policies

``` json
{
  "action" : "delete",
  "resources" : [
    { "href" : "http://localhost:3000/api/policies/101" },
    { "href" : "http://localhost:3000/api/policies/102" },
    ...
  ]
}
```

### Policy and Policy Profiles Actions

For managing policies and policy profiles on resource three available
actions are available. These are:

| Action   | Description                                           |
| -------- | ----------------------------------------------------- |
| assign   | Assign a policy or policy profile to the resource     |
| unassign | Unassign a policy or policy profile from the resource |
| resolve  | Resolves a resource policy or policy profile          |

### Resource Policy Management

Policy management on resources can be done by POSTing **assign** and
**unassign** actions to the policies or policy\_profiles subcollection
of resources. Policy management is available on the following primary
collections:

| Collection            |
| --------------------- |
| /api/clusters         |
| /api/hosts            |
| /api/policy\_profiles |
| /api/providers        |
| /api/resource\_pools  |
| /api/templates        |
| /api/vms              |

#### Policy specification

Policies and policy profiles can be specified using one of the following
forms:

By href:

``` json
{
  "href" : "http://localhost:3000/api/policies/:id"
}
```

``` json
{
  "href" : "http://localhost:3000/api/policy_profiles/:id"
}
```

Or by policy Guid:

``` json
{
  "guid" : "b1fd23bc-acc4-11e4-abc7-b8e85646e742"
}
```

#### Assigning policies to a resource

Assigning policies or policy\_profiles to resources is done by posting
an **assign** action against the policies or policy\_profiles
subcollection of a resource.

    POST /api/vms/320/policies

``` json
{
  "action" : "assign",
  "resource" : { "href" : "http://localhost:3000/api/policies/7" }
}
```

or multiple policies:

``` json
{
  "action" : "assign",
  "resource" : [
    { "href" : "http://localhost:3000/api/policies/7" },
    { "href" : "http://localhost:3000/api/policies/10" }
  ]
}
```

##### Response:

``` json
{
  "results": [
    {
      "success": true,
      "message": "Assigning Policy: id:'7' description:'test_control_policy' guid:'b1fd23bc-acc4-11e4-abc7-b8e85646e742'",
      "href": "http://localhost:3000/api/vms/320",
      "policy_id": "7",
      "policy_href": "http://localhost:3000/api/policies/7"
    }
  ]
}
```

#### Unassigning policies from a resource

Unassign policies or policy\_profiles to resources is done by posting an
**unassign** action against the policies or policy\_profiles
subcollection of a resource.

    POST /api/vms/320/policies

``` json
{
  "action" : "unassign",
  "resource" : { "href" : "http://localhost:3000/api/policies/7" }
}
```

##### Response:

``` json
{
  "results": [
    {
      "success": true,
      "message": "Unassigning Policy: id:'7' description:'test_control_policy' guid:'b1fd23bc-acc4-11e4-abc7-b8e85646e742'",
      "href": "http://localhost:3000/api/vms/320",
      "policy_id": "7",
      "policy_href": "http://localhost:3000/api/policies/7"
    }
  ]
}
```

### Resolving Policies of a Resource

Resolving a resource policy by targeting the subcollection resource
directly as follows:

    POST /api/vms/320/policies/7

``` json
{
  "action" : "resolve"
}
```

#### Response:

``` json
{
  "results": [
    {
      "success": true,
      "message": "Resolving Policy: id:'7' description:'test_control_policy' guid:'b1fd23bc-acc4-11e4-abc7-b8e85646e742'",
      "result": [
        {
          "id": "7",
          "name": "b1fd23bc-acc4-11e4-abc7-b8e85646e742",
          "description": "test_control_policy",
          "created_on": "2015-02-04T23:22:32Z",
          "updated_on": "2015-04-09T13:20:58Z",
          "towhat": "Vm",
          "guid": "b1fd23bc-acc4-11e4-abc7-b8e85646e742",
          "created_by": "admin",
          "updated_by": "admin",
          "active": true,
          "mode": "control",
          "result": "allow",
          "conditions": [

          ],
          "actions": [

          ]
        }
      ],
      "href": "http://localhost:3000/api/vms/320",
      "policy_id": "7",
      "policy_href": "http://localhost:3000/api/policies/7"
    }
  ]
}
```

### Resolving Policy Profiles of a Resource

Resolving a resource policy profile by targeting the subcollection
resource directly as follows:

    POST /api/vms/320/policy_profiles/34

``` json
{
  "action" : "resolve"
}
```

#### Response:

``` json
{
  "success": true,
  "message": "Resolving Policy Profile: id:'34' description:'Control Policies' guid:'f39b25e2-ad3e-11e4-8d4e-b8e85646e742'",
  "result": [
    {
      "id": "34",
      "name": "f39b25e2-ad3e-11e4-8d4e-b8e85646e742",
      "description": "Control Policies",
      "set_type": "MiqPolicySet",
      "created_on": "2015-02-05T13:57:41Z",
      "updated_on": "2015-02-26T13:42:43Z",
      "guid": "f39b25e2-ad3e-11e4-8d4e-b8e85646e742",
      "mode": "control",
      "result": "allow",
      "policies": [
        {
          "id": "7",
          "name": "b1fd23bc-acc4-11e4-abc7-b8e85646e742",
          "description": "test_control_policy",
          "created_on": "2015-02-04T23:22:32Z",
          "updated_on": "2015-04-09T13:20:58Z",
          "towhat": "Vm",
          "guid": "b1fd23bc-acc4-11e4-abc7-b8e85646e742",
          "created_by": "admin",
          "updated_by": "admin",
          "active": true,
          "mode": "control",
          "result": "allow",
          "conditions": [

          ],
          "actions": [

          ]
        },
        {
          "id": "8",
          "name": "68bfaade-ad3d-11e4-8d4e-b8e85646e742",
          "description": "second_test_control_policy",
          "created_on": "2015-02-05T13:46:39Z",
          "updated_on": "2015-04-09T13:20:58Z",
          "towhat": "Vm",
          "guid": "68bfaade-ad3d-11e4-8d4e-b8e85646e742",
          "created_by": "admin",
          "updated_by": "admin",
          "active": true,
          "mode": "control",
          "result": "allow",
          "conditions": [

          ],
          "actions": [

          ]
        }
      ]
    }
  ],
  "href": "http://localhost:3000/api/vms/320",
  "policy_profile_id": "34",
  "policy_profile_href": "http://localhost:3000/api/policy_profiles/34"
}
```
