The following recommendations can improve performance when migrating VMware virtual machines to Red Hat Virtualization (RHV) or Red Hat OpenStack Platform, using the Infrastructure Migration Solution (Red Hat Modernization and Migration Solutions). These are **recommendations**, not requirements, for migration.

This article supplements the recommendations described in the [Red Hat Infrastructure Migration Solution guides](https://access.redhat.com/documentation/en-us/red_hat_infrastructure_migration_solution).

The performance results are provided as examples. Actual migration speed and duration will depend on your environment's hardware, network speed, disk usage, and other factors.

## VMware environment recommendations

* Extend the VMware network to the Red Hat target platform.
* Ensure that the VMware network provides high throughput.

  VMware and RHV hosts often have multiple network interfaces. By default, the conversion hosts use the VMware hosts' admin interface to import VMs. Configure your routing for the fastest possible connection between the Red Hat and VMware environment. You can use host routes or IP table filtering to control the traffic flow.

* Distribute the VMware virtual machines evenly among multiple VMware hosts.

    *20 VMs with 100 GB disks, migrated with VDDK over iSCSI interface.*

    | Number of VMware hosts | Migration speed | Migration duration |
    | --------- | --------- | --------- |
    | 1 (20 VMs) | 413 MBps | 80 minutes |
    | 2 (10 VMs each) | 582 MBps (~40% faster) | 57 minutes |

* Remove unnecessary data from the VMware disks. Virtual machines with full disks take much longer to migrate than virtual machines with mostly zeros on their disks. In addition, RHV 4.2.6 has a Smart Zero Write feature, which copies zeroes more efficiently and improves performance.

    *10 VMs with 100 GB disks, on 1 VMware host, migrated with VDDK over Fibre Channel interface to RHV 4.2.5, without Smart Zero Write.*

    | Disk usage | Migration speed | Migration duration |
    | ------------- | ------------- | ------------- |
    | 66% | 220 MBps | 76 minutes |
    | 33% | 331 MBps (~50% faster) | 50 minutes |

    *10 VMs with 100 GB disks, on 1 VMware host, migrated with VDDK over Fibre Channel interface to RHV 4.2.6, with Smart Zero Write.*

    | Disk usage | Migration speed | Migration duration |
    | ------------- | ------------- | ------------- |
    | 66% | 393 MBps | 42 minutes |
    | 33% | 611 MBps (~55% faster) | 27 minutes |

## Red Hat environment recommendations

* Use fast, full SDD storage.
* Ensure that the network connection between the RHV conversion hosts and storage is at least 10 GbE.
* Use Fibre Channel interfaces between conversion hosts and storage.

  * SSD storage
  * 2 x 8 GBps Fibre Channel connections between conversion hosts and storage
  * 2 x 10 GbE iSCSI connections between conversion hosts and storage

  *10 VMs with 100 GB disks (66% disk usage) migrated from 2 VMware hosts.*

    | Storage interface | Migration speed | Migration duration |
    | --------- | --------- | --------- |
    | iSCSI | 379 MBps | 44 minutes |
    | Fibre Channel | 495 MBps (~30% faster) | 33 minutes |

    *20 VMs with 100 GB disks (66% disk usage) migrated from 2 VMware hosts.*

    | Storage interface | Migration speed | Migration duration |
    | --------- | --------- | --------- |
    | iSCSI | 582 MBps | 57 minutes |
    | Fibre Channel | 603 MBps (~4% faster) | 55 minutes |

* Configure multipath access between the conversion hosts and storage.

    *20 VMs with 100 GB disks, migrated from 2 VMware hosts (iSCSI interface), with VDDK, to 2 RHV conversion hosts (Fibre Channel interface).*

    | Paths | Migration speed | Migration duration |
    | --------- | --------- | --------- |
    | 2 | 393 MBps | 85 minutes |
    | 4 | 603 MBps (~50% faster) | 55 minutes |

## Host recommendations

For Red Hat Virtualization (IMS 1.1 and 1.2), the hardware and BIOS settings apply to *physical* conversion hosts.

For Red Hat Virtualization (IMS 1.3) and Red Hat OpenStack Platform (all IMS versions), the hardware and BIOS settings apply to the *hypervisors* on which the conversion hosts (virtual machines or instances) are deployed.

* Deploy the conversion hosts on midrange or high-end multicore machines with at least 10 GB of available RAM.
* If you increase the maximum number of concurrent migrations beyond `10`, you must add 1 GB RAM for each additional migration, up to a maximum of `20` concurrent migrations.
* In the BIOS settings, enable high performance and disable power-saving.
* Ensure that the RHV conversion hosts do not host virtual machines that perform intensive input/output operations to the target storage domain during migration.
* Ensure that virtual machines on the RHV conversion hosts are idle during the migration process.
* Deploy more than one conversion host, up to a maximum of five.

    *10 VMs, migrated in parallel with VDDK over Fibre Channel interface.*

    | Number of conversion hosts | Migration speed |
    | --------- | --------- |
    | 1 | 220 MBps |
    | 2 | 350 MBps |
    | 4 | 500 MBps |

## Migration recommendations

* Use the VMware Virtual Disk Development Kit to migrate the virtual disks, rather than migrating the disks over SSH.

    *10 VMs with 100 GB disks, 66% disk usage.*

    | Datapath Transformation | Migration speed | Migration duration |
    | --------- | --------- | --------- |
    | SSH | 107 MBps | 156 minutes |
    | VDDK | 220 MBps (~ 100% faster) | 76 minutes |

    *1 VM with 100 GB disk, 66% disk usage.*

    | Datapath Transformation | Migration speed | Migration duration |
    | --------- | --------- | --------- |
    | SSH | 59 MBps | 28 minutes |
    | VDDK | 91 MBps (~55% faster) | 18 minutes |

* For Red Hat Virtualization, schedule the migration at a time when the Manager and virtual machines are idle, for example, not during multiple virtual machine reboots or during input/output operations on conversion hosts to the target storage domain.

    *10 VMs with 100 GB disks, 66% disk usage, on 1 VMware host.*

    | Manager/VM activity level | Migration speed | Migration duration |
    | --------- | --------- | --------- |
    | High | 108 MBps | 155 minutes |
    | Low | 159 MBps (~50% faster) | 105 minutes |

* Migrate a group of virtual machines in parallel, rather than individually. You can deploy up to 5 conversion hosts, with each host migrating up to 20 virtual machines in parallel. **These limits should not be exceeded.**

    *Different numbers of VMs, 66% disk usage, on 1 VMware host.*

    | Migration group | Migration speed | Migration duration |
    | --------- | --------- |  --------- |
    | 1 VM, migrated 10 times | 70 MBps | 10 x 24 minutes |
    | 10 VMs, migrated in parallel | 220 MBps | 65 minutes (~3 times faster) |

## Typical end-to-end migration examples

* VDDK transformation
* VMware:
  * 20 VMs with 100 GB disks, divided evenly among 2 VMware hosts
  * 2 TB data
  * iSCSI interface with storage
* Red Hat:
  * 2 conversion hosts, each limited to 10 concurrent migrations
  * Fibre Channel interface with storage
  * 10 GbE network throughput

| Target platform | Migration speed | Migration duration |
| --------- | --------- | --------- |
| RHV 4.3 | 582 MBps | 57 minutes |
| OSP 14 | 494 MBps | 67 minutes |
