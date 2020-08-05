## Smart State Analysis Support

{{ site.data.product.title_short }} allows you to analyze virtual machines and instances on the providers it manages to collect information about the base operating system on those virtual machines or instances, their virtual hardware, installed applications, and other details. This operation is known as SmartState analysis. This section outlines the status of support for SmartState analysis of virtual machines and instances by guest operating system, file system, and by provider.

### File Systems

The following tables outline SmartState analysis support for different file systems by infrastructure and cloud providers.

#### Windows File System SmartState Analysis Support by Infrastructure Providers

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

[a] See Section [Supported Guest Operating Systems](#supported-guest-operating-systems).
[b] Install the VMware VDDK 6.0 so that SmartState analysis is successful.
[c] Install the VMware VDDK 6.5 so that SmartState analysis is successful. Alternatively, you can use VMware VDDK 6.0.
[d] Install the VMware VDDK 6.7 so that SmartState analysis is successful. Alternatively, you can use VMware VDDK 6.0.

#### Windows File System SmartState Analysis Support by Cloud Providers

| Cloud Provider                    | ReFS | NTFS | FAT32 | FAT |
| ----------------------------------| ---- | ---- | ----- | --- |
| Red Hat OpenStack Platform 10 [a] | No   | Yes  | No    | No  |
| Red Hat OpenStack Platform 13 [a] | No   | Yes  | No    | No  |
| Microsoft Azure                   | No   | Yes  | Yes   | Yes |
| Amazon Web Services (AWS)         | No   | Yes  | Yes   | Yes |
| Google Cloud Platform (GCP)       | No   | No   | No    | No  |

[a] See Section [Supported Guest Operating Systems](#supported-guest-operating-systems).

#### Linux File System SmartState Analysis Support by Infrastructure Providers

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

[a] See Section [Supported Guest Operating Systems](#supported-guest-operating-systems).
[b] Install the VMware VDDK 6.0 so that SmartState analysis is successful.
[c] Install the VMware VDDK 6.5 so that SmartState analysis is successful. Alternatively, you can use VMware VDDK 6.0.
[d] Install the VMware VDDK 6.7 so that SmartState analysis is successful. Alternatively, you can use VMware VDDK 6.0.

#### Linux File System SmartState Analysis Support by Cloud Providers

| Cloud Provider                    | EXT3 | EXT4 | XFS |
| --------------------------------- | ---- | ---- | --- |
| Red Hat OpenStack Platform 10 [a] | Yes  | Yes  | Yes |
| Red Hat OpenStack Platform 13 [a] | Yes  | Yes  | Yes |
| Microsoft Azure                   | Yes  | Yes  | Yes |
| Amazon Web Services (AWS)         | Yes  | Yes  | Yes |
| Google Cloud Platform (GCP)       |      |      |     |

[a] See Section [Supported Guest Operating Systems](#supported-guest-operating-systems).

#### Other File System SmartState Analysis Support by Infrastructure Providers

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

[a] See Section [Supported Guest Operating Systems](#supported-guest-operating-systems).
[b] Install the VMware VDDK 6.0 so that SmartState analysis is successful.
[c] Install the VMware VDDK 6.5 so that SmartState analysis is successful. Alternatively, you can use VMware VDDK 6.0.
[d] Install the VMware VDDK 6.7 so that SmartState analysis is successful. Alternatively, you can use VMware VDDK 6.0.

#### Other File System SmartState Analysis Support by Cloud Providers

| Cloud Provider                     | CDFS | Any Encrypted FS |
| -----------------------------------| ---- | ---------------- |
| Red Hat OpenStack Platform 10 [a]  | Yes  | Yes              |
| Red Hat OpenStack Platform 13 [a]  | Yes  | Yes              |
| Microsoft Azure                    | Yes  | Yes              |
| Amazon Web Services (AWS)          | Yes  | Yes              |
| Google Cloud Platform (GCP)        |      |                  |

[a] See Section [Supported Guest Operating Systems](#supported-guest-operating-systems).

## Guest Operating Systems

#### Supported Guest Operating Systems With Their Support Life Cycle
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

