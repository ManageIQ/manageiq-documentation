### Quota

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
<td><p>vms_by_owner, vms_by_group, vms_by_owner_and_group</p></td>
<td><p>Collect stats about existing VMs by owner or in the same LDAP group as the owner in the current request.</p>
<p>Sample return object:</p>
<p>{:class_name⇒"Vm", :count⇒5, :ids⇒[22, 120, 121, 122, 117], :cpu⇒6, :memory⇒5120, :allocated_storage⇒29032972288, :used_storage⇒29032972288}</p></td>
</tr>
<tr class="even">
<td><p>retired_vms_by_owner, retired_vms_by_group, retired_vms_by_owner_and_group</p></td>
<td><p>Collect stats about retired VMs, that have not been deleted from the host, by owner or in the same LDAP group as the owner in the current request.</p>
<p>Sample return object:</p>
<p>{:class_name⇒"Vm", :count⇒5, :ids⇒[22, 120, 121, 122, 117], :cpu⇒6, :memory⇒5120, :allocated_storage⇒29032972288, :used_storage⇒29032972288}</p></td>
</tr>
<tr class="odd">
<td><p>provisions_by_owner, provisions_by_group</p></td>
<td><p>Collect stats based on provisions running on the same day as the current request (based on scheduled date or immediate) by owner or in the same LDAP group as the owner. (Results do not include Provision Requests that have not been approved.)</p>
<p>Sample return object:</p>
<p>{:class_name⇒"MiqProvisionRequest", :count⇒6, :ids⇒[115, 116, 104, 102, 105, 112], :cpu⇒6, :memory⇒1536, , :storage⇒62914560}</p></td>
</tr>
<tr class="even">
<td><p>requests_by_owner, requests_by_group</p></td>
<td><p>Collect stats based on provision requests made the same day as the request by the same owner or LDAP group as the owner in the current request, regardless of when the provision request is scheduled to run. (Results do not include Provision Requests that have been denied.)</p>
<p>Sample return object:</p>
<p>{:class_name⇒"MiqProvisionRequest", :count⇒6, :ids⇒[115, 116, 104, 102, 105, 112], :cpu⇒6, :memory⇒1536, , :storage⇒62914560}</p></td>
</tr>
<tr class="odd">
<td><p>active_provisions_by_owner, active_provisions_by_group, active_provisions</p></td>
<td><p>Collect stats based on currently active provision requests by the same owner or LDAP group as the owner in the current request.</p>
<p>Sample return object:</p>
<p>{:class_name⇒"MiqProvisionRequest", :count⇒6, :ids⇒[115, 116, 104, 102, 105, 112], :cpu⇒6, :memory⇒1536, , :storage⇒62914560}</p></td>
</tr>
</tbody>
</table>
