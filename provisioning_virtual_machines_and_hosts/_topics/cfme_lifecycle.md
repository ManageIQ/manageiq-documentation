# {{ site.data.product.title_short }} Lifecycle

This guide discusses lifecycle activities such as provisioning and retirement that are part of the {{ site.data.product.title_short }} Automate component. {{ site.data.product.title_short }} Automate enables real-time, bidirectional process integration and adaptive automation for management events and administrative or operational activities.

- Operations Management with service level resource enforcement.

- Resource Management including datastore cleanup, snapshot aging and enforcement, and virtual machine or instance aging and retirement.

- Configuration and Change Management including enforced closed loop change management.

- Lifecycle Management such as provisioning, customization, reconfiguration, approval, CMDB updates, and retirement.

<div class="important">

Provisioning requires the **Automation Engine** server role enabled. Check your server role settings in the settings menu, menu: **Configuration > Server > Server Control**.

</div>

## Provisioning

When a virtual machine or cloud instance is provisioned, it goes through multiple phases. First, the request must be made. The request includes ownership information, tags, virtual hardware requirements, the operating system, and any customization of the request. Second, the request must go through an approval phase, either automatic or manual. Finally, the request is executed. This part of provisioning consists of pre-processing and post-processing. Pre-processing acquires IP addresses for the user, creates CMDB instances, and creates the virtual machine or instance based on information in the request. Post-processing activates the CMDB instance and emails the user. The steps for provisioning may be modified at any time using {{ site.data.product.title_short }}. ![2314](../images/2314.png)
