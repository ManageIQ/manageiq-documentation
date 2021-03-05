## Methods Available for Use with {{ site.data.product.title_short }}

Methods can be used from within {{ site.data.product.title_short }} to create custom actions
and workflows for the objects managed for your {{ site.data.product.title_short }}
Infrastructure. This document describes the methods available for use in
{{ site.data.product.title_short }}. This document is organized by the object hierarchy in
the Automate Model.

**Note:**

Users of {{ site.data.product.title_short }} can construct custom automation methods in Ruby
to extend the product. {{ site.data.product.title_short }} ships with a core set of Ruby
gems used by the {{ site.data.product.title_short }} Rails Application. The Ruby gems in
this set are subject to change, and have changed since the previous
version. If you are calling gems using Automate that are no longer in
the {{ site.data.product.title_short }} appliance, you can install them by using the `gem
install` command.

While gems can be imported into automation methods using `require`, it
is recommended that the authors of the automation methods clearly
document the use of gems either in the core set or a custom set. It is
the responsibility of the author of such custom automation to own the
life cycle of any gem being referenced in those methods.

{% include_relative _topics/about_evm.root.md %}

{% include_relative _topics/method_hierarchy.md %}

{% include_relative _topics/base_methods.md %}

{% include_relative _topics/availability_zones_availability_zone.md
%}

{% include_relative _topics/classifications_classification.md %}

{% include_relative _topics/cloud_networks_cloud_network.md %}

{% include_relative
_topics/cloud_resource_quotas_cloud_resource_quota.md %}

{% include_relative _topics/cloud_subnets_cloud_subnet.md %}

{% include_relative _topics/cloud_tenants_cloud_tenant.md %}

{% include_relative _topics/customization_template.md %}

### Clusters (ems\_cluster)

| Method                  | Use                                                             |
| ----------------------- | --------------------------------------------------------------- |
| all\_resource\_pools    | Return all of the objects Resource Pools                        |
| all\_vms                | Return all of the objects Virtual Machines                      |
| default\_resource\_pool | Return the objects default Resource Pool                        |
| ems\_events             | Returns an array of EmsEvent records associated with the object |
| ext\_management\_system | Return objects Management System                                |
| hosts                   | Return objects Hosts                                            |
| parent\_folder          | Return objects Parent Folder                                    |
| register\_host(host)    | Register Host to this Cluster                                   |
| resource\_pools         | Return objects Resource Pools                                   |
| storages                | Return objects datastores                                       |
| vms                     | Return objects Virtual Machines                                 |

``` ruby
  #########################
  #
  # Method: dumpCluster
  # Inputs: $evm.root['ems_cluster']
  # Description: Dump Cluster information
  #
  ##########################
  def dumpCluster(cluster)
    $evm.log("info","#{@log_prefix} - Cluster:<#{cluster.name}> Begin Attributes")
    cluster.attributes.sort.each { |k, v| $evm.log("info", "#{@log_prefix} - Cluster:<#{cluster.name}> Attributes - #{k}: #{v.inspect}")}
    $evm.log("info","#{@log_prefix} - Cluster:<#{cluster.name}> End Attributes")
    $evm.log("info","")

    $evm.log("info","#{@log_prefix} - Cluster:<#{cluster.name}> Begin Associations")
    cluster.associations.sort.each { |assc| $evm.log("info", "#{@log_prefix} - Cluster:<#{cluster.name}> Associations - #{assc}")}
    $evm.log("info","#{@log_prefix} - Cluster:<#{cluster.name}> End Associations")
    $evm.log("info","")

    $evm.log("info","#{@log_prefix} - Cluster:<#{cluster.name}> Begin Virtual Columns")
    cluster.virtual_column_names.sort.each { |vcn| $evm.log("info", "#{@log_prefix} - Cluster:<#{cluster.name}> Virtual Columns - #{vcn}: #{cluster.send(vcn)}")}
    $evm.log("info","#{@log_prefix} - Cluster:<#{cluster.name}> End Virtual Columns")
    $evm.log("info","")
  end
```

{% include_relative _topics/management_system_events_ems_event.md
%}

{% include_relative
_topics/management_system_folders_ems_folder.md %}

### Providers (ext\_management\_system)

| Method                              | Use                                                                        |
| ----------------------------------- | -------------------------------------------------------------------------- |
| authentication\_password\_encrypted | Returns credentials password encrypted                                     |
| authentication\_password            | Returns credentials password unencrypted                                   |
| authentication\_userid              | Returns credentials user id                                                |
| ems\_clusters                       | Returns objects clusters                                                   |
| ems\_events                         | Returns an array of EmsEvent records associated with the object            |
| ems\_folders                        | Returns objects folders                                                    |
| hosts                               | Returns objects hosts                                                      |
| refresh                             | Refreshes relationships and power states for objects related to the object |
| resource\_pools                     | Returns objects resource pools                                             |
| storages                            | Returns objects storages                                                   |
| vms                                 | Returns objects vms                                                        |
| to\_s                               | Converts object to string                                                  |

``` ruby
  #########################
  #
  # Method: dumpEMS
  # Inputs: $evm.root['ext_management_system']
  # Description: Dump EMS information
  #
  ##########################
  def dumpEMS(ems)
    $evm.log("info","#{@log_prefix} - EMS:<#{ems.name}> Begin Attributes")
    ems.attributes.sort.each { |k, v| $evm.log("info", "#{@log_prefix} - EMS:<#{ems.name}> Attributes - #{k}: #{v.inspect}")}
    $evm.log("info","#{@log_prefix} - EMS:<#{ems.name}> End Attributes")
    $evm.log("info","")

    $evm.log("info","#{@log_prefix} - EMS:<#{ems.name}> Begin Associations")
    ems.associations.sort.each { |assc| $evm.log("info", "#{@log_prefix} - EMS:<#{ems.name}> Associations - #{assc}")}
    $evm.log("info","#{@log_prefix} - EMS:<#{ems.name}> End Associations")
    $evm.log("info","")

    $evm.log("info","#{@log_prefix} - EMS:<#{ems.name}> Begin EMS Folders")
    ems.ems_folders.each { |ef| ef.attributes.sort.each { |k,v| $evm.log("info", "#{@log_prefix} - EMS:<#{ems.name}> EMS Folder:<#{ef.name}> #{k}: #{v.inspect}")}}
    $evm.log("info","#{@log_prefix} - EMS:<#{ems.name}> End EMS Folders")
    $evm.log("info","")

    $evm.log("info","#{@log_prefix} - EMS:<#{ems.name}> Begin Virtual Columns")
    ems.virtual_column_names.sort.each { |vcn| $evm.log("info", "#{@log_prefix} - EMS:<#{ems.name}> Virtual Columns - #{vcn}: #{ems.send(vcn)}")}
    $evm.log("info","#{@log_prefix} - EMS:<#{ems.name}> End Virtual Columns")
    $evm.log("info","")
  end
```

{% include_relative _topics/cloud_providers_ems_cloud.md %}

{% include_relative _topics/firewall_rules_firewall_rule.md %}

{% include_relative _topics/flavors_flavor.md %}

{% include_relative _topics/floating_ips_floating_ip.md %}

{% include_relative _topics/guest_applications_guest_application.md
%}

{% include_relative _topics/guest_device_guest_device.md %}

{% include_relative _topics/hardware_hardware.md %}

### Hosts (host)

