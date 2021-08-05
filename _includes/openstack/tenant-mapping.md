# Tenant Mapping

When adding an OpenStack cloud or infrastructure provider, enable *tenant mapping* in
{{ site.data.product.title_short }} to map any existing tenants from that provider.

This means {{ site.data.product.title_short }} will create new cloud tenants to match
each existing OpenStack tenant; each new cloud tenant and its corresponding OpenStack
tenant will have identical resource assignments (including user and role synchronization)
with the exception of quotas. Tenant quotas are not synchronized between
{{ site.data.product.title_short }} and OpenStack, and are available for reporting
purposes only. You can manage quotas in {{ site.data.product.title_short }} but this will
not affect the quotas created in OpenStack.

During a provider refresh, {{ site.data.product.title_short }} will also check for any
changes to the tenant list in OpenStack. {{ site.data.product.title_short }} will create
new cloud tenants to match any new tenants, and delete any cloud tenants whose
corresponding OpenStack tenants no longer exist. {{ site.data.product.title_short }} will
also replicate any changes to OpenStack tenants to their corresponding cloud tenants.

If you leave tenant mapping disabled, {{ site.data.product.title_short }} will not create
cloud tenants or tenant object hierarchy from OpenStack.
