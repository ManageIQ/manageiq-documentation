### Infrastructure Providers

 The following tables outline the capabilities of {{ site.data.product.title_short }} that are known to work for various virtual infrastructure providers.

| Discovery                                                    | VMware vSphere | Red Hat Virtualization (RHV) | Microsoft System Center Virtual Machine Manager (SCVMM) | OpenStack Platform (OSP) Director |
| ------------------------------------------------------------ | -------------- | ---------------------------- | ------------------------------------------------------- | --------------------------------- |
| Compute Inventory                                            | ✅             | ✅                           | ✅                                                      | ✅ (Nodes and Services)           |
| Network Inventory                                            | ✅             | ✅ (OVN)                     | ❌                                                      | ❌                                |
| Storage Inventory                                            | ✅             | ❌                           | ❌                                                      | ❌                                |
| Events                                                       | ✅             | ✅                           | ✅                                                      | ✅                                |
| Metrics                                                      | ✅             | ✅                           | ✅                                                      | ✅                                |
| Forensic Analysis (SmartState)                               | ✅             | ✅                           | ❌                                                      | ✅ (Nodes)                        |

| General Features                                             | VMware vSphere | Red Hat Virtualization (RHV) | Microsoft System Center Virtual Machine Manager (SCVMM) | OpenStack Platform (OSP) Director |
| ------------------------------------------------------------ | -------------- | ---------------------------- | ------------------------------------------------------- | --------------------------------- |
| Discovery - Provider                                         | ✅             | ✅                           | ✅                                                      | ❌                                |
| Relationship Discovery                                       | ✅             | ✅                           | ✅                                                      | ✅                                |
| Drift Comparison                                             | ✅             | ✅                           | ✅                                                      | ✅ (Nodes)                        |
| VM Genealogy                                                 | ✅             | ✅                           | ✅                                                      | ✅                                |
| Capacity & Utilization                                       | ✅             | ✅                           | ❌                                                      | ✅                                |
| VM Event Timelines                                           | ✅             | ✅                           | ✅                                                      | ❌                                |
| Infrastructure Event Timelines                               | ❌             | ❌                           | ❌                                                      | ✅                                |
| Reporting                                                    | ✅             | ✅                           | ✅                                                      | ✅                                |
| Right Sizing                                                 | ✅             | ✅                           | ❌                                                      | ❌                                |
| Chargeback                                                   | ✅             | ✅                           | ✅ (Allocation only)                                    | ❌                                |
| Automation Work Flows                                        | ✅             | ✅                           | ✅                                                      | ❌                                |
| Tag Mapping from Provider                                    | ❌             | ❌                           | ❌                                                      | ❌                                |
| Tag Mapping to Provider                                      | ❌             | ❌                           | ❌                                                      | ❌                                |
| VM Compliance Enforcement                                    | ✅             | ✅                           | ✅                                                      | ❌                                |
| VM Policy Enforcement                                        | ✅             | ✅                           | ✅                                                      | ❌                                |
| Alerts - Real Time                                           | ✅             | ❌                           | ❌                                                      | ❌                                |
| Alerts - VM Value Changed                                    | ✅             | ✅                           | ❌                                                      | ❌                                |
| Alerts - VM Reconfigured                                     | ✅             | ✅                           | ❌                                                      | ❌                                |
| Integrate with Service Catalogs                              | ✅             | ✅                           | ✅                                                      | ❌                                |

| Operations                                                   | VMware vSphere | Red Hat Virtualization (RHV) | Microsoft System Center Virtual Machine Manager (SCVMM) | OpenStack Platform (OSP) Director |
| ------------------------------------------------------------ | -------------- | ---------------------------- | ------------------------------------------------------- | --------------------------------- |
| VM Remote Console Access (see section below)                 | ✅             | ✅                           | ✅                                                      | ❌                                |
| VM Power Operations                                          | ✅             | ✅                           | ✅                                                      | ❌                                |
| VM Provisioning                                              |                |                              |                                                         |                                 |
|   - using PXE                                                | ✅             | ✅                           | ❌                                                      | ❌                                |
|   - using ISO                                                | ❌             | ✅                           | ❌                                                      | ❌                                |
|   - from Template to VM                                      | ✅             | ✅                           | ✅                                                      | ❌                                |
|   - from VM to Template                                      | ✅             | ✅                           | ❌                                                      | ❌                                |
|   - Clone from VM to VM                                      | ✅             | ❌                           | ❌                                                      | ❌                                |
|   - Customize Windows Templates with Sysprep                 | ✅             | ✅                           | ❌                                                      | ❌                                |
|   - Cloud-init                                               | ❌             | ✅                           | ❌                                                      | ❌                                |
| VM Retirement                                                | ✅             | ✅                           | ✅                                                      | ❌                                |
| VM Reconfiguration                                           | ✅             | ✅                           | ❌                                                      | ❌                                |
|   - Disk Addition                                            | ✅             | ✅                           | ❌                                                      | ❌                                |
|   - Network Interface Add/Remove                             | ✅             | ✅                           | ❌                                                      | ❌                                |
| VM Snapshot Creation and Removal                             | ✅             | ✅                           | ❌                                                      | ❌                                |
| Host Power Operations                                        | ✅             | ❌                           | ❌                                                      | ✅                                |
| Node Operations                                              |                |                              |                                                         |                                 |
|   - Add/Remove Node                                          | ❌             | ❌                           | ❌                                                      | ✅                                |
|   - Scale Down Node                                          | ❌             | ❌                           | ❌                                                      | ✅ (Compute nodes only)           |
|   - Scale Up Nodes                                           | ❌             | ❌                           | ❌                                                      | ✅ (Compute nodes only)           |
|   - Nodes Policy Enforcement                                 | ❌             | ❌                           | ❌                                                      | ✅                                |
|   - Nodes Evacuate                                           | ❌             | ❌                           | ❌                                                      | ✅                                |


#### Remote Consoles

| Provider                         | Connection Type |
| -------------------------------- | --------------- |
| VMware vSphere 6.0               | VNC             |
|                                  | VMRC            |
|                                  | WebMKS          |
| VMware vSphere 6.5 and higher    | VMRC            |
|                                  | WebMKS          |
| Red Hat Virtualization (RHV)     | SPICE           |
| Microsoft SCVMM                  | N/A             |