<table>
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<thead>
<tr class="header">
<th>Method</th>
<th>Use</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p>authentication_password</p></td>
<td><p>Returns credential password</p></td>
</tr>
<tr class="even">
<td><p>authentication_userid</p></td>
<td><p>Returns credential user</p></td>
</tr>
<tr class="odd">
<td><p>datacenter</p></td>
<td><p>Returns datacenter</p></td>
</tr>
<tr class="even">
<td><p>directories</p></td>
<td><p>Returns list of directories for the object</p></td>
</tr>
<tr class="odd">
<td><p>domain</p></td>
<td><p>Returns the domain portion of the hostname</p></td>
</tr>
<tr class="even">
<td><p>ems_cluster</p></td>
<td><p>Returns cluster</p></td>
</tr>
<tr class="odd">
<td><p>ems_events</p></td>
<td><p>Returns an array of EmsEvent records associated with the object</p></td>
</tr>
<tr class="even">
<td><p>ems_folder</p></td>
<td><p>Returns hosts folder on Management System</p></td>
</tr>
<tr class="odd">
<td><p>event_log_threshold?(options)</p></td>
<td><p>Searches event log records to determine if an event has occurred x number of times within a defined time frame. Returns true if the number of matching records found are greater or equal to the specified freq_threshold, otherwise it returns false</p>
<p>Options values:</p>
<p>:message_filter_type - Must be one of "STARTS WITH", "ENDS WITH", "INCLUDES", "REGULAR EXPRESSION"</p>
<p>:message_filter_value - &lt;string value to search for&gt;</p>
<p>:time_threshold - Options time interval to search. Example: 2.days (Search the past 2 days of event logs) Default 10.days</p>
<p>:freq_threshold - Number of occurrences to check for. Default = 2</p>
<p>:source, :event_id, :level, :name - Options filter values</p></td>
</tr>
<tr class="even">
<td><p>ext_management_system</p></td>
<td><p>Returns Management System</p></td>
</tr>
<tr class="odd">
<td><p>files</p></td>
<td><p>Returns list of files for the object</p></td>
</tr>
<tr class="even">
<td><p>guest_applications</p></td>
<td><p>Returns Guest Applications</p></td>
</tr>
<tr class="odd">
<td><p>hardware</p></td>
<td><p>Returns hardware</p></td>
</tr>
<tr class="even">
<td><p>lans</p></td>
<td><p>Returns LANs</p></td>
</tr>
<tr class="odd">
<td><p>operating_system</p></td>
<td><p>Returns Operating System</p></td>
</tr>
<tr class="even">
<td><p>storages</p></td>
<td><p>Returns datastores</p></td>
</tr>
<tr class="odd">
<td><p>switches</p></td>
<td><p>Returns network switches</p></td>
</tr>
<tr class="even">
<td><p>vms</p></td>
<td><p>Returns VMs.</p></td>
</tr>
<tr class="odd">
<td><p>credentials(type = :remote)</p></td>
<td><p>Returns credentials for a Host for the specified type as an array for username/pwd. (Default type is :remote if no type is specified.)</p>
<p>Supports 4 different types of credentials:</p>
<p>:default = Default</p>
<p>:remote = Remote Login (think SSH for ESX)</p>
<p>:ws = Web Services</p>
<p>:ipmi = IPMI</p>
<p>Example 1:</p>
<p>cred = host.credentials</p>
<p>cred ⇒ ["user", "pwd"]</p>
<p>Example 2:</p>
<p>user_str, pwd_str = host.credentials(:ipmi)</p>
<p>user_str ⇒ "user"</p>
<p>pwd_str ⇒ "pwd"</p></td>
</tr>
<tr class="even">
<td><p>ems_custom_keys</p></td>
<td><p>Returns Management Systems custom keys</p></td>
</tr>
<tr class="odd">
<td><p>ems_custom_get(key)</p></td>
<td><p>Gets Value for specified Management Systems custom key</p></td>
</tr>
<tr class="even">
<td><p>ems_custom_set(attribute, value)</p></td>
<td><p>Sets value for specified custom key of the Management System</p></td>
</tr>
<tr class="odd">
<td><p>custom_keys</p></td>
<td><p>Lists {{ site.data.product.title_short }} Server custom keys</p></td>
</tr>
<tr class="even">
<td><p>custom_get(key)</p></td>
<td><p>Gets value for specified {{ site.data.product.title_short }} Server custom key</p></td>
</tr>
<tr class="odd">
<td><p>custom_set(key, value)</p></td>
<td><p>Sets value for specified {{ site.data.product.title_short }} Server custom key</p></td>
</tr>
<tr class="even">
<td><p>ssh_exec(script)</p></td>
<td><p>Runs the specified script on the host</p></td>
</tr>
<tr class="odd">
<td><p>get_realtime_metric(metric, range, function)</p></td>
<td><p>Returns specified realtime metric</p></td>
</tr>
<tr class="even">
<td><p>current_memory_usage</p></td>
<td><p>Returns current memory usage</p></td>
</tr>
<tr class="odd">
<td><p>current_cpu_usage</p></td>
<td><p>Returns current cpu usage</p></td>
</tr>
<tr class="even">
<td><p>current_memory_headroom</p></td>
<td><p>Returns current memory headroom</p></td>
</tr>
<tr class="odd">
<td><p>to_s</p></td>
<td><p>Converts object to string</p></td>
</tr>
<tr class="even">
<td><p>scan</p></td>
<td><p>Performs SmartState Analysis on the object</p></td>
</tr>
</tbody>
</table>

The following table lists the metric types available for the
`get_realtime_metric(metric, range, function)` method for hosts.

| Metric                               | Description                                            |
| ------------------------------------ | ------------------------------------------------------ |
| v\_derived\_storage\_used            | Capacity - Used space in bytes                         |
| v\_pct\_cpu\_ready\_delta\_summation | CPU - Percentage ready                                 |
| v\_pct\_cpu\_wait\_delta\_summation  | CPU - Percentage wait                                  |
| v\_pct\_cpu\_used\_delta\_summation  | CPU - Percentage used                                  |
| v\_derived\_host\_count              | State - Number of hosts (Hourly Count / Daily Average) |
| v\_derived\_cpu\_reserved\_pct       | CPU - Percentage available                             |
| v\_derived\_memory\_reserved\_pct    | Memory - Percentage available                          |

The following Ruby snippet demonstrates using the
`get_realtime_metric(metric, range, function)` method using the
`v_pct_cpu_ready_delta_summation` metric.

``` ruby
host = $evm.root['host']
cpu_rdy = host.get_realtime_metric(:v_pct_cpu_ready_delta_summation, [15.minutes.ago.utc,5.minutes.ago.utc], :avg)
```

``` ruby
#########################
  #
  # Method: dumpHost
  # Inputs: $evm.root['host']
  # Description: Dump Host information
  #
  ##########################
  def dumpHost(host)
    host = $evm.object['host'] || $evm.root['host']
    $evm.log("info","#{@log_prefix} - Host:<#{host.name}> Begin Attributes")
    host.attributes.sort.each { |k, v| $evm.log("info", "#{@log_prefix} - Host:<#{host.name}> Attributes - #{k}: #{v.inspect}")}
    $evm.log("info","#{@log_prefix} - Host:<#{host.name}> End Attributes")
    $evm.log("info","")

    $evm.log("info","#{@log_prefix} - Host:<#{host.name}> Begin Associations")
    host.associations.sort.each { |assc| $evm.log("info", "#{@log_prefix} - Host:<#{host.name}> Associations - #{assc}")}
    $evm.log("info","#{@log_prefix} - Host:<#{host.name}> End Associations")
    $evm.log("info","")

    $evm.log("info","#{@log_prefix} - Host:<#{host.name}> Begin Hardware")
    host.hardware.attributes.each { |k,v| $evm.log("info", "#{@log_prefix} - Host:<#{host.name}> Hardware - #{k}: #{v.inspect}")}
    $evm.log("info","#{@log_prefix} - Host:<#{host.name}> End Hardware")
    $evm.log("info","")

    $evm.log("info","#{@log_prefix} - Host:<#{host.name}> Begin Lans")
    host.lans.each { |lan| lan.attributes.sort.each { |k,v| $evm.log("info", "#{@log_prefix} - Host:<#{host.name}> Lan:<#{lan.name}> - #{k}: #{v.inspect}")}}
    $evm.log("info","#{@log_prefix} - Host:<#{host.name}> End Lans")
    $evm.log("info","")

    $evm.log("info","#{@log_prefix} - Host:<#{host.name}> Begin Switches")
    host.switches.each { |switch| switch.attributes.sort.each { |k,v| $evm.log("info", "#{@log_prefix} - Host:<#{host.name}> Swtiche:<#{switch.name}> - #{k}: #{v.inspect}")}}
    $evm.log("info","#{@log_prefix} - Host:<#{host.name}> End Switches")
    $evm.log("info","")

    $evm.log("info","#{@log_prefix} - Host:<#{host.name}> Begin Operating System")
    host.operating_system.attributes.sort.each { |k, v| $evm.log("info", "#{@log_prefix} - Host:<#{host.name}> Operating System - #{k}: #{v.inspect}")}
    $evm.log("info","#{@log_prefix} - Host:<#{host.name}> End Operating System")
    $evm.log("info","")

    $evm.log("info","#{@log_prefix} - Host:<#{host.name}> Begin Guest Applications")
    host.guest_applications.each { |guest_app| guest_app.attributes.sort.each { |k, v| $evm.log("info", "#{@log_prefix} - Host:<#{host.name}> Guest Application:<#{guest_app.name}> - #{k}: #{v.inspect}")}}
    $evm.log("info","#{@log_prefix} - Host:<#{host.name}> End Guest Applications")
    $evm.log("info","")

    $evm.log("info","#{@log_prefix} - Host:<#{host.name}> Begin Virtual Columns")
    host.virtual_column_names.sort.each { |vcn| $evm.log("info", "#{@log_prefix} - Host:<#{host.name}> Virtual Columns - #{vcn}: #{host.send(vcn).inspect}")}
    $evm.log("info","#{@log_prefix} - Host:<#{host.name}> End Virtual Columns")
    $evm.log("info", "")
  end
```

