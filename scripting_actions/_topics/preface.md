The Automate model provides flexibility to not only change parts of the
provisioning process, but also to allow you to automate other
operational tasks. Below are some scenarios where the Automate model can
help accomplish these tasks.

  - Intelligent Workload Management - An enterprise had a requirement
    that when a virtual machine has reached a High CPU Percent Ready for
    a specified period of time, a vMotion should occur to a more
    suitable host. For this reason, VMware’s Distributed Resource
    Scheduler (DRS) was not practical, as the CPU Ready metric could not
    trigger DRS. The solution was to leverage {{ site.data.product.title }} Control
    and {{ site.data.product.title }} Automate to drive the management of this
    workflow.

  - Power on only during business hours - An organization which gave a
    group of self-service users {{ site.data.product.title }} access had a requirement
    to only allow certain virtual machines to be powered during business
    hours. This was solved with {{ site.data.product.title }} Automate.

  - Auto-Tagging virtual machines based on file contents - An IT
    organization needed a way to consume information from a text file on
    a virtual machine and dynamically populate vCenter. The data used to
    auto-tag virtual machines is also used to align unmanaged virtual
    machines to the business.
