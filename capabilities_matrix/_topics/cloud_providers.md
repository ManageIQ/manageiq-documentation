### Cloud Providers

The following tables outline the capabilities of {{ site.data.product.title_short }} that are known to work for various cloud providers.

| Discovery                                                    | AWS | Azure | GCP | OpenStack | IBM CIC | PowerVC | PowerVS | IBM VPC | Oracle |
| ------------------------------------------------------------ | --- | ----- | --- | ---------| ------- | ------- | ------- | ------- | ------ |
| Compute Inventory                                            | ✅  | ✅    | ✅  | ✅        | ✅      | ✅      | ✅      | ✅     | ✅    |
|   &nbsp;&nbsp;&bull; Key Pairs                               | ✅  | ❌    | ✅  | ✅        | ✅      | ✅      | ✅      | ✅     | ❌    |
| Network Inventory                                            | ✅  | ✅    | ✅  | ✅        | ✅      | ✅      | ✅      | ✅     | ✅    |
|   &nbsp;&nbsp;&bull; Cloud Networks                          | ✅  | ✅    | ✅  | ✅        | ✅      | ✅      | ✅      | ✅     | ✅    |
|   &nbsp;&nbsp;&bull; Cloud Subnets                           | ✅  | ✅    | ✅  | ✅        | ✅      | ✅      | ✅      | ✅     | ✅    |
|   &nbsp;&nbsp;&bull; Floating IP Addresses                   | ✅  | ✅    | ✅  | ✅        | ✅      | N/A     | N/A     | ✅     | ❌    |
|   &nbsp;&nbsp;&bull; Load Balancers                          | ✅  | ✅    | ✅  | ❌        | ❌      | N/A     | N/A     | ✅     | ❌    |
|   &nbsp;&nbsp;&bull; Network Managers                        | ❌  | ✅    | ✅  | ❌        | ❌      | ❌      | ✅      | ✅     | ✅    |
|   &nbsp;&nbsp;&bull; Network Manager Relations               | ✅  | ✅    | ✅  | ✅        | ✅      | ❌      | ✅      | ✅     | ✅    |
|   &nbsp;&nbsp;&bull; Network Ports                           | ✅  | ✅    | ✅  | ✅        | ✅      | ❌      | ✅      | ✅     | ✅    |
|   &nbsp;&nbsp;&bull; Network Routers                         | ❌  | ❌    | ✅  | ✅        | ✅      | ❌      | ❌      | ✅     | ❌    |
|   &nbsp;&nbsp;&bull; Security Groups                         | ✅  | ✅    | ✅  | ✅        | ✅      | N/A     | N/A     | N/A     | ❌    |
| Storage Inventory                                            | ✅  | ✅    | ✅  | ✅        | ✅      | ✅      | ✅      | ✅     | ✅    |
|   &nbsp;&nbsp;&bull; Storage Manager                         | ✅  | ❌    | ❌  | ✅        | ✅      | ✅      | ✅      | ✅     | ❌    |
|   &nbsp;&nbsp;&bull; Volumes                                 | ❌  | ❌    | ✅  | ✅        | ✅      | ✅      | ✅      | ✅     | ✅    |
| Events                                                       | ✅  | ✅    | ✅  | ✅        | ✅      | ✅      | ❌      | ✅     | ✅    |
| Metrics                                                      | ✅  | ✅    | ✅  | ✅        | ✅      | ✅      | ❌      | ✅     | ✅    |
| Forensic Analysis (SmartState)                               | ✅  | ✅    | ❌  | ✅        | ❌      | ❌      | ❌      | ❌     | ❌    |

| General Features                | AWS | Azure | GCP | OpenStack | IBM CIC | PowerVC              | PowerVS              | IBM VPC              | Oracle |
| ------------------------------- | --- | ----- | --- | --------- | ------- | -------------------- | -------------------- | -------------------- | ------ |
| Relationship Discovery          | ✅  | ✅    | ✅  | ✅        | ✅      | ✅                   | ✅                   | ✅                   | ✅     |
| Instance Drift Comparison       | ✅  | ✅    | ❌  | ✅        | ✅      | ❌                   | ❌                   | ❌                   | ❌     |
| Instance Genealogy              | ✅  | ✅    | ✅  | ✅        | ✅      | ✅                   | ✅                   | ✅                   | ✅     |
| Capacity & Utilization          | ✅  | ✅    | ✅  | ✅        | ✅      | ❌                   | ❌                   | ❌                   | ✅     |
| Instance Event Timelines        | ✅  | ✅    | ✅  | ✅        | ✅      | ✅                   | ❌                   | ✅                   | ✅     |
| Cloud Layer Timelines           | ❌  | ❌    | ❌  | ✅        | ✅      | ✅                   | ❌                   | ❌                   | ❌     |
| Reporting                       | ✅  | ✅    | ✅  | ✅        | ✅      | ✅                   | ✅                   | ✅                   | ✅     |
| Right Sizing                    | ✅  | ✅    | ✅  | ✅        | ✅      | ✅                   | ❌                   | ❌                   | ❌     |
| Chargeback by Allocation        | ✅  | ✅    | ✅  | ✅        | ✅      | ✅                   | ✅                   | ✅                   | ❌     |
| Chargeback by Usage             | ✅  | ✅    | ✅  | ✅        | ✅      | ❌                   | ❌                   | ❌                   | ❌     |
| Automation Work Flows           | ✅  | ❌    | ✅  | ✅        | ✅      | ✅                   | ❌                   | ❌                   | ❌     |
| Tag Mapping from Provider       | ✅  | ✅    | ❌  | ✅        | ✅      | ✅                   | ❌                   | ✅                   | ❌     |
| Tag Mapping to Provider         | ❌  | ❌    | ❌  | ❌        | ❌      | ❌                   | ❌                   | ❌                   | ❌     |
| Instance Policy Enforcement     | ✅  | ✅    | ✅  | ✅        | ✅      | ✅                   | ✅                   | ✅                   | ✅     |
| Instance Compliance Enforcement | ✅  | ✅    | ✅  | ✅        | ❌      | ❌                   | ❌                   | ❌                   | ❌     |
| Alerts - Real Time              | ❌  | ❌    | ❌  | ✅        | ❌      | ❌                   | ❌                   | ❌                   | ❌     |
| Integrate with Service Catalogs | ✅  | ✅    | ✅  | ✅        | ✅      | ✅                   | ✅                   | ✅                   | ✅     |

