# Defining the Hostgroup Hierarchy

{{ site.data.product.title }} displays the Red Hat Satellite 6 infrastructure in a
host group and host relationship. A host group defines a set of default
values that hosts inherit when placed in that group. Hosts can belong to
only one host group, but host groups can be nested in hierarchies. You
can create a **"base"** or **"parent"** host group that represents all
hosts in your organization, and then create nested or **"child"** host
groups under that parent to provide specific settings.
