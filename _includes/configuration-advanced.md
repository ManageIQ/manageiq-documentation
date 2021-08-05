# Advanced Configuration

After logging in, you can use the following menu items for advanced configuration of the appliance:

<table>
<caption>Appliance Console Advanced Settings</caption>
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<tbody>
<tr class="odd">
<td><p>Option</p></td>
<td><p>Description</p></td>
</tr>
<tr class="even">
<td><p><strong>Configure Network</strong></p></td>
<td><p>Provides options for configuring the network for your {{ site.data.product.title_short }}
appliance. The appliance is initially configured as a DHCP client with bridged networking.</p>
<p>You can use DHCP to obtain the IP address and network configuration for your
{{ site.data.product.title_short }} appliance, or use an IPv4 or IPv6 static network configuration
by providing specific IP address and network settings.</p>
<p>This menu also provides options to test the network configuration to check that name resolution
is working correctly, and to set the appliance’s host name.</p>
<div class="important">
<p>A valid fully qualified hostname for the {{ site.data.product.title_short }} appliance is
required for SmartState analysis to work correctly.</p>
</div></td>
</tr>
<tr class="odd">
<td><p><strong>Restore Database from Backup</strong></p></td>
<td><p>Restore the Virtual Management Database (VMDB) from a previous backup.</p></td>
</tr>
<tr class="even">
<td><p><strong>Configure Application</strong></p></td>
<td><p>Configure the VMDB. Use this option to configure the database for the appliance after
installing and running it for the first time.</p></td>
</tr>
<tr class="odd">
<td><p><strong>Configure Database Replication</strong></p></td>
<td><p>Configure a primary or standby server for VMDB replication.</p></td>
</tr>
<tr class="even">
<td><p><strong>Logfile Configuration</strong></p></td>
<td><p>Provides options for configuring a new logfile disk volume, and changing the saved logrotate
count.</p></td>
</tr>
<tr class="odd">
<td><p><strong>Configure Application Database Failover Monitor</strong></p></td>
<td><p>Start or stop VMDB failover monitoring.</p></td>
</tr>
<tr class="even">
<td><p><strong>Extend Temporary Storage</strong></p></td>
<td><p>Add temporary storage to the appliance. The appliance formats an unpartitioned disk attached
to the appliance host and mounts it at <code>/var/www/miq_tmp</code>. The appliance uses this
temporary storage directory to perform certain image download functions.</p></td>
</tr>
<tr class="odd">
<td><p><strong>Configure External Authentication (httpd)</strong></p></td>
<td><p>Configure authentication through an IPA server.</p></td>
</tr>
<tr class="even">
<td><p><strong>Update External Authentication Options</strong></p></td>
<td><p>Enable or disable external authentication methods: single sign-on, SAML, and local login.
For example, if the current state is <code>Enabled</code>, the prompt indicates the option should
be <code>Disabled</code>.</p></td>
</tr>
<tr class="odd">
<td><p><strong>Generate Custom Encryption Key</strong></p></td>
<td><p>Regenerate the encryption key used to encode plain text password.</p></td>
</tr>
<tr class="even">
<td><p><strong>Harden Appliance Using SCAP Configuration</strong></p></td>
<td><p>Apply Security Content Automation Protocol (SCAP) standards to the appliance. You can view
these SCAP rules in the <code>/var/www/miq/lib/appliance_console/config/scap_rules.yml</code>
file.</p></td>
</tr>
<tr class="odd">
<td><p><strong>Stop EVM Server Processes</strong></p></td>
<td><p>Stop all server processes. You may need to do this to perform maintenance.</p></td>
</tr>
<tr class="even">
<td><p><strong>Start EVM Server Processes</strong></p></td>
<td><p>Start the server. You may need to do this after performing maintenance.</p></td>
</tr>
<tr class="odd">
<td><p><strong>Restart Appliance</strong></p></td>
<td><p>Restart the {{ site.data.product.title_short }} appliance. You can either restart the
appliance and clear the logs or just restart the appliance.</p></td>
</tr>
<tr class="even">
<td><p><strong>Shut Down Appliance</strong></p></td>
<td><p>Power down the appliance and exit all processes.</p></td>
</tr>
<tr class="odd">
<td><p><strong>Summary Information</strong></p></td>
<td><p>Go back to the network summary screen for the {{ site.data.product.title_short }}
appliance.</p></td>
</tr>
<tr class="even">
<td><p><strong>Quit</strong></p></td>
<td><p>Leave the {{ site.data.product.title_short }} appliance console.</p></td>
</tr>
</tbody>
</table>
