## Overview

{{ site.data.product.title_short }} provides the ability to define services, which can
include one or more virtual machines or instances, and can be deployed
across hybrid environments. Services can be made available to users
through the Self Service user interface, allowing users to order
predefined IT services without IT operations getting involved.

The following three items are required to make a service available to
users from the {{ site.data.product.title_short }} Self Service user interface:

1.  **Service Dialog**: A service dialog is where you allow users to
    configure virtual machine or instance options. A service dialog
    determines which options users get to change. You can choose the
    options presented to the user, from setting the service name to
    changing all provisioning dialog options.

2.  **Service Catalog**: A service catalog is used to group service
    dialogs together.

3.  **Service Catalog Item**: A service catalog item is the actual
    service which combines a service dialog with a provisioning dialog.