{% include_relative _topics/hosts_vmware_esx_host_vmware_esx.md
%}

{% include_relative _topics/lan_lan.md %}

### Groups (miq\_group)

| Method                  | Use                                                         |
| ----------------------- | ----------------------------------------------------------- |
| users                   | Returns users in the current miq\_group                     |
| vms                     | Returns Virtual Machines that this group owns               |
| custom\_keys            | Returns all custom keys for the group                       |
| custom\_get(key)        | Returns the value of the specified custom key for the group |
| custom\_set(key, value) | Sets the value for the specified key                        |

``` ruby
  #########################
  #
  # Method: dumpGroup
  # Inputs: $evm.root['user'].miq_group
  # Description: Dump User's Group information
  #
  ##########################
  def dumpGroup
    user = $evm.root['user']
    unless user.nil?
      miq_group = user.miq_group
      unless miq_group.nil?
        $evm.log("info","#{@method} - Group:<#{miq_group.description}> Begin Attributes [miq_group.attributes]")
        miq_group.attributes.sort.each { |k, v| $evm.log("info", "#{@method} - Group:<#{miq_group.description}> Attributes - #{k}: #{v.inspect}")} unless $evm.root['user'].miq_group.nil?
        $evm.log("info","#{@method} - Group:<#{miq_group.description}> End Attributes [miq_group.attributes]")
        $evm.log("info", "")

        $evm.log("info","#{@method} - Group:<#{miq_group.description}> Begin Associations [miq_group.associations]")
        miq_group.associations.sort.each { |assc| $evm.log("info", "#{@method} - Group:<#{miq_group.description}> Associations - #{assc}")}
        $evm.log("info","#{@method} - Group:<#{miq_group.description}> End Associations [miq_group.associations]")
        $evm.log("info","")

        $evm.log("info","#{@method} - Group:<#{miq_group.description}> Begin Virtual Columns [miq_group.virtual_column_names]")
        miq_group.virtual_column_names.sort.each { |vcn| $evm.log("info", "#{@method} - Group:<#{miq_group.description}> Virtual Columns - #{vcn}: #{miq_group.send(vcn).inspect}")}
        $evm.log("info","#{@method} - Group:<#{miq_group.description}> End Virtual Columns [miq_group.virtual_column_names]")
        $evm.log("info","")
      end
    end
  end
```

### Request (miq\_request)

Request objects are submitted to {{ site.data.product.title_short }} Server for processing.
After the request phase, the request becomes a task object. The table
below shows the relationship between a request object and a task object.

| Request Object                        | Task Object                        |
| ------------------------------------- | ---------------------------------- |
| automation\_request                   | automation\_task                   |
| miq\_host\_provision\_request         | miq\_host\_provision               |
| miq\_provision\_request               | miq\_provision                     |
| vm\_reconfigure\_request              | vm\_reconfigure\_task              |
| service\_template\_provision\_request | service\_template\_provision\_task |
| vm\_migrate\_request                  | vm\_migrate\_task                  |

If you set something on the request object, it will be inherited by the
task instance that does the work. This may be useful if you are
provisioning multiple virtual machines at a time and need to modify the
same setting for all. Otherwise, the item can be modified on the
individual task.

<table>
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<thead>
<tr class="header">
<th>Method</th>
<th>Use</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p>add_tag(category, tag_name)</p></td>
<td><p>Add a tag to a provision instance by specifying the category and tag name</p>
<p>Example: miq_provision.add_tag(:location, "CHI")</p></td>
</tr>
<tr class="even">
<td><p>approve(approver,reason for approval)</p></td>
<td><p>Approves the miq_request.</p>
<p>Example: $evm.root["miq_request"].approve("admin", "Auto-Approved")</p></td>
</tr>
<tr class="odd">
<td><p>approvers</p></td>
<td><p>Returns request approvers.</p></td>
</tr>
<tr class="even">
<td><p>authorized?</p></td>
<td><p>Returns true if authorized, false if not.</p></td>
</tr>
<tr class="odd">
<td><p>clear_tag(category=nil, tag_name=nil)</p></td>
<td><p>Without any parameters, the clear_tag method will clear all tags from the provision request. Providing a category will clear all tags selected in that category. Clear a specific category/tag by providing it.</p>
<p>Example: miq_provision.clear_tag(:location, "CHI")</p></td>
</tr>
<tr class="even">
<td><p>deny</p></td>
<td><p>Denies the miq_request</p>
<p>Example:</p>
<p># Deny the request</p>
<p>$evm.log('info',"Request denied because of Quota")</p>
<p>$evm.root["miq_request"].deny("admin", "Quota Exceeded")</p></td>
</tr>
<tr class="odd">
<td><p>get_classification(category)</p></td>
<td><p>Works the same as get_tag(category) but the returned data is a hash with :name and :description</p>
<p>Example:</p>
<p>request.get_classification(:department)</p>
<p>Returns: [{:name⇒"accounting", :description⇒"Accounting"}, {:name⇒"engineering", :description⇒"Engineering"}]</p></td>
</tr>
<tr class="even">
<td><p>get_classifications</p></td>
<td><p>Works the same as get_tag but the returned tag data is a hash with :name and :description</p>
<p>Example:</p>
<p>request.get_classifications</p>
<p>Returns: {:cc⇒{:name⇒"001", :description⇒"Cost Center 001"}, :department⇒[{:name⇒"accounting", :description⇒"Accounting"}, {:name⇒"engineering", :description⇒"Engineering"}]}</p></td>
</tr>
<tr class="odd">
<td><p>get_option(key)</p></td>
<td><p>Returns a value from the options hash based on the name of the key name passed in. Internally many of the values are stored as an array of items. (For example, a target host would be stored as the index to the host object in the db and the display name.) Calling this method will return the first item if it is an array. For non-array values the item is returned unmodified.</p>
<p>Example: miq_provision_request.get_option(:number_of_cpus)</p></td>
</tr>
<tr class="even">
<td><p>get_tag(category)</p></td>
<td><p>Returns the tags selected for the specified tag category.</p>
<p>Example: request.get_tag(:department)</p>
<p>Returns: ["accounting", "engineering"]</p></td>
</tr>
<tr class="odd">
<td><p>get_tags</p></td>
<td><p>Get all selected tags stored in a hash by category. If more than one tag is selected in a category, the hash will contain an array of tag names. Otherwise it will contain the tag name as a string.</p>
<p>Example: request.get_tags</p>
<p>Returns: {:cc⇒"001", :department⇒["accounting", "engineering"]}</p></td>
</tr>
<tr class="even">
<td><p>miq_request</p></td>
<td><p>(Legacy support) Internal Note: The miq_request instance use to be a separate instance from the specific request instance (like miq_provision_request). When the classes were refactored into 1 this method was added to allow existing code and automate methods to continue to run unchanged.)</p></td>
</tr>
<tr class="odd">
<td><p>miq_request_tasks</p></td>
<td><p>Returns the requests tasks</p></td>
</tr>
<tr class="even">
<td><p>options</p></td>
<td><p>Returns a hash containing all the options set for the current provision object</p></td>
</tr>
<tr class="odd">
<td><p>pending</p></td>
<td><p>Puts the object in a pending state for approval</p>
<p>Example:</p>
<p># Raise automation event: request_pending</p>
<p>$evm.root["miq_request"].pending</p></td>
</tr>
<tr class="even">
<td><p>reason</p></td>
<td><p>Returns reason for approval or denial of request</p></td>
</tr>
<tr class="odd">
<td><p>requester</p></td>
<td><p>Returns the requester</p></td>
</tr>
<tr class="even">
<td><p>resource</p></td>
<td><p>Returns the resource for the request</p></td>
</tr>
<tr class="odd">
<td><p>set_message(value)</p></td>
<td><p>Sets the message for the request</p></td>
</tr>
<tr class="even">
<td><p>set_option(key, value)</p></td>
<td><p>Sets the specified key/value pair for the object</p></td>
</tr>
</tbody>
</table>

{% include_relative _topics/automation_request.md %}

{% include_relative _topics/miq_host_provision_request.md %}

{% include_relative _topics/miq_provision_request.md %}

### Request Task (miq\_request\_task)

