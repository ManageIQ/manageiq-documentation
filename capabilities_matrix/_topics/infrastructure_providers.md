### Infrastructure Providers

 The following tables outline the capabilities of {{ site.data.product.title_short }} that are known to work for various virtual infrastructure providers.

| Discovery                                                    | vSphere | oVirt / RHV | OpenStack undercloud    | IBM Power HMC | KubeVirt / OSV | Nutanix | Proxmox |
| ------------------------------------------------------------ | ------- | ----------- | ----------------------- | ------------- | -------------- | ------- | ------- |
| Compute Inventory                                            | ✅      | ✅          | ✅ (Nodes and Services) | ✅            | ✅             | ✅     | ✅       |
| Network Inventory                                            | ✅      | ✅ (OVN)    | ❌                      | ✅            | ❌             | ❌     | ✅       |
| Storage Inventory                                            | ✅      | ❌          | ❌                      | ✅            | ✅             | ✅     | ✅       |
| Events                                                       | ✅      | ✅          | ✅                      | ✅            | ❌             | ❌     | ❌       |
| Metrics                                                      | ✅      | ✅          | ✅                      | ✅            | ✅             | ❌     | ❌       |
| Forensic Analysis (SmartState)                               | ✅      | ✅          | ✅ (Nodes)              | ❌            | ❌             | ❌     | ❌       |

| General Features                                             | vSphere | oVirt / RHV | OpenStack undercloud | IBM Power HMC | KubeVirt / OSV | Nutanix | Proxmox |
| ------------------------------------------------------------ | ------- | ----------- | -------------------- | ------------- | -------------- | ------- | ------- |
| Relationship Discovery                                       | ✅      | ✅          | ✅                   | ✅            | ✅             | ✅      | ✅      |
| Drift Comparison                                             | ✅      | ✅          | ✅ (Nodes)           | ❌            | ❌             | ❌      | ❌      |
| VM Genealogy                                                 | ✅      | ✅          | ✅                   | ❌            | ✅             | ❌      | ❌      |
| Capacity & Utilization                                       | ✅      | ✅          | ✅                   | ✅            | ❌             | ❌      | ❌      |
| VM Event Timelines                                           | ✅      | ✅          | ❌                   | ✅            | ✅             | ❌      | ❌      |
| Infrastructure Event Timelines                               | ❌      | ❌          | ✅                   | ❌            | ❌             | ❌      | ❌      |
| Reporting                                                    | ✅      | ✅          | ✅                   | ✅            | ✅             | ✅      | ❌      |
| Right Sizing                                                 | ✅      | ✅          | ❌                   | ✅            | ❌             | ❌      | ❌      |
| Chargeback by Allocation                                     | ✅      | ✅          | ❌                   | ❌            | ❌             | ❌      | ❌      |
| Chargeback by Usage                                          | ✅      | ✅          | ❌                   | ❌            | ❌             | ❌      | ❌      |
| Automation Work Flows                                        | ✅      | ✅          | ❌                   | ❌            | ❌             | ❌      | ❌      |
| Tag Mapping from Provider                                    | ❌      | ❌          | ❌                   | ❌            | ❌             | ❌      | ❌      |
| Tag Mapping to Provider                                      | ❌      | ❌          | ❌                   | ❌            | ❌             | ❌      | ❌      |
| VM Compliance Enforcement                                    | ✅      | ✅          | ❌                   | ❌            | ❌             | ❌      | ❌      |
| VM Policy Enforcement                                        | ✅      | ✅          | ❌                   | ❌            | ❌             | ❌      | ❌      |
| Alerts - Real Time                                           | ✅      | ❌          | ❌                   | ❌            | ❌             | ❌      | ❌      |
| Alerts - VM Value Changed                                    | ✅      | ✅          | ❌                   | ❌            | ❌             | ❌      | ❌      |
| Alerts - VM Reconfigured                                     | ✅      | ✅          | ❌                   | ❌            | ❌             | ❌      | ❌      |
| Integrate with Service Catalogs                              | ✅      | ✅          | ❌                   | ✅            | ✅             | ❌      | ❌      |

