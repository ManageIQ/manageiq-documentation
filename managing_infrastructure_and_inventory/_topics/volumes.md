# Volumes

A volume is a block storage device that you can attach to or detach from
an instance to manage the storage available to that instance. Volumes
are managed through storage managers, which are added automatically to
{{ site.data.product.title }} when the corresponding provider is added.

## Amazon Elastic Block Store Manager Volumes

This section outlines the actions that you can perform on Amazon Elastic
Block Store manager volumes.

{% include_relative _topics/creating_ebs_volumes.md %}

{% include_relative _topics/creating_ebs_volume_snapshot.md %}

{% include_relative _topics/attaching_ebs_volumes.md %}

{% include_relative _topics/detaching_ebs_volumes.md %}

{% include_relative _topics/editing_ebs_volumes.md %}

{% include_relative _topics/deleting_ebs_volumes.md %}

## OpenStack Block Storage Manager Volumes

This section outlines the actions that you can perform on OpenStack
Block Storage manager volumes.

{% include_relative _topics/creating_openstack_volumes.md %}

{% include_relative _topics/creating_openstack_volume_backups.md %}

{% include_relative
_topics/restoring_an_openstack_volume_backup.md %}

{% include_relative _topics/restoring_cloud_volume_backup.md %}

{% include_relative _topics/deleting_cloud_volume_backup.md %}

{% include_relative _topics/creating_openstack_volume_snapshot.md
%}

{% include_relative _topics/attaching_openstack_volumes.md %}

{% include_relative _topics/detaching_openstack_volumes.md %}

{% include_relative _topics/editing_openstack_volumes.md %}

{% include_relative _topics/deleting_openstack_volumes.md %}

## IBM Power Systems Virtual Servers Block Storage Manager Volumes

This section outlines the actions that you can perform on IBM Power
Systems Virtual Servers Block Storage manager volumes.

{% include_relative _topics/creating_ibm_cloud_powervs_volumes.md %}

{% include_relative _topics/attaching_ibm_cloud_powervs_volumes.md %}

{% include_relative _topics/detaching_ibm_cloud_powervs_volumes.md %}

{% include_relative _topics/deleting_ibm_cloud_powervs_volumes.md %}
