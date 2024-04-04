## Adding IBM Cloud VPC Regions

{{ site.data.product.title_short }} allows administrators to add additional IBM
Cloud VPC regions on the appliance server. You can use this capability to add
new regions that have been set up since {{ site.data.product.title_short }} was
released. Once added the region it will be available when creating a new IBM
Cloud VPC provider.

1.  Browse to ![config gear](../../images/config-gear.png) **Settings** > **Application Settings**.

2.  Click on the **Settings** accordion, then click **{{ site.data.product.title_short }}: Region** at the top.
    Optionally, a server can be selected (within Zones) to limit the additional
    region to that server only.

3.  Click on the **Advanced** tab.

4.  Search for `:ems_ibm_cloud_vpc:`, and enter the regions you want to add
    under `:additional_regions:`.

        Example. To add hypothetical `lunar-base-1` `lunar-base-2` regions:

        :ems_ibm_cloud_vpc:
          :additional_regions:
            :lunar-base-1:
              :name: Lunar Base 1
              :hostname: lunar-base-1.iaas.cloud.ibm.com
              :description: Lunar Base 1
            :lunar-base-2:
              :name: Lunar Base 2
              :hostname: lunar-base-2.iaas.cloud.ibm.com
              :description: Lunar Base 2

5.  Click **Save**.