| Operations                                                   | AWS | Azure | GCP | OpenStack | IBM CIC | PowerVC                          | PowerVS  | IBM VPC | Oracle       |
| ------------------------------------------------------------ | --- | ----- | --- | --------- | -------- | -------------------------------- | -------- | ------- | ------------ |
| Instance Remote Console Access                               | ❌  | ❌    | ❌  | ✅ (VNC)  | ✅ (VNC) | ✅ (NovaLink-managed hosts only) | ❌       | ❌      | ❌           |
| Instance Power Operations                                    | ✅  | ✅    | ✅  | ✅        | ✅       | ✅                               | ✅       | ✅      | ✅           |
| Instance Provisioning                                        | ✅  | ✅    | ✅  | ✅        | ✅       | ✅                               | ✅       | ✅      | ✅           |
|   &nbsp;&nbsp;&bull; from Image to Instance                  | ✅  | ✅    | ✅  | ✅        | ✅       | ✅                               | ✅       | ✅      | ✅           |
|   &nbsp;&nbsp;&bull; from Image Snapshot to Instance         | ❌  | ❌    | ❌  | ✅        | ✅       | ❌                               | ❌       | ❌      | ❌           |
|   &nbsp;&nbsp;&bull; from Volume to Instance                 | ❌  | ❌    | ❌  | ✅        | ✅       | ❌                               | ❌       | ❌      | ❌           |
|   &nbsp;&nbsp;&bull; from Volume Snapshot to Instance        | ❌  | ❌    | ❌  | ✅        | ❌       | ❌                               | ❌       | ❌      | ❌           |
|   &nbsp;&nbsp;&bull; from Orchestration Template             | ✅  | ✅    | ❌  | ✅        | ✅       | ❌                               | ❌       | ❌      | ❌           |
|   &nbsp;&nbsp;&bull; Cloud-init                              | ❌  | ❌    | ❌  | ✅        | ✅       | ✅                               | ✅       | ❌      | ❌           |
|   &nbsp;&nbsp;&bull; Sysprep Windows Templates               | ❌  | ❌    | ❌  | ✅        | ✅       | N/A                              | N/A      | N/A     | ❌           |
| Instance Retirement                                          | ✅  | ✅    | ✅  | ✅        | ✅       | ✅                               | ✅       | ❌      | ✅           |
| Instance Reconfiguration                                     | ❌  | ❌    | ❌  | ✅        | ✅       | ✅                               | ❌       | ❌      | ❌           |
|   &nbsp;&nbsp;&bull; Disk Addition                           | ✅  | ✅    | ❌  | ✅        | ✅       | ❌                               | ✅       | ❌      | ❌           |
| Instance Migration                                           | ❌  | ❌    | ❌  | ✅        | ✅       | ✅                               | N/A      | N/A     | ❌           |
| Instance Snapshot Creation and Removal                       | ❌  | ❌    | ❌  | ✅        | ✅       | ✅                               | ❌       | ❌      | ❌           |
| Key Pairs Management                                         | ✅  | ❌    | ❌  | ✅        | ✅       | ✅                               | ✅       | ❌      | ❌           |
| Network Manager - CRUD Actions                               | ❌  | ❌    | ❌  | ❌        | ❌       | ❌                               | ❌       | ❌      | ❌           |
|   &nbsp;&nbsp;&bull; Create/Update/Delete Network            | ❌  | ❌    | ❌  | ✅        | ✅       | ❌                               | ❌       | ✅      | ❌           |
|   &nbsp;&nbsp;&bull; Create/Update/Delete Subnet             | ❌  | ❌    | ❌  | ✅        | ✅       | ❌                               | ❌       | ✅      | ❌           |
|   &nbsp;&nbsp;&bull; Create/Update/Delete Routers            | ❌  | ❌    | ❌  | ✅        | ✅       | ❌                               | ❌       | ❌      | ❌           |
| Volume Creation/Deletion                                     | ❌  | ❌    | ❌  | ✅        | ✅       | ✅                               | ✅       | ✅      | ❌           |
| Cloud Database - CRUD Actions                                | ✅  | ✅    | ✅  | ❌        | ❌       | ❌                               | ❌       | ✅      | ✅           |
