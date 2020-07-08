---
---

## Conversion Hosts

Management of conversion hosts is provided via the following collection:

``` data
/api/conversion_hosts
```

The following actions are available for conversion hosts:

  - [Querying Conversion Hosts](#querying-conversion-hosts)

  - [Creating Conversion Hosts](#creating-conversion-hosts)

  - [Deleting Conversion Hosts](#deleting-conversion-hosts)

### Querying Conversion Hosts

To query all conversion hosts:

    GET /api/conversion_hosts

To query a specific conversion host’s details:

    GET /api/conversion_hosts/:id

### Creating Conversion Hosts

Conversion hosts can be created via the *create* POST action by posting
the request directly to **/api/conversion\_hosts**.

``` json
{
  "resource_type": "ManageIQ::Providers::Redhat::InfraManager::Host",
  "resource_id": 00000000000004,
  "auth_user": "root",
  "conversion_host_ssh_private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvQI[...]gaS2cBrzxn3IQKTabc=\n-----END PRIVATE KEY-----\n",
  "vmware_vddk_package_url": "http://file.example.com/vddk/VMware-vix-disklib-stable.tar.gz"
}
```

#### Conversion Host Attributes

<table>
<colgroup>
<col style="width: 33%" />
<col style="width: 33%" />
<col style="width: 33%" />
</colgroup>
<thead>
<tr class="header">
<th>Attribute Group</th>
<th>Type</th>
<th>Description</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p>resource_type</p></td>
<td><p>string</p></td>
<td><p>Type of resource that is acting as a conversion host:</p>
<ul>
<li><p>oVirt / RHV Host: <code>ManageIQ::Providers::Redhat::InfraManager::Host</code></p></li>
<li><p>oVirt / RHV VM: <code>ManageIQ::Providers::Redhat::InfraManager::Vm</code></p></li>
<li><p>OpenStack VM: <code>ManageIQ::Providers::Openstack::CloudManager::Vm</code></p></li>
</ul></td>
</tr>
<tr class="even">
<td><p>resource_id</p></td>
<td><p>integer</p></td>
<td><p>ID of the resource acting as a conversion host</p></td>
</tr>
<tr class="odd">
<td><p>auth_user</p></td>
<td><p>string</p></td>
<td><p>User name for the SSH connection to a conversion host</p></td>
</tr>
<tr class="even">
<td><p>conversion_host_ssh_private_key</p></td>
<td><p>string</p></td>
<td><p>SSH private key for SSH connection to a conversion host. Line breaks must be replaced with <code>\n</code>.</p></td>
</tr>
<tr class="odd">
<td><p>vmware_vddk_package_url</p></td>
<td><p>string</p></td>
<td><p><strong><em>Only for VDDK transport</em></strong>. URL of downloaded VMware VDDK <code>tar.gz</code> archive file. The VDDK must be saved in an HTML-accessible location.</p></td>
</tr>
<tr class="even">
<td><p>vmware_ssh_private_key</p></td>
<td><p>string</p></td>
<td><p><strong><em>Only for SSH transport</em></strong>. SSH private key for SSH connection to the VMware ESXi hosts. Line breaks must be replaced with <code>\n</code>.</p></td>
</tr>
<tr class="odd">
<td><p>tls_ca_certs</p></td>
<td><p>string</p></td>
<td><p>CA certificate chain for validating the provider API endpoint certificate.</p></td>
</tr>
</tbody>
</table>

#### Response

Creating a conversion host can take a few minutes because the resource
is configured by an Ansible playbook. For this reason, the conversion
host creation process is asynchronous.

The response provides the ID and the URL of the configuration task.

``` json
{
  "results": [
    {
      "success": true,
      "message": "Enabling resource id:00000000000004 type:ManageIQ::Providers::Redhat::InfraManager::Host",
      "task_id": "00000000000005",
      "task_href": "http://localhost:3000/api/tasks/00000000000005",
      "href": "https://localhost:3000/api/conversion_hosts/"
    }
  ]
}
```

#### Monitoring Configuration Tasks

To monitor the conversion host configuration tasks:

    GET /api/tasks/:id

``` json
{
  "href": "http://localhost:3000/api/tasks/00000000000005",
  "id": "00000000000005",
  "name": "Configuring a conversion_host: operation=enable resource=(name: rhvh01.example.com type: ManageIQ::Providers::Redhat::InfraManager::Host id: 00000000000004)",
  "state": "Active",
  "status": "Ok",
  "message": "Task starting",
  "userid": "root",
  "created_on": "2019-09-10T07:21:36Z",
  "updated_on": "2019-09-10T07:21:37Z",
  "pct_complete": null,
  "context_data": {
    "request_params": {
      "resource_type": "Host",
      "resource_id": "00000000000004",
      "vmware_vddk_package_url": "http://file.example.com/vddk/VMware-vix-disklib-stable.tar.gz",
      "auth_user": "root"
    }
  },
  "results": null,
  "miq_server_id": "00000000000001",
  "identifier": null,
  "started_on": "2019-09-10T07:21:37Z",
  "zone": null,
  "actions": [
    {
      "name": "delete",
      "method": "post",
      "href": "http://localhost:3000/api/tasks/00000000000005"
    },
    {
      "name": "delete",
      "method": "delete",
      "href": "http://localhost:3000/api/tasks/00000000000005"
    }
  ]
}
```

### Deleting Conversion Hosts

Conversion hosts can be deleted with either the **delete** `POST` action
or the `DELETE` HTTP action.

To delete a single conversion host:

    POST /api/conversion_hosts/101

``` json
{
  "action" : "delete"
}
```

or:

    DELETE /api/conversion_hosts/101

To delete multiple conversion hosts:

    POST /api/conversion_hosts

``` json
{
  "action" : "delete",
  "resources" : [
    { "href" : "http://localhost:3000/api/conversion_hosts/101" },
    { "href" : "http://localhost:3000/api/conversion_hosts/102" },
    ...
  ]
}
```
