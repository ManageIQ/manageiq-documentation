### Infrastructure Providers Features Support

 The following tables outline the status of support for {{ site.data.product.title_short }} features on infrastructure providers.

### Red Hat Virtualization

The following table outlines the status of support for {{ site.data.product.title_short }} features on Red Hat Virtualization (RHV) infrastructure providers.

#### Red Hat Virtualization Provider Feature Support

| Feature                                                      | RHV 4.2 | RHV 4.3 |
| ------------------------------------------------------------ | ------- | ------- |
| Relationship Discovery                                       | Yes     | Yes     |
| VM Drift Comparison                                          | Yes     | Yes     |
| Track VM Genealogy                                           | Yes     | Yes     |
| Capacity & Utilization                                       | Yes     | Yes     |
| Capture VM/Instance Event Timelines                          | Yes     | Yes     |
| Discovery - Provider                                         | Yes     | Yes     |
| Reporting                                                    | Yes     | Yes     |
| Right Sizing                                                 | Yes     | Yes     |
| Chargeback                                                   | Yes     | Yes     |
| Remote Console VM Access                                     | Yes [a] | Yes [a] |
| Snapshot Creation and Removal                                | Yes     | Yes     |
| VM / Instance Compliance Enforcement                         | Yes     | Yes     |
| VM / Instance Policy Enforcement                             | Yes     | Yes     |
| VM / Instance Power Operations                               | Yes     | Yes     |
| VM / Instance Retirement                                     | Yes     | Yes     |
| Alerts - VM Value Changed                                    | Yes     | Yes     |
| Alerts - VM Reconfigured                                     | Yes     | Yes     |
| Integrate with Service Catalogs                              | Yes     | Yes     |
| Virtual Machine Reconfiguration                              | Yes     | Yes     |
| Automation Work Flows                                        | Yes     | Yes     |
| Provision VM/Instance using PXE                              | Yes     | Yes     |
| Provision VM/Instance using ISO                              | Yes     | Yes     |
| Provision from Template/Image to VM/Instance                 | Yes     | Yes     |
| Provision from VM/Instance to Template/Image                 | Yes     | Yes     |
| Host Power Operations                                        | No      | No      |
| Provision Host                                               | No      | No      |
| Clone from VM/Instance to VM/Instance                        | No      | No      |
| Cloud-Init                                                   | Yes     | Yes     |
| Customize Windows Templates with Sysprep during Provisioning | Yes     | Yes     |
| OVN Provider                                                 | Yes     | Yes     |

[a] On some operating system and browser combinations.

### VMware vSphere

The following table outlines the status of support for {{ site.data.product.title_short }} features on VMware vSphere infrastructure providers.

### VMware vSphere Provider Feature Support

| Feature                                                      | vSphere 6.0  | vSphere 6.5 | vSphere 6.7 |
| ------------------------------------------------------------ | ------------ | ----------- | ----------- |
| Relationship Discovery                                       | Yes          | Yes         | Yes         |
| VM Drift Comparison                                          | Yes          | Yes         | Yes         |
| Track VM Genealogy                                           | Yes          | Yes         | Yes         |
| Capacity & Utilization                                       | Yes          | Yes         | Yes         |
| Capture VM/Instance Event Timelines                          | Yes          | Yes         | Yes         |
| Discovery - Provider                                         | Yes          | Yes         | Yes         |
| Disk Addition to VM/Instance                                 | Yes          | Yes         | Yes         |
| Reporting                                                    | Yes          | Yes         | Yes         |
| Right Sizing                                                 | Yes          | Yes         | Yes         |
| Chargeback                                                   | Yes          | Yes         | Yes         |
| Remote Console VM Access                                     | Yes [a]      | Yes [a]     | Yes [a]     |
| Snapshot Creation and Removal                                | Yes          | Yes         | Yes         |
| VM / Instance Compliance Enforcement                         | Yes          | Yes         | Yes         |
| VM / Instance Policy Enforcement                             | Yes          | Yes         | Yes         |
| VM / Instance Power Operations                               | Yes          | Yes         | Yes         |
| VM / Instance Retirement                                     | Yes          | Yes         | Yes         |
| Alerts - Real Time                                           | Yes          | Yes         | Yes         |
| Alerts - VM Value Changed                                    | Yes          | Yes         | Yes         |
| Alerts - VM Reconfigured                                     | Yes          | Yes         | Yes         |
| Integrate with Service Catalogs                              | Yes          | Yes         | Yes         |
| Virtual Machine Reconfiguration                              | Yes          | Yes         | Yes         |
| Automation Work Flows                                        | Yes          | Yes         | Yes         |
| Provision VM/Instance using PXE                              | Yes          | Yes         | Yes         |
| Provision VM/Instance using ISO                              | No           | No          | No          |
| Provision from Template/Image to VM/Instance                 | Yes          | Yes         | Yes         |
| Provision from VM/Instance to Template/Image                 | Yes          | Yes         | Yes         |
| Host Power Operations                                        | Yes          | Yes         | Yes         |
| Customize Windows Templates with Sysprep during Provisioning | Yes          | Yes         | Yes         |
| Clone from VM/Instance to VM/Instance                        | Yes          | Yes         | Yes         |

