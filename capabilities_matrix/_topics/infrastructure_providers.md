### Infrastructure Providers

 The following table outlines the capabilities of {{ site.data.product.title_short }} that are known to work for various virtual infrastructure providers.

| Feature                                                      | VMware vSphere | Red Hat Virtualization (RHV) | Microsoft System Center Virtual Machine Manager (SCVMM) | OpenStack Platform (OSP) Director |
| ------------------------------------------------------------ | -------------- | ---------------------------- | ------------------------------------------------------- | --------------------------------- |
| Relationship Discovery                                       | ✅             | ✅                           | ✅                                                      | ✅                                |
| VM Drift Comparison                                          | ✅             | ✅                           | ✅                                                      | ❌                                |
| Track VM Genealogy                                           | ✅             | ✅                           | ✅                                                      | ✅                                |
| Capacity & Utilization                                       | ✅             | ✅                           | ❌                                                      | ❌                                |
| Capture VM/Instance Event Timelines                          | ✅             | ✅                           | ✅                                                      | ❌                                |
| Discovery - Provider                                         | ✅             | ✅                           | ✅                                                      | ❌                                |
| Reporting                                                    | ✅             | ✅                           | ✅                                                      | ✅                                |
| Right Sizing                                                 | ✅             | ✅                           | ❌                                                      | ❌                                |
| Chargeback                                                   | ✅             | ✅                           | ✅ (Allocation only)                                    | ❌                                |
| Remote Console VM Access (see section below)                 | ✅             | ✅                           | ✅                                                      | ❌                                |
| Snapshot Creation and Removal                                | ✅             | ✅                           | ❌                                                      | ❌                                |
| VM Compliance Enforcement                                    | ✅             | ✅                           | ✅                                                      | ❌                                |
| VM Policy Enforcement                                        | ✅             | ✅                           | ✅                                                      | ❌                                |
| VM Power Operations                                          | ✅             | ✅                           | ✅                                                      | ❌                                |
| VM Retirement                                                | ✅             | ✅                           | ✅                                                      | ❌                                |
| Alerts - Real Time                                           | ✅             | ❌                           | ❌                                                      | ❌                                |
| Alerts - VM Value Changed                                    | ✅             | ✅                           | ❌                                                      | ❌                                |
| Alerts - VM Reconfigured                                     | ✅             | ✅                           | ❌                                                      | ❌                                |
| Integrate with Service Catalogs                              | ✅             | ✅                           | ✅                                                      | ❌                                |
| VM Reconfiguration                                           | ✅             | ✅                           | ❌                                                      | ❌                                |
| Automation Work Flows                                        | ✅             | ✅                           | ✅                                                      | ❌                                |
| Provision VM using PXE                                       | ✅             | ✅                           | ❌                                                      | ❌                                |
| Provision VM using ISO                                       | ❌             | ✅                           | ❌                                                      | ❌                                |
| Provision from Template to VM                                | ✅             | ✅                           | ✅                                                      | ❌                                |
| Provision from VM to Template                                | ✅             | ✅                           | ❌                                                      | ❌                                |
| Clone from VM to VM                                          | ✅             | ❌                           | ❌                                                      | ❌                                |
| Disk Addition to VM                                          | ✅             | ✅                           | ❌                                                      | ❌                                |
| Network Interface Add/Remove to VM                           | ✅             | ✅                           | ❌                                                      | ❌                                |
| Host Power Operations                                        | ✅             | ❌                           | ❌                                                      | ❌                                |
| Provision Host                                               | ❌             | ❌                           | ❌                                                      | ❌                                |
| Cloud-Init                                                   | ❌             | ✅                           | ❌                                                      | ❌                                |
| Customize Windows Templates with Sysprep during Provisioning | ✅             | ✅                           | ❌                                                      | ❌                                |
| OVN Provider                                                 | ❌             | ✅                           | ❌                                                      | ❌                                |
| Nodes Inventory                                              | ❌             | ❌                           | ❌                                                      | ✅                                |
| OpenStack Services Inventory                                 | ❌             | ❌                           | ❌                                                      | ✅                                |
| Nodes Drift Comparison                                       | ❌             | ❌                           | ❌                                                      | ✅                                |
| Nodes Smart State                                            | ❌             | ❌                           | ❌                                                      | ✅                                |
| Capacity & Utilization                                       | ❌             | ❌                           | ❌                                                      | ✅                                |
| Capture Infrastructure Event Timelines                       | ❌             | ❌                           | ❌                                                      | ✅                                |
| Node Power Operation                                         | ❌             | ❌                           | ❌                                                      | ✅                                |
| Capacity Planning                                            | ❌             | ❌                           | ❌                                                      | ✅                                |
| Add/Remove Node                                              | ❌             | ❌                           | ❌                                                      | ✅                                |
| Scale Down Node                                              | ❌             | ❌                           | ❌                                                      | ✅ (Compute nodes only)           |
| Scale Up Nodes                                               | ❌             | ❌                           | ❌                                                      | ✅ (Compute nodes only)           |
| Nodes Policy Enforcement                                     | ❌             | ❌                           | ❌                                                      | ✅                                |
| Nodes Evacuate                                               | ❌             | ❌                           | ❌                                                      | ✅                                |
| OpenStack Upgrade                                            | ❌             | ❌                           | ❌                                                      | ❌                                |
| Tag Mapping from Provider                                    | ❌             | ❌                           | ❌                                                      | ❌                                |
| Tag Mapping to Provider                                      | ❌             | ❌                           | ❌                                                      | ❌                                |


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
