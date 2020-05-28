### Phase 4: Provisioning

**Target Type: Cloning a Template to a Virtual Machine.**

![Target Type: Cloning a Template to a Virtual
Machine](/images/:../images/2377.png)

**Target Type: Clone to Template.**

![Target Type: Clone to Template](/images/:../images/2378.png)

| Question                                                                                | Answer                                                                                                                                                                                                                    |
| --------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Where can I customize the email message that is sent upon provisioning completion?      | This can be customized using the \[`VM / Provisioning / Email
/ MiqProvision_Complete` \] in either the **Cloud** or **Infrastructure** namespace of your domain.                                                         |
| Where can I change what is put into the virtual machines Annotation after provisioning? | These settings can be modified by leveraging the `_PreProvision Ruby` methods in \[`VM / Provisioning / StateMachines /
Methods`\] in either the \*Cloud\</emphasis\> or **Infrastructure** namespace of your domain.     |
| Where do I set the default VC folder location for provisioning virtual machines?        | This can be modified by leveraging by leveraging the `_PreProvision Ruby` methods in \[`VM / Provisioning / StateMachines /
Methods`\] in either the \*Cloud\</emphasis\> or **Infrastructure** namespace of your domain. |
| Where can I modify the virtual machine customization spec mapping?                      | This can be modified by leveraging by leveraging the `_PreProvision
Ruby` methods in \[`VM / Provisioning / StateMachines / Methods`\] in either the \*Cloud\</emphasis\> or **Infrastructure** namespace of your domain. |
| Where can I modify the Clone\_to\_Template state\_machine?                              | Navigate to \[`VM / Provisioning / StateMachines / VMProvision_VM / template`\] in either the **Cloud** or **Infrastructure** namespace of your domain.                                                                   |
| Where can I modify the Clone\_to\_VM state\_machine?                                    | Navigate to \[`VM /
Provisioning / StateMachines / VMProvision_VM / clone_to_vm`\] in either the **Cloud** or **Infrastructure** namespace of your domain.                                                                |
