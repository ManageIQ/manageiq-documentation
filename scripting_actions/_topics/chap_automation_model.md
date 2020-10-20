## Understanding the Automate Model

Automate enables real-time, bi-directional process integration. This
provides users with a method to implement adaptive automation for
management events and administrative or operational activities.

{% include_relative _topics/automate_model2.md %}

{% include_relative _topics/creating_a_domain.md %}

{% include_relative _topics/editing_a_domain.md %}

{% include_relative _topics/deleting_a_domain.md %}

{% include_relative _topics/importing_a_domain.md %}

{% include_relative _topics/changing_priority_order_of_domains.md
%}

{% include_relative _topics/creating_a_namespace.md %}

{% include_relative _topics/to_create_a_class1.md %}

{% include_relative _topics/to_create_a_schema_for_a_class1.md
%}

{% include_relative _topics/to_edit_a_field_in_a_schema1.md %}

{% include_relative _topics/editing_schema_sequence.md %}

{% include_relative _topics/to_add_an_instance_to_a_class1.md %}

{% include_relative _topics/copying_a_class_or_instance.md %}

### Relationships

Relationships are used to connect to other instances in the **Automation
Datastore**. Relationships are formed using URI syntax. The following
can also be passed through a relationship:

  - Use `#` to set the message to send to the item in the relationship.

  - To pass an input to the method use `?` followed by the item to pass.

  - If you want to use a substitution, the syntax is `$\{}` with the
    substitution located between the brackets.

| Example                                                                                 | Explanation                                                                                                                                                                                    |
| --------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `/Cloud/VM/Provisioning/Naming/Default#create`                                          | This relationships uses the Default instance of the Naming class, which provides a means for other classes to name virtual machines. The relationship sends the `create` message to the class. |
| `/Cloud/VM/Provisioning/StateMachines/VMProvision_VM/AcquireMACAddress#$\{#ae_message}` | This relationships substitutes the message to send to the AcquireMACAddress instance of the VMProvision\_VM class with the value in `ae_message`.                                              |
| `/Cloud/VM/Retirement/Email/vm_retirement_emails?event=vm_retired`                      | Invokes the vm\_retirement\_emails instance of the Email class. Also sends the value `vm_retired` in the `event` attribute, which is used in the vm\_retirement\_emails method.                |
| `/Service/Lifecycle/Retirement?service_id=$\{process#service_id}`                       | Invokes the Retirement instance of the Lifecycle class and send a replacement value in `process#service_id` to the `service_id` attribute.                                                     |

### Methods

Methods are pieces of code associated with a class or object to perform
a task. {{ site.data.product.title }} allows for Ruby methods or backing a method
using an Ansible playbook. You can create your own methods or use
relationships to link to pre-existing ones.

{{ site.data.product.title }} ships with a core set of Ruby gems used by the
{{ site.data.product.title }} Rails Application. The Ruby gems in this set are subject
to change. If you are calling gems using Automate that are no longer in
this release, you can install them by using the `gem install` command.

While gems can be imported into automation methods using `require`, it
is recommended that the authors of the automation methods clearly
document the use of gems either in the core set or a custom set. It is
the responsibility of the author of such custom automation to own the
life cycle of any gem being referenced in those methods.

The Release Notes list Ruby gems that have been added, updated, or
removed in the latest version of {{ site.data.product.title }}.

{% include_relative _topics/to_create_a_method1.md %}

{% include_relative _topics/creating_a_dynamic_content_dialog.md
%}

{% include_relative _topics/ansible_method.md %}

{% include_relative _topics/expression_method_overview.md %}

### Simulation

After your model is designed, use the simulate page to test it. It
allows you to see the results in tree and XML view.

{% include_relative _topics/to_simulate_an_automate_model1.md %}

### Importing, Exporting, and Resetting the Datastore

The **Automate Model** can be exported and imported as a YAML file.
{{ site.data.product.title }} allows you to back up your model by export. Red Hat may
provide you with new or updated classes, and provides an import function
for either a class or the entire model. Finally, you can reset the
datastore to its default. Always be sure to export the current datastore
before importing or resetting.

**Note:**

The datastores you are exporting or importing between must use the same
{{ site.data.product.title_short }} version.

</div>

{% include_relative _topics/to_export_all_classes_classes1.md %}

{% include_relative _topics/to_import_datastore_classes1.md %}

{% include_relative
_topics/to_reset_the_datastore_to_the_default1.md %}