<table>
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<thead>
<tr class="header">
<th>Method</th>
<th>Use</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p>add_tag(category, tag_name)</p></td>
<td><p>Add a tag to a provision instance by specifying the category and tag name.</p>
<p>Example: miq_provision.add_tag(:location, "CHI")</p></td>
</tr>
<tr class="even">
<td><p>clear_tag(category=nil, tag_name=nil)</p></td>
<td><p>Without any parameters, the clear_tag method will clear all tags from the provision request. Providing a category will clear all tags selected in that category. Clear a specific category/tag by providing it.</p>
<p>Example: miq_provision.clear_tag(:location, "CHI")</p></td>
</tr>
<tr class="odd">
<td><p>destination</p></td>
<td><p>Returns the destination object. (The resultant object from running the task. In the case of provisioning, this would be the newly created VM.)</p></td>
</tr>
<tr class="even">
<td><p>execute</p></td>
<td><p>Executes or processes the request.</p></td>
</tr>
<tr class="odd">
<td><p>finished(msg)</p></td>
<td><p>Sets the task to finished with the supplied message.</p></td>
</tr>
<tr class="even">
<td><p>get_classification(category)</p></td>
<td><p>Works the same as get_tag(category) but the returned data is a hash with :name and :description.</p>
<p>Example:</p>
<p>request.get_classification(:department)</p>
<p>Returns: [{:name⇒"accounting", :description⇒"Accounting"}, {:name⇒"engineering", :description⇒"Engineering"}]</p></td>
</tr>
<tr class="odd">
<td><p>get_classifications</p></td>
<td><p>Works the same as get_tag but the returned tag data is a hash with :name and :description.</p>
<p>Example:</p>
<p>request.get_classifications</p>
<p>Returns: {:cc⇒{:name⇒"001", :description⇒"Cost Center 001"}, :department⇒[{:name⇒"accounting", :description⇒"Accounting"}, {:name⇒"engineering", :description⇒"Engineering"}]}</p></td>
</tr>
<tr class="even">
<td><p>get_option_last(key)</p></td>
<td><p>This method is the same as get_option, except that it returns the last array value.</p></td>
</tr>
<tr class="odd">
<td><p>get_option(key)</p></td>
<td><p>Returns a value from the options hash based on the name of the key name passed in. Internally many of the values are stored as an array of items. (For example, a target host would be stored as the index to the host object in the db and the display name.) Calling this method will return the first item if it is an array. For non-array values the item is returned unmodified.</p>
<p>Example: miq_provision_request.get_option(:number_of_cpus)</p></td>
</tr>
<tr class="even">
<td><p>get_tag(category)</p></td>
<td><p>Returns the tags selected for the specified tag category.</p>
<p>Example: request.get_tag(:department)</p>
<p>Returns: ["accounting", "engineering"]</p></td>
</tr>
<tr class="odd">
<td><p>get_tags</p></td>
<td><p>Get all selected tags stored in a hash by category. If more than one tag is selected in a category, the hash will contain an array of tag names. Otherwise it will contain the tag name as a string.</p>
<p>Example: request.get_tag</p>
<p>Returns: {:cc⇒"001", :department⇒["accounting", "engineering"]}</p></td>
</tr>
<tr class="even">
<td><p>message=(msg)</p></td>
<td><p>Sets the message for the request task.</p></td>
</tr>
<tr class="odd">
<td><p>miq_request</p></td>
<td><p>Returns the miq_request for the task.</p></td>
</tr>
<tr class="even">
<td><p>miq_request_task</p></td>
<td><p>Returns the parent miq_request task.</p></td>
</tr>
<tr class="odd">
<td><p>miq_request.user_message=(msg)</p></td>
<td><p>Allows automate method to override the default request status message. As a result, you can set custom messages for the progression of the state machine and its success or failure. This message will appear as the last message for the service request.</p></td>
</tr>
<tr class="even">
<td><p>miq_request_tasks</p></td>
<td><p>Returns the children miq_request tasks.</p></td>
</tr>
<tr class="odd">
<td><p>options</p></td>
<td><p>Returns a hash containing all the options set for the current object.</p></td>
</tr>
<tr class="even">
<td><p>set_option(key, value)</p></td>
<td><p>Updates a key/value pair in the options hash for the provision object. Often the value is required to be an array.</p></td>
</tr>
<tr class="odd">
<td><p>source</p></td>
<td><p>Returns the source object. (The source, or input, object that the task runs against. In the case of provisioning, this would be the VM or template selected to be provisioned.)</p></td>
</tr>
</tbody>
</table>

{% include_relative _topics/automation_task.md %}

{% include_relative _topics/miq_host_provision.md %}

#### VM Provision Task (miq\_provision)

