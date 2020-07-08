### Phase 5: Retirement

![image](../images/2379.png)

| Question                                                                                            | Answer                                                                                                                                                                                                                                                                           |
| --------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Where can I customize the email message that is sent upon completion of virtual machine retirement? | This can be customized using the \[`VM /
Retirement / Email / vm_retirement_emails`\] in either the **Cloud** or **Infrastructure** namespace of your domain.                                                                                                                    |
| Where can I customize the email message that is sent during virtual machine retirement warnings?    | This can be customized using the \[`VM /
Retirement / Email / vm_retirement_emails`\] in either the **Cloud** or **Infrastructure** namespace of your domain.                                                                                                                    |
| If I want to customize what gets called during the retirement phase where should I look?            | This can be customized using the \[`VM / Retirement
/ StateMachines / VMRetirement`\] in either the **Cloud** or **Infrastructure** namespace of your domain.                                                                                                                    |
| How can I extend the virtual machine retirement date an additional number of days?                  | Create a custom button for virtual machines that launches \[`/System/Request/vm_retire_extend`\]. Then navigate to the \[`VM /
Retirement / Email / vm_retire_extend`\] Ruby method in the **Cloud** or **Infrastructure** namespaces and set the `vm_retire_extend_days` value. |
