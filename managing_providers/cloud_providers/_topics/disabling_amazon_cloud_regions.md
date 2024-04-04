## Disabling Amazon Cloud Regions

{{ site.data.product.title_short }} allows administrators to disable Amazon cloud regions on
the appliance server. Use this capability to disable certain classified
regions like AWS GovCloud. Once disabled, the region will not be
available when adding an Amazon EC2 provider.

1.  Click ![config gear](../../images/config-gear.png) **Settings** > **Application Settings**.

2.  Click on the **Settings** accordion, then click **{{ site.data.product.title_short }}: Region** at the top.
    Optionally, a server can be selected (within Zones) to limit the additional
    region to that server only.

3.  Click on the **Advanced** tab.

4.  Search for `:ems_amazon:`, and enter the regions you want to disable
    under `:disabled_regions:`.

        Example. To disable the `ap-northeast-1` region:

        :ems_amazon:
          :disabled_regions:
          - us-gov-west-1
          - ap-northeast-1

5.  Click **Save**.