<table>
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<thead>
<tr class="header">
<th>Method</th>
<th>Use</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p>check_quota(quota_type, options={})</p></td>
<td><p>Returns the quota information for the specified type</p></td>
</tr>
<tr class="even">
<td><p>eligible_clusters</p></td>
<td><p>Returns an array of available Cluster objects filtered by previously selected resources</p></td>
</tr>
<tr class="odd">
<td><p>eligible_customization_templates</p></td>
<td><p>Returns an array of available Customization Templates</p></td>
</tr>
<tr class="even">
<td><p>eligible_folders</p></td>
<td><p>Returns an array of available Folder objects filtered by previously selected resources</p></td>
</tr>
<tr class="odd">
<td><p>eligible_hosts</p></td>
<td><p>Returns an array of available Host objects filtered by previously selected resources</p></td>
</tr>
<tr class="even">
<td><p>eligible_iso_images</p></td>
<td><p>Returns an array of available ISO Image objects filtered by previously selected resources</p></td>
</tr>
<tr class="odd">
<td><p>eligible_pxe_images</p></td>
<td><p>Returns an array of available PXE Image objects filtered by previously selected resources</p></td>
</tr>
<tr class="even">
<td><p>eligible_pxe_servers</p></td>
<td><p>Returns an array of available PXE Servers filtered by previously selected resources</p></td>
</tr>
<tr class="odd">
<td><p>eligible_resource_pools</p></td>
<td><p>Returns an array of available Resource Pool objects filtered by previously selected resources</p></td>
</tr>
<tr class="even">
<td><p>eligible_resources(rsc_type)</p></td>
<td><p>Returns the eligible resources for the resource type specified</p></td>
</tr>
<tr class="odd">
<td><p>eligible_storages</p></td>
<td><p>Returns an array of available Storage (Datastore) objects filtered by previously selected resources</p></td>
</tr>
<tr class="even">
<td><p>eligible_windows_images</p></td>
<td><p>Returns an array of available Windows Image objects filtered by previously selected resources</p></td>
</tr>
<tr class="odd">
<td><p>get_domain_details</p></td>
<td><p>Returns domain information</p></td>
</tr>
<tr class="even">
<td><p>get_domain_name</p></td>
<td><p>Returns domain name</p></td>
</tr>
<tr class="odd">
<td><p>get_folder_paths</p></td>
<td><p>Returns a hash where the key is an index and the value is the fully-qualified path name of the folder. (Sample: {7 ⇒ Dev/Dept1/QA, 8 ⇒ Test/Dept2/QA}) This format is useful when a fully-qualified path is required to match the folder name. For example, if you had multiple QA folders under different departments in the sample above. To find the proper QA folder you need to evaluate the entire folder path.</p></td>
</tr>
<tr class="even">
<td><p>get_network_details</p></td>
<td><p>Returns network information</p></td>
</tr>
<tr class="odd">
<td><p>get_network_scope</p></td>
<td><p>Returns network scope</p></td>
</tr>
<tr class="even">
<td><p>miq_provision_request</p></td>
<td><p>Returns the provision request object</p></td>
</tr>
<tr class="odd">
<td><p>set_cluster(rsc)</p></td>
<td><p>Set the cluster to use based on object returned from eligible_clusters</p></td>
</tr>
<tr class="even">
<td><p>set_customization_spec(name=nil, override=false)</p></td>
<td><p>Sets the name of the custom spec to use as defined by its name in Virtual Center (Note: This is not supported when being passed by VMware.)</p></td>
</tr>
<tr class="odd">
<td><p>set_customization_template(rsc)</p></td>
<td><p>Set the customization_template to use based on object returned from eligible_customization_templates</p></td>
</tr>
<tr class="even">
<td><p>set_dvs(portgroup, switch = portgroup)</p></td>
<td><p>Set the name of the Distributed Virtual Switch (portgroup). An options &lt;switch&gt; name can also be passed</p>
<p>Example: miq_provision.set_dvs('default')</p></td>
</tr>
<tr class="odd">
<td><p>set_folder(folder_path)</p></td>
<td><p>Set the folder to use based on object returned from eligible_folders. In addition, set_folder accepts the following folder types:</p>
<p>Folder Paths - separated by forward slashes. (Must include Data-center name.) Example: Prod/Discovered virtual machine where Prod is the Data-center name and Discovered virtual machine is the folder name.</p>
<p>Object returned from the get_folder_paths method</p></td>
</tr>
<tr class="even">
<td><p>set_host(rsc)</p></td>
<td><p>Set the host to use based on object returned from eligible_hosts</p></td>
</tr>
<tr class="odd">
<td><p>set_network_adapter(idx, nic_hash, value=nil)</p></td>
<td><p>Modifies the network card attached to the VM container</p>
<p>Available settings:</p>
<p>:is_dvs true / false (Default: false)</p>
<p>:network (Network Name)</p>
<p>:mac_address</p>
<p>:devicetype (Default: VirtualPCNet32) Defined by VMware: <a href="http://www.vmware.com/support/developer/vc-sdk/visdk400pubs/ReferenceGuide/vim.vm.device.VirtualEthernetCard.html">http://www.vmware.com/support/developer/vc-sdk/visdk400pubs/ReferenceGuide/vim.vm.device.VirtualEthernetCard.html</a></p>
<p>:connectable ⇒ {:allowguestcontrol ⇒ true / false} (Default: true)</p>
<p>:connectable ⇒ {:startconnected ⇒ true / false} (Default: true)</p>
<p>:connectable ⇒ {:connected ⇒ true / false} (Default: true)</p>
<p>Example: prov.set_network_adapter(1, {:network ⇒ dvs_net1, :is_dvs ⇒ true} )</p></td>
</tr>
<tr class="even">
<td><p>set_network_address_mode(mode)</p></td>
<td><p>Available modes are dhcp and static</p></td>
</tr>
<tr class="odd">
<td><p>set_nic_settings(idx, nic_hash, value=nil)</p></td>
<td><p>Modifies the network interface settings at the operating system level</p>
<p>Available settings:</p>
<p>:addr_mode "dhcp" / "static" (Default: Statis)</p>
<p>:ip_addr</p>
<p>:subnet_mask</p>
<p>:gateway</p>
<p>:dns_domain</p>
<p>:dns_servers (Windows Only) Comma separated values</p>
<p>:sysprep_netbios_mode (Windows Only) Defined by VMware: <a href="http://www.vmware.com/support/developer/vc-sdk/visdk400pubs/ReferenceGuide/vim.vm.customization.IPSettings.NetBIOSMode.html">http://www.vmware.com/support/developer/vc-sdk/visdk400pubs/ReferenceGuide/vim.vm.customization.IPSettings.NetBIOSMode.html</a></p>
<p>:wins_servers Passed as a string specifying the Primary and Secondary WINS servers separated by a comma. "&lt;PrimaryWINS&gt;, &lt;SecondaryWINS&gt;"</p>
<p>Example: prov.set_nic_settings(1, {:ip_addr⇒10.226.133.55, :subnet_mask⇒'255.255.255.192', :gateway⇒'10.226.133.5', :addr_mode⇒["static", "Static"] } )</p></td>
</tr>
<tr class="even">
<td><p>set_iso_image(rsc)</p></td>
<td><p>Set the iso_image to use based on object returned from eligible_iso_images</p></td>
</tr>
<tr class="odd">
<td><p>set_pxe_image(rsc)</p></td>
<td><p>Set the pxe_image to use based on object returned from eligible_pxe_images</p></td>
</tr>
<tr class="even">
<td><p>set_pxe_server(rsc)</p></td>
<td><p>Set the pxe_server to use based on object returned from eligible_pxe_servers</p></td>
</tr>
<tr class="odd">
<td><p>set_resource_pool(rsc)</p></td>
<td><p>Set the resource_pool to use based on object returned from eligible_resource_pools</p></td>
</tr>
<tr class="even">
<td><p>set_storage(rsc)</p></td>
<td><p>Set the Datastore (storage object) to use based on object returned from eligible_storages</p></td>
</tr>
<tr class="odd">
<td><p>set_vlan(vlan)</p></td>
<td><p>Sets the name of the VLan to use</p>
<p>Example: miq_provision.set_vlan('default')</p></td>
</tr>
<tr class="even">
<td><p>set_vm_notes(note)</p></td>
<td><p>Sets text for the VM notes (aka annotation) field</p></td>
</tr>
<tr class="odd">
<td><p>set_vm_notes(notes)</p></td>
<td><p>Sets text for the VM notes (aka annotation) field</p></td>
</tr>
<tr class="even">
<td><p>set_windows_image(rsc)</p></td>
<td><p>Set the windows_image to use based on object returned from eligible_windows_images</p></td>
</tr>
<tr class="odd">
<td><p>source_type</p></td>
<td><p>Returns the provision source type. (values are 'vm' or 'template')</p></td>
</tr>
<tr class="even">
<td><p>status</p></td>
<td><p>Returns provision status</p></td>
</tr>
<tr class="odd">
<td><p>target_type</p></td>
<td><p>Returns the provision target type. (values are 'vm' or 'template')</p></td>
</tr>
<tr class="even">
<td><p>vdi_farm</p></td>
<td><p>Returns VDI Farm information</p></td>
</tr>
<tr class="odd">
<td><p>vm</p></td>
<td><p>The newly created vm</p></td>
</tr>
<tr class="even">
<td><p>vm_template</p></td>
<td><p>Returns the template selected to be provisioned</p></td>
</tr>
</tbody>
</table>

``` ruby
begin
  miq_provision = $evm.root["miq_provision"] || $evm.root['miq_provision']
  prov = $evm.root["miq_provision"]
  user = prov.miq_request.requester
  raise "User not specified" if user.nil?



  ###################################
  # Process Change Request Number and set VM Annotation
  ###################################
  intake = prov.get_option(:vm_description)
  intake = "Change Request#: #{intake}"
  prov.set_option(:vm_description,intake)


  ###################################
  # Set the customization spec based on the environment tag chosen in the dialog
  ###################################
  tags = prov.get_tags
  $evm.log("info","Tags: #{tags.inspect}")
  env = tags[:environment]
  $evm.log("info", "Mapping custom spec based on Category Environment <#{env}> chosen in the dialog")
  if env.eql? "dev"
    customization_spec = "Dev-Specification"
    miq_provision.set_customization_spec(customization_spec)
  end
  if env.eql? "stg"
    customization_spec = "Stg-Specification"
    miq_provision.set_customization_spec(customization_spec)
  end


  ###################################
  # Set the VM Notes as follows:
  ###################################
  vm_notes = "#{intake}"
  vm_notes +=  "\nOwner: #{miq_provision.get_option(:owner_first_name)} #{miq_provision.get_option(:owner_last_name)}"
  vm_notes += "\nEmail: #{miq_provision.get_option(:owner_email)}"
  vm_notes += "\nSource Template: #{miq_provision.vm_template.name}"
  miq_provision.set_vm_notes(vm_notes)


  ###################################
  # Drop the VM in the targeted folder
  # In VC a folder must exist that matches the LDAP Group
  # VM will be placed in the Folder
  ###################################
  if prov.get_option(:placement_folder_name).nil?
    ###################################
    # If you want to use a Default folder, set folder = below to the default
    ###################################
    #    folder = "22F DC/LAB FARM/GSE/Intel/Infrastructure/ManageIQ/SelfServiceVMs"
    folder = "DC1/Infrastructure/ManageIQ/SelfService"
    $evm.log("info", "Placing VM in VC folder: <#{folder}")
    $evm.log("info", "Set_folder called with [#{folder.inspect}]")

    miq_provision.set_folder(folder)
  end


  ####################################################
  # Set the IP Address based on the :mac_address entered in the dialog
  #
  ####################################################
  ipaddr = prov.get_option(:mac_address)

  if ! ipaddr.nil?
    # Set provisioning options to override options
    prov.set_option(:sysprep_spec_override, [true, 1])
    prov.set_option(:addr_mode, ["static", "Static"])
    prov.set_option(:ip_addr, ipaddr)
    # Reset :mac_address to nil
    prov.set_option(:mac_address, nil)
  end

  $evm.log("info", "Provision Options: #{prov.options.inspect}")

  exit MIQ_OK

rescue => err
  $evm.log("info", "Set_folder err [#{err}]\n#{err.backtrace.join("\n")}")
end
```

{% include_relative
_topics/adding_disks_to_openstack_instance_provisioning.md %}

{% include_relative
_topics/booting_openstack_instances_from_volume.md %}

{% include_relative
_topics/vm_provisioning_for_clouds_task_miq_provision_cloud.md
%}

{% include_relative _topics/service_template_provision_task.md %}

{% include_relative
_topics/service_reconfiguration_task_service_reconfigure_task.md
%}

{% include_relative _topics/vm_migrate_task.md %}

{% include_relative _topics/proxies_miq_proxy.md %}

### Servers (miq\_server)

These methods are available to the {{ site.data.product.title_short }} Server.

