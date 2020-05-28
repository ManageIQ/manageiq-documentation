## Enabling {{ site.data.product.title_short }} User Interface Access

To access the {{ site.data.product.title }} virtual appliance user interface, you need
to enable access over ports `80` and `443` to the virtual machine. You
can do this using the CLI or from within the Azure portal.

  - To enable a port using the CLI, enter `az vm open-port --port
    <port-number> --resource-group <resource-group> --name <vm-name>`.

  - To enable a port using the Microsoft Azure portal, open the
    properties for the resource group where the appliance is located,
    click on **Network Security Group**, and add HTTP and HTTPS access.
