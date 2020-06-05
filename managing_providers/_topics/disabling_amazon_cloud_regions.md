# Disabling Amazon Cloud Regions

{{ site.data.product.title }} allows administrators to disable Amazon cloud regions on
the appliance server. Use this capability to disable certain classified
regions like AWS GovCloud. Once disabled, the region will not be
available when adding an Amazon EC2 provider.

1.  Click ![config gear](../images/config-gear.png) (**Configuration**).

2.  Click on the **Settings** accordion, then click **Zones**.

3.  Click the zone where the {{ site.data.product.title_short }} server is located,
    then click on the EVM server.

4.  Click on the **Advanced** tab.

5.  Search for `:ems_amazon:`, and enter the regions you want to disable
    under `:disabled_regions:`.

        Example. To disable the `ap-northeast-1` region:

        :ems_amazon:
          :disabled_regions:
          - us-gov-west-1
          - ap-northeast-1

6.  Click **Save**.

<div class="note">

In AWS, Government regions are disabled by default. To enable a disabled
region, be sure to do so in the `production.yml` configuration file
manually.

</div>
