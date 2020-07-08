### Provisioning Request Attributes

  - [Request Attribute Groups](#provision-requests-attribute-groups)

  - [Requester Attributes](#requester-attributes)

  - [Custom Attributes](#custom-attributes)

  - [Environment Attributes](#environment-attributes)

  - [Service Catalog Attributes](#service-catalog-attributes)

  - [Schedule Attributes](#schedule-attributes)

  - [Network Attributes](#network-attributes)

  - [Hardware Attributes](#hardware-attributes)

#### Provisioning Request Attribute Groups

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
<td><p>version</p></td>
<td><p>string</p></td>
<td><p>Interface version. Defaults to 1.1</p></td>
</tr>
<tr class="even">
<td><p>template_fields</p></td>
<td><p>hash</p></td>
<td><p>Fields used to find the template virtual machine. Provide any or all fields. Supply a guid or ems_guid to protect against matching same-named templates on different Providers within the appliance.</p>
<p>Supported fields are: name=[VM Template Name] Example: template_1 guid=[guid value from vms resource] ems_guid=[uid_ems value from vms resource]</p></td>
</tr>
<tr class="odd">
<td><p>vm_fields</p></td>
<td><p>hash</p></td>
<td><p>Allows for setting properties on the Service Catalog, Hardware, Network, Customize, and Schedule tabs in the Provisioning dialog.</p></td>
</tr>
<tr class="even">
<td><p>requester</p></td>
<td><p>hash</p></td>
<td><p>Allows for the setting of properties on the Requester tab in the Provisioning dialog.</p></td>
</tr>
<tr class="odd">
<td><p>tags</p></td>
<td><p>hash</p></td>
<td><p>Tags to apply to newly created virtual machine.</p>
<p>Example: network_location=Internal cc=001</p></td>
</tr>
<tr class="even">
<td><p>additional_values</p></td>
<td><p>hash</p></td>
<td><p>Additional values are name-value pairs stored with a provision request, but not used by the core provisioning code. These values are usually referenced from automate methods for custom processing.</p>
<p>Example: Store a request_id from an external system so the system can be notified during the provisioning process.</p></td>
</tr>
<tr class="odd">
<td><p>ems_custom_attributes</p></td>
<td><p>hash</p></td>
<td><p>Custom attributes applied to the virtual machine through the Provider as part of provisioning.</p></td>
</tr>
<tr class="even">
<td><p>miq_custom_attributes</p></td>
<td><p>hash</p></td>
<td><p>Custom attributes applied to the virtual machine and stored in the database as part of provisioning.</p></td>
</tr>
</tbody>
</table>

#### Service Catalog Attributes

These attributes are used in the `vm_fields` attribute group:

| Attribute       | Type    | Description                                          | Default |
| --------------- | ------- | ---------------------------------------------------- | ------- |
| number\_of\_vms | integer | Number of virtual machines - maximum 50              | 1       |
| vm\_description | string  | Virtual machine description - maximum 100 characters |         |
| vm\_prefix      | string  | Virtual machine name prefix or suffix                |         |
| src\_vm\_id     | integer | Name                                                 |         |
| vm\_name        | string  | Virtual machine name                                 |         |
| pxe\_image\_id  | string  | Image                                                |         |
| pxe\_server\_id | integer | Server                                               |         |
| host\_name      | string  | Host name                                            |         |
| provision\_type | string  | Provision type                                       | vmware  |
| linked\_clone   | boolean | Linked clone                                         | false   |
| snapshot        | string  | Snapshot                                             |         |
| vm\_filter      | integer | Filter                                               |         |

#### Hardware Attributes

These attributes are used in the `vm_fields` attribute group:

| Attribute           | Type    | Description       | Values                 | Default   |
| ------------------- | ------- | ----------------- | ---------------------- | --------- |
| disk\_format        | string  | Disk format       | thick, thin, unchanged | unchanged |
| cpu\_limit          | integer | CPU (MHz)         |                        |           |
| memory\_limit       | integer | Memory (MB)       |                        |           |
| number\_of\_sockets | integer | Number of sockets | 1, 2, 4, 8             | 1         |
| cores\_per\_socket  | integer | Cores per socket  | 1, 2, 4, 8             | 1         |
| cpu\_reserve        | integer | CPU (MHz)         |                        |           |
| vm\_memory          | string  | Memory (MB)       | 1024, 2048, 4096       | 1024      |
| memory\_reserve     | integer | Memory (MB)       |                        |           |
| network\_adapters   | integer | Network adapters  | 1, 2, 3, 4             | 1         |

#### Network Attributes

These attributes are used in the `vm_fields` attribute group:

| Attribute    | Type   | Description |
| ------------ | ------ | ----------- |
| vlan         | string | vLAN        |
| mac\_address | string | MAC address |

#### Custom Attributes

These attributes are used in the `vm_fields` attribute group:

| Attribute                              | Type    | Description                                                                         | Values             | Default   |
| -------------------------------------- | ------- | ----------------------------------------------------------------------------------- | ------------------ | --------- |
| dns\_servers                           | string  | DNS server list                                                                     |                    |           |
| sysprep\_organization                  | string  | Organization                                                                        |                    |           |
| sysprep\_password                      | string  | New administrator password                                                          |                    |           |
| sysprep\_custom\_spec                  | string  | Name (Note: This is not supported when being passed by VMware through an API call.) |                    |           |
| sysprep\_server\_license\_mode         | string  | Identification                                                                      | perServer, perSeat |           |
| ldap\_ous                              | string  | LDAP group                                                                          |                    |           |
| sysprep\_timezone                      | string  | Timezone                                                                            |                    |           |
| dns\_suffixes                          | string  | DNS suffix list                                                                     |                    |           |
| sysprep\_product\_id                   | string  | ProductID                                                                           |                    |           |
| sysprep\_identification                | string  | Identification                                                                      | domain, workgroup  |           |
| sysprep\_per\_server\_max\_connections | string  | Maximum connections                                                                 |                    | 5         |
| sysprep\_computer\_name                | string  | Computer name                                                                       |                    |           |
| sysprep\_workgroup\_name               | string  | Workgroup name                                                                      |                    | WORKGROUP |
| sysprep\_spec\_override                | boolean | Override specification                                                              |                    | false     |
| addr\_mode                             | string  | Address mode                                                                        | static, dhcp       | dhcp      |
| linux\_host\_name                      | string  | Computer name                                                                       |                    |           |
| sysprep\_domain\_admin                 | string  | Domain admin                                                                        |                    |           |
| sysprep\_change\_sid                   | boolean | Change SID                                                                          |                    | true      |
| sysprep\_domain\_name                  | string  | Domain name                                                                         |                    |           |
| sysprep\_upload\_file                  | string  | Upload                                                                              |                    |           |
| gateway                                | string  | Gateway                                                                             |                    |           |
| ip\_addr                               | string  | IP address                                                                          |                    |           |
| linux\_domain\_name                    | string  | Domain name                                                                         |                    |           |
| sysprep\_domain\_password              | string  | Domain password                                                                     |                    |           |
| sysprep\_auto\_logon                   | boolean | Auto Logon                                                                          |                    | true      |
| sysprep\_enabled                       | string  | Customize                                                                           |                    | disabled  |
| sysprep\_delete\_accounts              | boolean | Delete accounts                                                                     |                    | false     |
| sysprep\_upload\_text                  | string  | Sysprep text                                                                        |                    |           |
| wins\_servers                          | string  | WINS server list                                                                    |                    |           |
| subnet\_mask                           | string  | Subnet mask                                                                         |                    |           |
| sysprep\_full\_name                    | string  | Full name                                                                           |                    |           |
| sysprep\_auto\_logon\_count            | integer | Auto logon count                                                                    | 1, 2, 3            | 1         |
| customization\_template\_id            | integer | Script name                                                                         |                    |           |
| root\_password                         | string  | Root password                                                                       |                    |           |
| hostname                               | string  | Host name                                                                           |                    |           |
| customization\_template\_script        | string  | Script text                                                                         |                    |           |

#### Schedule Attributes

These attributes are used in the `vm_fields` attribute group:

| Attribute        | Type    | Description                              | Values                                        | Default     |
| ---------------- | ------- | ---------------------------------------- | --------------------------------------------- | ----------- |
| schedule\_type   | string  | When to provision                        | schedule, immediately (*On Approval*)         | immediately |
| vm\_auto\_start  | boolean | Power on virtual machines after creation |                                               | true        |
| schedule\_time   | time    | Time to provision on                     |                                               |             |
| retirement       | integer | Time until retirement                    | 0 (*Indefinite*), 1.month, 3.months, 6.months | 0           |
| retirement\_warn | integer | Retirement warning                       | 1.week, 2.weeks, 30.days                      | 1.week      |

#### Requester Attributes

These attributes are used in the **requester** attribute group:

| Attribute             | Type   | Description                 |
| --------------------- | ------ | --------------------------- |
| owner\_phone          | string | Phone                       |
| owner\_country        | string | Country/Region              |
| owner\_phone\_mobile  | string | Mobile phone                |
| owner\_title          | string | Title                       |
| owner\_first\_name    | string | First name                  |
| owner\_manager        | string | Manager name                |
| owner\_address        | string | Address                     |
| owner\_company        | string | Company                     |
| owner\_last\_name     | string | Last name                   |
| owner\_manager\_email | string | Manager e-mail address      |
| owner\_city           | string | City                        |
| owner\_department     | string | Department                  |
| owner\_load\_ldap     | button | Look up LDAP e-mail address |
| owner\_manager\_phone | string | Manager phone               |
| owner\_state          | string | State                       |
| owner\_office         | string | Office                      |
| owner\_zip            | string | Zip code                    |
| owner\_email          | string | E-Mail                      |
| request\_notes        | string | Notes                       |

#### Environment Attributes

These attributes cannot be passed directly. To use these attributes,
provide **additional\_values** and allow customization methods to use
these attributes, then modify the request accordingly.

| Attribute                           | Type    | Description          | Values    | Default                                                                                                                 |
| ----------------------------------- | ------- | -------------------- | --------- | ----------------------------------------------------------------------------------------------------------------------- |
| new\_datastore\_grow\_increment     | integer | Grow increment (GB)  |           |                                                                                                                         |
| new\_datastore\_create              | boolean | Create datastore     |           | false                                                                                                                   |
| placement\_cluster\_name            | integer | Name                 |           |                                                                                                                         |
| new\_datastore\_aggregate           | string  | Aggregate            |           |                                                                                                                         |
| new\_datastore\_max\_size           | integer | Max size (GB)        |           |                                                                                                                         |
| new\_datastore\_storage\_controller | string  | Controller           |           |                                                                                                                         |
| cluster\_filter                     | integer | Filter               |           |                                                                                                                         |
| host\_filter                        | integer | Filter               |           |                                                                                                                         |
| ds\_filter                          | integer | Filter               |           |                                                                                                                         |
| new\_datastore\_volume              | string  | Volume               |           |                                                                                                                         |
| placement\_host\_name               | integer | Name                 |           |                                                                                                                         |
| placement\_ds\_name                 | integer | Name                 |           |                                                                                                                         |
| new\_datastore\_fs\_type            | string  | FS Type              | NFS, VMFS | NFS                                                                                                                     |
| rp\_filter                          | integer | Filter               |           |                                                                                                                         |
| new\_datastore\_thin\_provision     | string  | Thin provision       |           |                                                                                                                         |
| placement\_auto                     | boolean | Choose automatically |           | false (**NOTE**: placement\_auto defaults to `true` for requests made from the API or {{ site.data.product.title_short }} Automate.) |
| new\_datastore\_size                | integer | Size (GB)            |           |                                                                                                                         |
| new\_datastore\_autogrow            | string  | Autogrow             |           | false                                                                                                                   |
| placement\_folder\_name             | integer | Name                 |           |                                                                                                                         |
| new\_datastore\_name                | string  | Name                 |           |                                                                                                                         |
| placement\_rp\_name                 | integer | Name                 |           |                                                                                                                         |
| placement\_dc\_name                 | integer | Name                 |           |                                                                                                                         |
