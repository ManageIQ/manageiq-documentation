## Callbacks in Multiple Appliance Environments

In a {{ site.data.product.title }} multiple appliance environment, enable the Embedded
Ansible server role on a dedicated {{ site.data.product.title_short }} appliance. Add
`store_session:sql` to Ansible playbooks to ensure successful callbacks
to {{ site.data.product.title_short }} appliances in a multiple appliance
environment.
