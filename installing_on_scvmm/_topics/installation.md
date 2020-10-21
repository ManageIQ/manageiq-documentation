## Installing {{ site.data.product.title }}

Installing {{ site.data.product.title }} consists of the following steps:

1.  Downloading the VHD image to your SCVMM Library.

2.  Creating a blank VHD to be used for the database disk.

3.  Running a PowerShell script to create a deployable template for the
    {{ site.data.product.title_short }} appliance.

4.  Configuring the {{ site.data.product.title_short }} appliance.

After you have completed all the procedures in this guide, you will have
a working environment on which you can perform additional customizations
and configurations.

**Requirements.**

Uploading the {{ site.data.product.title_short }} appliance file to SCVMM requires:

  - A Microsoft System Center Virtual Machine Manager environment with
    at least one Hyper-V node.

  - 44 GB of storage space.

  - 12 GB RAM.

  - 4 vCPUs.

  - An Admin privileged account for the SCVMM environment

### Obtaining the Appliance

### Deploying the Appliance

Create a blank VHD to be used for the database disk and add it to your
SCVMM Library, create a template for the {{ site.data.product.title_short }}
appliance, then deploy a virtual machine to run the appliance.

1.  Create a blank VHD to be used for the database disk and add it to
    your SCVMM Library. Run this command on a node containing Hyper-V.

    For example, on a node with Hyper-V installed you can create a 20GB
    blank VHD with the following PowerShell command:

        PS C:\Users\Administrator.MS01> New-VHD -Path 'C:\path\to\my\newvdisk.vhdx' -SizeBytes 20gb -Dynamic

2.  Copy the blank VHD disk to the SCVMM Library.

3.  In a PowerShell terminal, run `'Refresh-LibraryShare'` to refresh
    the library:

        PS C:\Users\Administrator.MS01> 'Refresh-LibraryShare'

4.  Run the following PowerShell script to create a deployable template
    for the {{ site.data.product.title_short }} appliance, substituting values for
    your environment:

        $networkName = "yourNetwork"
        $templateName = "myNewCFMETemplate"
        $templateOwner = "ownerUsername"
        $memorySizeMb = 12288
        $cpuCount = 4
        $srcPath = "C:\path\to\vhd\in\Library"
        $dbDiskSrcPath = "C:\path\to\db\vhd\in\Library"
        $templateOsType = "Red Hat Enterprise Linux 7 (64 bit)"
        $scvmmFqdn = "fqdn.of.scvmm.com"

        $JobGroupId01 = [Guid]::NewGuid().ToString()
        $LogicalNet = Get-SCLogicalNetwork -Name $networkName
        New-SCVirtualNetworkAdapter -JobGroup $JobGroupID01 -MACAddressType Dynamic
            -LogicalNetwork $LogicalNet -Synthetic
        New-SCVirtualSCSIAdapter -JobGroup $JobGroupID01 -AdapterID 6 -Shared $False
        New-SCHardwareProfile -Name $templateName -Owner $templateOwner
            -Description 'Temp profile used to create a VM Template' -MemoryMB
        $memorySize
            -CPUCount $cpuCount -JobGroup $JobGroupID01
        $JobGroupId02 = [Guid]::NewGuid().ToString()
        $VHD = Get-SCVirtualHardDisk | where {{ $_.Location -eq $srcPath }} | where {{
        $_.HostName -eq $scvmmFqdn }}
        New-SCVirtualDiskDrive -IDE -Bus 0 -LUN 0 -JobGroup $JobGroupID02
        -VirtualHardDisk $VHD
        $DBVHD = Get-SCVirtualHardDisk | where {{ $_.Location -eq $dbDiskSrcPath }}
        New-SCVirtualDiskDrive -IDE -Bus 1 -LUN 0 -JobGroup $JobGroupID02
        -VirtualHardDisk $DBVHD
        $HWProfile = Get-SCHardwareProfile | where {{ $_.Name -eq $templateName }}
        $OS = Get-SCOperatingSystem | where {{ $_.Name -eq $templateOsType }}
        New-SCVMTemplate -Name $templateName -Owner $templateOwner -HardwareProfile
        $HWProfile `
            -JobGroup $JobGroupID02 -RunAsynchronously -Generation 1 -NoCustomization
        Remove-HardwareProfile -HardwareProfile $templateName

5.  Deploy a virtual machine to a host group from the created template.

    Run the following PowerShell script, substituting values for your
    environment:

        $tpl = Get-SCVMTemplate -Name $templateName -VMMServer $scvmmServer
        $vm_hg = Get-SCVMHostGroup -Name $hostGroup -VMMServer $scvmmServer
        $vmc = New-SCVMConfiguration -VMTemplate $tpl -Name $vmName -VMHostGroup $vm_hg
        Update-SCVMConfiguration -VMConfiguration $vmc
        New-SCVirtualMachine -Name $vmName -VMConfiguration $vmc

    **Note:**

    Substitute these values in your PowerShell script:

      - $hostGroup = "NAME\_OF\_HOST\_GROUP\_TO\_DEPLOY\_TO"

      - $scvmmServer = "NAME\_OF\_YOUR\_SCVMM\_SERVER"

      - $templateName = "NAME\_OF\_CFME\_TEMPLATE"

      - $vmName = "NAME\_OF\_YOUR\_NEW\_VM"

    </div>

Your SCVMM environment now contains a running {{ site.data.product.title_short }}
appliance which you can configure.
