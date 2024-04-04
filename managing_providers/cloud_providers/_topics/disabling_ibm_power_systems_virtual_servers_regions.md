## Disabling IBM Power Systems Virtual Server Regions

{{ site.data.product.title_short }} allows administrators to disable IBM Power
Systems Virtual Server regions on the appliance server. You can use this
capability to disable default regions. Once disabled, the region will not be
available for new and existing IBM Power Systems Virtual Server providers.

1.  Browse to ![config gear](../../images/config-gear.png) **Settings** > **Application Settings**.

2.  Click on the **Settings** accordion, then click **{{ site.data.product.title_short }}: Region** at the top.
    Optionally, a server can be selected (within Zones) to limit the disabled
    region to that server only.

3.  Click on the **Advanced** tab.

4.  Search for `:ems_ibm_cloud_power_virtual_servers:`, and enter the regions you want to disable
    under `:disabled_regions:`.

        Example. To disable the `dal` and `eu-de` regions:

        :ems_ibm_cloud_power_virtual_servers:
          :disabled_regions:
          - dal
          - eu-de

5.  Click **Save**.
