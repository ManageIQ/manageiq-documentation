### Infrastructure Providers

 The following table outlines the capabilities of {{ site.data.product.title_short }} that are known to work for various virtual infrastructure providers.

| Feature                                                      | VMware vSphere | Red Hat Virtualization (RHV) | Microsoft System Center Virtual Machine Manager (SCVMM) | OpenStack Platform (OSP) Director |
| ------------------------------------------------------------ | -------------- | ---------------------------- | ------------------------------------------------------- | --------------------------------- |
| Relationship Discovery                                       | Yes            | Yes                          | Yes                                                     | Yes                               |
| VM Drift Comparison                                          | Yes            | Yes                          | Yes                                                     | No                                |
| Track VM Genealogy                                           | Yes            | Yes                          | Yes                                                     | Yes                               |
| Capacity & Utilization                                       | Yes            | Yes                          | No                                                      | No                                |
| Capture VM/Instance Event Timelines                          | Yes            | Yes                          | Yes                                                     | No                                |
| Discovery - Provider                                         | Yes            | Yes                          | Yes                                                     | No                                |
| Reporting                                                    | Yes            | Yes                          | Yes                                                     | Yes                               |
| Right Sizing                                                 | Yes            | Yes                          | No                                                      | No                                |
| Chargeback                                                   | Yes            | Yes                          | Yes (but limited to inventory allocation)               | No                                |
| Remote Console VM Access (see section below)                 | Yes            | Yes                          | Yes                                                     | No                                |
| Snapshot Creation and Removal                                | Yes            | Yes                          | No                                                      | No                                |
| VM Compliance Enforcement                                    | Yes            | Yes                          | Yes                                                     | No                                |
| VM Policy Enforcement                                        | Yes            | Yes                          | Yes                                                     | No                                |
| VM Power Operations                                          | Yes            | Yes                          | Yes                                                     | No                                |
| VM Retirement                                                | Yes            | Yes                          | Yes                                                     | No                                |
| Alerts - Real Time                                           | Yes            | No                           | No                                                      | No                                |
| Alerts - VM Value Changed                                    | Yes            | Yes                          | No                                                      | No                                |
| Alerts - VM Reconfigured                                     | Yes            | Yes                          | No                                                      | No                                |
| Integrate with Service Catalogs                              | Yes            | Yes                          | Yes                                                     | No                                |
| VM Reconfiguration                                           | Yes            | Yes                          | No                                                      | No                                |
| Automation Work Flows                                        | Yes            | Yes                          | Yes                                                     | No                                |
| Provision VM using PXE                                       | Yes            | Yes                          | No                                                      | No                                |
| Provision VM using ISO                                       | No             | Yes                          | No                                                      | No                                |
| Provision from Template to VM                                | Yes            | Yes                          | Yes                                                     | No                                |
| Provision from VM to Template                                | Yes            | Yes                          | No                                                      | No                                |
| Clone from VM to VM                                          | Yes            | No                           | No                                                      | No                                |
| Disk Addition to VM                                          | Yes            | Yes                          | No                                                      | No                                |
| Network Interface Add/Remove to VM                           | Yes            | Yes                          | No                                                      | No                                |
| Host Power Operations                                        | Yes            | No                           | No                                                      | No                                |
| Provision Host                                               | No             | No                           | No                                                      | No                                |
| Cloud-Init                                                   | No             | Yes                          | No                                                      | No                                |
| Customize Windows Templates with Sysprep during Provisioning | Yes            | Yes                          | No                                                      | No                                |
| OVN Provider                                                 | No             | Yes                          | No                                                      | No                                |
| Nodes Inventory                                              | No             | No                           | No                                                      | Yes                               |
| OpenStack Services Inventory                                 | No             | No                           | No                                                      | Yes                               |
| Nodes Drift Comparison                                       | No             | No                           | No                                                      | Yes                               |
| Nodes Smart State                                            | No             | No                           | No                                                      | Yes                               |
| Capacity & Utilization                                       | No             | No                           | No                                                      | Yes                               |
| Capture Infrastructure Event Timelines                       | No             | No                           | No                                                      | Yes                               |
| Node Power Operation                                         | No             | No                           | No                                                      | Yes                               |
| Capacity Planning                                            | No             | No                           | No                                                      | Yes                               |
| Add/Remove Node                                              | No             | No                           | No                                                      | Yes                               |
| Scale Down Node                                              | No             | No                           | No                                                      | Yes (Compute nodes only)          |
| Scale Up Nodes                                               | No             | No                           | No                                                      | Yes (Compute nodes only)          |
| Nodes Policy Enforcement                                     | No             | No                           | No                                                      | Yes                               |
| Nodes Evacuate                                               | No             | No                           | No                                                      | Yes                               |
| OpenStack Upgrade                                            | No             | No                           | No                                                      | No                                |
| Tag Mapping from Provider                                    | No             | No                           | No                                                      | No                                |
| Tag Mapping to Provider                                      | No             | No                           | No                                                      | No                                |


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
