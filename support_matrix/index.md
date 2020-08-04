# Support Matrix

## Supported platforms and features in {{ site.data.product.title_short }}

A summary of the supported platforms and features in {{ site.data.product.title_short }}.
{:shortdesc}

- [Build](#build)
- [Supported Browsers](#supported-browsers)
- [Supported Platforms](#supported-platforms)
- [Provisioning Support on Infrastructure Providers](#prov-infrastructure-providers)
- [Provisioning Support on Cloud Providers](#prov-cloud-providers)
- [Feature Support on Infrastructure Providers](#feature-infrastructure-providers)
- [Feature Support on Cloud Providers](#feature-cloud-providers)
- [Feature Support on Container Providers](#feature-container-providers)
- [Feature Support on Network Providers](#feature-network-providers)
- [Feature Support on Automation Management Providers](#feature-automation-management-providers)
- [Remote Console Support](#remote-console-support)
- [Operating System Support](#operating-system-support)
- [Smart State Analysis Support](#smart-state-analysis-support)
- [Supported Guest Operating Systems](#supported-guest-operating-systems)

## Chapter 1. Build
{: #build}
This release of {{ site.data.product.title_short }} is available in 2 formats: virtual appliance and podified that includes the following key components:

- CentOS Linux release 8.2.2004 (Core)
- Rails 5.2.4.3
- Ruby 2.6.3p62
- PostgreSQL 10.6
- Apache 2.4.37

## Chapter 2. Supported Browsers
{: #supported-browsers}
The following table lists the browsers that work with {{ site.data.product.title_short }}.

#### Table 2.1. Supported Browsers

| Browser         |
| --------------- |
| Google Chrome   |
| Mozilla Firefox |
| Safari          |
| Microsoft Edge  |

## Chapter 3. Supported Runtime Platforms for {{site.data.keyword.inf_man}}
{: #supported-platforms}

 The following table lists platforms on which {{site.data.keyword.inf_man}} can be installed and run from.

#### Table 3.1. Supported Platforms
| Platform                                                     | Appliance or Podfied |
| ------------------------------------------------------------ | -------------------- |
| Amazon Web Services (AWS)                                    | Appliance            |
| Microsoft Azure                                              | Appliance            |
| Google Cloud Platform (GCP)                                  | Appliance            |
| Microsoft System Center Virtual Machine Manager (SCVMM)      | Appliance            |
| Kubernetes                                                   | Podified             |
| OpenShift Container Platform (OCP)                           | Podified             |
| Red Hat OpenStack Platform (OSP)                             | Appliance            |
| Red Hat Virtualization (RHV)                                 | Appliance            |
| VMware vSphere                                               | Appliance            |


## Chapter 4. Provisioning Support

### 4.1. Infrastructure Providers
{: #prov-infrastructure-providers}

The following table outlines the status of support for provisioning on infrastructure providers.

#### Table 4.1. Infrastructure Provider Provisioning Support

| Feature                                      | Microsoft System Center VMM (SCVMM)  | Red Hat Virtualization (RHV) Manager | VMware vSphere |
| -------------------------------------------- | ------------------------------------ | ------------------------------------ | -------------- |
| Provision VM/Instance using PXE              | No                                   | Yes                                  | No             |
| Provision VM/Instance using ISO              | No                                   | Yes                                  | No             |
| Clone from VM/Instance to VM/Instance        | No                                   | No                                   | Yes            |
| Provision from Template/Image to VM/Instance | Yes                                  | Yes                                  | Yes            |
| Provision from VM/Instance to Template/Image | No                                   | No                                   | Yes            |

### 4.2. Cloud Providers
{: #prov-cloud-providers}

The following table outlines the status of support for provisioning on cloud providers.

#### Table 4.2. Cloud Provider Provisioning Support

| Feature                                      | Red Hat OpenStack Platform (OSP) | Amazon Web Services (AWS) | Microsoft Azure | Google Cloud Platform (GCP) |
| -------------------------------------------- | -------------------------------- | ------------------------- | --------------- | --------------------------- |
| Provision VM/Instance using PXE              | No                               | No                        | No              | No                          |
| Provision VM/Instance using ISO              | No                               | No                        | No              | No                          |
| Clone from VM/Instance to VM/Instance        | No                               | No                        | No              | No                          |
| Provision from Template/Image to VM/Instance | Yes                              | Yes                       | Yes             | Yes                         |
| Provision from VM/Instance to Template/Image | No                               | No                        | No              | No                          |
| Orchestration Template Provisioning          | Yes                              | Yes                       | Yes             | No                          |


## Chapter 5. Feature Support
{: #feature-support}

{{ site.data.product.title_short }} allows you to perform actions on the providers that it manages, and provides features for interacting with and providing information about those providers. This section outlines the status of support for actions that you can perform on providers, and the {{ site.data.product.title_short }} features that allow you to interact with those providers.

**Note:** You can run a rake command to retrieve a list of provider features supported across all platforms. Run the following command in your {{ site.data.product.title_short }} appliance to retrieve the supported features in a comma-separated values (.csv) file format. The comma-separated values are displayed on the command-line interface (CLI) by default. You can use a pipe to redirect the output to a file.

```
ruby /var/www/miq/vmdb/tools/feature_support_matrix.rb
```

### 5.1. Infrastructure Providers
{: #feature-infrastructure-providers}

 The following tables outline the status of support for {{ site.data.product.title_short }} features on infrastructure providers.

### 5.1.1. Red Hat Virtualization

The following table outlines the status of support for {{ site.data.product.title_short }} features on Red Hat Virtualization (RHV) infrastructure providers.

#### Table 5.1. Red Hat Virtualization Provider Feature Support

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

### 5.1.2. VMware vSphere

The following table outlines the status of support for {{ site.data.product.title_short }} features on VMware vSphere infrastructure providers.

#### Table 5.2. VMware vSphere Provider Feature Support

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

### 5.1.3. Microsoft SCVMM

The following table outlines the status of support for Microsoft SCVMM infrastructure providers.

#### Table 5.3. Microsoft SCVMM Provider Feature Support

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

## 5.2. OpenStack Platform Director Infrastructure Providers

The following table outlines the status of support for {{ site.data.product.title_short }} features on OpenStack Platform (OSP) director infrastructure providers.

#### Table 5.4. OpenStack Platform Director Infrastructure Provider Feature Support
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

## 5.3. Cloud Providers
{: #feature-cloud-providers}

The following section outlines the status of support for {{ site.data.product.title_short }} features on cloud providers.

### 5.3.1. Red Hat OpenStack Platform

The following table outlines the status of support for {{ site.data.product.title_short }} features on Red Hat OpenStack Platform (RHOSP) cloud providers.

#### Table 5.5. Red Hat OpenStack Platform Feature Support
| Feature                                    | OSP 10 | OSP 13 |
| ------------------------------------------ | ------ | ------ |
| Relationship Discovery                     | Yes    | Yes    |
| Instance Drift Comparison                  | Yes    | Yes    |
| Track Instance Genealogy                   | Yes    | Yes    |
| Capacity & Utilization                     | Yes    | Yes    |
| Capture Cloud Layer Timelines              | Yes    | Yes    |
| Capture Instance Event Timelines           | Yes    | Yes    |
| Discovery - Provider                       | No     | No     |
| Disk Addition to Instance                  | Yes    | Yes    |
| Key Pairs Inventory                        | Yes    | Yes    |
| Key Pairs Management                       | Yes    | Yes    |
| Reporting                                  | Yes    | Yes    |
| Right Sizing                               | Yes    | Yes    |
| Chargeback                                 | Yes    | Yes    |
| Remote Console Instance Access             | Yes    | Yes    |
| Snapshot Creation and Removal              | Yes    | Yes    |
| Instance Compliance Enforcement            | Yes    | Yes    |
| Instance Policy Enforcement                | Yes    | Yes    |
| Instance Power Operations                  | Yes    | Yes    |
| Instance Retirement                        | Yes    | Yes    |
| Alerts - Real Time                         | Yes    | Yes    |
| Alerts - Instance Value Changed            | No     | No     |
| Alerts - Reconfigured                      | No     | No     |
| Integrate with Service Catalogs            | Yes    | Yes    |
| Virtual Machine Reconfiguration            | Yes    | Yes    |
| Volume Inventory                           | Yes    | Yes    |
| Volume Creation/Deletion                   | Yes    | Yes    |
| Instance Migration                         | Yes    | Yes    |
| Automation Work Flows                      | Yes    | Yes    |
| Storage Manager                            | Yes    | Yes    |
| Provision Instance using PXE               | No     | No     |
| Provision Instance using ISO               | No     | No     |
| Provision from Template/Image to Instance  | Yes    | Yes    |
| Provision from Image Snapshot to Instance  | Yes    | Yes    |
| Provision from Volume to Instance          | Yes    | Yes    |
| Provision from Volume Snapshot to Instance | Yes    | Yes    |
| Clone from Instance to Instance            | No     | No     |
| Cloud-Init                                 | Yes    | Yes    |
| Sysprep Windows Templates                  | Yes    | Yes    |

### 5.3.2. Amazon Web Services (AWS)

 The following table outlines the status of support for {{ site.data.product.title_short }} features on Amazon Web Services (AWS) cloud providers.

#### Table 5.6. Amazon Web Services Feature Support

| Feature                                      | Amazon Web Services (AWS) |
| -------------------------------------------- | ------------------------- |
| Relationship Discovery                       | Yes                       |
| VM Drift Comparison                          | Yes                       |
| Track VM Genealogy                           | Yes                       |
| Capacity & Utilization                       | Yes                       |
| Capture VM/Instance Event Timelines          | Yes                       |
| Discovery - Provider                         | Yes                       |
| Disk Addition to VM/Instance                 | Yes                       |
| Key Pairs Inventory                          | Yes                       |
| Key Pairs Management                         | Yes                       |
| Reporting                                    | Yes                       |
| Right Sizing                                 | Yes                       |
| Chargeback                                   | Yes                       |
| Remote Console VM Access                     | No                        |
| Snapshot Creation and Removal                | No                        |
| VM / Instance Compliance Enforcement         | Yes                       |
| VM / Instance Policy Enforcement             | Yes                       |
| VM / Instance Power Operations               | Yes                       |
| VM / Instance Retirement                     | Yes                       |
| Alerts - Real Time                           | No                        |
| Alerts - VM Value Changed                    | No                        |
| Alerts - Reconfigured                        | No                        |
| Integrate with Service Catalogs              | Yes                       |
| Virtual Machine Reconfiguration              | No                        |
| Volume Inventory                             | No                        |
| Volume Creation/Deletion                     | No                        |
| VM Migration                                 | No                        |
| Automation Work Flows                        | Yes                       |
| Network Manager - Read Only                  | Yes                       |
| Network Manager - CRUD Actions Supported     | No                        |
| Storage Manager                              | Yes                       |
| Provision VM/Instance using PXE              | No                        |
| Provision VM/Instance using ISO              | No                        |
| Provision from Template/Image to VM/Instance | Yes                       |
| Clone from VM/Instance to VM/Instance        | No                        |

### 5.3.3. Microsoft Azure

 The following table outlines the status of support for {{ site.data.product.title_short }} features on Microsoft Azure cloud providers.

#### Table 5.7. Microsoft Azure Feature Support
| Feature                                      | Microsoft Azure |
| -------------------------------------------- | --------------- |
| Relationship Discovery                       | Yes             |
| VM Drift Comparison                          | Yes             |
| Track VM Genealogy                           | Yes             |
| Capacity & Utilization                       | Yes             |
| Capture Cloud Layer Timelines                | N/A             |
| Capture VM/Instance Event Timelines          | Yes             |
| Discovery - Provider                         | Yes             |
| Disk Addition to VM/Instance                 | Yes             |
| Key Pairs Inventory                          | No              |
| Key Pairs Management                         | Yes             |
| Optimization - Bottleneck Identification     | No              |
| Reporting                                    | Yes             |
| Right Sizing                                 | Yes             |
| Chargeback                                   | Yes             |
| Remote Console VM Access                     | No              |
| Snapshot Creation and Removal                | No              |
| VM / Instance Compliance Enforcement         | Yes             |
| VM / Instance Policy Enforcement             | Yes             |
| VM / Instance Power Operations               | Yes             |
| VM / Instance Retirement                     | Yes             |
| Alerts - Real Time                           | No              |
| Alerts - VM Value Changed                    | No              |
| Alerts - Reconfigured                        | No              |
| Integrate with Service Catalogs              | Yes             |
| Virtual Machine Reconfiguration              | No              |
| Volume Inventory                             | No              |
| Volume Creation/Deletion                     | No              |
| VM Migration                                 | No              |
| Automation Work Flows                        | No              |
| Network Manager - Read Only                  | Yes             |
| Network Manager - CRUD Actions Supported     | No              |
| Provision VM/Instance using PXE              | No              |
| Provision VM/Instance using ISO              | No              |
| Provision from Template/Image to VM/Instance | Yes             |
| Clone from VM/Instance to VM/Instance        | No              |

### 5.3.4. IBM PowerVC

The following table outlines the status of support for actions that you can perform on IBM® PowerVC™ via the OpenStack API, and the {{ site.data.product.title_short }} features that allow you to interact with cloud deployments that use IBM® PowerVC™ as a provider.

#### Table 5.8. IBM PowerVC Provider Feature Support

| Feature                                      | PowerVC |
| -------------------------------------------- | ------- |
| Relationship Discovery                       | Yes     |
| VM Drift Comparison                          | No      |
| Track VM Genealogy                           | Yes     |
| Capacity & Utilization                       | No      |
| Capture Cloud Layer Timelines                | Yes     |
| Capture VM/Instance Event Timelines          | Yes     |
| Key Pairs Inventory                          | Yes     |
| Key Pairs Management                         | Yes     |
| Reporting                                    | No      |
| Right Sizing                                 | Yes     |
| Chargeback                                   | No      |
| Remote Console VM Access                     | Yes (for NovaLink-managed hosts only) |
| Snapshot Creation and Removal                | Yes     |
| VM / Instance Compliance Enforcement         | No      |
| VM / Instance Policy Enforcement             | Yes     |
| VM / Instance Power Operations               | Yes     |
| VM / Instance Retirement                     | Yes     |
| Alerts - Real Time                           | No      |
| Alerts - VM Value Changed                    | No      |
| Alerts - Reconfigured                        | No      |
| Integrate with Service Catalogs              | Yes     |
| Virtual Machine Reconfiguration              | Yes     |
| Volume Inventory                             | Yes     |
| Volume Creation/Deletion                     | Yes     |
| VM Migration                                 | Yes     |
| Automation Work Flows                        | Yes     |
| Network Manager - Read Only                  | Yes     |
| Provision from Template/Image to VM/Instance | Yes     |
| Clone from VM/Instance to VM/Instance        | No      |

### 5.3.5. Google Cloud Platform (GCP)

The following table outlines the status of support for {{ site.data.product.title_short }} features on Google Compute Engine cloud providers.

#### Table 5.9. Google Compute Engine Feature Support

| Feature                                      | Google Cloud Platform (GCP) |
| -------------------------------------------- | --------------------------- |
| Relationship Discovery                       | Yes                         |
| VM Drift Comparison                          | No                          |
| Track VM Genealogy                           | Yes                         |
| Capacity & Utilization                       | Yes                         |
| Capture Cloud Layer Timelines                | No                          |
| Capture VM/Instance Event Timelines          | Yes                         |
| Discovery - Provider                         | No                          |
| Disk Addition to VM/Instance                 | No                          |
| Key Pairs Inventory                          | Yes                         |
| Key Pairs Management                         | No                          |
| Optimization - Bottleneck Identification     | No                          |
| Reporting                                    | Yes                         |
| Right Sizing                                 | Yes                         |
| Chargeback                                   | Yes                         |
| Remote Console VM Access                     | No                          |
| Snapshot Creation and Removal                | No                          |
| VM / Instance Compliance Enforcement         | Yes                         |
| VM / Instance Policy Enforcement             | Yes                         |
| VM / Instance Power Operations               | Yes                         |
| VM / Instance Retirement                     | Yes                         |
| Alerts - Real Time                           | No                          |
| Alerts - VM Value Changed                    | No                          |
| Alerts - Reconfigured                        | No                          |
| Integrate with Service Catalogs              | Yes                         |
| Virtual Machine Reconfiguration              | No                          |
| Volume Inventory                             | Yes                         |
| Volume Creation/Deletion                     | No                          |
| VM Migration                                 | No                          |
| Automation Work Flows                        | Yes                         |
| Network Manager - Read Only                  | Yes                         |
| Network Manager - CRUD Actions Supported     | No                          |
| Storage Manager                              | No                          |
| Provider TLS                                 | No                          |
| Provision VM/Instance using PXE              | No                          |
| Provision VM/Instance using ISO              | No                          |
| Provision from Template/Image to VM/Instance | Yes                         |
| Provision from VM/Instance to Template/Image | No                          |
| Host Power Operations                        | No                          |
| Provision Host                               | No                          |
| Clone from VM/Instance to VM/Instance        | No                          |

### 5.4. Container Providers
{: #feature-container-providers}

The following section outlines the status of support for {{ site.data.product.title_short }} features on OpenShift Container Platform container providers. 

#### Table 5.10. OpenShift Container Platform Provider Feature Support

| Feature                                 | OCP 3.11 | OCP 4.x |
| --------------------------------------- | -------- |-------- |
| Relationship Discovery                  | Yes      | Yes     |
| Track Container Image Relationship      | Yes      | Yes     |
| Capacity & Utilization                  | Yes      | Yes     |
| Capture Container Event Timelines       | Yes      | Yes     |
| Discovery - Provider                    | No       | No      |
| Reporting                               | Yes      | Yes     |
| Chargeback                              | Yes      | Yes     |
| Remote Cockpit Node Access              | Yes      | No      |
| Container Node Compliance Enforcement   | Yes      | Yes     |
| Container Node Policy Enforcement       | Yes      | Yes     |
| Replicator Compliance Enforcement       | Yes      | Yes     |
| Replicator Policy Enforcement           | Yes      | Yes     |
| Pod Compliance Enforcement              | Yes      | Yes     |
| Pod Policy Enforcement                  | Yes      | Yes     |
| Image Compliance Enforcement            | Yes      | Yes     |
| Image Policy Enforcement                | Yes      | Yes     |
| Template Provisioning                   | Yes      | No      |
| Smart State                             | Yes      | No      |
| OpenSCAP Execution and Report           | Yes      | No      |
| Cross Linking Underlying Infrastructure | Yes      | Yes     |

### 5.5. Network Providers
{: #feature-network-providers}

This section outlines the status of support for {{ site.data.product.title_short }} features on network providers.

#### Table 5.11. Network Provider Feature Support

| Feature                       | Red Hat OpenStack Platform (OSP) | Amazon Web Services (AWS) | Microsoft Azure | Google Cloud Platform (GCP) |
| ----------------------------- | -------------------------------- | ------------------------- | --------------- | --------------------------- |
| Network Manager Relationships | Yes                              | Yes                       | Yes             | Yes                         |
| Relationship Discovery        | Yes                              | Yes                       | Yes             | Yes                         |
| Cloud Network Inventory       | Yes                              | Yes                       | Yes             | Yes                         |
| Cloud Subnet Inventory        | Yes                              | Yes                       | Yes             | Yes                         |
| Network Router Inventory      | Yes                              | No                        | No              | Yes                         |
| Security Groups               | Yes                              | Yes                       | Yes             | Yes                         |
| Floating IP Addresses         | Yes                              | Yes                       | Yes             | Yes                         |
| Network Ports                 | Yes                              | Yes                       | Yes             | Yes                         |
| Load Balancer Inventory       | No                               | Yes                       | Yes             | Yes                         |
| Create/Update/Delete Network  | Yes                              | No                        | No              | No                          |
| Create/Update/Delete Subnet   | Yes                              | No                        | No              | No                          |
| Create/Update/Delete Routers  | Yes                              | No                        | No              | No                          |

### 5.6. Automation Management Providers
{: #feature-automation-management-providers}

The following table outlines the status of support for {{ site.data.product.title_short }} features on automation management providers.

#### Table 5.12. Automation Management Provider Feature Support
| Feature                        | Ansible Tower |
| ------------------------------ | ------------- |
| Groups Inventory               | Yes           |
| Configured Systems Inventory   | Yes           |
| Job Template Inventory         | Yes           |
| Integrate with Service Catalog | Yes           |
| Automate Workflows             | Yes           |

## Chapter 6. Remote Console Support
{: #remote-console-support}

{{ site.data.product.title_short }} allows you to access the console of virtual machines and instances on the providers it managers using HTML5-based VNC consoles. This section outlines the status of support for remote consoles in {{ site.data.product.title_short }}.

**Note:** For VMware vSphere providers, {{ site.data.product.title_short }} supports the versions of VMRC that VMware supports. However, VMware does not support VMRC for Mac operating systems. See VMware VMRC documentation for more information.

 For all other providers, {{ site.data.product.title_short }} supports HTML5-based VNC consoles. The following have been tested with {{ site.data.product.title_short }} Engine:

- Windows: UltraVNC 1.1.8.8 - http://www.uvnc.com/
- Linux/Mac: SSVNC 1.0.29 - http://www.karlrunge.com/x11vnc/ssvnc.html. At the time of this writing, this is the only client that supports the VNC repeater configuration. 

**Note:** As of 1 September 2015, new versions of Chrome no longer support VMRC consoles. VMRC requires NPAPI plug-in support. Chrome removed support for NPAPI plug-ins in version 45.0.2454, which was released on this date.

### 6.1. Support on Red Hat Enterprise Linux by Providers and Browsers

The following tables outline the status of support for remote consoles on providers for Red Hat Enterprise Linux 6 and Red Hat Enterprise Linux 7. 

#### Table 6.1. Remote Console Support on Red Hat Enterprise Linux 6
| Provider                         | Connection Type | Support | Chrome | Firefox |
| -------------------------------- | --------------- | ------- | ------ | ------- |
| VMware vSphere 6.0               | VNC             | Yes     | No     | Yes     |
|                                  | VMRC            |         | No     | Yes     |
|                                  | WebMKS          |         | No     | Yes     |
| VMware vSphere 6.5               | VMRC            | Yes     | No     | Yes     |
|                                  | WebMKS          |         | No     | Yes     |
| Red Hat Virtualization (RHV) 4.2 | SPICE           | Yes     | No     | No      |
| Red Hat Virtualization (RHV) 4.3 | SPICE           | Yes     | No     | No      |
| Red Hat OpenStack Platform 10    | VNC             | Yes     | No     | No      |
| Red Hat OpenStack Platform 13    | VNC             | Yes     | No     | No      |

#### Table 6.2. Remote Console Support on Red Hat Enterprise Linux 7
| Provider                         | Connection Type | Support | Chrome | Firefox |
| -------------------------------- | --------------- | ------- | ------ | ------- |
| VMware vSphere 6.0               | VNC             | Yes     | Yes    | Yes     |
|                                  | VMRC            |         | Yes    | Yes     |
|                                  | WebMKS          |         | Yes    | Yes     |
| VMware vSphere 6.5               | VMRC            | Yes     | Yes    | Yes     |
|                                  | WebMKS          |         | Yes    | Yes     |
| Red Hat Virtualization (RHV) 4.2 | SPICE           | Yes     | No     | No      |
| Red Hat Virtualization (RHV) 4.3 | SPICE           | Yes     | No     | No      |
| Red Hat OpenStack Platform 10    | VNC             | Yes     | No     | No      |
| Red Hat OpenStack Platform 13    | VNC             | Yes     | No     | No      |

#### 6.2. Support on Fedora by Providers and Browsers

The following tables outline the status of support for remote consoles on providers for Fedora 25, 26, and 27.

#### Table 6.3. Remote Console Support on Fedora 25
| Provider                         | Connection Type | Support | Chrome | Firefox |
| -------------------------------- | --------------- | ------- | ------ | ------- |
| VMware vSphere 6.0               | VNC             | Yes     | Yes    | Yes     |
|                                  | VMRC            |         | Yes    | Yes     |
|                                  | WebMKS          |         | Yes    | Yes     |
| VMware vSphere 6.5               | VMRC            | Yes     | Yes    | Yes     |
|                                  | WebMKS          |         | Yes    | Yes     |
| Red Hat Virtualization (RHV) 4.2 | SPICE           | Yes     | No     | No      |
| Red Hat Virtualization (RHV) 4.3 | SPICE           | Yes     | No     | No      |
| Red Hat OpenStack Platform 10    | VNC             | Yes     | No     | No      |
| Red Hat OpenStack Platform 13    | VNC             | Yes     | No     | No      |

#### Table 6.4. Remote Console Support on Fedora 26
| Provider                         | Connection Type | Support | Chrome | Firefox |
| -------------------------------- | --------------- | ------- | ------ | ------- |
| VMware vSphere 6.0               | VNC             | Yes     | Yes    | Yes     |
|                                  | VMRC            |         | Yes    | Yes     |
|                                  | WebMKS          |         | Yes    | Yes     |
| VMware vSphere 6.5               | VMRC            | Yes     | Yes    | Yes     |
|                                  | WebMKS          |         | Yes    | Yes     |
| Red Hat Virtualization (RHV) 4.2 | SPICE           | Yes     | No     | No      |
| Red Hat Virtualization (RHV) 4.3 | SPICE           | Yes     | No     | No      |
| Red Hat OpenStack Platform 10    | VNC             | Yes     | No     | No      |
| Red Hat OpenStack Platform 13    | VNC             | Yes     | No     | No      |

#### Table 6.5. Remote Console Support on Fedora 27
| Provider                         | Connection Type | Support | Chrome | Firefox |
| -------------------------------- | --------------- | ------- | ------ | ------- |
| VMware vSphere 6.0               | VNC             | Yes     | Yes    | Yes     |
|                                  | VMRC            |         | Yes    | Yes     |
|                                  | WebMKS          |         | Yes    | Yes     |
| VMware vSphere 6.5               | VMRC            | Yes     | Yes    | Yes     |
|                                  | WebMKS          |         | Yes    | Yes     |
| Red Hat Virtualization (RHV) 4.2 | SPICE           | Yes     | No     | No      |
| Red Hat Virtualization (RHV) 4.3 | SPICE           | Yes     | No     | No      |
| Red Hat OpenStack Platform 10    | VNC             | Yes     | No     | No      |
| Red Hat OpenStack Platform 13    | VNC             | Yes     | No     | No      |

### 6.3. Support on Windows by Providers and Browsers

The following tables outline the status of support for remote consoles on providers for Windows 7, 10, and 2012 Server.

#### Table 6.6. Remote Console Support on Windows 7
| Provider                         | Connection Type | Support | Chrome | Firefox | IE 11 | IE 10 |
| -------------------------------- | --------------- | ------- | ------ | ------- | ----- | ----- |
| VMware vSphere 6.0               | VNC             | Yes     | Yes    | Yes     | Yes   | No    |
|                                  | VMRC            |         | Yes    | Yes     | Yes   | No    |
|                                  | WebMKS          |         | Yes    | Yes     | Yes   | No    |
| VMware vSphere 6.5               | VMRC            | Yes     | Yes    | Yes     | Yes   | No    |
|                                  | WebMKS          |         | Yes    | Yes     | Yes   | No    |
| Red Hat Virtualization (RHV) 4.2 | SPICE           | Yes     | No     | No      | No    | No    |
| Red Hat Virtualization (RHV) 4.3 | SPICE           | Yes     | No     | No      | No    | No    |
| Red Hat OpenStack Platform 10    | VNC             | Yes     | No     | No      | No    | No    |
| Red Hat OpenStack Platform 13    | VNC             | Yes     | No     | No      | No    | No    |
| Amazon Web Services (AWS)        | N/A             | No      | N/A    | N/A     | N/A   | N/A   |
| Microsoft SCVMM                  | N/A             | No      | N/A    | N/A     | N/A   | N/A   |

#### Table 6.7. Remote Console Support on Windows 10

| Provider                         | Connection Type | Support | Chrome | Firefox | IE 11 | IE 10 | Edge |
| -------------------------------- | --------------- | ------- | ------ | ------- | ----- | ----- | ---- |
| VMware vSphere 6.0               | VNC             | Yes     | No     | No      | No    | No    | Yes  |
|                                  | VMRC            |         | No     | No      | No    | No    | Yes  |
|                                  | WebMKS          |         | No     | No      | No    | No    | Yes  |
| VMware vSphere 6.5               | VMRC            | Yes     | No     | No      | No    | No    | Yes  |
|                                  | WebMKS          |         | No     | No      | No    | No    | Yes  |
| Red Hat Virtualization (RHV) 4.2 | SPICE           | Yes     | No     | No      | No    | No    | No   |
| Red Hat Virtualization (RHV) 4.3 | SPICE           | Yes     | No     | No      | No    | No    | No   |
| Red Hat OpenStack Platform 10    | VNC             | Yes     | No     | No      | No    | No    | No   |
| Red Hat OpenStack Platform 13    | VNC             | Yes     | No     | No      | No    | No    | No   |
| Amazon Web Services (AWS)        | N/A             | No      | N/A    | N/A     | N/A   | N/A   | N/A  |
| Microsoft SCVMM                  | N/A             | No      | N/A    | N/A     | N/A   | N/A   | N/A  |

#### Table 6.8. Remote Console Support on Windows 2012 Server
| Provider                         | Connection Type | Support | Chrome | Firefox | IE 11 | IE 10 |
| -------------------------------- | --------------- | ------- | ------ | ------- | ----- | ----- |
| VMware vSphere 6.0               | VNC             | Yes     | Yes    | Yes     | Yes   | No    |
|                                  | VMRC            |         | No     | No      | No    | No    |
|                                  | WebMKS          |         | No     | No      | No    | No    |
| VMware vSphere 6.5               | VMRC            | Yes     | Yes    | Yes     | Yes   | No    |
|                                  | WebMKS          |         | Yes    | Yes     | Yes   | No    |
| Red Hat Virtualization (RHV) 4.2 | SPICE           | Yes     | No     | No      | No    | No    |
| Red Hat Virtualization (RHV) 4.3 | SPICE           | Yes     | No     | No      | No    | No    |
| Red Hat OpenStack Platform 10    | VNC             | Yes     | No     | No      | No    | No    |
| Red Hat OpenStack Platform 13    | VNC             | Yes     | No     | No      | No    | No    |
| Amazon Web Services (AWS)        | N/A             | No      | N/A    | N/A     | N/A   | N/A   |
| Microsoft SCVMM                  | N/A             | No      | N/A    | N/A     | N/A   | N/A   |


## Chapter 7. Operating System Support
{: #operating-system-support}

This section outlines the supported operating systems by infrastructure and cloud providers.

#### Table 7.1. Windows Support by Infrastructure Providers
| Infrastructure Provider           | Windows 7 SP1 | Windows 8.1 | Windows 10 | Windows 2012 | Windows 2016 |
| --------------------------------- | ------------- | ----------- | ---------- | ------------ | ------------ |
| Red Hat Virtualization 4.2        |               |             | Yes        |              |              |
| Red Hat Virtualization 4.3        |               |             | Yes        |              |              |
| Red Hat OpenStack Platform 10 [a] | Yes           | Yes         | Yes        | Yes          | Yes          |
| Red Hat OpenStack Platform 13 [a] | Yes           | Yes         | Yes        | Yes          | Yes          |
| VMware vCenter 6.0 [b]            | Yes           | Yes         | Yes        | Yes          | Yes          |
| VMware vCenter 6.5 [c]            | Yes           | Yes         | Yes        | Yes          | Yes          |
| VMware vCenter 6.7 [d]            | Yes           | Yes         | Yes        | Yes          | Yes          |
| Microsoft SCVMM 2016 [a]          | Yes           | Yes         | Yes        | Yes          | Yes          |
| Microsoft SCVMM 2019 [a]          | Yes           | Yes         | Yes        | Yes          | Yes          |

[a] See Section 8.2, [Supported Guest Operating Systems](#supported-guest-operating-systems).

[b] Install the VMware VDDK 6.0 so that SmartState analysis is successful.

[c] Install the VMware VDDK 6.5 so that SmartState analysis is successful. Alternatively, you can use VMware VDDK 6.0.

[d] Install the VMware VDDK 6.7 so that SmartState analysis is successful. Alternatively, you can use VMware VDDK 6.0.

#### Table 7.2. Windows Support by Cloud Providers

| Cloud Provider                    | Windows 7 SP1 | Windows 8.1 | Windows 10 | Windows 2012 | Windows 2016 |
| --------------------------------- | ------------- | ----------- | ---------- | ------------ | ------------ |
| Red Hat OpenStack Platform 10 [a] | Yes           | Yes         | Yes        | Yes          | Yes          |
| Red Hat OpenStack Platform 13 [a] | Yes           | Yes         | Yes        | Yes          | Yes          |
| Microsoft Azure                   | Yes           | Yes         | Yes        | Yes          | Yes          |
| Amazon Web Services (AWS)         | Yes           | Yes         | Yes        | Yes          | Yes          |
| Google Cloud Platform (GCP)       |               |             |            |              |              |

[a] See Section 8.2, [Supported Guest Operating Systems](#supported-guest-operating-systems).

#### Table 7.3. Linux Support by Infrastructure Providers
| Infrastructure Provider           | RHEL 6 | RHEL 7 | Ubuntu | SUSE |
| --------------------------------- | ------ | ------ | ------ | ---- |
| Red Hat Virtualization 4.2        |        | Yes    |        |      |
| Red Hat Virtualization 4.3        |        | Yes    |        |      |
| Red Hat OpenStack Platform 10 [a] | Yes    | Yes    | Yes    | Yes  |
| Red Hat OpenStack Platform 13 [a] | Yes    | Yes    | Yes    | Yes  |
| VMware vCenter 6.0 [b]            | Yes    | Yes    | Yes    | Yes  |
| VMware vCenter 6.5 [c]            | Yes    | Yes    | Yes    | Yes  |
| VMware vCenter 6.7 [d]            | Yes    | Yes    | Yes    | Yes  |
| Microsoft SCVMM 2016 [a]          | Yes    | Yes    | Yes    | Yes  |
| Microsoft SCVMM 2019 [a]          | Yes    | Yes    | Yes    | Yes  |

[a] See Section 8.2, [Supported Guest Operating Systems](#supported-guest-operating-systems).

[b] Install the VMware VDDK 6.0 so that SmartState analysis is successful.

[c] Install the VMware VDDK 6.5 so that SmartState analysis is successful. Alternatively, you can use VMware VDDK 6.0.

[d] Install the VMware VDDK 6.7 so that SmartState analysis is successful. Alternatively, you can use VMware VDDK 6.0.

#### Table 7.4. Linux Support by Cloud Providers
| Cloud Provider                    | RHEL 6 | RHEL 7 | Ubuntu | SUSE |
| ----------------------------------| ------ | ------ | ------ | ---- |
| Red Hat OpenStack Platform 10 [a] | Yes    | Yes    | Yes    | Yes  |
| Red Hat OpenStack Platform 13 [a] | Yes    | Yes    | Yes    | Yes  |
| Microsoft Azure                   | Yes    | Yes    | Yes    | Yes  |
| Amazon Web Services (AWS)         | Yes    | Yes    | Yes    | Yes  |
| Google Cloud Platform (GCP)       |        |        |        |      |

[a] See Section 8.2, [Supported Guest Operating Systems](#supported-guest-operating-systems).

## Chapter 8. Smart State Analysis Support
{: #smart-state-analysis-support}

{{ site.data.product.title_short }} allows you to analyze virtual machines and instances on the providers it manages to collect information about the base operating system on those virtual machines or instances, their virtual hardware, installed applications, and other details. This operation is known as SmartState analysis. This section outlines the status of support for SmartState analysis of virtual machines and instances by guest operating system, file system, and by provider.

### 8.1. File Systems

The following tables outline SmartState analysis support for different file systems by infrastructure and cloud providers.

#### Table 8.1. Windows File System SmartState Analysis Support by Infrastructure Providers
| Infrastructure Provider           | ReFS | NTFS | FAT32 | FAT |
| ----------------------------------| ---- | ---- | ----- | --- |
| Red Hat Virtualization 4.2        | No   |      |       |     |
| Red Hat Virtualization 4.3        | No   |      |       |     |
| Red Hat OpenStack Platform 10 [a] | No   | Yes  | No    | No  |
| Red Hat OpenStack Platform 13 [a] | No   | Yes  | No    | No  |
| Red Hat OpenShift                 | No   |      |       |     |
| VMware vCenter 6.0 [b]            | No   | Yes  | Yes   | Yes |
| VMware vCenter 6.5 [c]            | No   | Yes  | Yes   | Yes |
| VMware vCenter 6.7 [d]            | No   | Yes  | Yes   | Yes |
| Microsoft SCVMM 2016              | No   | Yes  | Yes   | Yes |
| Microsoft SCVMM 2019              | No   | Yes  | Yes   | Yes |

[a] See Section 8.2, [Supported Gues

[b] Install the VMware VDDK 6.0 so that SmartState analysis is successful.

[c] Install the VMware VDDK 6.5 so that SmartState analysis is successful. Alternatively, you can use VMware VDDK 6.0.

[d] Install the VMware VDDK 6.7 so that SmartState analysis is successful. Alternatively, you can use VMware VDDK 6.0.

#### Table 8.2. Windows File System SmartState Analysis Support by Cloud Providers
| Cloud Provider                    | ReFS | NTFS | FAT32 | FAT |
| ----------------------------------| ---- | ---- | ----- | --- |
| Red Hat OpenStack Platform 10 [a] | No   | Yes  | No    | No  |
| Red Hat OpenStack Platform 13 [a] | No   | Yes  | No    | No  |
| Microsoft Azure                   | No   | Yes  | Yes   | Yes |
| Amazon Web Services (AWS)         | No   | Yes  | Yes   | Yes |
| Google Cloud Platform (GCP)       | No   | No   | No    | No  |

[a] See Section 8.2, [Supported Guest Operating Systems](#supported-guest-operating-systems).

#### Table 8.3. Linux File System SmartState Analysis Support by Infrastructure Providers
| Infrastructure Provider           | EXT3 | EXT4 | XFS |
| ----------------------------------| ---- | ---- | --- |
| Red Hat Virtualization 4.2        |      |      |     |
| Red Hat Virtualization 4.3        |      |      |     |
| Red Hat OpenStack Platform 10 [a] | Yes  | Yes  | Yes |
| Red Hat OpenStack Platform 13 [a] | Yes  | Yes  | Yes |
| Red Hat OpenShift                 |      |      |     |
| VMware vCenter 6.0 [b]            | Yes  | Yes  | Yes |
| VMware vCenter 6.5 [c]            | Yes  | Yes  | Yes |
| VMware vCenter 6.7 [d]            | Yes  | Yes  | Yes |
| Microsoft SCVMM 2016              | Yes  | Yes  | Yes |
| Microsoft SCVMM 2019              | Yes  | Yes  | Yes |

[a] See Section 8.2, [Supported Guest Operating Systems](#supported-guest-operating-systems).

[b] Install the VMware VDDK 6.0 so that SmartState analysis is successful.

[c] Install the VMware VDDK 6.5 so that SmartState analysis is successful. Alternatively, you can use VMware VDDK 6.0.

[d] Install the VMware VDDK 6.7 so that SmartState analysis is successful. Alternatively, you can use VMware VDDK 6.0.

#### Table 8.4. Linux File System SmartState Analysis Support by Cloud Providers
| Cloud Provider                    | EXT3 | EXT4 | XFS |
| --------------------------------- | ---- | ---- | --- |
| Red Hat OpenStack Platform 10 [a] | Yes  | Yes  | Yes |
| Red Hat OpenStack Platform 13 [a] | Yes  | Yes  | Yes |
| Microsoft Azure                   | Yes  | Yes  | Yes |
| Amazon Web Services (AWS)         | Yes  | Yes  | Yes |
| Google Cloud Platform (GCP)       |      |      |     |

[a] See Section 8.2, [Supported Guest Operating Systems](#supported-guest-operating-systems).

#### Table 8.5. Other File System SmartState Analysis Support by Infrastructure Providers
| Infrastructure Provider            | CDFS | Any Encrypted FS |
| -----------------------------------| ---- | ---------------- |
| Red Hat Virtualization 4.2         |      |                  |
| Red Hat Virtualization 4.3         |      |                  |
| Red Hat OpenStack Platform 10 [a]  | Yes  | Yes              |
| Red Hat OpenStack Platform 13 [a]  | Yes  | Yes              |
| Red Hat OpenShift                  |      |                  |
| VMware vCenter 6.0 [b]             | Yes  | Yes              |
| VMware vCenter 6.5 [c]             | Yes  | Yes              |
| VMware vCenter 6.7 [d]             | Yes  | Yes              |
| Microsoft SCVMM 2016               | Yes  | Yes              |
| Microsoft SCVMM 2019               | Yes  | Yes              |

[a] See Section 8.2, [Supported Guest Operating Systems](#supported-guest-operating-systems).

[b] Install the VMware VDDK 6.0 so that SmartState analysis is successful.

[c] Install the VMware VDDK 6.5 so that SmartState analysis is successful. Alternatively, you can use VMware VDDK 6.0.

[d] Install the VMware VDDK 6.7 so that SmartState analysis is successful. Alternatively, you can use VMware VDDK 6.0.

#### Table 8.6. Other File System SmartState Analysis Support by Cloud Providers
| Cloud Provider                     | CDFS | Any Encrypted FS |
| -----------------------------------| ---- | ---------------- |
| Red Hat OpenStack Platform 10 [a]  | Yes  | Yes              |
| Red Hat OpenStack Platform 13 [a]  | Yes  | Yes              |
| Microsoft Azure                    | Yes  | Yes              |
| Amazon Web Services (AWS)          | Yes  | Yes              |
| Google Cloud Platform (GCP)        |      |                  |

[a] See Section 8.2, [Supported Guest Operating Systems](#supported-guest-operating-systems).

## 8.2. Guest Operating Systems
{: #supported-guest-operating-systems}

#### Table 8.7. Supported Guest Operating Systems With Their Support Life Cycle
| Guest Operating System                  | EOL Date   | Extended Support Date | Link                                                                                                                          |
| --------------------------------------- | ---------- | --------------------- | ----------------------------------------------------------------------------------------------------------------------------- |
| Windows 2012 R2 Standard                | 10/9/2018  | 10/10/2023            | [Windows 2012 R2](https://support.microsoft.com/en-us/lifecycle/search/17383)                                                 |
| Windows 2012 R2 Datacenter              | 10/9/2018  | 10/10/2023            | [Windows 2012 R2](https://support.microsoft.com/en-us/lifecycle/search/17383)                                                 |
| Windows 2016 Standard                   | 1/11/2022  | 1/11/2027             | [Windows 2016 Standard](https://support.microsoft.com/en-us/lifecycle/search/19761)                                           |
| Windows 2016 Datacenter                 | 1/11/2022  | 1/11/2027             | [Windows 2016 Datacenter](https://support.microsoft.com/en-us/lifecycle/search/19751)                                         |
| Windows 7 SP1                           | 1/13/2015  | 1/14/2020             | [Windows 7 SP1](https://support.microsoft.com/en-us/lifecycle/search/14019)                                                   |
| Windows 8.1                             | 1/9/2018   | 1/10/2023             | [Windows 8.1](https://support.microsoft.com/en-us/lifecycle/search/16796)                                                     |
| Windows 10 Ent. 2016 LTSB               | 10/12/2021 | 10/13/2026            | [Windows 10 Ent. 2016](https://support.microsoft.com/en-us/lifecycle/search/19680)                                            |
| Microsoft SCVMM 2016                    | 1/11/2022  | 1/11/2027             | [SCVMM 2016](https://support.microsoft.com/en-us/lifecycle/search/19758)                                                      |
| Microsoft SCVMM 2019                    | 4/9/2024   | 4/9/2029              | [SCVMM 2019](https://support.microsoft.com/en-us/lifecycle/search?alpha=System%20Center%202019%20Virtual%20Machine%20Manager) |
| Red Hat OpenStack Platform Version 10.0 | 6/16/2018  | 12/16/2019            | [RHOSP Life Cycle](https://access.redhat.com/support/policy/updates/openstack/platform)                                       |
| Red Hat OpenStack Platform Version 13.0 | 12/27/2019 | 6/27/2021             | [RHOSP Life Cycle](https://access.redhat.com/support/policy/updates/openstack/platform)                                       |

