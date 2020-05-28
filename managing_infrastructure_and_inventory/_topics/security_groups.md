## Security Groups

You can group instances using security groups to restrict port or IP
address accessibility. Security groups can be created and assigned to
instances using {{ site.data.product.title }} instance provisioning.

Cloud providers that currently support this function include: Amazon
EC2, OpenStack, and Red Hat Enterprise Virtualization.

{% include_relative _topics/adding_a_security_group.md %}

{% include_relative _topics/editing_a_security_group.md %}

{% include_relative _topics/viewing_security_groups.md %}

{% include_relative _topics/tagging_security_groups.md %}

{% include_relative _topics/deleting_a_security_group.md %}