[a] On some operating system and browser combinations

### Microsoft System Center Virtual Machine Management (SCVMM)

The following table outlines the status of support for Microsoft SCVMM infrastructure providers.

### Microsoft SCVMM Provider Feature Support

| Feature                                      | SCVMM 2016 R2  | SCVMM 2019 |
| -------------------------------------------- | -------------- | ---------- |
| Relationship Discovery                       | Yes            | Yes        |
| VM Drift Comparison                          | Yes            | Yes        |
| Track VM Genealogy                           | Yes            | Yes        |
| Capacity & Utilization                       | No             | No         |
| Capture VM/Instance Event Timelines          | Yes            | Yes        |
| Discovery - Provider                         | Yes            | Yes        |
| Reporting                                    | Yes            | Yes        |
| Right Sizing                                 | No             | No         |
| Chargeback                                   | Yes [a]        | Yes [a]    |
| Remote Console VM Access                     | Yes [b]        | Yes [b]    |
| Snapshot Creation and Removal                | No             | No         |
| VM / Instance Compliance Enforcement         | Yes            | Yes        |
| VM / Instance Policy Enforcement             | Yes            | Yes        |
| VM / Instance Power Operations               | Yes            | Yes        |
| VM / Instance Retirement                     | Yes            | Yes        |
| Alerts - Real Time                           | No             | No         |
| Alerts - VM Value Changed                    | No             | No         |
| Alerts - VM Reconfigured                     | No             | No         |
| Integrate with Service Catalogs              | Yes            | Yes        |
| Virtual Machine Reconfiguration              | No             | No         |
| Automation Work Flows                        | Yes            | Yes        |
| Provision VM/Instance using PXE              | No             | No         |
| Provision VM/Instance using ISO              | No             | No         |
| Provision from Template/Image to VM/Instance | Yes            | Yes        |
| Provision from VM/Instance to Template/Image | No             | No         |
| Host Power Operations                        | No             | No         |
| Provision Host                               | No             | No         |
| Clone from VM/Instance to VM/Instance        | No             | No         |

[a] Limited to inventory allocation.
[b] On some operating system and browser combinations.

## OpenStack Platform Director Infrastructure Providers

The following table outlines the status of support for {{ site.data.product.title_short }} features on OpenStack Platform (OSP) director infrastructure providers.

### OpenStack Platform Director Infrastructure Provider Feature Support
| Feature                                | OpenStack Platform (OSP) Director |
| -------------------------------------- | --------------------------------- |
| Relationship Discovery                 | Yes                               |
| Nodes Inventory                        | Yes                               |
| OpenStack Services Inventory           | Yes                               |
| Nodes Drift Comparison                 | Yes                               |
| Nodes Smart State                      | Yes                               |
| Capacity & Utilization                 | Yes                               |
| Capture Infrastructure Event Timelines | Yes                               |
| Node Power Operation                   | Yes                               |
| Capacity Planning                      | Yes                               |
| Reporting                              | Yes                               |
| Add/Remove Node                        | Yes                               |
| Scale Down Node                        | Yes (Compute nodes only)          |
| Scale Up Nodes                         | Yes (Compute nodes only)          |
| Nodes Policy Enforcement               | Yes                               |
| Nodes Evacuate                         | Yes                               |
| OpenStack Upgrade                      | No                                |

The following table outlines the status of support for provisioning on infrastructure providers.

### Infrastructure Provider Provisioning Support

| Feature                                      | Microsoft System Center VMM (SCVMM)  | Red Hat Virtualization (RHV) Manager | VMware vSphere |
| -------------------------------------------- | ------------------------------------ | ------------------------------------ | -------------- |
| Provision VM/Instance using PXE              | No                                   | Yes                                  | No             |
| Provision VM/Instance using ISO              | No                                   | Yes                                  | No             |
| Clone from VM/Instance to VM/Instance        | No                                   | No                                   | Yes            |
| Provision from Template/Image to VM/Instance | Yes                                  | Yes                                  | Yes            |
| Provision from VM/Instance to Template/Image | No                                   | No                                   | Yes            |
