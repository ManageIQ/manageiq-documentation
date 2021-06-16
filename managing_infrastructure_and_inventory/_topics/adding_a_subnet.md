### Adding a Subnet

Add a subnet to an existing cloud network following the procedure below.

1.  Browse to menu: **Networks > Subnets**.

2.  Click **Configuration**, then
    click **Add a new Cloud Subnet**.

3.  Select a **Network Manager**.

4.  Under **Placement**, select a **Cloud Tenant**.

5.  Provide the following **Cloud Subnet** details:

    1.  A descriptive **Subnet Name**.

    2.  The **Gateway** IP address of the router interface for the
        default gateway.

    3.  **Enable DHCP** services for the subnet. DHCP allows automated
        distribution of IP settings to instances.

    4.  Select the **IP Version**. The IP address range in the Network
        Address field must match whichever version you select.

    5.  Input the **Subnet CIDR** address in CIDR format, which contains
        the IP address range and subnet mask in one value.

        **Note:**

        Determine the address by calculating the number of bits masked
        in the subnet mask and append that value to the IP address
        range. For example, the subnet mask 255.255.255.0 has 24 masked
        bits. To use this mask with the IPv4 address range
        192.168.122.0, specify the address 192.168.122.0/24.
        