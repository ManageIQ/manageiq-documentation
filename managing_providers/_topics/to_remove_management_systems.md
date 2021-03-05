# Removing a Provider

If a provider has been decommissioned or requires some troubleshooting,
it might require deletion from the VMDB.

Deleting a provider removes the account information from {{ site.data.product.title_short }}
console. You will no longer be able to view any associated history
including chargeback reports generated for the deleted provider.
Additionally, if {{ site.data.product.title_short }} is the database of record, deleting
providers would become a major problem for the other systems relying on
it for accurate and consistent billing information. Review all the
dependencies carefully before deleting a provider.

1.  Navigate to menu:Compute\[Infrastructure \> Providers\].

2.  Select the check box for the provider to delete.

3.  Click ![Configuration](../images/1847.png) (**Configuration**), then
    ![Remove Infrastructure Providers from the VMDB](../images/2098.png)
    (**Remove Infrastructure Providers from the VMDB**).

4.  Click (**OK**).
