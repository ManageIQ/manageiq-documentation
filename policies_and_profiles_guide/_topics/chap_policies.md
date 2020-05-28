{% include policies-intro.md %}

### Control Policies

A control policy is a combination of an event, a condition, and an
action. This combination provides management capabilities in your
virtual environment.

  - An event is a trigger to check a condition.

  - A condition is a test triggered by an event.

  - An action is an execution that occurs if a condition is met.

{% include_relative _topics/to_create_a_control_policy.md %}

{% include_relative
_topics/editing_basic_info_scope_and_notes_for_a_policy.md %}

{% include_relative _topics/copying_a_policy.md %}

{% include_relative _topics/deleting_a_policy.md %}

{% include_relative _topics/creating_a_new_policy_condition.md %}

{% include_relative _topics/editing_policy_condition_assignments.md
%}

{% include_relative _topics/editing_policy_event_assignments.md %}

{% include_relative _topics/to_assign_an_action_to_an_event.md
%}

### Compliance Policies

Compliance policies are specifically designed to secure your environment
by checking conditions that you create. These conditions can include the
same conditions that you would use in a control policy, and most of the
procedures are the same. However, a compliance policy automatically
assigns the mark as a compliant action when the entity type (virtual
machine or host, for example) to which the policy applies passes all of
the conditions. If any of the conditions are not met, then the virtual
machine or host is marked as non-compliant. The compliance status is
shown in the summary screen for the entity type and on the compare and
drift screens.

{% include_relative _topics/to_create_a_compliance_policy.md %}

{% include_relative
_topics/to_create_a_condition_to_check_file_contents_of_a_host.md
%}

#### Checking for Compliance

After you have created your compliance policies and assigned them to a
policy profile, you can check compliance in two ways. You can either
schedule the compliance check or perform the check directly from the
summary screen.

The compliance check runs all compliance policies that are assigned to
the host or virtual machine. If the item fails any of the checks, it is
marked as non-compliant in the item’s summary screen.

<div class="note">

To schedule, you must have `EvmRole-administrator` access to the
{{ site.data.product.title }} server.

</div>

{% include_relative _topics/to_schedule_a_compliance_check.md %}

{% include_relative
_topics/to_check_a_virtual_machine_for_compliance_from_the_summary_screen.md
%}

{% include_relative
_topics/to_check_a_host_for_compliance_from_the_summary_screen.md
%}

{% include_relative
_topics/to_check_a_replicator_for_compliance_from_the_summary_screen.md
%}

{% include_relative
_topics/to_check_a_pod_for_compliance_from_the_summary_screen.md
%}

{% include_relative
_topics/to_check_a_container_node_for_compliance_from_the_summary_screen.md
%}

{% include_relative
_topics/to_check_a_container_image_for_compliance_from_the_summary_screen.md
%}
