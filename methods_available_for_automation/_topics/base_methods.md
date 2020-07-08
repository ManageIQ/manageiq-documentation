### Base Methods

These methods may be used with all objects available in the Automate
Model.

| Method                                                                                          | Usage                                                                                                         |
| ----------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------- |
| inspect                                                                                         | Returns a string containing a list of attributes of the object. See the InspectMe method in Samples class     |
| inspect\_all                                                                                    | Returns all information for an object                                                                         |
| virtual\_column\_names                                                                          | Returns the objects virtual columns names                                                                     |
| virtual\_columns\_inspect                                                                       | Returns the objects virtual columns and values                                                                |
| reload                                                                                          | Returns to original object to prevent the internal object from being returned                                 |
| model\_suffix                                                                                   | Returns objects suffix. For an object of type MiqAeServiceVmVmware, returns "Vmware"                          |
| tagged\_with?(category, name)                                                                   | Is the object tagged with the category and name specified?                                                    |
| tags(category = nil)-- this means that category is an optional parameter, with a default of nil | Returns the tags.                                                                                             |
| tag\_assign(tag)                                                                                | Assigns tag to the object, except for the miq\_provision object, which uses add\_tag(category, tag\_name)     |
| tag\_unassign(tag)                                                                              | Unassigns tag to the object, except for the miq\_provision object, which uses clear\_tag(category, tag\_name) |

The **InspectMe** **Sample Method** uses many of the Methods shown in
this document. The method returns attributes of the {{ site.data.product.title }}
Server and then returns attributes for the host, cluster, and virtual
machine from the provider of invocation. In many environments it is
linked to a button.

``` ruby
###################################
# EVM Automate Method: InspectMe
#
# Notes: Dump the objects in storage to the automation.log
#
###################################
begin
  @method = 'InspectMe'
  @log_prefix = "[#{@method}]"
  $evm.log("info", "#{@log_prefix} - EVM Automate Method Started")

  # Turn on verbose logging
  @debug = true



  # List the types of object we will try to detect
  obj_types = %w{ vm host storage ems_cluster ext_management_system }
  obj_type = $evm.root.attributes.detect { |k,v| obj_types.include?(k)}

  # uncomment below to dump root object attributes
  dumpRoot

  # uncomment below to dump miq_server object attributes
  dumpServer


  # If obj_type is NOT nil
  unless obj_type.nil?
    rootobj = obj_type.first
    obj = obj_type.second
    $evm.log("info", "#{@log_prefix} - Detected Object:<#{rootobj}>")
    $evm.log("info","")

    case rootobj
    when 'host' then dumpHost(obj)
    when 'vm' then dumpVM(obj)
    when 'ems_cluster' then dumpCluster(obj)
    when 'ext_management_system' then dumpEMS(obj)
    when 'storage' then dumpStorage(obj)
    end
  end

  #
  # Exit method
  #
  $evm.log("info", "#{@log_prefix} - EVM Automate Method Ended")
  exit MIQ_OK

  #
  # Set Ruby rescue behavior
  #
rescue => err
  $evm.log("error", "#{@log_prefix} - [#{err}]\n#{err.backtrace.join("\n")}")
  exit MIQ_ABORT
end
```
