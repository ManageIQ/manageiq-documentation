This article is a supplement to the installation and configuration procedures in the [Migration Analytics Guide](https://access.redhat.com/documentation/en-us/migration_analytics).

You can download a script to configure Red Hat CloudForms for Migration Analytics. This script creates a SmartState analysis profile, applies a control policy to the vCenter provider, and installs the VMware Virtual Disk Development Kit (VDDK) in the CloudForms appliance.

## Prerequisites

- You have [installed the CloudForms appliance on VMware vSphere](https://access.redhat.com/documentation/en-us/migration_analytics/1.0/html-single/migration_analytics_guide/index#Installing-cloudforms_migration_analytics).
- You have [downloaded and copied the VDDK archive file](https://access.redhat.com/documentation/en-us/migration_analytics/1.0/html-single/migration_analytics_guide/index#Installing-vddk_migration_analytics) to `/root` on the CloudForms appliance.
- You have [added VMware vCenter as an infrastructure provider](https://access.redhat.com/documentation/en-us/migration_analytics/1.0/html-single/migration_analytics_guide/index#Adding-a-provider-to-cloudforms_migration_analytics) to CloudForms.

## Procedure

1. Log in to the CloudForms appliance as root user.
2. Clone the configuration files:

  ~~~
  # cd /root
  # git clone https://github.com/konveyor/mig-analytics-tools
  ~~~

3. Go to the `configure` directory:

  ~~~
  # cd mig-analytics-tools/playbooks/configure/
  ~~~

4. Run the configuration script:

  ~~~
  # sh configure
  ~~~

5. Enter the full path, `/root/VMware-vix-disklib-[version].x86_64.tar.gz`, of the VDDK archive file:

  ~~~
  # sh configure
  Path for VMware VDDK file:
  ~~~

  An Ansible playbook creates the `default` SmartState VM analysis profile for Migration Analytics, applies a control policy to the vCenter provider, and installs VDDK.

You can now [scan your VMware virtual machines](https://access.redhat.com/documentation/en-us/migration_analytics/1.0/html-single/migration_analytics_guide/index#collecting_data_for_migration_analytics).
