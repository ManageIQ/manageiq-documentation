This guide assumes that you have:

  - [Already deployed {{ site.data.product.title }} on your chosen
    platform](https://www.ibm.com/support/knowledgecenter/SSFC4F_2.0.0/mcm/infrastructure/infra_mgmt_intro.html)

  - [Already deployed OpenShift Container
    Platform](https://access.redhat.com/documentation/en-us/openshift_container_platform/3.9/html/installation_and_configuration/)

When enabling metrics on OpenShift Container Platform, you can store your metrics data on *persistent* or *non-persistent* storage. To use persistent storage, you need to provision a persistent volume specifically for this purpose before [configuring the metrics components](#ocp-metrics-storage). See [Persistent Volumes](https://access.redhat.com/documentation/en-us/openshift_container_platform/3.9/html/architecture/additional-concepts#architecture-additional-concepts-storage)
in the OpenShift Container Platform *Architecture* documentation for more information.