| Method         | Use                                           |
| -------------- | --------------------------------------------- |
| zone           | Returns {{ site.data.product.title_short }} Servers Zone          |
| region\_number | Returns {{ site.data.product.title_short }} Servers Region Number |
| region\_name   | Returns {{ site.data.product.title_short }} Servers Region Name   |

``` ruby
  #########################
  #
  # Method: dumpServer
  # Inputs: $evm.root['miq_server']
  # Description: Dump MIQ Server information
  #
  ##########################
  def dumpServer
    $evm.log("info","#{@method} - Server:<#{$evm.root['miq_server'].name}> Begin Attributes")
    $evm.root['miq_server'].attributes.sort.each { |k, v| $evm.log("info", "#{@method} - Server:<#{$evm.root['miq_server'].name}> Attributes - #{k}: #{v.inspect}")}
    $evm.log("info","#{@method} - Server:<#{$evm.root['miq_server'].name}> End Attributes")
    $evm.log("info", "")
  end
```

{% include_relative _topics/network_network.md %}

{% include_relative _topics/pxe_image.md %}

{% include_relative _topics/pxe_server.md %}

{% include_relative _topics/security_groups_security_group.md %}

{% include_relative _topics/service2.md %}

{% include_relative _topics/service_resource_service_resource.md %}

{% include_relative _topics/service_template.md %}

{% include_relative _topics/snapshot_snapshot.md %}

### Datastores (storage)

| Method                    | Use                                           |
| ------------------------- | --------------------------------------------- |
| ext\_management\_systems, | Returns objects Management System             |
| hosts                     | Returns objects Hosts                         |
| vms                       | Returns objects Virtual Machines              |
| unregistered\_vms         | Returns objects unregistered Virtual Machines |
| to\_s                     | Converts object to string                     |
| scan                      | Performs SmartState Analysis on the object    |

``` ruby
 #########################
  #
  # Method: dumpStorage
  # Inputs: $evm.root['storage']
  # Description: Dump Storage information
  #
  ##########################
  def dumpStorage(storage)
    $evm.log("info","#{@log_prefix} - Storage:<#{storage.name}> Begin Attributes")
    storage.attributes.sort.each { |k, v| $evm.log("info", "#{@log_prefix} - Storage:<#{storage.name}> Attributes - #{k}: #{v.inspect}")}
    $evm.log("info","#{@log_prefix} - Storage:<#{storage.name}> End Attributes")
    $evm.log("info","")

    $evm.log("info","#{@log_prefix} - Storage:<#{storage.name}> Begin Associations")
    storage.associations.sort.each { |assc| $evm.log("info", "#{@log_prefix} - Storage:<#{storage.name}> Associations - #{assc}")}
    $evm.log("info","#{@log_prefix} - Storage:<#{storage.name}> End Associations")
    $evm.log("info","")

    $evm.log("info","#{@log_prefix} - Storage:<#{storage.name}> Begin Virtual Columns")
    storage.virtual_column_names.sort.each { |vcn| $evm.log("info", "#{@log_prefix} - Storage:<#{storage.name}> Virtual Columns - #{vcn}: #{storage.send(vcn)}")}
    $evm.log("info","#{@log_prefix} - Storage:<#{storage.name}> End Virtual Columns")
    $evm.log("info","")
  end
```

{% include_relative _topics/switch_switch.md %}

### User (user)

These methods can be used on the currently logged on user.

| Method                       | Use                                               |
| ---------------------------- | ------------------------------------------------- |
| current\_group               | Returns user’s assigned internal group            |
| custom\_get(key)             | Returns the custom key value specified by "key"   |
| custom\_keys                 | Returns an array of custom keys                   |
| custom\_set(key,value)       | Sets custom value for "key" to "value"            |
| email                        | Returns user’s email address                      |
| get\_ladap\_attribute(name)  | Returns the value of the specified LDAP attribute |
| get\_ldap\_atttribute\_names | Returns user’s LDAP attribute names               |
| ldap\_group                  | Returns user’s assigned LDAP group                |
| miq\_requests                | Returns user’s requests                           |
| name                         | Returns user’s name                               |
| userid                       | Returns user’s userid                             |
| vms                          | Returns Virtual Machines that this user owns      |

``` ruby
  #########################
  #
  # Method: dumpUser
  # Inputs: $evm.root['user']
  # Description: Dump User information
  #
  ##########################
  def dumpUser
    user = $evm.root['user']
    unless user.nil?
      $evm.log("info","#{@method} - User:<#{user.name}> Begin Attributes [user.attributes]")
      user.attributes.sort.each { |k, v| $evm.log("info", "#{@method} - User:<#{user.name}> Attributes - #{k}: #{v.inspect}")}
      $evm.log("info","#{@method} - User:<#{user.name}> End Attributes [user.attributes]")
      $evm.log("info", "")

      $evm.log("info","#{@method} - User:<#{user.name}> Begin Associations [user.associations]")
      user.associations.sort.each { |assc| $evm.log("info", "#{@method} - User:<#{user.name}> Associations - #{assc}")}
      $evm.log("info","#{@method} - User:<#{user.name}> End Associations [user.associations]")
      $evm.log("info","")

      $evm.log("info","#{@method} - User:<#{user.name}> Begin Virtual Columns [user.virtual_column_names]")
      user.virtual_column_names.sort.each { |vcn| $evm.log("info", "#{@method} - User:<#{user.name}> Virtual Columns - #{vcn}: #{user.send(vcn).inspect}")}
      $evm.log("info","#{@method} - User:<#{user.name}> End Virtual Columns [user.virtual_column_names]")
      $evm.log("info","")
    end
  end
```

### Virtual Machines and Templates (vm\_or\_template)

The following methods can be used on a virtual machine or template
object.

