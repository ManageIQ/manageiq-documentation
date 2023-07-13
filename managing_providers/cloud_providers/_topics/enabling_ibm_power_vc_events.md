## Enabling Events in IBM PowerVC


Service events must be enabled in IBM PowerVC in order for {{ site.data.product.title_short }} to collect and display them.

1.  Login to the PowerVC CLI and check if the following services are enabled:
    ```
    powervc-config image audit
    powervc-config compute audit
    powervc-config storage audit
    ```

2.  If the services are not enabled, use the following commands to enable them:
    ```
    powervc-config image audit --enable --restart
    powervc-config compute audit --enable --restart
    powervc-config storage audit --enable --restart
    ```

After enabling the services {{ site.data.product.title_short }} will be able to collect and display event data.

## Viewing IBM PowerVC Events in {{ site.data.product.title_short }}

In {{ site.data.product.title_short }}, view events for your IBM PowerVC Provider by following these steps:

1.  Browse to menu: **Compute > Clouds > Providers** and select your IBM PowerVC Provider.

2.  Go to **Monitoring > Timelines** on the provider summary page to view an events timeline for the provider.
