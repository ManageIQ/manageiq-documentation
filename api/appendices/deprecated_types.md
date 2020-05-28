---
---

## Deprecated Types

This page lists the types that have been deprecated in previous releases
and have been updated to newer types. They are *temporarily* supported
in the listed releases but will be removed in future releases.

### API v2.4.0 ⇒ v3.0.0

For Orchestration Templates:

| Old Type                   | New Type                                                            |
| -------------------------- | ------------------------------------------------------------------- |
| OrchestrationTemplateAzure | ManageIQ::Providers::Azure::CloudManager::OrchestrationTemplate     |
| OrchestrationTemplateHot   | ManageIQ::Providers::Openstack::CloudManager::OrchestrationTemplate |
| OrchestrationTemplateCfn   | ManageIQ::Providers::Amazon::CloudManager::OrchestrationTemplate    |
| OrchestrationTemplateVnfd  | ManageIQ::Providers::Openstack::CloudManager::VnfdTemplate          |