<table>
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<thead>
<tr class="header">
<th>Method</th>
<th>Use</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p>add_disk [1]</p></td>
<td><p>Add storage to an existing VM.</p>
<p>This method accepts as parameters: disk_name, disk_size_mb, and options to pass values for :thinProvisioned, :dependent, and :persistent.</p>
<p>Example: <code>vm.add_disk("[#{vm.storage_name}]", size_in_mb, thin_provisioned: true)</code></p></td>
</tr>
<tr class="even">
<td><p>changed_vm_value?</p></td>
<td><p>Checks the 2 most recent drift state captures , and answers whether the specified value changed between them</p></td>
</tr>
<tr class="odd">
<td><p>collect_running_processes</p></td>
<td><p>Collects the running processes of the object</p></td>
</tr>
<tr class="even">
<td><p>create_snapshot(name, desc = nil)</p></td>
<td><p>Create a snapshot of the object. The <strong>name</strong> parameter is not used for Red Hat Virtualization virtual machines when creating a snapshot.</p></td>
</tr>
<tr class="odd">
<td><p>custom_get(key)</p></td>
<td><p>Get the value of specified {{ site.data.product.title_short }} Server key from the object</p></td>
</tr>
<tr class="even">
<td><p>custom_keys</p></td>
<td><p>List all {{ site.data.product.title_short }} Server custom keys for the object</p></td>
</tr>
<tr class="odd">
<td><p>custom_set(key, value)</p></td>
<td><p>Set a custom {{ site.data.product.title_short }} Server key value</p></td>
</tr>
<tr class="even">
<td><p>datacenter</p></td>
<td><p>Returns objects Datacenter</p></td>
</tr>
<tr class="odd">
<td><p>direct_service</p></td>
<td><p>Show the direct service relationship of the virtual machine</p></td>
</tr>
<tr class="even">
<td><p>directories</p></td>
<td><p>Returns number of directories on the object</p></td>
</tr>
<tr class="odd">
<td><p>ems_blue_folder (this will be reworked to be more VMware-specific)</p></td>
<td><p>Returns objects blue folder from VMware. These are the folders showing in VM and Templates view in VMware</p></td>
</tr>
<tr class="even">
<td><p>ems_cluster</p></td>
<td><p>Returns objects cluster</p></td>
</tr>
<tr class="odd">
<td><p>ems_custom_get(key)</p></td>
<td><p>Gets specified key of custom Management System Attribute</p></td>
</tr>
<tr class="even">
<td><p>ems_custom_keys</p></td>
<td><p>List the custom keys defined by the Management System for the object</p></td>
</tr>
<tr class="odd">
<td><p>ems_custom_set(attribute, value)</p></td>
<td><p>Sets specified key and value of custom Management System Attribute</p></td>
</tr>
<tr class="even">
<td><p>ems_folder</p></td>
<td><p>Returns objects folder on Management System</p></td>
</tr>
<tr class="odd">
<td><p>ems_ref_string</p></td>
<td><p>Returns unique identifier the Management System uses to identify this resource. For example, in VMware a VM would return a value like: "vm-26622"</p></td>
</tr>
<tr class="even">
<td><p>event_log_threshold? (options)</p></td>
<td><p>Searches event log records to determine if an event has occurred x number of times within a defined time frame. Returns true if the number of matching records found are greater or equal to the specified freq_threshold, otherwise it returns false</p>
<p>Options values:</p>
<p>:message_filter_type - Must be one of "STARTS WITH", "ENDS WITH", "INCLUDES", "REGULAR EXPRESSION"</p>
<p>:message_filter_value - &lt;string value to search for&gt;</p>
<p>:time_threshold - Options time interval to search. Example: 2.days (Search the past 2 days of event logs) Default 10.days</p>
<p>:freq_threshold - Number of occurrences to check for. Default = 2</p>
<p>:source, :event_id, :level, :name - Options filter values</p></td>
</tr>
<tr class="odd">
<td><p>event_threshold?(options)</p></td>
<td><p>Checks if an event (or multiple events) have occurred X number of times in N seconds. The values below are used if no data is passed</p>
<p>event_threshold?(options = {:time_threshold ⇒ 30.minutes, :event_types ⇒ ["MigrateVM_Task_Complete"], :freq_threshold ⇒ 2})</p></td>
</tr>
<tr class="even">
<td><p>ext_management_system</p></td>
<td><p>Returns objects Management System</p></td>
</tr>
<tr class="odd">
<td><p>files</p></td>
<td><p>Returns number of files on the object</p></td>
</tr>
<tr class="even">
<td><p>get_realtime_metric(metric, range, function)</p></td>
<td><p>Returns specified realtime metric</p></td>
</tr>
<tr class="odd">
<td><p>group=(group)</p></td>
<td><p>Sets objects group</p></td>
</tr>
<tr class="even">
<td><p>guest_applications</p></td>
<td><p>Returns objects Guest Application list</p></td>
</tr>
<tr class="odd">
<td><p>hardware</p></td>
<td><p>Returns objects Hardware</p></td>
</tr>
<tr class="even">
<td><p>host</p></td>
<td><p>Returns objects Host</p></td>
</tr>
<tr class="odd">
<td><p>migrate(host, pool = nil, priority = "defaultPriority", state = nil)</p></td>
<td><p>Migrates the object to another host. The only required parameter is host</p></td>
</tr>
<tr class="even">
<td><p>miq_provision</p></td>
<td><p>If VM was created using {{ site.data.product.title_short }} Server provisioning, this is the miq_provision task instance that created the VM</p></td>
</tr>
<tr class="odd">
<td><p>move_into_folder(folder) [2]</p></td>
<td><p>Use this method to move VMware virtual machines into folders.</p>
<p>Example:</p>
<p>vm = Vm.find_by_name('&lt;vm_name&gt;')</p>
<p>folder = EmsFolder.find_by(:name ⇒ '&lt;folder_name&gt;')</p>
<p>vm.move_into_folder(folder) unless folder.nil?</p></td>
</tr>
<tr class="even">
<td><p>operating_system</p></td>
<td><p>Returns objects Operating System</p></td>
</tr>
<tr class="odd">
<td><p>owner</p></td>
<td><p>Return objects owner</p></td>
</tr>
<tr class="even">
<td><p>owner=(owner)</p></td>
<td><p>Sets objects owner</p></td>
</tr>
<tr class="odd">
<td><p>performances_maintains_value_for_duration?</p></td>
<td><p>Based on options given, checks to see if a performance threshold is maintained for a time period</p>
<p>Example: vm.performances_maintains_value_for_duration?(:column ⇒ "cpu_usage_rate_average", :operator ⇒ "=", :value ⇒ 3.51, :duration ⇒ 20.minutes)</p></td>
</tr>
<tr class="even">
<td><p>reboot_guest</p></td>
<td><p>Reboots the guest operating system</p></td>
</tr>
<tr class="odd">
<td><p>reconfigured_hardware_value?</p></td>
<td><p>Checks if hardware value has been reconfigured</p></td>
</tr>
<tr class="even">
<td><p>refresh</p></td>
<td><p>Refresh power states and relationships of the object</p></td>
</tr>
<tr class="odd">
<td><p>registered?</p></td>
<td><p>Is the object registered?</p></td>
</tr>
<tr class="even">
<td><p>remove_all_snapshots</p></td>
<td><p>Remove all of the objects snapshots</p></td>
</tr>
<tr class="odd">
<td><p>remove_from_disk</p></td>
<td><p>Removes the object from disk</p></td>
</tr>
<tr class="even">
<td><p>remove_from_vmdb</p></td>
<td><p>Removes the object from the VMDB</p></td>
</tr>
<tr class="odd">
<td><p>remove_snapshot(snapshot_id)</p></td>
<td><p>Remove a specific snapshot based on the snapshot_id</p></td>
</tr>
<tr class="even">
<td><p>resource_pool</p></td>
<td><p>Returns objects Resource Pool</p></td>
</tr>
<tr class="odd">
<td><p>retire_now</p></td>
<td><p>Retire the object immediately</p></td>
</tr>
<tr class="even">
<td><p>retirement_warn=(seconds)</p></td>
<td><p>Send a retirement warning</p></td>
</tr>
<tr class="odd">
<td><p>retires_on=(date)</p></td>
<td><p>Retire the object on date specified</p></td>
</tr>
<tr class="even">
<td><p>revert_to_snapshot(snapshot_id)</p></td>
<td><p>Revert to a snapshot based on the snapshot_id</p></td>
</tr>
<tr class="odd">
<td><p>scan(scan_categories = nil)</p></td>
<td><p>Perform SmartState Analysis on the object. Scan_categories is optional</p></td>
</tr>
<tr class="even">
<td><p>service</p></td>
<td><p>Show the top-level service for a virtual machine in a service hierarchy. For the immediate parent service relationship of a virtual machine, use direct_service</p></td>
</tr>
<tr class="odd">
<td><p>shutdown_guest</p></td>
<td><p>Shuts down the guest operating system of the object</p></td>
</tr>
<tr class="even">
<td><p>snapshots</p></td>
<td><p>Returns list of snapshots for the object</p></td>
</tr>
<tr class="odd">
<td><p>standby_guest</p></td>
<td><p>Puts the operating system on standby</p></td>
</tr>
<tr class="even">
<td><p>start</p></td>
<td><p>Starts the object</p>
<p>See Samples/PowerOn_DHOB</p></td>
</tr>
<tr class="odd">
<td><p>stop</p></td>
<td><p>Stops the object</p></td>
</tr>
<tr class="even">
<td><p>storage</p></td>
<td><p>Returns objects Datastore</p></td>
</tr>
<tr class="odd">
<td><p>suspend</p></td>
<td><p>Suspends the object</p></td>
</tr>
<tr class="even">
<td><p>to_s</p></td>
<td><p>Converts object to string</p></td>
</tr>
<tr class="odd">
<td><p>unlink_storage</p></td>
<td><p>Removes the reference to the VM’s Datastore</p></td>
</tr>
<tr class="even">
<td><p>unregister</p></td>
<td><p>Unregisters the object from the Management System</p></td>
</tr>
</tbody>
</table>

