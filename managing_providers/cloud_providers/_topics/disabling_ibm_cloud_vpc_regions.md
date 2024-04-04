## Disabling IBM Cloud VPC Regions

{{ site.data.product.title_short }} allows administrators to disable IBM Cloud
VPC regions on the appliance server. You can use this capability to disable
certain classified regions. Once disabled, the region will not be available
when adding a new IBM Cloud VPC provider.

1.  Browse to ![config gear](../../images/config-gear.png) **Settings** > **Application Settings**.

2.  Click on the **Settings** accordion, then click **{{ site.data.product.title_short }}: Region** at the top.
    Optionally, a server can be selected (within Zones) to limit the disabled
    region to that server only.

3.  Click on the **Advanced** tab.

4.  Search for `:ems_ibm_cloud_vpc`, and enter the regions you want to disable
    under `:disabled_regions:`.

        Example. To disable the `au-syd` and `br-sao` regions:

        :ems_ibm_cloud_vpc:
          :disabled_regions:
          - au-syd
          - br-sao

5.  Click **Save**.
