### Phase 2: Request Approval

![image](../images/2376.png)

| Question                                                                                  | Answer                                                                                                                                                                                       |
| ----------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Where can I specify auto-approval values on a per virtual machine template basis?         | Tags can be assigned to templates in the form of \[**prov\_max\_vms**, **prov\_max\_cpus**, **prov\_max\_memory**, **prov\_max\_retirement\_days**\].                                        |
| Where can I modify the default Auto-Approval values?                                      | These values can be set in the \[`Service / Provisioning / StateMachines /
ServiceProvisionRequestApproval / Default`\] class instance in your domain.                                       |
| How can I customize the email that is sent when a request is approved?                    | The Request Approved email message can be modified in \[`VM / Provisioning / Email / MiqProvisionRequest_Approved`\] in either the **Cloud** or **Infrastructure** namespace of your domain. |
| How can I customize the email that is sent when a request is denied?                      | The Request Denied email message can be modified in \[`VM / Provisioning / Email / MiqProvisionRequest_Denied`\] in either the **Cloud** or **Infrastructure** namespace of your domain.     |
| How can I customize the email that is sent when a request is not Auto-approved?           | The Request Pending email message can be modified in \[`VM / Provisioning / Email / MiqProvisionRequest_Denied`\] in either the **Cloud** or **Infrastructure** namespace of your domain.    |
| If a Request Approval requires manual approval, how does an Approver approve the request? | Log into {{ site.data.product.title }} as an approver/admin and navigate to menu:Virtual Machines\[Requests\] and then click on the request.                                                               |
