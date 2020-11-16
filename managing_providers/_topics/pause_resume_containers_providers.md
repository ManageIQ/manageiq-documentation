# Pausing / Resuming Containers Providers

In {{ site.data.product.title_short }}, you can pause and resume containers
providers. This allows users to add a number of potentially
resource-intensive providers, then pause and resume those that are not
required at a given time. Additionally, when performing maintenance on a
provider, you can pause the provider to prevent {{ site.data.product.title_short }}
from connecting to it, to avoid generating log errors or collecting
partial data.

**Note:**

  - While the provider is paused no data will be collected from it. This
    may cause gaps in inventory, metrics and events.

  - Also, the provider itself is not turned off when paused, but only
    temporarily disables the link between {{ site.data.product.title_short }} and the
    provider. Resuming the provider re-enables the link between
    {{ site.data.product.title_short }} and the provider.

To pause a containers provider:

1.  Navigate to menu:Compute\[Containers \> Providers\].

2.  Click the containers provider that you want to pause.

3.  Click ![Configuration](../images/1847.png) (**Configuration**), and
    then ![Pause this Containers
    Provider](../images/pause-containers-provider.png) (**Pause this
    Containers Provider**).

4.  Click **OK**.

To resume a paused containers provider:

1.  Navigate to menu:Compute\[Containers \> Providers\].

2.  Click the paused containers provider that you want to resume.

3.  Click ![Configuration](../images/1847.png) (**Configuration**), and
    then ![Resume this Containers
    Provider](../images/resume-containers-provider.png) (**Resume this
    Containers Provider**).

4.  Click **OK**.
