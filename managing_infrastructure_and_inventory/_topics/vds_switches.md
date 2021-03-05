# VMware Networking Switches

After adding a VMware provider, {{ site.data.product.title_short }} automatically discovers
all vSphere distributed switches (vDS) on that provider and collects the
information in the {{ site.data.product.title_short }} inventory.

Navigate to menu:Compute\[Infrastructure \> Networking\] to see a list
of all VMware switches, along with information including *Name*,
*Ports*, and *UUID*. Switches and port groups are listed by provider,
then cluster on the sidebar.

Click on a switch to view its summary page, which displays relationships
with hosts, and any tags.

{% include_relative _topics/tagging_vds_switches.md %}
