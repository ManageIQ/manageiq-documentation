# Adding Azure Cloud Regions

{{ site.data.product.title_short }} allows administrators to add additional Azure cloud regions on
the appliance server. You can use this capability to add new regions that have been
set up since {{ site.data.product.title_short }} was released.  Once added the region it will be available when
creating a new Azure provider.

1.  Click ![config gear](../images/config-gear.png) (**Configuration**).

2.  Click on the **Settings** accordion, then click **ManageIQ Region** at the top.

3.  Click on the **Advanced** tab.

4.  Search for `:ems_azure:`, and enter the regions you want to add
    under `:additional_regions:`.

        Example. To add hypothetical `lunar-base-1` `lunar-base-2` regions:

        :ems_azure:
          :additional_regions:
            :lunar-base-1:
              :name: lunar-base-1
              :description: Lunar Base 1
            :lunar-base-2:
              :name: lunar-base-2
              :description: Lunar Base 2

5.  Click **Save**.
