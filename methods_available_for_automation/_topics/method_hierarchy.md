### Method Hierarchy

The Automate Model inline methods have a hierarchy. The sublevels in the
hierarchy have access to the methods for itself and the levels above it.
For example, Red Hat Hosts have access to the Red Hat Host methods, Host
Methods, and Base Methods.

The following nested list displays the hierarchy.

  - Top Level: Base

      - Authentication (authentication)

          - Private Keys (auth\_private\_key)

              - Key Pair for Clouds (auth\_key\_pair\_cloud)

                  - Amazon (auth\_key\_pair\_amazon)

                  - OpenStack (auth\_key\_pair\_openstack)

      - Availability Zones (availability\_zone)

          - Amazon (availability\_zone\_amazon)

          - OpenStack (availability\_zone\_openstack)

      - Classification (classification)

      - Cloud Networks (cloud\_network)

      - Cloud Resource Quotas (cloud\_resource\_quota)

          - OpenStack (openstack\_resource\_quota)

      - Cloud Subnets (cloud\_subnet)

      - Cloud Tenants (cloud\_tenant)

      - Customization Templates (customization\_template)

          - Cloud Init (customization\_template\_cloud\_init)

          - Kickstart (customization\_template\_kickstart)

          - Sysprep (customization\_template\_sysprep)

      - Cluster (ems\_cluster)

      - Event (ems\_event)

      - Folder (ems\_folder)

      - Providers (ext\_management\_system)

          - Cloud (ems\_cloud)

              - Amazon (ems\_amazon)

              - Openstack (ems\_openstack)

          - Infrastructure (ems\_infra)

              - Microsoft System Center VMM (ems\_microsoft)

              - Red Hat Enterprise Virtualization (ems\_redhat)

              - VMware vCenter (ems\_vmware)

      - Filesystems (filesystem)

      - Firewall Rules (filewall\_rule)

      - Flavors

          - Amazon (flavor\_amazon)

          - OpenStack (flavor\_openstack)

      - Floating IPs (floating\_ip)

          - Amazon (floating\_ip\_amazon)

          - OpenStack (floating\_ip\_openstack)

      - Guest Applications (guest\_application)

      - Guest Devices (guest\_device)

      - Hardware (hardware)

      - Hosts (host)

          - Red Hat Enterprise Virtualization (host\_redhat)

          - VMware (host\_vmware)

              - VMware ESX (host\_vmware\_esx)

      - ISO Images (iso\_image)

      - Jobs (job)

      - LANs (lan)

      - Groups (miq\_group)

      - Policies (miq\_policy)

      - Proxies (miq\_proxy)

      - Requests (miq\_request)

          - Automation (automation\_request)

          - Host Provisioning (miq\_host\_provision\_request)

          - VM Provisioning (miq\_provision\_request)

              - VM Templates (miq\_provision\_request\_template)

          - Service Reconfiguration (service\_reconfigure\_request)

          - Service Template Provisioning
            (service\_template\_provision\_request)

          - VM Migration (vm\_migrate\_request)

          - VM Reconfiguration (vm\_reconfigure\_request)

      - Request Task (miq\_request\_task)

          - Automation (automation\_task)

          - Host Provisioning (miq\_host\_provision)

          - VM Provisioning (miq\_provision)

              - Cloud (miq\_provision\_cloud)

                  - Amazon (miq\_provision\_amazon)

                  - OpenStack (miq\_provision\_openstack)

              - Red Hat Enterprise Virtualization
                (miq\_provision\_redhat)

                  - Via ISO (miq\_provision\_redhat\_via\_iso)

                  - Via PXE (miq\_provision\_redhat\_via\_pxe)

              - VMware (miq\_provision\_vmware)

                  - Via NetApp RCU
                    (miq\_provision\_vmware\_via\_net\_app\_rcu)

                  - Via PXE (miq\_provision\_vmware\_via\_pxe)

          - Service Reconfiguration (service\_reconfigure\_task)

          - Service Template Provisioning
            (service\_template\_provision\_task)

          - VM Migratation (vm\_migrate\_task)

          - VM Reconfiguration (vm\_reconfigure\_task)

      - Servers (miq\_server)

      - Networks (network)

      - Operating Systems (operating\_system)

      - PXE Images (pxe\_image)

          - iPXE (pxe\_image\_ipxe)

          - PXELINUX (pxe\_image\_pxelinux)

      - PXE Servers (pxe\_server)

      - Resource Pools (resource\_pool)

      - Security Groups (security\_group)

          - Amazon (security\_group\_amazon)

          - OpenStack (security\_group\_openstack)

      - Services (service)

      - Service Resources (service\_resource)

      - Service Templates (service\_template)

      - Snapshots (snapshot)

      - Storages (storage)

      - Switches (switch)

      - Users (user)

      - VMs or Templates (vm\_or\_template)

          - Templates (miq\_template)

              - Cloud (template\_cloud)

                  - Amazon (template\_amazon)

                  - OpenStack (template\_openstack)

              - Infrastructure (template\_infra)

                  - Microsoft (template\_microsoft)

                  - Red Hat Enterprise Virtualization (template\_redhat)

                  - VMware (template\_vmware)

          - VMs (vm)

              - Clouds (vm\_cloud)

                  - Amazon (vm\_amazon)

                  - OpenStack (vm\_openstack)

              - Infrastructure (vm\_infra)

                  - Microsoft (vm\_microsoft)

                  - Red Hat Enterprise Virtualization (vm\_redhat)

                  - Vmware (vm\_vmware)

      - Windows Images (windows\_images)
