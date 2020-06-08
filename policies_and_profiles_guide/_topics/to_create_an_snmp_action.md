#### Creating an SNMP Action

To send SNMP traps from the {{ site.data.product.title }} server, you must have the
`Notifier` server role and the SNMP daemons enabled.

1.  Navigate to menu:Control\[Explorer\].

2.  Click the **Actions** accordion, then click
    ![image](../images/1847.png) (**Configuration**),
    ![image](../images/1862.png) (**Add a new Action**).

3.  Enter a **Description** for the action.

4.  Select **Send an SNMP** Trap from **Action Type**.

5.  Type in the IP for the host to send the trap to, select the version
    of SNMP that you are using, and type in the Trap Object ID. Type in
    multiple hosts if you require the trap sent to multiple SNMP hosts.

      - If using SNMP V1, you are prompted for a Trap Number. Type 1, 2,
        or 3, based on the appropriate Suffix Number from table below.

      - If using SNMP V2, you are prompted for a Trap Object ID. Type
        info, warning, or critical, based on the table below.

        | Object ID             | Suffix Number Added to PEN | PEN with the Suffix Added |
        | --------------------- | -------------------------- | ------------------------- |
        | info                  | 1                          | 1.3.6.1.4.1.33482.1       |
        | warn, warning         | 2                          | 1.3.6.1.4.1.33482.2       |
        | crit, critical, error | 3                          | 1.3.6.1.4.1.33482.3       |


        Trap Object ID and Suffix Number

6.  Type in the variables that you require in your message.

7.  Click **Add**.

<div class="note">

When adding an SNMP action, be sure to set it as asynchronous.

</div>
