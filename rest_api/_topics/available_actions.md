### Available Actions

| Action                                      | Method | URL                                          |
| ------------------------------------------- | ------ | -------------------------------------------- |
| Add Service Catalog                         | POST   | /api/service\_catalogs                       |
| Add Service Catalogs                        | POST   | /api/service\_catalogs                       |
| Edit Service Catalog                        | POST   | /api/service\_catalogs/id                    |
| Edit Service Catalogs                       | POST   | /api/service\_catalogs                       |
| Automation Request                          | POST   | /api/automation\_requests                    |
| Automation Requests                         | POST   | /api/automation\_requests                    |
| Edit Service                                | POST   | /api/services/id                             |
| Edit Service via PUT                        | PUT    | /api/services/id                             |
| Edit Service via PATCH                      | PATCH  | /api/services/id                             |
| Edit Services                               | POST   | /api/services/                               |
| Assign Tags to a Service                    | POST   | /api/services/id/tags                        |
| Assign a Tag by Name to a Service           | POST   | /api/services/id/tags                        |
| Assign a Tag by Name to a Service           | POST   | /api/services/id/tags                        |
| Unassign Tags from Service                  | POST   | /api/services/id/tags                        |
| Assign Tags to Cloud Networks               | POST   | /api/cloud\_networks/id/tags                 |
| Assign Tags to Cloud Subnets                | POST   | /api/cloud\_subnets/id/tags                  |
| Assign Tags to Flavors                      | POST   | /api/flavors/id/tags                         |
| Assign Tags to Availability Zones           | POST   | /api/availability\_zones/id/tags             |
| Assign Tags to Network Routers              | POST   | /api/network\_routers/id/tags                |
| Assign Tags to Security Groups              | POST   | /api/security\_groups/id/tags                |
| Retire Service Now                          | POST   | /api/services/id                             |
| Retire Service in Future                    | POST   | /api/services/id                             |
| Retire Services                             | POST   | /api/services                                |
| Delete Service                              | DELETE | /api/services/id                             |
| Delete Services                             | POST   | /api/services                                |
| Edit Service Template                       | POST   | /api/service\_templates/id                   |
| Edit Service Templates                      | POST   | /api/service\_templates                      |
| Assign Tags to Service Template             | POST   | /api/service\_templates/id/tags              |
| Unassign Tags from Service Template         | POST   | /api/service\_templates/id/tags              |
| Delete Service Template                     | DELETE | /api/service\_templates/id                   |
| Delete Service Templates                    | POST   | /api/service\_templates                      |
| Assign Service Templates                    | POST   | /api/service\_catalogs/id/service\_templates |
| Unassign Service Templates                  | POST   | /api/service\_catalogs/id/service\_templates |
| Order Service                               | POST   | /api/service\_catalogs/id/service\_templates |
| Order Services                              | POST   | /api/service\_catalogs/id/service\_templates |
| Delete Service Catalog                      | DELETE | /api/service\_catalogs/id                    |
| Delete Service Catalogs                     | POST   | /api/service\_catalogs                       |
| Provision Request                           | POST   | /api/provision\_requests                     |
| Provision Requests                          | POST   | /api/provision\_requests                     |
| Create a Provider                           | POST   | /api/providers                               |
| Create a Provider with Compound Credentials | POST   | /api/providers                               |
| Edit a Provider                             | POST   | /api/providers                               |
| Update a Provider                           | POST   | /api/providers                               |
| Delete a Provider                           | POST   | /api/providers                               |
| Delete Multiple Providers                   | POST   | /api/providers                               |
| Refresh a Provider                          | POST   | /api/providers                               |
| Scan a VM                                   | POST   | /api/vms                                     |
| Set Owner of a VM                           | POST   | /api/vms                                     |
| Add a Lifecycle Event to a VM               | POST   | /api/vms                                     |
| Add an Event to a VM                        | POST   | /api/vms                                     |
| Start a VM                                  | POST   | /api/vms                                     |
| Stop a VM                                   | POST   | /api/vms                                     |
| Suspend a VM                                | POST   | /api/vms                                     |
| Delete VMs                                  | DELETE | /api/vms                                     |
| Scan a Container                            | POST   | /api/container\_images                       |
