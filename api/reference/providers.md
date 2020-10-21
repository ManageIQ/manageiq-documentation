---
---

## Provider Support

Provider management including CRUD operations as well as the **refresh**
action is available via the REST API. Management of providers is
through:

``` data
/api/providers
```

  - [Querying Providers](#querying-providers)

  - [Creating Providers](#creating-providers)

  - [Specifying Credentials](#specifying-credentials)

  - [Specifying Connection
    Configurations](#specifying-connection-configurations)

  - [Editing Providers](#editing-providers)

  - [Deleting Providers](#deleting-providers)

  - [Refresh Providers](#refresh-providers)

  - [Import Vm to Provider](#import-vm-providers)

  - [Foreman Support](#foreman-support)

  - [Provider Examples](#provider-examples)

### Querying Providers

Providers can be queried as follows:

``` data
GET /api/providers
```

A specific provider can also be queried by its id:

``` data
GET /api/providers/:id
```

Foreman type providers can be queried by specifying the provider\_class
as follows:

``` data
GET /api/providers?provider_class=provider
```

#### Cloud Networks

The Cloud Networks of a provider can be queried by asking for the
*cloud\_networks* subcollection as follows:

``` data
GET /api/providers/:id/cloud_networks
```

``` data
GET /api/providers/:id/cloud_networks/:cloud_network_id
```

Or expanding the Cloud Networks in addition to the provider as follows:

``` data
GET /api/providers/:id?expand=cloud_networks
```

#### Cloud Subnets

The Cloud Subnets of a provider can be queried by asking for the
*cloud\_subnets* subcollection as follows:

``` data
GET /api/providers/:id/cloud_subnets
```

``` data
GET /api/providers/:id/cloud_subnets/:cloud_subnet_id
```

Or expanding the Cloud Subnets in addition to the provider as follows:

``` data
GET /api/providers/:id?expand=cloud_subnets
```

#### Load Balancers

Load Balancers of providers can be queried via the load\_balancers
subcollection as follows:

Query all Load Balancers of a provider:

``` data
GET /api/providers/:id/load_balancers
```

Query a specific Load Balancer of a provider:

``` data
GET /api/providers/:id/load_balancers/:load_balancer_id
```

Or expanding the Load Balancers for the specific provider as follows:

``` data
GET /api/providers/:id?expand=load_balancers
```

#### Virtual Machines

Virtual Machines of providers can be queried via the vms subcollection
as follows:

Query all VMs of a provider:

``` data
GET /api/providers/:id/vms
```

Query a specific VM of a provider:

``` data
GET /api/providers/:id/vms/:vm_id
```

Or expanding the VMs for the specific provider as follows:

``` data
GET /api/providers/:id?expand=vms
```

Query specific VMs of a provider and get their name and vendor
attributes:

``` data
GET /api/providers/:id/vms?filter[]=name='test*'&attributes=name,vendor&expand=resources
```

### Creating Providers

Creating a provider is done via the **create** action as follows:

    POST /api/providers

``` data
{
  "action" : "create",
  "resource" : {
    # New Provider JSON
  }
}
```

And like other **create** actions, the new provider data can simply be
posted to the /api/providers URL.

    POST /api/providers

``` data
{
  # New Provider JSON
}
```

**Note:**

Please refer to the [Resource Attributes](../appendices/resource_attributes.html#providers) page for a
list of available attributes when creating providers.

For example, creating a VMware type provider:

    POST /api/providers

``` json
{
  "name" : "vCenter 5",
  "type" : "ManageIQ::Providers::Vmware::InfraManager",
  "hostname" : "my_vcenter_50",
  "ipaddress" : "192.168.150.1",
  "zone" :  { "href" : "http://localhost:3000/api/zone/1" },
  "credentials" :  {
    "userid" : "vcenter_admin",
    "password" : "vcenter_password"
  }
}
```

If zone is not specified, the Default zone will be used.

The **type** attribute specifies the supported provider class names
which include:

|                                                   |
| ------------------------------------------------- |
| ManageIQ::Providers::Amazon::CloudManager         |
| ManageIQ::Providers::Azure::CloudManager          |
| ManageIQ::Providers::Hawkular::MiddlewareManager  |
| ManageIQ::Providers::Kubernetes::ContainerManager |
| ManageIQ::Providers::Microsoft::InfraManager      |
| ManageIQ::Providers::Openshift::ContainerManager  |
| ManageIQ::Providers::Openstack::CloudManager      |
| ManageIQ::Providers::Openstack::InfraManager      |
| ManageIQ::Providers::Lenovo::PhysicalInfraManager |
| ManageIQ::Providers::Redhat::InfraManager         |
| ManageIQ::Providers::Vmware::CloudManager         |
| ManageIQ::Providers::Vmware::InfraManager         |

**Note:**

Please note that the provider **type** classes have changed in the
appliance from earlier releases (*v2.0.0* of the API). Please refer to
the [Provider Types](../appendices/provider_types.html) page for a
mapping from the old to the new types.

### Specifying Credentials

When creating or updating providers, the credentials can be specified as
a a single default set, or a compound set where additional credentials
are necessary, for example AMPQ for OpenStack or Metrics for RHEVM.

Single default credentials set:

``` json
{
  "name" : "vCenter 50",
  "type" : "ManageIQ::Providers::Vmware::InfraManager",
  ...
  "credentials" :  {
    "userid" : "vc_admin",
    "password" : "vc_password"
  }
}
```

Compound credentials set:

``` json
{
  "name" : "RHEVM",
  "type" : " ManageIQ::Providers::Redhat::InfraManager",
  ...
  "credentials" : [
     {
       "userid"    : "default_userid",
       "password"  : "default_password"
     },
     {
       "userid"    : "metrics_userid",
       "password"  : "metrics_password",
       "auth_type" : "metrics"
     }
  ]
}
```

### Specifying Connection Configurations

When creating or updating providers, connection configurations can be
set. Connection configurations can be used to specify resources such as
an `amqp` event provider for OpenStack, adding Hawkular metrics, or an
authentication token.

Hawkular metrics:

``` json
{
  "name": "Openshift Provider",
  "type": "ManageIQ::Providers::Openshift::ContainerManager",
  ...
  "connection_configurations": [
    {
      "endpoint": {
        "role"                  : "hawkular",
        "hostname"              : "hawkular_host",
        "port"                  : "1443",
        "security_protocol"     : "ssl-without-validation",
        "certificate_authority" : "-----BEGIN CERTIFICATE-----",
        "verify_ssl": 0
      },
      "authentication": {
        "role"     :  "hawkular",
        "auth_key" :  "hawkular_auth_key"
      }
    }
  ]
}
```

Amqp event provider:

``` json
{
  "name": "Openstack Provider",
  "type": "ManageIQ::Providers::Openstack::CloudManager",
  ...
  "connection_configurations": [
    {
      "endpoint": {
        "role"              : "amqp",
        "hostname"          : "amqphost.com",
        "port"              : "5672",
        "security_protocol" : "non-ssl"
      },
      "authentication": {
        "userid"   : "amqp_userid",
        "password" : "amqp_password",
        "role"     : "amqp"
      }
    }
  ]
}
```

Ceilometer event provider:

``` json
{
  "name"              : "Openstack Provider",
  "type"              : "ManageIQ::Providers::Openstack::CloudManager",
  "hostname"          : "ceilometerhost.com",
  "ipaddress"         : "192.168.150.1",
  "security_protocol" : "ssl",
  ...
  "connection_configurations": {
      "userid"   :  "userid",
      "password" :  "password"
  },
  "connection_configurations": [
      "endpoint" : {
        "role"   : "ceilometer"
      }
    }
  ]
}
```

### Editing Providers

Editing provider is available via the **edit** action with the
**resource** specifying the attributes to update for that provider.

    POST /api/providers/:id

``` json
{
  "action" : "edit" ,
  "resource" : {
    "hostname" : "new_vcenter_50",
    "ipaddress" : "192.168.150.2"
  }
}
```

**Note:**

type is a restricted attribute and cannot be edited.

### Deleting Providers

Deleting a provider is done via the delete method:

    DELETE /api/providers/:id

or via the **delete** action as follows:

    POST /api/providers/:id

``` json
{
  "action" : "delete"
}
```

or by href:

    POST /api/providers

``` json
{
  "action" : "delete",
  "resources" : [
    { "href" : "http://localhost:3000/api/providers/:id" }
  ]
}
```

### Refresh Providers

Performing a refresh of providers is done via the **refresh** action.

    POST /api/providers/:id

``` json
{
  "action" : "refresh"
}
```

You can also refresh multiple providers:

    POST /api/providers

``` json
{
  "action" : "refresh",
  "resources" : [
    { "href" : "http://localhost:3000/api/providers/:id" },
    { "href" : "http://localhost:3000/api/providers/:id" }
  ]
}
```

### Import Vm to Provider

Importing a VM into a provider is supported via the *import\_vm* action.

This is currently supported for importing a Vm from a VMware vCenter
provider into a Red Hat Virtualization provider.

    POST /api/providers/:id

``` json
{
  "action" : "import_vm"
  "resource" : {
    "source" : { "href" : "http://localhost:3000/api/vms/11" },
    "target" : {
      "name"       : "new_vm_name",
      "cluster"    : { "href" : "http://localhost:3000/api/clusters/201" },
      "data_store" : { "href" : "http://localhost:3000/api/data_stores/301" },
      "sparse"     : true
    }
  }
}
```

### Foreman Support

Management of Foreman providers is provided as a seperate class of
providers. This is still accessed via the **/api/providers** entry
point, but enabled by a new parameter:

``` data
  GET|POST|DELETE /api/providers?provider_class=provider
```

The **provider\_class** parameter is supported with **/api/provider**
for all CRUD operations including the **refresh** action.

An example of creating a Foreman provider:

    POST /api/providers?provider_class=provider

``` json
{
  "type"      : "ManageIQ::Providers::Foreman::Provider",
  "name"      : "new_foreman_111",
  "url"       : "100.200.300.111",
  "credentials" : {
    "userid"   : "foreman_admin",
    "password" : "foreman_password"
  }
}
```

When creating providers with provider\_class as *provider*, the **type**
attribute specifies the supported provider class names which include:

|                                             |
| ------------------------------------------- |
| ManageIQ::Providers::AnsibleTower::Provider |
| ManageIQ::Providers::Foreman::Provider      |
| ManageIQ::Providers::Openstack::Provider    |

**Note:**

When managing providers of *provider* provider\_class, Tagging and
Policy management does not currently apply. So requests including the
tags, policies and policy\_profiles subcollections will be rejected.

### Provider Examples

Below you will find example requests for creating various providers.

Ansible Tower Automation Manager:

``` json
{
  "type": "ManageIQ::Providers::AnsibleTower::AutomationManager",
  "name": "API test",
  "api_version": "3.1.2",
  "provider_id": 10000000000012,
  "credentials": {
    "userid": "userid",
    "password": "password"
  }
}
```

AWS:

``` json
{
  "type": "ManageIQ::Providers::Amazon::CloudManager",
  "provider_region": "us-east-1",
  "name": "Amazon Example",
  "credentials": {
    "userid": "<access key id>",
    "password": "<secret access key>"
  }
}
```

Azure:

``` json
{
  "type": "ManageIQ::Providers::Azure::CloudManager",
  "name": "Azure Example",
  "provider_region": "eastus",
  "uid_ems": "<tenant_id>",
  "subscription": "<subscription_id>",
  "credentials": {
    "userid": "<client id>",
    "password": "<client key>"
  }
}
```

Kubernetes Container Manager:

``` json
{
  "type": "ManageIQ::Providers::Kubernetes::ContainerManager",
  "name": "Kubernetes Test",
  "connection_configurations": [
    {
      "endpoint": {
        "hostname": "00.0.00.00",
        "port": "6443",
        "security_protocol": "ssl"
      },
      "authentication": {
        "authtype": "bearer",
        "auth_key": "<token_here>"
      }
    }
  ]
}
```

Microsoft System Center VMM (SCVMM):

``` json
{
  "type": "ManageIQ::Providers::Microsoft::InfraManager",
  "name": "SCVMM API example",
  "api_version": "2.1.0",
  "connection_configurations": [
    {
      "endpoint": {
        "hostname": "00.0.00.00",
        "port": "443",
        "security_protocol": "ssl"
      },
      "authentication": {
        "username": "username",
        "password": "password"
      }
    }
  ]
}
```

OpenShift Container Manager:

``` json
{
   "name":"ocp-example",
   "port":8443,
   "type":"ManageIQ::Providers::Openshift::ContainerManager",
   "hostname":"ocp.example.com",
   "connection_configurations":[
      {
         "endpoint":{
            "role":"default",
            "security_protocol":"ssl-without-validation",
            "verify_ssl":0
         },
         "authentication":{
            "authtype":"bearer",
            "type":"AuthToken",
            "auth_key":"<auth key>"
         }
      }
   ]
}
```

OpenStack Cloud Manager:

``` json
{
  "type": "ManageIQ::Providers::Openstack::CloudManager",
  "name": "API Example",
  "api_version": "v2",
  "connection_configurations": [
    {
      "endpoint": {
        "role": "default",
        "hostname": "00.0.00.001",
        "port": "5000",
        "security_protocol": "non-ssl"
      },
      "authentication": {
        "type": "ManageIQ::Providers::Openstack::CloudManager::AuthKeyPair",
        "fingerprint": "fingerprint"
      }
    }
  ]
}
```

OpenStack Infra Manager:

``` json
{
  "type": "ManageIQ::Providers::Openstack::InfraManager",
  "name": "OSP API example",
  "api_version": "v2",
  "connection_configurations": [
    {
      "endpoint": {
        "hostname": "00.0.00.00",
        "port": "5000",
        "security_protocol": "non-ssl"
      },
      "authentications": {
        "username": "username",
        "password": "password"
      }
    }
  ]
}
```

Red Hat Virtualization Manager:

``` json
{
  "type": "ManageIQ::Providers::Redhat::InfraManager",
  "name": "Sample Rhevm",
  "port": 5000,
  "hostname": "sample_rhevm.provider.com",
  "ipaddress": "100.200.300.4",
  "security_protocol": "kerberos",
  "certificate_authority": "----BEGIN CERTIFICATE----...",
  "credentials": {
    "userid": "uname",
    "password": "password"
  }
}
```

VMware Infra Manager:

``` json
{
  "type": "ManageIQ::Providers::Vmware::InfraManager",
  "name": "Sample VMWare provider",
  "hostname": "sample_vmware.provider.com",
  "ipaddress": "100.200.300.1",
  "credentials": {
    "userid": "uname",
    "password": "pword"
  }
}
```

VMware Cloud Manager:

``` json
{
  "type": "ManageIQ::Providers::Vmware::CloudManager",
  "api_version": "9.0",
  "name": "Api Test",
  "connection_configurations": [
    {
      "endpoint": {
        "port": "443",
        "hostname": "00.0.00.000"
      },
      "authentication": {
        "username": "username",
        "password": "pword"
      }
    }
  ]
}
```
