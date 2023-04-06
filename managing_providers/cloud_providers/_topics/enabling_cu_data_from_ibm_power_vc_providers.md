## Enabling Capacity and Utilization data from IBM PowerVC Providers

Complete the following procedure to enable Capacity and Utilization data for an
IBM PowerVC cloud provider in {{ site.data.product.title_short }}.

Virtual Machines for which you want to monitor capacity and utilization data
need to be created with a Compute Template with performance information
collection enabled.

1.  In the IBM PowerVC web interface, navigate to **Virtual Machines >
Compute Templates** in the side menu.

2.  In the Compute Templates Menu, select the **Create  +** button.

3.  During creation of the Compute Template, select the **Miscellaneous**
tab.

4.  Then select the checkbox with the description
**Enable performance information collection**.

5.  Continue with template creation. When ready, select **Create** to create
your template.

Any Virtual Machines created using that template will be able to transmit
Capacity and Utilization data to {{ site.data.product.title_short }}.

![PowerVC Compute Template](../../images/enable-perf-info-collection.png)
