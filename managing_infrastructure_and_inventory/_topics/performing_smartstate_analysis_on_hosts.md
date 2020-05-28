# Performing SmartState Analysis on Hosts

Perform a SmartState analysis on a host to collect additional
information about it, such as patches, CPU, and memory.

<div class="note">

  - SmartState analysis on hosts is processed by the **Provider
    Operations** role. It is enabled by default.

  - For ESX or ESXi hypervisors, consider the following: ESX hosts
    utilize a service console for host management and can be accessed
    using SSH. ESXi hosts lack a service console and therefore SSH
    cannot be used to obtain information sets for patches, services,
    Linux packages, user groups, SSH Config, and FS Files.

  - `root` or administrator credentials are required to get patch
    information.

</div>

1.  Navigate to menu:Compute\[Infrastructure \> Hosts\].

2.  Check the hosts to analyze.

3.  Click ![1847](/images/1847.png) (**Configuration**), and then
    ![1942](/images/1942.png)(**Perform SmartState Analysis**).

4.  Click **OK**.
