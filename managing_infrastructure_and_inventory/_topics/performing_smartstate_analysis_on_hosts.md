# Performing SmartState Analysis on Hosts

Perform a SmartState analysis on a host to collect additional
information about it, such as patches, CPU, and memory.

**Note:**

- SmartState analysis on hosts is processed by the **Provider Operations** role. It is enabled by default.

- For ESX or ESXi hypervisors, consider the following: ESX hosts utilize a service console for host management and can be accessed using SSH. ESXi hosts lack a service console and therefore SSH cannot be used to obtain information sets for patches, services, Linux packages, user groups, SSH Config, and FS Files.

- `root` or administrator credentials are required to get patch information.

1. Browse to menu: **Compute > Infrastructure > Hosts**.

2. Check the hosts to analyze.

3. Click **Configuration**, and then
4. ![1942](../images/1942.png) **Perform SmartState Analysis**.

5. Click **OK**.
