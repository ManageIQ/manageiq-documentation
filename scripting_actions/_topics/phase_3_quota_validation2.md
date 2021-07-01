### Phase 3: Quota Validation

| Question                                                                          | Answer                                                                                                                                                                                                                                                   |
| --------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Where in {{ site.data.product.title_short }} can I set default quota thresholds for users and groups? | These values can be set in the \[`VM
Provisioning / StateMachines / ProvisionRequestQuotaVerification`\] class instance of either the **Cloud** or **Infrastructure** namespace in your domain.                                                          |
| Where in {{ site.data.product.title_short }} can I set individual and group quota thresholds?         | Tags can be assigned to groups or users by browsing to menu: **Configuration > Access Control**. The following are valid tags that can be assigned to group or individual users: \[**quota\_max\_cpu**, **quota\_max\_memory**, **quota\_max\_storage**\]. |
| Where can I customize the way our virtual machines are named?                     | Virtual machine naming conventions can be altered using the methods in the \[`VM /
Provisioning / Naming`\] class of either the **Cloud** or **Infrastructure** namespace in your domain.                                                                |
| How can I customize the email that is sent when a request is denied?              | The Request Denied email message can be modified in the \[`VM /
Provisioning / Email / MiqProvisionRequest_Denied`\] in either the **Cloud** or **Infrastructure** namespace of your domain.                                                             |
