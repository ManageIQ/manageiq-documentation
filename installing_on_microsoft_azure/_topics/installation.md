## Installing {{ site.data.product.title }}

Installing {{ site.data.product.title }} consists of the following steps:

1.  Downloading the appliance for your environment as a virtual machine
    image template.

2.  Setting up a virtual machine based on the appliance.

3.  Configuring the {{ site.data.product.title_short }} appliance.

After you have completed all the procedures in this guide, you will have
a working environment on which additional customizations and
configurations can be performed.

### Obtaining the {{ site.data.product.title }} Virtual Appliance

### Uploading and Provisioning the {{ site.data.product.title }} Virtual Appliance in Microsoft Azure

You can upload and provision the appliance in an Azure environment using
the following two methods:

  - Using the Azure PowerShell script

  - Using the Azure Command-Line Interface (Azure CLI)

To upload the {{ site.data.product.title }} appliance file in Microsoft Azure, ensure
the following requirements are met:

  - Approximately 2 GB of space for each VHD image; 44+ GB of space, 12
    GB RAM, and 4 VCPUs for the {{ site.data.product.title }} appliance.

  - [Microsoft Azure Account](https://azure.microsoft.com/en-us/free/).

  - Administrator access to the Azure portal.

  - Depending on your infrastructure, allow time for the upload.

#### Using the Azure PowerShell Script

**Note:**

Make sure Azure Resource Manager cmdlets are available; see [Azure
Resource Manager
Cmdlets](https://msdn.microsoft.com/en-us/library/mt125356.aspx) for the
latest installation information.

</div>

1.  Log in to **Azure Resource Manager** using the cmdlet:

        ## Customize for Your Environment
        $SubscriptionName = "my subscription"

        Login-AzureRmAccount
        Select-AzureRmSubscription -SubscriptionName $SubscriptionName

    When prompted, enter your user name and password for the Azure
    Portal.

2.  Upload the VHD file to a storage account. As shown in the example
    script below, you will first create a **Resource Group** through the
    Portal UI or PowerShell. Additionally, create the storage container
    defined in "BlobDestinationContainer" in advance.

        Example Script:

        ## Customize for Your Environment
        $SubscriptionName = "my subscription"

        $ResourceGroupName = "test"
        $StorageAccountName = "test"

        $BlobNameSource = "example.vhd"
        $BlobSourceContainer = "templates"
        $LocalImagePath = "C:\tmp\$BlobNameSource"

        ##

        # Upload VHD to a "templates" directory. You can pass a few arguments, such as `NumberOfUploaderThreads 8`. The default number of uploader threads is `8`. See https://msdn.microsoft.com/en-us/library/mt603554.aspx

        Add-AzureRmVhd -ResourceGroupName $ResourceGroupName -Destination https://$StorageAccountName.blob.core.windows.net/$BlobSourceContainer/$BlobNameSource -LocalFilePath $LocalImagePath -NumberOfUploaderThreads 8

3.  Create a virtual machine. Then, define your VM and VHD name, your
    system/deployment name and size. Next, you will set the appropriate
    Storage, Network and Configuration options for your environment.

        Example Script:

        ## Customize for Your Environment

        $BlobNameDest = "example.vhd"
        $BlobDestinationContainer = "vhds"
        $VMName = "example"
        $DeploySize= "Standard_A3"
        $vmUserName = "user1"

        $InterfaceName = "test-nic"
        $VNetName = "test-vnet"
        $PublicIPName = "test-public-ip"

        $SSHKey = <your ssh public key>

        ##

        $StorageAccount = Get-AzureRmStorageAccount -ResourceGroup $ResourceGroupName -Name $StorageAccountName

        $SourceImageUri = "https://$StorageAccountName.blob.core.windows.net/templates/$BlobNameSource"
        $Location = $StorageAccount.Location
        $OSDiskName = $VMName

        # Network
        $Subnet1Name = "default"
        $VNetAddressPrefix = "10.1.0.0/16"
        $VNetSubnetAddressPrefix = "10.1.0.0/24"
        $PIp = New-AzureRmPublicIpAddress -Name $PublicIPName -ResourceGroupName $ResourceGroupName -Location $Location -AllocationMethod Dynamic -Force
        $SubnetConfig = New-AzureRmVirtualNetworkSubnetConfig -Name $Subnet1Name -AddressPrefix $VNetSubnetAddressPrefix
        $VNet = New-AzureRmVirtualNetwork -Name $VNetName -ResourceGroupName $ResourceGroupName -Location $Location -AddressPrefix $VNetAddressPrefix -Subnet $SubnetConfig -Force
        $Interface = New-AzureRmNetworkInterface -Name $InterfaceName -ResourceGroupName $ResourceGroupName -Location $Location -SubnetId $VNet.Subnets[0].Id -PublicIpAddressId $PIp.Id -Force

        # Specify the VM Name and Size
        $VirtualMachine = New-AzureRmVMConfig -VMName $VMName -VMSize $DeploySize

        # Add User
        $cred = Get-Credential -UserName $VMUserName -Message "Setting user credential - use blank password"
        $VirtualMachine = Set-AzureRmVMOperatingSystem -VM $VirtualMachine -Linux -ComputerName $VMName -Credential $cred

        # Add NIC
        $VirtualMachine = Add-AzureRmVMNetworkInterface -VM $VirtualMachine -Id $Interface.Id

        # Add Disk
        $OSDiskUri = $StorageAccount.PrimaryEndpoints.Blob.ToString() + $BlobDestinationContainer + "/" + $BlobNameDest

        $VirtualMachine = Set-AzureRmVMOSDisk -VM $VirtualMachine -Name $OSDiskName -VhdUri $OSDiskUri -CreateOption fromImage -SourceImageUri $SourceImageUri -Linux

        # Set SSH key
        Add-AzureRmVMSshPublicKey -VM $VirtualMachine -Path “/home/$VMUserName/.ssh/authorized_keys” -KeyData $SSHKey

        # Create the VM
        New-AzureRmVM -ResourceGroupName $ResourceGroupName -Location $Location -VM $VirtualMachine

    **Note:**

    These are the procedural steps as of the time of writing. For more
    information, see the following Azure documentation.

      - <https://azure.microsoft.com/en-us/documentation/articles/powershell-azure-resource-manager>

    The steps covered in the following article are for a Windows
    machine, however, most of the items are common between Windows and
    Linux.

      - <https://azure.microsoft.com/en-us/documentation/articles/virtual-machines-windows-create-powershell>

    </div>

#### Using the Azure Command-Line Interface

Complete the following steps to upload and provision the
{{ site.data.product.title_short }} virtual appliance using the Azure CLI.

##### Installing the Azure Command-Line Interface

**Note:**

For a complete Azure CLI 2.0 command reference, see [Azure CLI 2.0:
Command reference -
az](https://docs.microsoft.com/en-us/cli/azure/?view=azure-cli-latest).

</div>

1.  Import the Microsoft repository key.

        $ sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc

2.  Create a local Azure CLI repository entry.

        $ sudo sh -c 'echo -e "[azure-cli]\nname=Azure CLI\nbaseurl=https://packages.microsoft.com/yumrepos/azure-cli\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/azure-cli.repo'

3.  Update the yum package index.

        $ yum check-update

4.  Install the Azure CLI.

        $ sudo yum install azure-cli

5.  Log in to Azure.

        $ az login

        Example:

        To sign in, use a web browser to open the page https://aka.ms/devicelogin and enter the code GJP8Y33XY to authenticate.

        [
          {
            "cloudName": "AzureCloud",
            "id": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
            "isDefault": true,
            "name": "Demo Azure account",
            "state": "Enabled",
            "tenantId": "xxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
            "user": {
              "name": "clouduser",
              "type": "user"
            }
          }
        ]

##### Creating Resources for the Appliance in Microsoft Azure Using the Azure Command-Line Interface

Complete the following steps to create resources in Microsoft Azure
using the Azure CLI.

**Note:**

  - If you already have resources you can use, you can skip this section
    and go directly to [Uploading and Provisioning the
    {{ site.data.product.title_short }} Virtual Appliance Using the Azure
    Command-Line
    Interface](#uploading-provisioning-appliance-using-azure-cli).

  - For a complete Azure CLI 2.0 command reference, see [Azure CLI 2.0:
    Command reference -
    az](https://docs.microsoft.com/en-us/cli/azure/?view=azure-cli-latest).

</div>

1.  Create a resource group in an Azure region.

        $ az group create --name <resource-group> --location <azure-region>

        Example:

        [clouduser@localhost]$ az group create --name azrhelclirsgrp --location southcentralus
        {
          "id": "/subscriptions//resourceGroups/azrhelclirsgrp",
          "location": "southcentralus",
          "managedBy": null,
          "name": "azrhelclirsgrp",
          "properties": {
            "provisioningState": "Succeeded"
          },
          "tags": null
        }

2.  Create a storage account; see [SKU type
    descriptions](#storage-sku-types).

        $ az storage account create -l <azure-region> -n <storage-account-name> -g <resource-group --sku <sku_type>

        Example:

        [clouduser@localhost]$ az storage account create -l southcentralus -n azrhelclistact -g azrhelclirsgrp --sku Standard_LRS
        {
          "accessTier": null,
          "creationTime": "2017-04-05T19:10:29.855470+00:00",
          "customDomain": null,
          "encryption": null,
          "id": "/subscriptions//resourceGroups/azrhelclirsgrp/providers/Microsoft.Storage/storageAccounts/azrhelclistact",
          "kind": "Storage",
          "lastGeoFailoverTime": null,
          "location": "southcentralus",
          "name": "azrhelclistact",
          "primaryEndpoints": {
            "blob": "https://azrhelclistact.blob.core.windows.net/",
            "file": "https://azrhelclistact.file.core.windows.net/",
            "queue": "https://azrhelclistact.queue.core.windows.net/",
            "table": "https://azrhelclistact.table.core.windows.net/"
        },
        "primaryLocation": "southcentralus",
        "provisioningState": "Succeeded",
        "resourceGroup": "azrhelclirsgrp",
        "secondaryEndpoints": null,
        "secondaryLocation": null,
        "sku": {
          "name": "Standard_LRS",
          "tier": "Standard"
        },
        "statusOfPrimary": "available",
        "statusOfSecondary": null,
        "tags": {},
          "type": "Microsoft.Storage/storageAccounts"
        }

3.  Get the storage account connection string.

        $ az storage account show-connection-string -n <storage-account-name> -g <resource-group>

        Example:

        [clouduser@localhost]$ az storage account show-connection-string -n azrhelclistact -g azrhelclirsgrp
        {
          "connectionString": "DefaultEndpointsProtocol=https;EndpointSuffix=core.windows.net;AccountName=azrhelclistact;AccountKey=NreGk...=="
        }

4.  Export the connection string. Copy the connection string and paste
    it into the following command. This connects your system to the
    storage account.

        $ export AZURE_STORAGE_CONNECTION_STRING="<storage-connection-string>"

        Example:

        [clouduser@localhost]$ export AZURE_STORAGE_CONNECTION_STRING="DefaultEndpointsProtocol=https;EndpointSuffix=core.windows.net;AccountName=azrhelclistact;AccountKey=NreGk...=="

5.  Create the storage container.

        $ az storage container create -n <container-name>

        Example:

        [clouduser@localhost]$ az storage container create -n azrhelclistcont
        {
          "created": true
        }

6.  Create a virtual network.

        $ az network vnet create -g <resource group> --name <vnet-name> --subnet-name <subnet-name>

        Example:

        [clouduser@localhost]$ az network vnet create --resource-group azrhelclirsgrp --name azrhelclivnet1 --subnet-name azrhelclisubnet1
        {
          "newVNet": {
            "addressSpace": {
              "addressPrefixes": [
              "10.0.0.0/16"
              ]
          },
          "dhcpOptions": {
            "dnsServers": []
          },
          "etag": "W/\"\"",
          "id": "/subscriptions//resourceGroups/azrhelclirsgrp/providers/Microsoft.Network/virtualNetworks/azrhelclivnet1",
          "location": "southcentralus",
          "name": "azrhelclivnet1",
          "provisioningState": "Succeeded",
          "resourceGroup": "azrhelclirsgrp",
          "resourceGuid": "0f25efee-e2a6-4abe-a4e9-817061ee1e79",
          "subnets": [
            {
              "addressPrefix": "10.0.0.0/24",
              "etag": "W/\"\"",
              "id": "/subscriptions//resourceGroups/azrhelclirsgrp/providers/Microsoft.Network/virtualNetworks/azrhelclivnet1/subnets/azrhelclisubnet1",
              "ipConfigurations": null,
              "name": "azrhelclisubnet1",
              "networkSecurityGroup": null,
              "provisioningState": "Succeeded",
              "resourceGroup": "azrhelclirsgrp",
              "resourceNavigationLinks": null,
              "routeTable": null
            }
          ],
          "tags": {},
          "type": "Microsoft.Network/virtualNetworks",
          "virtualNetworkPeerings": null
          }
        }

##### Uploading and Provisioning the {{ site.data.product.title_short }} Virtual Appliance Using the Azure Command-Line Interface

You can now upload and provision the appliance in an Azure environment
using the Azure Command-Line Interface (Azure CLI).

1.  Upload the image to the storage container. It may take several
    minutes. Note: Enter `az storage container list` to get the list of
    storage containers.

        $ az storage blob upload --account-name <storage-account-name> --container-name <container-name> --type page --file <path-to-vhd> --name <image-name>.vhd

        Example:

        $ az storage blob upload --account-name azrhelclistact --container-name azrhelclistcont --type page --file example.vhd --name example.vhd

        Finished[#############################################################]  100.0000%

2.  Get the URL for the uploaded VHD file using the following command.
    You will need to use this URL in the next step.

        $ az storage blob url -c <container-name> -n <image-name>.vhd

        Example:

        $ az storage blob url -c azrhelclistcont -n example.vhd

        "https://azrhelclistact.blob.core.windows.net/azrhelclistcont/example.vhd"

3.  Create a reusable image from a blob and then use a managed disk.

        Example:

        $ az image create -n <image-name> -g <{{ site.data.product.title_abbr }}-appliance-group> --os-type <linux> --source <https://{{ site.data.product.title_abbr }}storageaccount.blob.core.windows.net/{{ site.data.product.title_abbr }}storagecontainer/example.vhd>

4.  Create the virtual machine. Note that the following command uses
    `--generate-ssh-keys`. In this example, the private/public key pair
    `/home/clouduser/.ssh/id_rsa` and `/home/clouduser/.ssh/id_rsa.pub`
    are created.

        $ az vm create --resource-group <resource-group> --location <azure-region> --use-unmanaged-disk --name <vm-name> --storage-account <storage-account-name> --os-type linux --admin-username <administrator-name> --generate-ssh-keys --image <URL>

        Example:

        az vm create --resource-group azrhelclirsgrp --location southcentralus --use-unmanaged-disk --name {{ site.data.product.title_abbr }}-appliance-1 --storage-account azrhelclistact --os-type linux --admin-username clouduser --generate-ssh-keys --image https://azrhelclistact.blob.core.windows.net/azrhelclistcont/example.vhd

        {
          "fqdns": "",
          "id": "/subscriptions//resourceGroups/azrhelclirsgrp/providers/Microsoft.Compute/virtualMachines/{{ site.data.product.title_abbr }}-appliance-1",
          "location": "southcentralus",
          "macAddress": "00-0X-XX-XX-XX-XX",
          "powerState": "VM running",
          "privateIpAddress": "10.0.0.4",
          "publicIpAddress": "12.84.121.147",
          "resourceGroup": "azrhelclirsgrp"
        }

    Make a note of the public IP address. You will need this to log in
    to the virtual machine in the next step.

5.  Start an SSH session and log in to the appliance.

        $ ssh -i <path-to-ssh-key> <admin-username@public-IP-address>

        Example:

        $ ssh  -i /home/clouduser/.ssh/id_rsa clouduser@12.84.121.147
        The authenticity of host '12.84.121.147' can't be established.
        Are you sure you want to continue connecting (yes/no)? yes
        Warning: Permanently added '12.84.121.147' (ECDSA) to the list of known hosts.

        Welcome to the Appliance Console

        For a menu, please type: appliance_console

6.  Enter `sudo appliance_console` at the prompt. The summary screen
    appears.

You have successfully provisioned a {{ site.data.product.title_short }} virtual
appliance in Microsoft Azure.

**Note:**

The exported storage connection string does not persist after a system
reboot. If any of the commands in the above steps fail, export the
storage connection string again using the following commands:

1.  Get the storage account connection string.

        $ az storage account show-connection-string -n <storage-account-name> -g <resource-group>

        Example:

        $ az storage account show-connection-string -n azrhelclistact -g azrhelclirsgrp
        {
          "connectionString": "DefaultEndpointsProtocol=https;EndpointSuffix=core.windows.net;AccountName=azrhelclistact;AccountKey=NreGk...=="
        }

2.  Export the connection string. Copy the connection string and paste
    it into the following command. This connects your system to the
    storage account.

        $ export AZURE_STORAGE_CONNECTION_STRING="<storage-connection-string>"

        Example:

        $ export AZURE_STORAGE_CONNECTION_STRING="DefaultEndpointsProtocol=https;EndpointSuffix=core.windows.net;AccountName=azrhelclistact;AccountKey=NreGk...=="

</div>

  - You will need to create a data disk for the database; see
    <https://docs.microsoft.com/en-us/azure/virtual-machines/linux/add-disk>
    for information about how to add a persistent disk to store your
    data.

  - See [Database Requirements](../deployment_planning_guide/index.html#database-requirements) for some general guidelines for your database requirements.

  - For information about Azure ports used by {{ site.data.product.title_short }},
    see [Configuring Firewall Ports](../appliance_hardening_guide/index.html#configuring-firewall-ports).