| Operations                                                   | vSphere | oVirt / RHV | OpenStack undercloud    | IBM Power HMC | KubeVirt / OSV | Nutanix | Proxmox |
| ------------------------------------------------------------ | ------- | ----------- | ----------------------- | --------------| -------------- | ------- | ------- |
| VM Remote Console Access (see section below)                 | ✅      | ✅          | ❌                      | ❌            | ✅             | ❌      | ❌      |
| VM Power Operations                                          | ✅      | ✅          | ❌                      | ✅            | ✅             | ✅      | ✅      |
| VM Provisioning                                              |         |             |                         |               |                |         |
|   &nbsp;&nbsp;&bull; using PXE                               | ✅      | ✅          | ❌                      | ❌            | ❌             | ❌      | ❌      |
|   &nbsp;&nbsp;&bull; using ISO                               | ❌      | ✅          | ❌                      | ❌            | ❌             | ❌      | ❌      |
|   &nbsp;&nbsp;&bull; from Template to VM                     | ✅      | ✅          | ❌                      | ✅            | ✅             | ❌      | ❌      |
|   &nbsp;&nbsp;&bull; from VM to Template                     | ✅      | ✅          | ❌                      | ✅            | ❌             | ❌      | ❌      |
|   &nbsp;&nbsp;&bull; Clone from VM to VM                     | ✅      | ❌          | ❌                      | ❌            | ❌             | ❌      | ❌      |
|   &nbsp;&nbsp;&bull; Sysprep Windows Templates               | ✅      | ✅          | ❌                      | ❌            | ❌             | ❌      | ❌      |
|   &nbsp;&nbsp;&bull; Cloud-init                              | ❌      | ✅          | ❌                      | ❌            | ❌             | ❌      | ❌      |
| VM Retirement                                                | ✅      | ✅          | ❌                      | ✅            | ✅             | ✅      | ✅      |
| VM Reconfiguration                                           | ✅      | ✅          | ❌                      | ❌            | ✅ *           | ❌      | ❌      |
|   &nbsp;&nbsp;&bull; Disk Addition                           | ✅      | ✅          | ❌                      | ❌            | ❌             | ❌      | ❌      |
|   &nbsp;&nbsp;&bull; Network Interface Add/Remove            | ✅      | ✅          | ❌                      | ❌            | ❌             | ❌      | ❌      |
| VM Snapshot Creation and Removal                             | ✅      | ✅          | ❌                      | ❌            | ❌             | ❌      | ❌      |
| Host Power Operations                                        | ✅      | ❌          | ✅                      | ✅            | ❌             | ❌      | ❌      |
| Node Operations                                              |         |             |                         |               | ❌             | ❌      | ❌      |
|   &nbsp;&nbsp;&bull; Add/Remove Node                         | ❌      | ❌          | ✅                      | ❌            | ❌             | ❌      | ❌      |
|   &nbsp;&nbsp;&bull; Scale Down Node                         | ❌      | ❌          | ✅ (Compute nodes only) | ❌            | ❌             | ❌      | ❌      |
|   &nbsp;&nbsp;&bull; Scale Up Nodes                          | ❌      | ❌          | ✅ (Compute nodes only) | ❌            | ❌             | ❌      | ❌      |
|   &nbsp;&nbsp;&bull; Nodes Policy Enforcement                | ❌      | ❌          | ✅                      | ❌            | ❌             | ❌      | ❌      |
|   &nbsp;&nbsp;&bull; Nodes Evacuate                          | ❌      | ❌          | ✅                      | ❌            | ❌             | ❌      | ❌      |
| Create Cloud Network                                         | ❌      | ✅          | ❌                      | ❌            | ❌             | ❌      | ❌      |
| Delete Cloud Network                                         | ❌      | ✅          | ❌                      | ❌            | ❌             | ❌      | ❌      |
| Create Cloud Subnet                                          | ❌      | ✅          | ❌                      | ❌            | ❌             | ❌      | ❌      |
| Delete Cloud Subnet                                          | ❌      | ✅          | ❌                      | ❌            | ❌             | ❌      | ❌      |
| Create Network Router                                        | ❌      | ✅          | ❌                      | ❌            | ❌             | ❌      | ❌      |
| Delete Network Router                                        | ❌      | ✅          | ❌                      | ❌            | ❌             | ❌      | ❌      |

\* KubeVirt/OSV VMs created with an instance type are not supported for reconfigure

#### Remote Consoles

| Provider     | Connection Type |
| ------------ | --------------- |
| vSphere 6.0  | VNC             |
|              | VMRC            |
|              | WebMKS          |
| vSphere 6.5+ | VMRC            |
|              | WebMKS          |
| RHV          | SPICE           |
| SCVMM        | N/A             |
| KubeVirt     | SPICE           |
| OSV          | SPICE           |
