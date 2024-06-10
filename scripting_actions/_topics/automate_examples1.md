### Automate Examples

This chapter describes the ways to invoke an Automate workflow.
Automation can be initiated through an alert, an event, a
{{ site.data.product.title_short }} application, or a custom button. The same automation
process can be re-used across more than one of these. For example, using
automation to remove orphaned virtual machines and instances could be
initiated by:

  - An administrator request from the {{ site.data.product.title_short }} console (from a
    custom button)

  - An alert indicating the datastore has less than 20% free-space

  - A virtual machine or instance unregistered event is detected

All invocations of an automate model must enter through the
`/System/Process` namespace.

You can use automation to create a Provisioning Dialog that modifies the provisioning parameters of a VM service. For more information, see [Example: Provisioning a VM service](../../provisioning_virtual_machines_and_hosts/_topics/catalogs_and_services.md#provisioning-dialog)
