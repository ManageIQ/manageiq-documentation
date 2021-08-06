# Authenticating VMware vCenter Hosts

The procedure below describes how to authenticate the VMware vCenter hosts.

1. Browse to menu: **Compute > Infrastructure > Providers**.

2. Click on a provider to display its summary screen.

3. On the summary screen, click **Hosts** in the **Relationships** information box to
   display the hosts on that provider.

4. Select the hosts to authenticate. You can select all hosts using the **Check All** option.

5. Click **Configuration**

6. Click ![Edit Selected items](../images/1851.png) **Edit Selected items**.

7. In the **Credentials** area, under **Default**, provide the VMware ESXi login credentials:

      - Enter the user name in the **Username** field.

      - Enter the password in the **Password** field.

      - Confirm the password in the **Confirm Password** field.

      - Click **Validate** to confirm {{ site.data.product.title_short }} can connect to the VMware vCenter host.

8. If editing multiple hosts, select a host from the **Select Host to validate against**
   list; provide the VMware ESXi login credentials and click **Validate**.

9. Click **Save**.
