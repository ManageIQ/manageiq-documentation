---
---

## SOAP to REST Mapping guide

  - [Insight Web Services](#insight-web-services)

  - [Control Web Services](#control-web-services)

  - [Automate Web Services](#automate-web-services)

### Insight Web Services

| SOAP API               | HTTP Method | REST API URLs                                                                      | Actions | Examples                                                       |
| ---------------------- | ----------- | ---------------------------------------------------------------------------------- | ------- | -------------------------------------------------------------- |
| ClusterGetTags         | GET         | /api/cluster/:id/tags                                                              |         |                                                                |
| DatastoreGetTags       | GET         | /api/data\_stores/:id/tags                                                         |         |                                                                |
| EmsGetTags             | GET         | /api/providers/:id/tags                                                            |         |                                                                |
| EVMDeleteVmByName      | DELETE      | /api/vms/:id                                                                       |         | [Delete VM](../examples/delete_vm.html)                        |
|                        | POST        | /api/vms/:id                                                                       | delete  | [Delete VMs](../examples/delete_vm.html#deleting-multiple-vms) |
| EVMClusterList         | GET         | /api/clusters                                                                      |         |                                                                |
| EVMDatastoreList       | GET         | /api/data\_stores                                                                  |         |                                                                |
| EVMHostList            | GET         | /api/hosts                                                                         |         |                                                                |
| EVMResourcePoolList    | GET         | /api/resource\_pools                                                               |         |                                                                |
| EVMPing                | GET         | /api                                                                               |         |                                                                |
| EVMVmAccounts          | GET         | /api/vms/:id/accounts                                                              |         |                                                                |
| EVMVmList              | GET         | /api/vms                                                                           |         |                                                                |
|                        | GET         | /api/hosts/:id?attributes=vms                                                      |         |                                                                |
|                        | GET         | /api/hosts?filter\[\]=guid='…​.'\&expand=resources\&attributes=vms                 |         |                                                                |
| EVMVmSoftware          | GET         | /api/vms:id/software                                                               |         |                                                                |
| FindClusterById        | GET         | /api/clusters/:id                                                                  |         |                                                                |
| FindClustersById       | GET         | /api/clusters/:id                                                                  |         |                                                                |
| FindDatastoreById      | GET         | /api/data\_stores/:id                                                              |         |                                                                |
| FindDatastoresById     | GET         | /api/data\_stores/:id                                                              |         |                                                                |
| FindEmsByGuid          | GET         | /api/providers?filter\[\]=guid='…​.'                                               |         |                                                                |
| FindHostByGuid         | GET         | /api/hosts?filter\[\]='guid='…​.'"                                                 |         |                                                                |
| FindHostsByGuid        | GET         | /api/hosts?filter\[\]='guid='…​.'"                                                 |         |                                                                |
| FindResourcePoolById   | GET         | /api/resource\_pools/:id                                                           |         |                                                                |
| FindResourcePoolsById  | GET         | /api/resource\_pools                                                               |         |                                                                |
|                        | GET         | /api/resource\_pools?filter\[\]=id=:id\&filter\[\]=or id=:id&…​                    |         |                                                                |
| FindVmByGuid           | GET         | /api/vms?filter\[\]=guid='…​.'                                                     |         |                                                                |
| FindVmsByGuid          | GET         | /api/vms?filter\[\]=guid='…​.'\&filter\[\]=or guid='…​.'&…​                        |         |                                                                |
| GetClusterList         | GET         | /api/clusters                                                                      |         |                                                                |
|                        | GET         | /api/clusters?filter\[\]=ems\_id=:id                                               |         |                                                                |
|                        | GET         | /api/providers/:id?attributes=ems\_clusters                                        |         |                                                                |
| GetClustersByList      | GET         | /api/clusters/:id                                                                  |         |                                                                |
|                        | GET         | /api/clusters?filter\[\]=id=:id\&filter\[\]=or id=:id&…​                           |         |                                                                |
| GetClustersByTag       | GET         | /api/clusters?by\_tag=:tag\_path                                                   |         |                                                                |
| GetDatastoreByList     | GET         | /api/data\_stores                                                                  |         |                                                                |
| GetDatastoreByTag      | GET         | /api/data\_stores?by\_tag=:tag\_path                                               |         |                                                                |
| GetEmsByList           | GET         | /api/providers                                                                     |         |                                                                |
|                        | GET         | /api/providers/:id                                                                 |         |                                                                |
|                        | GET         | /api/providers?filter\[\]=…​.\&expand=resources                                    |         |                                                                |
| GetEmsList             | GET         | /api/providers                                                                     |         |                                                                |
| GetHostsByList         | GET         | /api/hosts                                                                         |         |                                                                |
|                        | GET         | /api/hosts?filter\[\]=…​.\&expand=resources                                        |         |                                                                |
| GetHostList            | GET         | /api/hosts                                                                         |         |                                                                |
|                        | GET         | /api/providers/:id?attributes=hosts                                                |         |                                                                |
|                        | GET         | /api/providers?filter\[\]=guid='…​.'\&expand=resources\&attributes=hosts           |         |                                                                |
| GetResourcePoolList    | GET         | /api/providers/:id?attributes=resource\_pools                                      |         |                                                                |
|                        | GET         | /api/providers?filter\[\]=guid='…​.'\&expand=resources\&attributes=resource\_pools |         |                                                                |
| GetResourcePoolsByList | GET         | /api/resource\_pools                                                               |         |                                                                |
|                        | GET         | /api/resource\_pools/:id                                                           |         |                                                                |
|                        | GET         | /api/resource\_pools?filter\[\]=…​.\&expand=resources                              |         |                                                                |
| GetResourcePoolsByTag  | GET         | /api/resource\_pools?by\_tag=:tag\_path                                            |         |                                                                |
| GetTemplatesByTag      | GET         | /api/templates?by\_path=:tag\_path                                                 |         |                                                                |
| GetVmList              | GET         | /api/hosts/:id?attributes=vms                                                      |         |                                                                |
|                        | GET         | /api/hosts?filter\[\]=guid='…​.'\&expand=resources\&attributes=vms                 |         |                                                                |
| GetVmsByList           | GET         | /api/vms                                                                           |         |                                                                |
|                        | GET         | /api/vms/:id                                                                       |         |                                                                |
|                        | GET         | /api/vms?filter\[\]=…​.\&expand=resources                                          |         |                                                                |
| GetVmsByTag            | GET         | /api/vms?by\_path=:tag\_path                                                       |         |                                                                |
| HostGetTags            | GET         | /api/hosts/:id/tags                                                                |         |                                                                |
|                        | GET         | /api/hosts/:id?expand=tags                                                         |         |                                                                |
|                        | GET         | /api/hosts?filter\[\]=guid='…​.'\&expand=resources,tags                            |         |                                                                |
| ResourcePoolGetTags    | GET         | /api/resource\_pools/:id/tags                                                      |         |                                                                |
|                        | GET         | /api/resource\_pools/:id?expand=tags                                               |         |                                                                |
| VmGetTags              | GET         | /api/vms/:id/tags                                                                  |         |                                                                |
|                        | GET         | /api/vms/:id?expand=tags                                                           |         |                                                                |

### Control Web Services

| SOAP API                     | HTTP Method | REST API URLs                                                         | Actions               | Examples                                                                                        |
| ---------------------------- | ----------- | --------------------------------------------------------------------- | --------------------- | ----------------------------------------------------------------------------------------------- |
| ClusterSetTag                | POST        | /api/clusters/:id/tags                                                | assign                | [Assigning Tags](../reference/tagging.html#assigning-tags)                                      |
| DatastoreSetTag              | POST        | /api/data\_stores/:id/tags                                            | assign                | [Assigning Tags](../reference/tagging.html#assigning-tags)                                      |
| EmsSetTag                    | POST        | /api/providers/:id/tags                                               | assign                | [Assigning Tags](../reference/tagging.html#assigning-tags)                                      |
| EVMActionList                | GET         | /api/policies/:id/policy\_actions                                     |                       | [Policy Actions](../reference/policy_collections.html#policy-actions)                           |
|                              | GET         | /api/policies/:id?expand=policy\_actions                              |                       |                                                                                                 |
|                              | GET         | /api/policies?filter\[\]=guid='…​.'\&expand=resources,policy\_actions |                       |                                                                                                 |
| EVMAddLifecycleEvent         | POST        | /api/vms/:id                                                          | add\_lifecycle\_event | [Add Lifecycle Event to VM](../examples/add_lifecycle_event_vm.html)                            |
| EVMAssignPolicy              | POST        | /api/hosts/:id/policies                                               | assign                | [Assigning Policies](../reference/policies.html#assigning-policies-to-a-resource)               |
| EVMConditionList             | GET         | /api/policies/:id/conditions                                          |                       | [Policy Conditions](../reference/policy_collections.html#policy-conditions)                     |
|                              | GET         | /api/policies/:id?expand=conditions                                   |                       |                                                                                                 |
|                              | GET         | /api/policies?filter\[\]=guid='…​.'\&expand=resources,conditions      |                       |                                                                                                 |
| EVMEventList                 | GET         | /api/policies/:id/events                                              |                       | [Policy Events](../reference/policy_collections.html#policy-events)                             |
|                              | GET         | /api/policies/:id?expand=events                                       |                       |                                                                                                 |
|                              | GET         | /api/policies?filter\[\]=guid='…​.'\&expand=resources,events          |                       |                                                                                                 |
| EVMGetPolicy                 | GET         | /api/policies                                                         |                       | [Querying Policies](../reference/policies.html#querying-policies)                               |
|                              | GET         | /api/policies/:id                                                     |                       |                                                                                                 |
|                              | GET         | /api/policies?filter\[\]=name='…​.'                                   |                       |                                                                                                 |
| EVMPolicyList                | GET         | /api/hosts/:id/policies                                               |                       | [Policy Management](../reference/policies.html)                                                 |
|                              | GET         | /api/hosts/:id?expand=policies                                        |                       |                                                                                                 |
|                              | GET         | /api/hosts?filter\[\]=guid='…​.'\&expand=resources,policies           |                       |                                                                                                 |
| EVMVmEventByProperty         | POST        | /api/vms/:id                                                          | add\_event            | [Add VM Event](../examples/add_event_vm.html)                                                   |
| EVMVmScanByProperty          | POST        | /api/vms/:id                                                          | scan                  | [Scan VM](../examples/scan_vm.html)                                                             |
| EVMSmartStart                | POST        | /api/vms/:id                                                          | start                 | [Start VM](../examples/start_vm.html)                                                           |
| EVMSmartStop                 | POST        | /api/vms/:id                                                          | stop                  | [Stop VM](../examples/stop_vm.html)                                                             |
| EVMSmartSuspend              | POST        | /api/vms/:id                                                          | suspend               | [Suspend VM](../examples/suspend_vm.html)                                                       |
| EVMUnassignPolicy            | POST        | /api/hosts/:id/policies                                               | unassign              | [Unassigning Policies](../reference/policies.html#unassigning-policies-from-a-resource)         |
| EVMVmRsop                    | POST        | /api/vms/:id/policies/:id                                             | resolve               | [Resolving Policies](../reference/policies.html#resolving-policies-of-a-resource)               |
|                              | POST        | /api/vms/:id/policy\_profiles/:id                                     | resolve               | [Resolving Policy Profiles](../reference/policies.html#resolving-policy-profiles-of-a-resource) |
| HostSetTag                   | POST        | /api/hosts/:id/tags                                                   | assign                | [Assigning Tags](../reference/tagging.html#assigning-tags)                                      |
| ResourcePoolSetTag           | POST        | /api/resource\_pools/:id/tags                                         | assign                | [Assigning Tags](../reference/tagging.html#assigning-tags)                                      |
| VmAddCustomAttribute         | POST        | /api/vms/:id/custom\_attributes                                       | add                   | [Adding Custom Attributes](../reference/custom_attributes.html#add-custom-attributes)           |
| VmAddCustomAttributes        | POST        | /api/vms/:id/custom\_attributes                                       | add                   |                                                                                                 |
| VmAddCustomAttributeByFields | POST        | /api/vms/:id/custom\_attributes                                       | add                   |                                                                                                 |
| VmDeleteCustomAttribute      | POST        | /api/vms/:id/custom\_attributes                                       | delete                | [Deleting Custom Attributes](../reference/custom_attributes.html#delete-custom-attributes)      |
| VmDeleteCustomAttributes     | POST        | /api/vms/:id/custom\_attributes                                       | delete                |                                                                                                 |
| VmSetTag                     | POST        | /api/vms/:id/tags                                                     | assign                | [Assigning Tags](../reference/tagging.html#assigning-tags)                                      |
| VmSetOwner                   | POST        | /api/vms/:id                                                          | set\_owner            | [Set Owner of VM](../examples/set_owner_vm.html)                                                |

### Automate Web Services

| SOAP API                | HTTP Method | REST API URLs                                       | Actions | Examples                                                                                                                             |
| ----------------------- | ----------- | --------------------------------------------------- | ------- | ------------------------------------------------------------------------------------------------------------------------------------ |
| CreateAutomationRequest | POST        | /api/automation\_requests                           | create  | [Create Automation Request](../examples/automation_request.html), [Create Automation Requests](../examples/automation_requests.html) |
| EVMProvisionRequestEx   | POST        | /api/provision\_requests                            | create  | [Create Provision Request](../examples/provision_request.html), [Create Provision Requests](../examples/provision_requests.html)     |
| GetAutomationRequest    | GET         | /api/automation\_requests/:id                       |         |                                                                                                                                      |
| GetAutomationTask       | GET         | /api/automation\_requests/:id?expand=request\_tasks |         |                                                                                                                                      |
|                         | GET         | /api/automation\_requests/:id/request\_tasks/:id    |         |                                                                                                                                      |
| GetVmProvisionRequest   | GET         | /api/provision\_requests/:id                        |         |                                                                                                                                      |
|                         | GET         | /api/provision\_requests/:id?expand=request\_tasks  |         |                                                                                                                                      |
| VmProvisionRequest      | POST        | /api/provision\_requests                            | create  | [Create Provision Request](../examples/provision_request.html), [Create Provision Requests](../examples/provision_requests.html)     |
