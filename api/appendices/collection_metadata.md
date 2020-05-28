---
---

## Collection Metadata

Collection specific metadata can be queried by sending an HTTP OPTIONS
request on the specific collection:

    OPTIONS /api/:collection

What gets returned is the following structure:

``` json
{
  "attributes": [
  ],
  "virtual_attributes": [
  ],
  "relationships": [
  ],
  "subcollections": [
  ],
  "data": {
  }
}
```

| Entry               | Description                                         |
| ------------------- | --------------------------------------------------- |
| attributes          | Physical attributes of the collection               |
| virtual\_attributes | Virtual attributes of the collection                |
| relationships       | Physical or Virtual associations to other resources |
| subcollections      | Subcollections that can be queried                  |
| data                | Optional meta-data for the collection               |

The following is an example for the **groups** collection:

    OPTIONS /api/groups

``` json
{
  "attributes": [
    "created_on",
    "description",
    "group_type",
    "id",
    "sequence",
    "settings",
    "tenant_id",
    "updated_on"
  ],
  "virtual_attributes": [
    "allocated_memory",
    "allocated_storage",
    "allocated_vcpu",
    "custom_1",
    "custom_2",
    "custom_3",
    "custom_4",
    "custom_5",
    "custom_6",
    "custom_7",
    "custom_8",
    "custom_9",
    "href_slug",
    "miq_user_role_name",
    "provisioned_storage",
    "read_only",
    "region_description",
    "region_number",
    "user_count"
  ],
  "relationships": [
    "active_vms",
    "custom_action_buttons",
    "custom_actions",
    "custom_attributes",
    "custom_button_sets",
    "custom_buttons",
    "entitlement",
    "miq_custom_attributes",
    "miq_report_results",
    "miq_reports",
    "miq_templates",
    "miq_user_role",
    "miq_widget_contents",
    "miq_widget_sets",
    "taggings",
    "tags",
    "tenant",
    "users",
    "vms"
  ],
  "subcollections": [
    "tags"
  ],
  "data": {
  }
}
```

### Optional Metadata

Most collections do not declare additional metadata as shown by the
empty *data* hash entry above. Optional metadata is made available as
needed for API clients. They are generally used to provide additional
information needed for user-interfaces, help complete or validate data
for additional API calls, etc.

Currently, optional metadata is made available for the following
collections:

| Collection                        |
| --------------------------------- |
| /api/authentications              |
| /api/clusters                     |
| /api/container\_deployments       |
| /api/custom\_buttons              |
| /api/generic\_object\_definitions |
| /api/hosts                        |
| /api/providers                    |

There is no enforced structure for the *data* element as each collection
may need to provide different types of metadata. The following is a
partial meta-data example:

``` data
OPTIONS /api/generic_object_definitions
```

``` json
{
  "attributes": [
    "created_at",
    "description",
    "id",
    "name",
    "properties",
    "updated_at"
  ],
  "virtual_attributes": [
    "generic_objects_count",
    "href_slug",
    "region_description",
    "region_number"
  ],
  "relationships": [
    "custom_action_buttons",
    "custom_actions",
    "custom_button_sets",
    "custom_buttons",
    "generic_objects",
    "picture"
  ],
  "subcollections": [
    "generic_objects"
  ],
  "data": {
    "allowed_association_types": [
      [
        "Availability Zone",
        "AvailabilityZone"
      ],
      ...
      [
        "VM and Instance",
        "Vm"
      ],
      [
        "Zone",
        "Zone"
      ]
    ],
    "allowed_types": [
      [
        "Boolean",
        "boolean"
      ],
      [
        "Date/Time",
        "datetime"
      ],
      [
        "Float",
        "float"
      ],
      [
        "Integer",
        "integer"
      ],
      [
        "String",
        "string"
      ],
      [
        "Time",
        "time"
      ]
    ]
  }
}
```
