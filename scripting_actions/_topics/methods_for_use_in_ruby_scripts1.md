### Methods for use in Ruby Scripts

To use one of these in one of your own Ruby methods, use the syntax of
`vm.method`. For example, to reboot the guest operating system, use
`vm.rebootGuest`.

| Method                      | Description                                                                                                               |
| --------------------------- | ------------------------------------------------------------------------------------------------------------------------- |
| start                       | Start Virtual Machine container.                                                                                          |
| stop                        | Stop Virtual Machine container.                                                                                           |
| suspend                     | Suspend Virtual Machine container.                                                                                        |
| unregister                  | Unregister Virtual Machine.                                                                                               |
| collect\_running\_processes | Collect the running processes from a started Virtual Machine.                                                             |
| shutdownGuest               | Shutdown the guest operating system of the VM container. Requires VMware tools (or vendors tools) installed on the guest. |
| standbyGuest                | Put the guest operating system into standby. Requires VMware tools (or vendors tools) installed on the guest.             |
| rebootGuest                 | Reboot the guest operating system. Requires VMware tools (or vendors tools) installed on the guest.                       |
