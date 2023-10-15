## Installing Roles on an Embedded Ansible Appliance
{: #installing_roles_embedded_ansible_appliance}

Roles are ways of automatically loading certain variable files, tasks, and handlers based on a known file structure. Grouping content by roles also allows for easy sharing of roles with other users. Install roles on a {{ site.data.product.title_short }} appliance with the Embedded Ansible server role activated to optimize playbooks.

When using this role in a playbook on a {{ site.data.product.title_short }} appliance, add an empty `roles` directory at the root of the playbook. In the `roles` directory, include a `requirements.yml` file with the following contents:

    ---
    - src: <ansible-galaxy-role>

{{ site.data.product.title_short }} automatically installs the role once it sees the `requirements.yml` file in the playbook.