``` ruby
  #########################
  #
  # Method: dumpVM
  # Inputs: $evm.root['vm']
  # Description: Dump VM information
  #
  ##########################
  def dumpVM(vm)
    $evm.log("info","#{@log_prefix} - VM:<#{vm.name}> Begin Attributes [vm.attributes]")
    vm.attributes.sort.each { |k, v| $evm.log("info", "#{@log_prefix} - VM:<#{vm.name}> Attributes - #{k}: #{v.inspect}")}
    $evm.log("info","#{@log_prefix} - VM:<#{vm.name}> End Attributes [vm.attributes]")
    $evm.log("info","")

    $evm.log("info","#{@log_prefix} - VM:<#{vm.name}> Begin Associations [vm.associations]")
    vm.associations.sort.each { |assc| $evm.log("info", "#{@log_prefix} - VM:<#{vm.name}> Associations - #{assc}")}
    $evm.log("info","#{@log_prefix} - VM:<#{vm.name}> End Associations [vm.associations]")
    $evm.log("info","")

    $evm.log("info","#{@log_prefix} - VM:<#{vm.name}> Begin Hardware Attributes [vm.hardware]")
    vm.hardware.attributes.each { |k,v| $evm.log("info", "#{@log_prefix} - VM:<#{vm.name}> Hardware - #{k}: #{v.inspect}")}
    $evm.log("info","#{@log_prefix} - VM:<#{vm.name}> End Hardware Attributes [vm.hardware]")
    $evm.log("info","")

    $evm.log("info","#{@log_prefix} - VM:<#{vm.name}> Begin Hardware Associations [vm.hardware.associations]")
    vm.hardware.associations.sort.each { |assc| $evm.log("info", "#{@log_prefix} - VM:<#{vm.name}> hardware Associations - #{assc}")}
    $evm.log("info","#{@log_prefix} - VM:<#{vm.name}> End hardware Associations [vm.hardware.associations]")
    $evm.log("info","")

    $evm.log("info","#{@log_prefix} - VM:<#{vm.name}> Begin Neworks [vm.hardware.nics]")
    vm.hardware.nics.each { |nic| nic.attributes.sort.each { |k,v| $evm.log("info", "#{@log_prefix} - VM:<#{vm.name}> VLAN:<#{nic.device_name}> - #{k}: #{v.inspect}")}}
    $evm.log("info","#{@log_prefix} - VM:<#{vm.name}> End Networks [vm.hardware.nics]")
    $evm.log("info","")

    unless vm.ext_management_system.nil?
      $evm.log("info","#{@log_prefix} - VM:<#{vm.name}> Begin EMS [vm.ext_management_system]")
      vm.ext_management_system.attributes.sort.each { |ems_k, ems_v| $evm.log("info", "#{@log_prefix} - VM:<#{vm.name}> EMS:<#{vm.ext_management_system.name}> #{ems_k} - #{ems_v.inspect}")}
      $evm.log("info","#{@log_prefix} - VM:<#{vm.name}> End EMS [vm.ext_management_system]")
      $evm.log("info","")
    end

    unless vm.owner.nil?
      $evm.log("info","#{@log_prefix} - VM:<#{vm.name}> Begin Owner [vm.owner]")
      vm.owner.attributes.each { |k,v| $evm.log("info", "#{@log_prefix} - VM:<#{vm.name}> Owner - #{k}: #{v.inspect}")}
      $evm.log("info","#{@log_prefix} - VM:<#{vm.name}> End Owner [vm.owner]")
      $evm.log("info","")
    end

    unless vm.operating_system.nil?
      $evm.log("info","#{@log_prefix} - VM:<#{vm.name}> Begin Operating System [vm.operating_system]")
      vm.operating_system.attributes.sort.each { |k, v| $evm.log("info", "#{@log_prefix} - VM:<#{vm.name}> Operating System - #{k}: #{v.inspect}")}
      $evm.log("info","#{@log_prefix} - VM:<#{vm.name}> End Operating System [vm.operating_system]")
      $evm.log("info","")
    end

    unless vm.guest_applications.nil?
      $evm.log("info","#{@log_prefix} - VM:<#{vm.name}> Begin Guest Applications")
      vm.guest_applications.each { |guest_app| guest_app.attributes.sort.each { |k, v| $evm.log("info", "#{@log_prefix} - VM:<#{vm.name}> Guest Application:<#{guest_app.name}> - #{k}: #{v.inspect}")}} unless vm.guest_applications.nil?
      $evm.log("info","#{@log_prefix} - VM:<#{vm.name}> End Guest Applications")
      $evm.log("info","")
    end

    unless vm.snapshots.nil?
      $evm.log("info","#{@log_prefix} - VM:<#{vm.name}> Begin Snapshots")
      vm.snapshots.each { |ss| ss.attributes.sort.each { |k, v| $evm.log("info", "#{@log_prefix} - VM:<#{vm.name}> Snapshot:<#{ss.name}> - #{k}: #{v.inspect}")}} unless vm.snapshots.nil?
      $evm.log("info","#{@log_prefix} - VM:<#{vm.name}> End Snapshots")
      $evm.log("info","")
    end

    unless vm.storage.nil?
      $evm.log("info","#{@log_prefix} - VM:<#{vm.name}> Begin VM Storage [vm.storage]")
      vm.storage.attributes.sort.each { |stor_k, stor_v| $evm.log("info", "#{@log_prefix} - VM:<#{vm.name}> Storage:<#{vm.storage.name}> #{stor_k} - #{stor_v.inspect}")}
      $evm.log("info","#{@log_prefix} - VM:<#{vm.name}> End VM Storage [vm.storage]")
      $evm.log("info","")
    end

    $evm.log("info","#{@log_prefix} - VM:<#{vm.name}> Begin Virtual Columns -----")
    vm.virtual_column_names.sort.each { |vcn| $evm.log("info", "#{@log_prefix} - VM:<#{vm.name}> Virtual Columns - #{vcn}: #{vm.send(vcn).inspect}")}
    $evm.log("info","#{@log_prefix} - VM:<#{vm.name}> End Virtual Columns -----")
    $evm.log("info","")
  end
```

``` ruby
  ####################
  #
  # Method: createSnapshot
  #
  ####################

  def createSnapshot(vm, snap_name, snap_desc=snap_name)
    $evm.log("info","#{@method} - VM:<#{vm.name}> Creating Snapshot:<#{snap_name}> Description:<#{snap_desc}>")
    vm.create_snapshot(snap_name, snap_desc)
  end
```

``` ruby
  ####################
  # Red Hat Virtualization Virtual Machines
  # Method: createSnapshot
  #
  ####################

    def createSnapshot(vm, snap_desc=snap_name)
        $evm.log("info","#{@method} - VM:<#{vm.name}> Creating Snapshot:<#{snap_name}> Description:<#{snap_desc}>")
        vm.create_snapshot(snap_desc)
    end
```

#### VMs (vm)

| Method                    | Use                                    |
| ------------------------- | -------------------------------------- |
| add\_to\_service(service) | Adds the VM to a service object        |
| remove\_from\_service     | Removes the VM from its parent service |

The following table lists the metric types available for the
`get_realtime_metric(metric, range, function)` method for virtual
machines.

| Metric                               | Description                                                          |
| ------------------------------------ | -------------------------------------------------------------------- |
| v\_derived\_storage\_used            | Capacity - Used space in bytes                                       |
| v\_pct\_cpu\_ready\_delta\_summation | CPU - Percentage ready                                               |
| v\_pct\_cpu\_wait\_delta\_summation  | CPU - Percentage wait                                                |
| v\_pct\_cpu\_used\_delta\_summation  | CPU - Percentage used                                                |
| v\_derived\_vm\_count                | State - Peak average virtual machines (Hourly Count / Daily Average) |
| v\_derived\_cpu\_reserved\_pct       | CPU - Percentage available                                           |
| v\_derived\_memory\_reserved\_pct    | Memory - Percentage available                                        |

The following Ruby snippet demonstrates using the
`get_realtime_metric(metric, range, function)` method using the
`v_pct_cpu_ready_delta_summation` metric.

``` ruby
host = $evm.root['vm']
cpu_rdy = vm.get_realtime_metric(:v_pct_cpu_ready_delta_summation, [15.minutes.ago.utc,5.minutes.ago.utc], :avg)
```

{% include_relative _topics/vms_for_clouds_vm_cloud.md %}

{% include_relative _topics/windows_image.md %}

### Creating Categories and Tags

These methods are invoked using $evm.execute. See after the table for
usage examples.

<table>
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<thead>
<tr class="header">
<th>Method(parameter)</th>
<th>Use</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p>category_exists?</p></td>
<td><p>Checks to see if a tag category exists. Usually used with unless or if to then create a category that does not exist.</p>
<p>Example: $evm.execute('category_exists?', "department")</p></td>
</tr>
<tr class="even">
<td><p>category_create</p></td>
<td><p>Creates a new category, and if only one tag value from this category can be assigned to a configuration item, sets that tag value using the <code>single_value</code> option.</p>
<p>Example: $evm.execute('category_create', :name ⇒ "department", :single_value ⇒ false, :description ⇒ "Department")</p>
<p><strong>NOTE:</strong></p>
<p>The <code>category_create</code> method currently does not work as expected. The user interface shows the value provided for <code>:description</code> in the <strong>Display Name</strong> field and the value provided for <code>:example_text</code> is displayed in the <strong>Description</strong> field.</p></td>
</tr>
<tr class="odd">
<td><p>tag_exists?</p></td>
<td><p>Checks to see if a tag exists in a category.</p>
<p>Example: $evm.execute('tag_exists?', "department", "finance")</p></td>
</tr>
<tr class="even">
<td><p>tag_create</p></td>
<td><p>Creates a new tag in the specified category.</p>
<p>Example: $evm.execute('tag_create', "department", :name ⇒ "finance", :description ⇒ "Finance")</p></td>
</tr>
</tbody>
</table>

{% include_relative _topics/category_and_tags_methods_example1.md
%}

{% include_relative _topics/quota2.md %}

1.  Supported for Red Hat Virtualization and VMware virtual machines

2.  Supported for VMware virtual machines only
