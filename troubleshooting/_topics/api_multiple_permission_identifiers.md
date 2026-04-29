## Disabling a Feature Across All User Interfaces

### Overview

A feature in ManageIQ (such as retiring a service) may have separate feature identifiers for each user interface: the standard UI, Service UI, and API. Disabling a feature identifier in one user interface does not disable the feature in other user interfaces. To fully disable a feature, all of its feature identifiers must be disabled.

### Background

When you edit a user role in **Access Control** → **Roles**, you see a tree of feature identifiers. However, this tree doesn't show which identifiers belong to the same feature across different user interfaces. The API configuration in `api.yml` maps each feature to its related identifiers. If a user has **any** of the identifiers listed for a feature, the API request succeeds.

### Example: Service Retirement Feature

Consider the service retirement feature, which has two distinct feature identifiers:

#### API Configuration
From `config/api.yml`:

```yaml
- :name: retire
  :identifier:
  - service_retire_now
  - sui_services_retire
```

#### Feature Identifier Definitions

**Standard UI Feature Identifier** - `miq_product_features.yml`:
```yaml
- :name: Retire Services
  :description: Retire Services
  :feature_type: control
  :identifier: service_retire_now
```

**Service UI Feature Identifier** - `miq_product_features.yml`:
```yaml
- :name: Retire Service
  :description: Retire Service
  :feature_type: control
  :identifier: sui_services_retire
```

### Implications for Disabling Features

Disabling a feature identifier restricts access in its corresponding user interface (standard UI or Service UI), but does not disable the feature in other user interfaces. Since the API accepts **any** of the listed feature identifiers, all identifiers must be disabled to fully disable the feature across all user interfaces.

### How to Disable a Feature Across All User Interfaces

To fully disable a feature:

1. **Check the main features section** - Navigate to **Access Control** → **Roles** → Your custom role and locate the relevant feature permissions in the features tree. For example, **Everything** → **Services** → **My Services** → **Operate** → **Retire Services**.
2. **Check the Service UI section** - Also review the **Service UI** section of the features tree, as some features have additional permissions for other user interfaces that must be disabled. For example, **Everything** → **Service UI** → **My Services** → **Operate** → **Retire Service**.
3. **Disable all related permissions** - Disable permissions in both sections (e.g., for service retirement, disable both the main service retirement permission and the Service UI retirement permission)
4. **Verify** - Test requests across all interfaces (standard UI, Service UI, and API) and confirm access is denied

### Visual Reference

![Dual Feature Identifier Checkboxes](../images/retire_service.png)

The screenshot shows two separate "Retire Service" feature identifiers—one under **Services** and one under **Service UI**. Both must be disabled to disable the feature across all user interfaces.

### Features with Multiple Identifiers

Features with multiple feature identifiers include:

- Service retirement
- Service creation
- Service modification
- Custom button actions
- Other operations with both standard and Service UI identifiers