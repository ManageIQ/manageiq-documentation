# Optimizing Ansible Playbooks for {{ site.data.product.title_short }}

Ansible is a simple model-driven configuration management, multi-node
deployment, and remote-task execution system. When designing playbooks
for use with {{ site.data.product.title_short }} it is helpful to utilize solutions
within the playbook itself to ensure optimal implementation of
playbook-backed services or automated processes.

This section is intended to complement the existing documentation on
Ansible playbooks and guide administrators through optimizing playbooks
for use with {{ site.data.product.title_short }}.

{% include_relative _topics/adding_ansible_galaxy_roles.md %}

{% include_relative _topics/ansible_service_linking.md %}

{% include_relative _topics/manageiq-automate-role.md %}

{% include_relative _topics/ansible_playbook_store_sessions.md %}
