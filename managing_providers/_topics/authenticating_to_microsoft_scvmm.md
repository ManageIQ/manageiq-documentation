# Authenticating to Microsoft SCVMM

Before you can add a Microsoft SCVMM provider to your {{ site.data.product.title_short }}
environment, you must enable WinRM to listen for HTTP traffic on
Microsoft SCVMM servers. You must also set the appropriate execution
policy on the Microsoft SCVMM server to allow PowerShell scripts from
the appliance to run remotely.

1.  Log in to the Microsoft SCVMM server.

2.  Enable WinRM for configuration.

        winrm quickconfig

3.  Set the following options:

        winrm set winrm/config/client/auth @{Basic="true"}
        winrm set winrm/config/service/auth @{Basic="true"}
        winrm set winrm/config/service @{AllowUnencrypted="true"}

4.  For Windows 2012 R2 with PowerShell 4.0, use the following syntax to
    set these options:

        winrm set winrm/config/client/auth '@{Basic="true"}'
        winrm set winrm/config/service/auth '@{Basic="true"}'
        winrm set winrm/config/service '@{AllowUnencrypted="true"}'

5.  Enable remote script execution on the SCVMM server using the
    Set-ExecutionPolicy cmdlet.

        Set-ExecutionPolicy RemoteSigned

    For more information on SCVMM remote script execution policies, see
    [Using the Set-ExecutionPolicy
    Cmdlet](http://technet.microsoft.com/en-us/library/ee176961.aspx).

If PowerShell returns an error, search for `log_dos_error_results` in
the `evm.log` and `scvmm.log` files for information.
