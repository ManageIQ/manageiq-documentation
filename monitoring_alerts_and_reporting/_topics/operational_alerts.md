### Operational Alert Types

<table>
<caption>Operational Alerts</caption>
<colgroup>
<col style="width: 33%" />
<col style="width: 33%" />
<col style="width: 33%" />
</colgroup>
<thead>
<tr class="header">
<th>Driving Event</th>
<th>Explanation (Thresholds, Description)</th>
<th>Proposed Action and Next Steps</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p>EVM Server Start</p></td>
<td><p>Alert is raised when an server starts.</p></td>
<td><p>Send e-email. This is a notification.</p></td>
</tr>
<tr class="even">
<td><p>EVM Server Stop</p></td>
<td><p>Alert is raised when a server stops.</p></td>
<td><p>Send e-mail. Review logs to see why the server stopped.</p></td>
</tr>
<tr class="odd">
<td><p>EVM Server Not Responding</p></td>
<td><p>Alert is raised when one server detects that another server has not responded in 2 minutes.</p></td>
<td><p>This is a sign of a problem that should be investigated. Check logs.</p></td>
</tr>
<tr class="even">
<td><p>EVM Server Exceeded Memory Limit</p></td>
<td><p>Alert is raised when an server has exceeded its system memory limit and begins killing workers. Default is 80%.</p>
<p>Threshold configured in Advanced Settings.</p>
<p>server:</p>
<p>:worker_monitor:</p>
<p>:kill_algorithm:</p>
<p>:name: :used_swap_percent_gt_value</p>
<p>:value: 80</p></td>
<td><p>This may be caused by the following issues:</p>
<p>The server is running with too few resources.</p>
<p>The server is enabled with too many roles or number of workers.</p>
<p>The server picked up all the roles because another server has failed.</p>
<p>A runaway process has taken up most of the memory.</p></td>
</tr>
<tr class="odd">
<td><p>EVM Server is Master</p></td>
<td><p>When one server takes over as a master server.</p></td>
<td><p>Typically, this should only occur when first starting a set of servers, perhaps following expected outages. If a server picks up as master in other situations, the old master had an issue that needs to be researched (such as server not responding in time).</p></td>
</tr>
<tr class="even">
<td><p>EVM Server High System Disk Usage</p></td>
<td><p>The server’s system disk is 80% full. This check is run as part of a system schedule.</p>
<p>Threshold configured in Advanced Settings.</p>
<p>server:</p>
<p>events:</p>
<p>:disk_usage_gt_percent: 80</p></td>
<td><p>Temp files used by the operating system may be filling the disk. Yum updates, normal /tmp files, or temp files in /var/lib/data/miqtemp/ may cause the problem.</p></td>
</tr>
<tr class="odd">
<td><p>EVM Server High App Disk Usage</p></td>
<td><p>The server’s app disk is 80% full. This check is run as part of a system schedule.</p>
<p>Threshold configured in Advanced Settings.</p>
<p>server:</p>
<p>events:</p>
<p>:disk_usage_gt_percent: 80</p></td>
<td><p>Server temp files may remain.</p></td>
</tr>
<tr class="even">
<td><p>EVM Server High Log Disk Usage</p></td>
<td><p>The server’s log disk is 80% full. This check is run as part of a system schedule.</p>
<p>Threshold configured in Advanced Settings.</p>
<p>server:</p>
<p>events:</p>
<p>:disk_usage_gt_percent: 80</p></td>
<td><p>Logs are getting too big or are not being log rotated properly every day. Review the most recent logs.</p></td>
</tr>
<tr class="odd">
<td><p>EVM Server High DB Disk Usage</p></td>
<td><p>The server’s db disk is 80% full. This check is run as part of a system schedule. Applies if using PostgreSQL as the VDMB.</p>
<p>Threshold configured in Advanced Settings.</p>
<p>server:</p>
<p>events:</p>
<p>:disk_usage_gt_percent: 80</p></td>
<td><p>Database or database logging is getting too large. May require <strong>full</strong> vacuuming of PostgreSQL database.</p></td>
</tr>
<tr class="even">
<td><p>EVM Worker Started</p></td>
<td><p>Alert is raised when a worker is about to start.</p></td>
<td><p>This is a notification. Failover may trigger this alert.</p></td>
</tr>
<tr class="odd">
<td><p>EVM Worker Stopped</p></td>
<td><p>Alert is raised when a worker is requested to stop.</p></td>
<td><p>Review logs for reason in the event the worker was not purposefully stopped.</p></td>
</tr>
<tr class="even">
<td><p>EVM Worker Killed</p></td>
<td><p>Alert is raised when a non- responsive worker does not restart on its own and is killed.</p></td>
<td><p>Review logs for reason the worker was killed. May be the result of EVM Worker Not Responding.</p></td>
</tr>
<tr class="odd">
<td><p>EVM Worker Not Responding</p></td>
<td><p>Alert is raised when a worker has not responded for 2 minutes (:heartbeat_timeout) or has not started within 10 minutes (:starting_timeout).</p></td>
<td><p>An influx of events from the Virtual Center or Red Hat Virtualization causes an inability of EVM/CFME to handle the capacity at which they are being queued. Utilize the Event Handler Configuration to filter events that are causing problematic queue table growth.</p></td>
</tr>
<tr class="even">
<td><p>EVM Worker Exceeded Memory Limit</p></td>
<td><p>Alert is raised when a worker exceeds the memory threshold. The default is 150 MB, but some workers have their own value in the :memory_threshold section for that specific worker.</p></td>
<td><p>Review logs for reason the worker is exceeding the memory limit. This may be the result of an overload to the worker process that requires further investigation.</p></td>
</tr>
<tr class="odd">
<td><p>EVM Worker Exceeded Uptime Limit</p></td>
<td><p>Alert is raised when a worker has been running longer than the :restart_interval. (Most workers are set to never restart using the 0.hours setting.) The EMS Refresh SmartProxy workers are set to restart every 2 hours.</p></td>
<td><p>Review logs for the reason the worker is exceeding the limit. This may be the result of an overload to the worker process that needs further investigation.</p></td>
</tr>
<tr class="even">
<td><p>EVM Worker Exit File</p></td>
<td><p>Alert is raised when the scheduler worker exits due to a pending large ntp time change.</p></td>
<td><p>This is a notification.</p></td>
</tr>
</tbody>
</table>
