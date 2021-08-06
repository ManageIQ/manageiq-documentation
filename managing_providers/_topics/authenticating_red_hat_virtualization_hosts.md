# Authenticating Red Hat Virtualization Hosts

After adding a Red Hat Virtualization infrastructure provider, you must authenticate its hosts to enable full functionality.

1. Browse to menu: **Compute > Infrastructure > Providers**.

2. Click on a provider to display its summary screen.

3. On the summary screen, click **Hosts** in the **Relationships** information box to
   display the hosts on that provider.

4. Select the hosts to authenticate. You can select all hosts using the **Check All** option.

5. Click **Configuration**.

6. Click ![Edit this item](../images/1851.png) **Edit this item**.

7. In the **Credentials** area, enter credentials for the following, as required:

    1. **Default**: This field is mandatory. Users should have privileged access such as, root or administrator.

    2. **Remote Login**: Credentials for this field are required if SSH login is disabled for the **Default** account.

    3. **Web Services**: This tab is used for access to Web Services in Red Hat Virtualization.

    4. **IPMI**: This tab is used for access to IPMI.

8. Click **Validate**.

9. If editing multiple hosts:

    1. Select a host from the **Select Host to validate against** list.

    2. If required, enter credentials for **Remote Login**, **Web Services**, and **IPMI** in their respective tabs; click **Validate**.

    3. Select another host to validate each of these credentials against.

10. Click **Add**.
