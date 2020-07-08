Actions are performed after the condition is evaluated. Control comes with a set of default actions that you can choose from. You can also create some of your own.

| Action                                                      | Description                                                                                                        |
| ----------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------ |
| Cancel vCenter Task                                         | Stop current vCenter Task. Due to limitations of vCenter, this applies only to cloning tasks.                      |
| Check Host or VM Compliance                                 | Run compliance checks.                                                                                             |
| Collect Running Processes on VM Guest OS                    | Collect the list of running processes from the guest operating system.                                             |
| Connect All CD-ROM Drives for Virtual Machine               | Connect all the CD-ROM drives for the virtual machine.                                                             |
| Connect All Floppy Drives for Virtual Machine               | Connect all the floppy drives for the virtual machine.                                                             |
| Connect All Floppy and CD-ROM Drives for Virtual Machine    | Connect all of the floppy and CD-ROM drives for virtual machine.                                                   |
| Convert to Template                                         | Convert this virtual machine to a template.                                                                        |
| Delete all Snapshots                                        | Remove all snapshots for a virtual machine.                                                                        |
| Delete Most Recent Snapshot                                 | Removes a virtual machine’s most recent snapshot.                                                                  |
| Delete VM from Disk                                         | Remove the virtual machine from disk.                                                                              |
| Disconnect All CD-ROM Drives for Virtual Machine            | Disconnect all the CD-ROM drives for the virtual machine.                                                          |
| Disconnect All Floppy Drives for Virtual Machine            | Disconnect all the floppy drives for the virtual machine.                                                          |
| Disconnect All Floppy and CD-ROM Drives for Virtual Machine | Disconnect all of the floppy and CD-ROM drives for virtual machine.                                                |
| Execute an external script                                  | Run an external script.                                                                                            |
| Generate Audit Event                                        | Write an entry to the audit log and to the VMDB.                                                                   |
| Generate log message                                        | Write an entry to the {{ site.data.product.title }} log.                                                                         |
| Initiate SmartState Analysis for Host                       | Start a SmartState Analysis for a host.                                                                            |
| Initiate SmartState Analysis for VM                         | Start a SmartState Analysis for a virtual machine.                                                                 |
| Invoke a Custom Automation                                  | For use with {{ site.data.product.title }} automate. It enables you to run tasks and notifications automatically.                |
| Mark as Non-Compliant                                       | Used with compliance policies. Mark resource as non-compliant. (Compliance status is viewable in summary screens.) |
| Prevent current event from proceeding                       | Stop the current event from continuing.                                                                            |
| Put Virtual Machine Guest OS in Standby                     | Put the virtual machines operating system in standby mode.                                                         |
| Raise Automation Event                                      | Used with {{ site.data.product.title }} automate.                                                                                |
| Refresh data from vCenter                                   | Perform a refresh of the vCenter.                                                                                  |
| Remove Virtual Machine from Inventory                       | Take the virtual machine out of inventory.                                                                         |
| Retire Virtual Machine                                      | Retire the virtual machine. (It remains in inventory, but cannot be started.)                                  |
| Show EVM Event on Timeline                                  | To show the EVM event on the timeline.                                                                             |
| Shutdown Virtual Machines Guest OS                          | Shut down the virtual machine’s operating system.                                                                  |
| Start Virtual Machine                                       | Power on the virtual machine.                                                                                      |
| Stop Virtual Machine                                        | Power off the virtual machine.                                                                                     |
| Suspend Virtual Machine                                     | Suspend the virtual machine.                                                                                       |

Default Actions and Descriptions

### Custom Actions

You can create a custom action by using the {{ site.data.product.title }} console. Enter a description and action type. Procedures for each type of action are shown in the following sections. When you create a policy, you can associate actions with specific events.

| Custom Action                     | Description                                                                                                                   |
| --------------------------------- | ----------------------------------------------------------------------------------------------------------------------------- |
| Assign Profile to Analysis Task   | When initiating a Smart State Analysis event, you can assign a specific analysis profile.                                     |
| Create a Snapshot                 | Creates a snapshot with a name that you provide.                                                                              |
| Delete Snapshots by Age           | Removes snapshots based on how old they are.                                                                                  |
| Evaluate Alerts                   | Checks for alerts. This is required for the alert to be delivered.                                                            |
| Inherit Parent Tags               | Assigns tags from the parent cluster, host, datastore, or resource pool.                                                      |
| Invoke a Custom Automation        | For use with {{ site.data.product.title }} automate.                                                                                        |
| Reconfigure CPUs                  | Reconfigure the number of CPUs for a virtual machine to the number you specify.                                               |
| Reconfigure Memory                | Reconfigure the amount of memory for a virtual machine to the amount you specify.                                             |
| Remove Tags                       | Removes tags from the resource.                                                                                               |
| Run Ansible Playbook              | Run an Ansible playbook against an inventory selection.                                                                       |
| Send an E-mail                    | Send an email to an address that you provide. This type of action can be used in an alert.                                    |
| Send an SNMP trap                 | Send an SNMP (Simple Network Management Protocol) trap to the host you specify. This type of action can be used for an alert. |
| Set a Custom Attribute in vCenter | Set the value of a custom attribute in vCenter.                                                                               |
| Tag                               | Assign a company tag that you specify to a virtual machine.                                                                   |

Custom Actions and Descriptions

{% include_relative
_topics/to_create_an_assign_profile_to_analysis_task_action.md
%}

{% include_relative _topics/to_create_a_snapshot_action.md %}

{% include_relative _topics/to_delete_snapshots_by_age.md %}

{% include_relative _topics/to_evaluate_an_alert.md %}

{% include_relative _topics/to_create_an_inherit_tag_action.md %}

{% include_relative _topics/to_create_a_cpu_reconfigure_action.md
%}

{% include_relative
_topics/to_create_a_memory_reconfigure_action.md %}

{% include_relative _topics/to_create_an_remove_tag_action.md %}

{% include_relative _topics/to_create_an_ansible_playbook_run.md
%}

{% include_relative _topics/to_create_an_e-mail_action.md %}

{% include_relative _topics/to_create_an_snmp_action.md %}

{% include_relative
_topics/to_create_a_set_custom_attribute_action.md %}

{% include_relative _topics/to_create_a_tag_action.md %}

{% include_relative _topics/editing_an_action.md %}

{% include_relative _topics/deleting_an_action.md %}
