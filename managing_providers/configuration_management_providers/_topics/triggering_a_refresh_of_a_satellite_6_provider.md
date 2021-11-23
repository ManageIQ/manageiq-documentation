## Triggering a Refresh of a Satellite 6 Provider

Your Satellite 6 provider can still create new hosts independently of
{{ site.data.product.title_short }}. Your {{ site.data.product.title_short }} appliance detects these changes
after an automatic refresh period. However, you can trigger a manual
refresh to avoid waiting for the automatic refresh.

1.  Navigate to menu:Configuration\[Management\].

2.  Select your Red Hat Satellite 6 provider using the checkbox, and
    click menu:Configuration\[Refresh Relationships and Power States\].
    This triggers the refresh.

3.  When the refresh is complete, select the Red Hat Satellite 6
    provider to check the updated list of hosts groups in the provider.
