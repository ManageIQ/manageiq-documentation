### Sub-Collection Queries

| Sub-Collection                                         | URL                                                   |
| ------------------------------------------------------ | ----------------------------------------------------- |
| Tagging                                                | /api/\<collection\>/:id/tags                          |
| Policies                                               | /api/\<collection\>/:id/policies                      |
| Policy Profiles                                        | /api/\<collection\>/:id/policy\_profiles              |
|                                                        |                                                       |
| Service Requests                                       | /api/service\_templates/:id/service\_requests         |
| Request Tasks                                          |                                                       |
|                                                        | /api/service\_requests/:id/request\_tasks             |
|                                                        | /api/automation\_requests/:id/request\_tasks          |
|                                                        | /api/provision\_requests/:id/request\_tasks           |
| Request Tasks can also be accessed via the tasks alias |                                                       |
|                                                        | /api/service\_requests/:id/tasks                      |
|                                                        | /api/automation\_requests/:id/tasks                   |
|                                                        | /api/provision\_requests/:id/tasks                    |
| Infrastructure Providers                               |                                                       |
|                                                        | /api/providers/:id/lans                               |
|                                                        | /api/hosts/:id/lans                                   |
|                                                        | /api/providers/:id/networks                           |
|                                                        | /api/providers/:id/folders (also returns Datacenters) |
