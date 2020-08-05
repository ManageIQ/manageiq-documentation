---
---

# Support Matrix

{% include_relative _topics/browsers.md %}

{% include_relative _topics/runtime_platforms.md %}


## Feature Support

{{ site.data.product.title_short }} allows you to perform actions on the providers that it manages, and provides features for interacting with and providing information about those providers. This section outlines the status of support for actions that you can perform on providers, and the {{ site.data.product.title_short }} features that allow you to interact with those providers.

**Note:** You can run a rake command to retrieve a list of provider features supported across all platforms. Run the following command in your {{ site.data.product.title_short }} appliance to retrieve the supported features in a comma-separated values (.csv) file format. The comma-separated values are displayed on the command-line interface (CLI) by default. You can use a pipe to redirect the output to a file.

```
ruby /var/www/miq/vmdb/tools/feature_support_matrix.rb
```

{% include_relative _topics/infrastructure_providers.md %}

{% include_relative _topics/cloud_providers.md %}

{% include_relative _topics/container_providers.md %}

{% include_relative _topics/automation_providers.md %}

{% include_relative _topics/remote_consoles.md %}

{% include_relative _topics/operating_systems.md %}

{% include_relative _topics/smartstate_analysis.md %}

