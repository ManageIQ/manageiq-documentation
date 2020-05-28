---
---

## Provision Request Supported Attributes

| Attribute Class                                           | Provision Request Attribute Group |
| --------------------------------------------------------- | --------------------------------- |
| [Requester Attributes](#requester-attributes)             | requester                         |
| [Custom Attributes](#custom-attributes)                   | vm\_fields                        |
| [Service Catalog Attributes](#service-catalog-attributes) | vm\_fields                        |
| [Schedule Attributes](#schedule-attributes)               | vm\_fields                        |
| [Network Attributes](#network-attributes)                 | vm\_fields                        |
| [Hardware Attributes](#hardware-attributes)               | vm\_fields                        |
| [Environment Attributes](#environment-attributes)         | additional\_values                |

### Requester Attributes

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

### Custom Attributes

| Attribute                              | Type    | Description                | Values             | Default   |
| -------------------------------------- | ------- | -------------------------- | ------------------ | --------- |
| dns\_servers                           | string  | DNS server list            |                    |           |
| sysprep\_organization                  | string  | Organization               |                    |           |
| sysprep\_password                      | string  | New Administrator Password |                    |           |
| sysprep\_custom\_spec                  | string  | Name                       |                    |           |
| sysprep\_server\_license\_mode         | string  | Identification             | perServer, perSeat |           |
| ldap\_ous                              | string  | LDAP Group                 |                    |           |
| sysprep\_timezone                      | string  | Timezone                   |                    |           |
| dns\_suffixes                          | string  | DNS Suffix list            |                    |           |
| sysprep\_product\_id                   | string  | ProductID                  |                    |           |
| sysprep\_identification                | string  | Identification             | domain, workgroup  |           |
| sysprep\_per\_server\_max\_connections | string  | Maximum Connections        |                    | 5         |
| sysprep\_computer\_name                | string  | Computer Name              |                    |           |
| sysprep\_workgroup\_name               | string  | Workgroup Name             |                    | WORKGROUP |
| sysprep\_spec\_override                | boolean | Override Specification     |                    | false     |
| addr\_mode                             | string  | Address Mode               | static, dhcp       | dhcp      |
| linux\_host\_name                      | string  | Computer Name              |                    |           |
| sysprep\_domain\_admin                 | string  | Domain Admin               |                    |           |
| sysprep\_change\_sid                   | boolean | Change SID                 |                    | true      |
| sysprep\_domain\_name                  | string  | Domain Name                |                    |           |
| sysprep\_upload\_file                  | string  | Upload                     |                    |           |
| gateway                                | string  | Gateway                    |                    |           |
| ip\_addr                               | string  | IP Address                 |                    |           |
| linux\_domain\_name                    | string  | Domain Name                |                    |           |
| sysprep\_domain\_password              | string  | Domain Password            |                    |           |
| sysprep\_auto\_logon                   | boolean | Auto Logon                 |                    | true      |
| sysprep\_enabled                       | string  | Customize                  |                    | disabled  |
| sysprep\_delete\_accounts              | boolean | Delete Accounts            |                    | false     |
| sysprep\_upload\_text                  | string  | Sysprep Text               |                    |           |
| wins\_servers                          | string  | WINS Server list           |                    |           |
| subnet\_mask                           | string  | Subnet Mask                |                    |           |
| sysprep\_full\_name                    | string  | Full Name                  |                    |           |
| sysprep\_auto\_logon\_count            | integer | Auto Logon Count           | 1, 2, 3            | 1         |
| customization\_template\_id            | integer | Script Name                |                    |           |
| root\_password                         | string  | Root Password              |                    |           |
| hostname                               | string  | Host Name                  |                    |           |
| customization\_template\_script        | string  | Script Text                |                    |           |

### Service Catalog Attributes

| Attribute       | Type    | Description                       | Default |
| --------------- | ------- | --------------------------------- | ------- |
| number\_of\_vms | integer | Count. *Max*: 50                  | 1       |
| vm\_description | string  | VM Description. *Max length*: 100 |         |
| vm\_prefix      | string  | VM Name Prefix/Suffix             |         |
| src\_vm\_id     | integer | Name                              |         |
| vm\_name        | string  | VM Name                           |         |
| pxe\_image\_id  | string  | Image                             |         |
| pxe\_server\_id | integer | Server                            |         |
| host\_name      | string  | Host Name                         |         |
| provision\_type | string  | Provision Type                    | vmware  |
| linked\_clone   | boolean | Linked Clone                      | false   |
| snapshot        | string  | Snapshot                          |         |
| vm\_filter      | integer | Filter                            |         |

### Schedule Attributes

| Attribute        | Type    | Description                              | Values                                        | Default     |
| ---------------- | ------- | ---------------------------------------- | --------------------------------------------- | ----------- |
| schedule\_type   | string  | When to Provision                        | schedule, immediately (*On Approval*)         | immediately |
| vm\_auto\_start  | boolean | Power on virtual machines after creation |                                               | true        |
| schedule\_time   | time    | Time to Provision on                     |                                               |             |
| retirement       | integer | Time until Retirement                    | 0 (*Indefinite*), 1.month, 3.months, 6.months | 0           |
| retirement\_warn | integer | Retirement Warning                       | 1.week, 2.weeks, 30.days                      | 1.week      |

### Network Attributes

| Attribute    | Type   | Description |
| ------------ | ------ | ----------- |
| vlan         | string | vLan        |
| mac\_address | string | MAC Address |

### Hardware Attributes

| Attribute           | Type    | Description       | Values                 | Default   |
| ------------------- | ------- | ----------------- | ---------------------- | --------- |
| disk\_format        | string  | Disk Format       | thick, thin, unchanged | unchanged |
| cpu\_limit          | integer | CPU (MHz)         |                        |           |
| memory\_limit       | integer | Memory (MB)       |                        |           |
| number\_of\_sockets | integer | Number of Sockets | 1, 2, 4, 8             | 1         |
| cores\_per\_socket  | integer | Cores per Socket  | 1, 2, 4, 8             | 1         |
| cpu\_reserve        | integer | CPU (MHz)         |                        |           |
| vm\_memory          | string  | Memory (MB)       | 1024, 2048, 4096       | 1024      |
| memory\_reserve     | integer | Memory (MB)       |                        |           |
| network\_adapters   | integer | Network Adapters  | 1, 2, 3, 4             | 1         |

### Environment Attributes

These attributes cannot be passed directly. To use these attributes,
provide them in the **additional\_values** attribute group and have
customization methods use them and modify the request accordingly.

| Attribute                           | Type    | Description          | Values    | Default |
| ----------------------------------- | ------- | -------------------- | --------- | ------- |
| new\_datastore\_grow\_increment     | integer | Grow Increment (GB)  |           |         |
| new\_datastore\_create              | boolean | Create Datastore     |           | false   |
| placement\_cluster\_name            | integer | Name                 |           |         |
| new\_datastore\_aggregate           | string  | Aggregate            |           |         |
| new\_datastore\_max\_size           | integer | Max Size (GB)        |           |         |
| new\_datastore\_storage\_controller | string  | Controller           |           |         |
| cluster\_filter                     | integer | Filter               |           |         |
| host\_filter                        | integer | Filter               |           |         |
| ds\_filter                          | integer | Filter               |           |         |
| new\_datastore\_volume              | string  | Volume               |           |         |
| placement\_host\_name               | integer | Name                 |           |         |
| placement\_ds\_name                 | integer | Name                 |           |         |
| new\_datastore\_fs\_type            | string  | FS Type              | NFS, VMFS | NFS     |
| rp\_filter                          | integer | Filter               |           |         |
| new\_datastore\_thin\_provision     | string  | Thin Provision       |           |         |
| placement\_auto                     | boolean | Choose Automatically |           | false   |
| new\_datastore\_size                | integer | Size (GB)            |           |         |
| new\_datastore\_autogrow            | string  | Autogrow             |           | false   |
| placement\_folder\_name             | integer | Name                 |           |         |
| new\_datastore\_name                | string  | Name                 |           |         |
| placement\_rp\_name                 | integer | Name                 |           |         |
| placement\_dc\_name                 | integer | Name                 |           |         |
