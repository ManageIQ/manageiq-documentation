# Discovering OpenStack Infrastructure Providers

{{ site.data.product.title }} has the ability to discover OpenStack infrastructure
providers. In this process, {{ site.data.product.title_short }} scans a network
segment and searches for the Bare Metal (Ironic) service which runs on
port `6385` by default. Note that, currently, the discovery does not
work if the Bare Metal service has been moved to a different port.

1.  Navigate to menu:Compute\[Infrastructure \> Providers\].

2.  Click ![Configuration](../images/1847.png) (**Configuration**), then
    click ![Discover Infrastructure Providers](../images/1942.png)
    (**Discover Infrastructure Providers**).

3.  Select **OpenStack Infrastructure** under **Discover**.

4.  Provide a **Subnet Range**. Enter the **From Address** and **To
    Address** of the address range.

5.  Click **Start**.
