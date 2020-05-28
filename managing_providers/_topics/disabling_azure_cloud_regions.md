# Disabling Azure Cloud Regions

{{ site.data.product.title }} allows administrators to disable Azure cloud regions on
the appliance server. You can use this capability to disable certain
classified regions. Once disabled, the region will not be available when
adding a new Azure provider.

1.  Click ![config gear](/images/config-gear.png) (**Configuration**).

2.  Click on the **Settings** accordion, then click **Zones**.

3.  Click the zone where the {{ site.data.product.title_short }} server is located,
    then click on the EVM server.

4.  Click on the **Advanced** tab.

5.  Search for `:ems_azure:`, and enter the regions you want to disable
    under `:disabled_regions:`.

        Example. To disable the `us-gov-arizona` and `us-gov-texas` regions:

        :ems_azure:
          :disabled_regions:
          - us-gov-arizona
          - us-gov-texas

6.  Click **Save**.
