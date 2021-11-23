## Triggering a Refresh of an IBM Terraform Provider

Your IBM Terraform provider can still create new hosts independently of {{ site.data.product.title_short }}. Your {{ site.data.product.title_short }} detects these changes after an automatic refresh period. However, you can trigger a manual refresh to avoid waiting for the automatic refresh.

1. Navigate to menu: **Configuration > Providers**.

2. Select your Terraform provider using the checkbox, and click menu: **Configuration > Refresh Relationships and Power States**. This triggers the refresh.

3. When the refresh is complete, select the Terraform provider to check the updated list of Configuration profiles and Configured systems in the provider.
