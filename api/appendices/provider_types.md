---
---

## Provider Types

The provider types available with earlier appliances have changed with
this release. This is what gets specified with the *type* attribute when
creating a new provider:

    POST /api/providers

``` json
{
  "name" : "vCenter 5",
  "type" : "ManageIQ::Providers::Vmware::InfraManager",
  "hostname" : "my_vcenter_50",
  ...
}
```

The following table lists the type from previous appliance releases
(*v2.0.0* of the REST API), and their mapping to the new *v2.1.0* types:

| v2.0.0 Provider Type | v2.1.0 Provider Type                                       |
| -------------------- | ---------------------------------------------------------- |
| EmsAmazon            | ManageIQ::Providers::Amazon::CloudManager                  |
|                      | ManageIQ::Providers::Atomic::ContainerManager (**new**)    |
|                      | ManageIQ::Providers::Azure::CloudManager (**new**)         |
| EmsKubernetes        | ManageIQ::Providers::Kubernetes::ContainerManager          |
| EmsMicrosoft         | ManageIQ::Providers::Microsoft::InfraManager               |
|                      | ManageIQ::Providers::Openshift::ContainerManager (**new**) |
| EmsOpenstackInfra    | ManageIQ::Providers::Openstack::InfraManager               |
| EmsOpenstack         | ManageIQ::Providers::Openstack::CloudManager               |
| EmsRedhat            | ManageIQ::Providers::Redhat::InfraManager                  |
| EmsVmware            | ManageIQ::Providers::Vmware::InfraManager                  |

And when *provider-class* is set to **provider**, the following mapping
table applies:

| v2.0.0 Provider Type | v2.1.0 Provider Type                     |
| -------------------- | ---------------------------------------- |
| ProviderForeman      | ManageIQ::Providers::Foreman::Provider   |
| ProviderOpenstack    | ManageIQ::Providers::Openstack::Provider |
