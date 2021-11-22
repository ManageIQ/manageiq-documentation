# Adding Amazon Cloud Regions

{{ site.data.product.title_short }} allows administrators to add Amazon cloud regions on
the appliance server. You can use this capability to add new regions that have been
set up since {{ site.data.product.title_short }} was released.  Once adding the region it will be
available when creating a new Amazon EC2 provider.

1.  Click ![config gear](../images/config-gear.png) (**Configuration**).

2.  Click on the **Settings** accordion, then click **ManageIQ Region** at the top.

3.  Click on the **Advanced** tab.

4.  Search for `:ems_amazon:`, and enter the regions you want to add
    under `:additional_regions:`.

        Example. To add hypothetical `lunar-base-1` `lunar-base-2` regions:

        :ems_amazon:
          :additional_regions:
            :lunar-base-1:
              :name: Lunar Base 1
              :hostname: ec2.lunar-base-1.amazonaws.com
              :description: Lunar Base 1
            :lunar-base-2:
              :name: Lunar Base 2
              :hostname: ec2.lunar-base-2.amazonaws.com
              :description: Lunar Base 2

5.  Click **Save**.
