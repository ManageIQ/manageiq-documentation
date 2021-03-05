# Enabling AWS Config Notifications

Amazon’s AWS Config notifies subscribers of changes in a region through
its Simple Notification Service (SNS). {{ site.data.product.title_short }} subscribes to the
SNS service for AWS Config deltas and converts the deltas into
{{ site.data.product.title_short }} events.

1.  Enable the AWS Config service in the AWS Management Console. See the
    [AWS Config Developer
    Guide](http://aws.amazon.com/documentation/config/) for more
    information.

2.  Create a new Amazon SNS topic named `AWSConfig_topic`.
    {{ site.data.product.title_short }} automatically connects to this topic.

3.  (Optional) Configure the frequency of delta creation in the AWS
    Management Console.

You can assign {{ site.data.product.title_short }} policies to the AWS events listed
below. The appliance performs a provider refresh on all these events
except for `AWS_EC2_Instance_UPDATE`.

<table>
<colgroup>
<col style="width: 33%" />
<col style="width: 33%" />
<col style="width: 33%" />
</colgroup>
<thead>
<tr class="header">
<th>Event</th>
<th>Policies</th>
<th>Refresh</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p>AWS_EC2_Instance_CREATE</p></td>
<td><p>src_vm</p>
<p>vm_create</p></td>
<td><p>ems</p></td>
</tr>
<tr class="even">
<td><p>AWS_EC2_Instance_UPDATE</p></td>
<td><p>N/A</p></td>
<td><p>ems</p></td>
</tr>
<tr class="odd">
<td><p>AWS_EC2_Instance_running</p></td>
<td><p>src_vm</p>
<p>vm_start</p></td>
<td><p>ems</p></td>
</tr>
<tr class="even">
<td><p>AWS_EC2_Instance_stopped</p></td>
<td><p>src_vm</p>
<p>vm_power_off</p></td>
<td><p>ems</p></td>
</tr>
<tr class="odd">
<td><p>AWS_EC2_Instance_shutting-down</p></td>
<td><p>src_vm</p>
<p>vm_power_off</p></td>
<td><p>ems</p></td>
</tr>
</tbody>
</table>
