### Infrastructure Providers

 The following tables outline the capabilities of {{ site.data.product.title_short }} that are known to work for various virtual infrastructure providers.

| Discovery                                                    | vSphere | oVirt / RHV | SCVMM | OpenStack undercloud    | IBM Power HMC | KubeVirt |
| ------------------------------------------------------------ | ------- | ----------- | ----- | ----------------------- | ------------- | -------- |
| Compute Inventory                                            | ✅      | ✅          | ✅    | ✅ (Nodes and Services) | ✅            | ✅         |
| Network Inventory                                            | ✅      | ✅ (OVN)    | ❌    | ❌                      | ✅            | ❌          |
| Storage Inventory                                            | ✅      | ❌          | ❌    | ❌                      | ❌            | ✅         |
| Events                                                       | ✅      | ✅          | ✅    | ✅                      | ✅            | ❌          |
| Metrics                                                      | ✅      | ✅          | ✅    | ✅                      | ❌            | ❌          |
| Forensic Analysis (SmartState)                               | ✅      | ✅          | ❌    | ✅ (Nodes)              | ❌            | ❌          |

| General Features                                             | vSphere | oVirt / RHV | SCVMM | OpenStack undercloud | IBM Power HMC | KubeVirt |
| ------------------------------------------------------------ | ------- | ----------- | ------| -------------------- | ------------- | -------- |
| Relationship Discovery                                       | ✅      | ✅          | ✅    | ✅                   | ✅            | ✅         |
| Drift Comparison                                             | ✅      | ✅          | ✅    | ✅ (Nodes)           | ❌            | ❌          |
| VM Genealogy                                                 | ✅      | ✅          | ✅    | ✅                   | ❌            | ✅         |
| Capacity & Utilization                                       | ✅      | ✅          | ❌    | ✅                   | ✅            | ❌          |
| VM Event Timelines                                           | ✅      | ✅          | ✅    | ❌                   | ✅            | ❌          |
| Infrastructure Event Timelines                               | ❌      | ❌          | ❌    | ✅                   | ❌            | ❌          |
| Reporting                                                    | ✅      | ✅          | ✅    | ✅                   | ✅            | ✅         |
| Right Sizing                                                 | ✅      | ✅          | ❌    | ❌                   | ❌            | ❌          |
| Chargeback by Allocation                                     | ✅      | ✅          | ✅    | ❌                   | ❌            | ❌          |
| Chargeback by Usage                                          | ✅      | ✅          | ❌    | ❌                   | ❌            | ❌          |
| Automation Work Flows                                        | ✅      | ✅          | ✅    | ❌                   | ❌            | ❌          |
| Tag Mapping from Provider                                    | ❌      | ❌          | ❌    | ❌                   | ❌            | ❌          |
| Tag Mapping to Provider                                      | ❌      | ❌          | ❌    | ❌                   | ❌            | ❌          |
| VM Compliance Enforcement                                    | ✅      | ✅          | ✅    | ❌                   | ❌            | ❌          |
| VM Policy Enforcement                                        | ✅      | ✅          | ✅    | ❌                   | ❌            | ❌          |
| Alerts - Real Time                                           | ✅      | ❌          | ❌    | ❌                   | ❌            | ❌          |
| Alerts - VM Value Changed                                    | ✅      | ✅          | ❌    | ❌                   | ❌            | ❌          |
| Alerts - VM Reconfigured                                     | ✅      | ✅          | ❌    | ❌                   | ❌            | ❌          |
| Integrate with Service Catalogs                              | ✅      | ✅          | ✅    | ❌                   | ❌            | ❌          |

| Operations                                                   | vSphere | oVirt / RHV | SCVMM | OpenStack undercloud    | IBM Power HMC | KubeVirt |
| ------------------------------------------------------------ | ------- | ----------- | ----- | ----------------------- | --------------| -------- |
| VM Remote Console Access (see section below)                 | ✅      | ✅          | ✅    | ❌                      | ❌            | ✅         |
| VM Power Operations                                          | ✅      | ✅          | ✅    | ❌                      | ✅            | ✅         |
| VM Provisioning                                              |         |             |       |                         |               |
|   - using PXE                                                | ✅      | ✅          | ❌    | ❌                      | ❌            | ❌          |
|   - using ISO                                                | ❌      | ✅          | ❌    | ❌                      | ❌            | ❌          |
|   - from Template to VM                                      | ✅      | ✅          | ✅    | ❌                      | ✅            | ✅         |
|   - from VM to Template                                      | ✅      | ✅          | ❌    | ❌                      | ✅            | ❌          |
|   - Clone from VM to VM                                      | ✅      | ❌          | ❌    | ❌                      | ❌            | ❌          |
|   - Sysprep Windows Templates                                | ✅      | ✅          | ❌    | ❌                      | ❌            | ❌          |
|   - Cloud-init                                               | ❌      | ✅          | ❌    | ❌                      | ❌            | ❌          |
| VM Retirement                                                | ✅      | ✅          | ✅    | ❌                      | ✅            | ✅         |
| VM Reconfiguration                                           | ✅      | ✅          | ❌    | ❌                      | ❌            | ❌          |
|   - Disk Addition                                            | ✅      | ✅          | ❌    | ❌                      | ❌            | ❌          |
|   - Network Interface Add/Remove                             | ✅      | ✅          | ❌    | ❌                      | ❌            | ❌          |
| VM Snapshot Creation and Removal                             | ✅      | ✅          | ❌    | ❌                      | ❌            | ❌          |
| Host Power Operations                                        | ✅      | ❌          | ❌    | ✅                      | ✅            | ❌          |
| Node Operations                                              |         |             |       |                         |               | ❌          |
|   - Add/Remove Node                                          | ❌      | ❌          | ❌    | ✅                      | ❌            | ❌          |
|   - Scale Down Node                                          | ❌      | ❌          | ❌    | ✅ (Compute nodes only) | ❌            | ❌          |
|   - Scale Up Nodes                                           | ❌      | ❌          | ❌    | ✅ (Compute nodes only) | ❌            | ❌          |
|   - Nodes Policy Enforcement                                 | ❌      | ❌          | ❌    | ✅                      | ❌            | ❌          |
|   - Nodes Evacuate                                           | ❌      | ❌          | ❌    | ✅                      | ❌            | ❌          |

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
