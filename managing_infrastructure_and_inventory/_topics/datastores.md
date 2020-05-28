# Datastores

A storage location is considered a device where digital information
resides and is connected to a resource. {{ site.data.product.title }} detects,
analyzes, and collects capacity and utilization data for both VMFS and
NFS datastores. Datastores connected to a provider are automatically
created on discovery. On creation of a repository, a datastore is
automatically created.

![datastores](/images/datastores.png)

After detecting datastores, you might want to examine them more closely
to see virtual machines, hosts, and available space.

![2237](/images/2237.png)

1.  File system type

2.  Number of hosts

3.  Number of virtual machines

4.  Available space

{% include_relative
_topics/performing_smartstate_analysis_on_datastores.md %}

{% include_relative _topics/reviewing_a_datastore.md %}

{% include_relative _topics/tagging_a_datastore.md %}

{% include_relative
_topics/viewing_capacity_and_utilization_charts_for_a_datastore.md
%}

{% include_relative _topics/removing_a_datastore.md %}
