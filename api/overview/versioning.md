---
---

## Version History

<table>
<colgroup>
<col style="width: 18%" />
<col style="width: 18%" />
<col style="width: 63%" />
</colgroup>
<thead>
<tr class="header">
<th>API Version &amp; Entrypoints</th>
<th>Published Release</th>
<th>Description</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p><strong>4.2.0</strong></p>
<p>/api, /api/v4.2.0</p></td>
<td><p>June 2020</p>
<p><em>Jansa</em></p></td>
<td><p>Added support for Configured Systems, Creating Providers via DDF, Requesting compliance checks, Added pagination, ordering and filtering of report result sets, Added support for Tag filtering by expression in Groups</p></td>
</tr>
<tr class="even">
<td><p><strong>4.1.0</strong></p>
<p>/api, /api/v4.1.0</p></td>
<td><p>September 2019</p>
<p><em>Ivanchuk</em></p></td>
<td><p>Added support for CRUD of Firmware Registries, Added CD-ROMs and Disks subcollection for VMs, Provisioning of Physical Servers, API authentication via OpenID-Connect, Automation Domains, Pluggable API Support, Pxe Servers, Widget Content Generation, Policy Profiles, Added Compliance subcollection to VMs</p></td>
</tr>
<tr class="odd">
<td><p><strong>4.0.0</strong></p>
<p>/api, /api/v4.0.0</p></td>
<td><p>January 2019</p>
<p><em>Hammer</em></p></td>
<td><p>Added support for Conversion Hosts, Updates of Transformation Mappings, Cloud Volume Types, Bulk Tagging of Users, Configuration Scripts, Accessing Event Streams of Physical Resources, Physical Storage, Racks, and Chassis, Physical Switches and related Power actions, Support Queued Retirement for VMs and Services, Password updates for Providers, Tagging of Availability Zones, Cloud Networks, Cloud Subnets, Flavors, Network Routers, and Security Groups, CRUD for Templates, Lans and Network Subcollection for Hosts and Providers, Folders subcollection on providers (#338) Pause and Resume actions to Providers, Chargeback Reports for Services, Settings support for Servers and Regions, Switches, Container Volumes, Container Templates, Container Images, Container Groups and Cloud Object Store Containers, Added Transformation Mapping Support, Support Enabling and Disabling Conversion Hosts</p></td>
</tr>
<tr class="even">
<td><p><strong>3.0.0</strong></p>
<p>/api, /api/v3.0.0</p></td>
<td><p>January 2018</p>
<p><em>Gaprindashvili</em></p></td>
<td><p>Settings Management, CRUD of Custom Button Sets, CRUD of Custom Buttons, Support Automate Workspaces, Support Service Dialog query parameters, Dialog Field Refresh Enhancement, Updating request tasks, Support additional VM decorators, Return the full dialog upon Service Dialog creates and edits, Support add_providers_vms action on Services, Deleting Tasks, Support Event Streams, Support set_current_group for Users, Support Custom Attributes on Services and Instances, Deprecated Orchestration Template classes, Return picture href for generic object subcollections, Return image_href and extensions with Pictures, Support Security groups, Creating Providers require credentials, CRUD for Generic Object Definitions, CRUD for Generic Objects, VMs Subcollection for Providers, Querying Container Projects, Removed Arbitration Profiles, Rules and Settings, Flavor Management, Management of Physical Servers, Support Guest Devices, Support Metrics Rollups, Querying by multiple tags, Querying Floating IPs, Query and Delete Network Routers, Support set_miq_server action on VMs, Querying Cloud Subnets, Enabled pagination by default, Delete Cloud Volumes, Support Configuration Script Payload subcollection, Removed Blueprint support, Return hrefs on create, Enable custom actions for several collections, Support DELETE method for Custom Attributes, Support multi-manager Provider refreshes, Refreshing Authentications, Refreshing Configuration Script Sources, Enable edits for Automation and Provision Requests, Assigning and Unassigning Policies from Policy Profiles</p></td>
</tr>
<tr class="odd">
<td><p><strong>2.4.0</strong></p>
<p>/api, /api/v2.4.0</p></td>
<td><p>June 2017</p>
<p><em>fine</em></p></td>
<td><p>CRUD on actions, Creating and accessing alert actions of alert resources, CRUD on Alert Definitions, Querying Alerts, CRUD on Authentications, CRUD on Conditions, Querying Cloud Volumes, Querying Configuration Script Payloads, Creating and querying Authentications of Configuration Script Payloads, CRUD on Configuration Script Sources, Querying Load Balancers, Copying Orchestration Templates, CRUD on Policies, Accessing Load Balancers of Providers, Importing VMs in Providers, Querying Regions, CRUD and Copy of Service Dialogs, Copying Service Orders, Accessing Orchestration Stacks of Services, Bulk assignment of Tags on Services, Adding and Removing Resources of Services, Adding and Removing Approvers to Service Requests, CRUD of Service Templates, Editing Vms, Creating, Querying, Reverting and Deleting Snapshots of Vms, Bulk assignment of Tags on Vms, Creating, Querying and Deleting Snapshots of Instances</p></td>
</tr>
<tr class="even">
<td><p><strong>2.3.0</strong></p>
<p>/api, /api/v2.3.0</p></td>
<td><p>December 2016</p>
<p><em>Euwe</em></p></td>
<td><p>Automate Collection, Automate Domains Collection, Automate Domain refresh_from_source, Collection OPTIONS and metadata, Service Power Operations, Picture Create action, Delete Service Dialogs, Bulk Queries, CRUD on Notifications, Blueprint Collection, CRUD, publishing, and Tagging, Custom Attributes on Providers, Additional Server information provided in API entry point, CRUD on Arbitration Profiles, CRUD on Arbitration Rules, CRUD on Arbitration Settings, Queries of Virtual Templates, Cloud Networks subcollection for Providers, Service Create action, CRUD on Orchestration Templates</p></td>
</tr>
<tr class="odd">
<td><p><strong>2.2.0</strong></p>
<p>/api, /api/v2.2.0</p></td>
<td><p>June 2016</p>
<p><em>Darga</em></p></td>
<td><p>CRUD on Groups, CRUD on Users, Updating a Host password, Service Reconfigure action, Additional Vm collection actions, Instance collection actions, Approve/Deny provision and automation requests, Delete one’s own authentication token, Filtering enhancements to support virtual attributes, Querying enhancements to support case insensitive sorting, CRUD on Tenant quotas, Exposing read-only subset of Settings, Shopping Carts</p></td>
</tr>
<tr class="even">
<td><p><strong>2.1.0</strong></p>
<p>/api, /api/v2.1.0</p></td>
<td><p>November 2015</p>
<p><em>Capablanca</em></p></td>
<td><p>CRUD on Tenants, CRUD on Categories and Tags, CRUD on User Roles, CRUD on Chargeback Rates, Tagging Tenants, Changing user password, Querying reports, importing and running reports, Querying service dialogs of service template and services, Querying pictures of services, service requests and service templates, Custom buttons and dialogs support on services and service templates, Ability to trigger custom actions on services, Setting ownership on Services, Vms and Templates, User group authorization, Additional Primary Collections: Features, Roles, Tenants, Service dialogs, Provision dialogs, Reports, Chargebacks, Rates, Categories, Tags</p></td>
</tr>
<tr class="odd">
<td><p><strong>2.0.0</strong></p>
<p>/api, /api/v2.0.0</p></td>
<td><p>May 2015</p>
<p><em>Botvinnik</em></p></td>
<td><p>Parity with SOAP API, Support for Providers CRUD &amp; Refresh action, VM Control Management, VM Custom Attributes, Improved Tagging queries, Tag Management, Policy and Policy Profile Management, Improved Action Result responses, Expanded Primary collections</p></td>
</tr>
<tr class="even">
<td><p><strong>1.1</strong></p>
<p>/api, /api/v1.1</p></td>
<td><p>October 2014</p>
<p><em>Anand</em></p></td>
<td><p>CVE-2014-7814 Fix, sqlfilter replaced with new filter[] parameter</p></td>
</tr>
<tr class="odd">
<td><p><strong>1.0</strong></p>
<p>/api, /api/v1.0</p></td>
<td><p>August 2014</p></td>
<td><p>Foundation, Collections, Resources and Subcollections, Querying, Filtering, Paging, and Sorting, Tagging, Service Catalog Management, Service Ordering, Provision Requests, Automation Requests</p></td>
</tr>
</tbody>
</table>
