#### VM Provision Request (miq\_provision\_request)

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
<td><p>ci_type</p></td>
<td><p>Returns the cloud infrastructure type: vm</p></td>
</tr>
<tr class="odd">
<td><p>eligible_clusters</p></td>
<td><p>Returns an array of available Cluster objects filtered by previously selected resources</p></td>
</tr>
<tr class="even">
<td><p>eligible_customization_templates</p></td>
<td><p>Returns an array of available Customization Templates filtered by previously selected resources</p></td>
</tr>
<tr class="odd">
<td><p>eligible_folders</p></td>
<td><p>Returns an array of available Folder objects filtered by previously selected resources</p></td>
</tr>
<tr class="even">
<td><p>eligible_hosts</p></td>
<td><p>Returns an array of available Host objects filtered by previously selected resources</p></td>
</tr>
<tr class="odd">
<td><p>eligible_iso_images</p></td>
<td><p>Returns an array of available ISO image objects filtered by previously selected resources</p></td>
</tr>
<tr class="even">
<td><p>eligible_pxe_images</p></td>
<td><p>Returns an array of available PXE Image objects filtered by previously selected resources</p></td>
</tr>
<tr class="odd">
<td><p>eligible_pxe_servers</p></td>
<td><p>Returns an array of available PXE Server objects filtered by previously selected resources</p></td>
</tr>
<tr class="even">
<td><p>eligible_resource_pools</p></td>
<td><p>Returns an array of available Resource Pool objects filtered by previously selected resources</p></td>
</tr>
<tr class="odd">
<td><p>eligible_resources(rsc_type)</p></td>
<td><p>Returns eligible resources given the type specified</p></td>
</tr>
<tr class="even">
<td><p>eligible_storages</p></td>
<td><p>Returns an array of available Storage (Datastore) objects filtered by previously selected resources</p></td>
</tr>
<tr class="odd">
<td><p>eligible_windows_images</p></td>
<td><p>Returns an array of available Windows Image objects filtered by previously selected resources</p></td>
</tr>
<tr class="even">
<td><p>get_folder_paths</p></td>
<td><p>Returns a hash where the key is an index and the value is the fully-qualified path name of the folder. (Sample: {7 ⇒ Dev/Dept1/QA, 8 ⇒ Test/Dept2/QA}) This format is useful when a fully-qualified path is required to match the folder name. For example, if you had multiple QA folders under different departments in the sample above. To find the proper QA folder you need to evaluate the entire folder path.</p></td>
</tr>
<tr class="odd">
<td><p>get_retirement_days</p></td>
<td><p>Returns the number of dates until retirement</p></td>
</tr>
<tr class="even">
<td><p>miq_provision</p></td>
<td><p>Returns the task.</p></td>
</tr>
<tr class="odd">
<td><p>miq_request</p></td>
<td><p>Returns the miq_provision_requests miq_request object</p></td>
</tr>
<tr class="even">
<td><p>set_cluster(rsc)</p></td>
<td><p>Set the cluster to use based on object returned from eligible_clusters</p></td>
</tr>
<tr class="odd">
<td><p>set_customization_template(rsc)</p></td>
<td><p>Set the customization_template to use based on object returned from eligible_customization_templates</p></td>
</tr>
<tr class="even">
<td><p>set_folder(folder_path)</p></td>
<td><p>Set the folder to use based on object returned from eligible_folders. In addition, set_folder accepts the following folder types:</p>
<p>Folder Paths - separated by forward slashes. (Must include Data-center name.) Example: Prod/Discovered virtual machine where Prod is the Data-center name and Discovered virtual machine is the folder name.</p>
<p>Object returned from the get_folder_paths method</p></td>
</tr>
<tr class="odd">
<td><p>set_host(rsc)</p></td>
<td><p>Set the host to use based on object returned from eligible_hosts</p></td>
</tr>
<tr class="even">
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
<tr class="odd">
<td><p>set_network_address_mode(mode)</p></td>
<td><p>Sets IP address type. Available modes are dhcp and static</p></td>
</tr>
<tr class="even">
<td><p>set_nic_settings(idx, nic_hash, value=nil)</p></td>
<td><p>Modifies the network interface settings at the operating system level</p>
<p>Available settings:</p>
<p>:addr_mode "dhcp" / "static" (Default: static)</p>
<p>:ip_addr</p>
<p>:subnet_mask</p>
<p>:gateway</p>
<p>:dns_domain</p>
<p>:dns_servers (Windows Only) Comma separated values</p>
<p>:sysprep_netbios_mode (Windows Only) Defined by VMware: <a href="http://www.vmware.com/support/developer/vc-sdk/visdk400pubs/ReferenceGuide/vim.vm.customization.IPSettings.NetBIOSMode.html">http://www.vmware.com/support/developer/vc-sdk/visdk400pubs/ReferenceGuide/vim.vm.customization.IPSettings.NetBIOSMode.html</a></p>
<p>:wins_servers Passed as a string specifying the Primary and Secondary WINS servers separated by a comma. "&lt;PrimaryWINS&gt;, &lt;SecondaryWINS&gt;"</p>
<p>Example: prov.set_nic_settings(1, {:ip_addr⇒10.226.133.55, :subnet_mask⇒'255.255.255.192', :gateway⇒'10.226.133.5', :addr_mode⇒["static", "Static"] } )</p></td>
</tr>
<tr class="odd">
<td><p>set_iso_image(rsc)</p></td>
<td><p>Set the iso_image to use based on object returned from eligible_iso_images</p></td>
</tr>
<tr class="even">
<td><p>set_pxe_image(rsc)</p></td>
<td><p>Set the pxe_image to use based on object returned from eligible_pxe_images</p></td>
</tr>
<tr class="odd">
<td><p>set_pxe_server(rsc)</p></td>
<td><p>Set the pxe_server to use based on object returned from eligible_pxe_servers</p></td>
</tr>
<tr class="even">
<td><p>set_resource_pool(rsc)</p></td>
<td><p>Set the resource_pool to use based on object returned from eligible_resource_pools</p></td>
</tr>
<tr class="odd">
<td><p>set_resource(rsc)</p></td>
<td><p>Sets the resource for the request. (Helper method, should not be called directly)</p></td>
</tr>
<tr class="even">
<td><p>set_retirement_days</p></td>
<td><p>Set the number of days until retirement.</p></td>
</tr>
<tr class="odd">
<td><p>set_storage(rsc)</p></td>
<td><p>Set the Datastore (storage object) to use based on object returned from eligible_storages</p></td>
</tr>
<tr class="even">
<td><p>set_vm_notes(note)</p></td>
<td><p>Sets text for the VM notes (aka annotation) field</p></td>
</tr>
<tr class="odd">
<td><p>set_windows_image(rsc)</p></td>
<td><p>Set the windows_image to use based on object returned from eligible_windows_images</p></td>
</tr>
<tr class="even">
<td><p>source_type</p></td>
<td><p>Returns the provision source type. (values are 'vm' or 'template')</p></td>
</tr>
<tr class="odd">
<td><p>src_vm_id</p></td>
<td><p>Returns ID of the template being cloned</p></td>
</tr>
<tr class="even">
<td><p>target_type</p></td>
<td><p>Returns the provision target type. (values are 'vm' or 'template')</p></td>
</tr>
<tr class="odd">
<td><p>vm_template</p></td>
<td><p>Returns the requests template</p></td>
</tr>
</tbody>
</table>
