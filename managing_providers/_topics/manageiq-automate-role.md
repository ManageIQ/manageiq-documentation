### Modifying the Automate Workspace Using the `manageiq-automate` Role.

The `manageiq-automate` role allows users of {{ site.data.product.title_short }} Automate to
modify and add to the automate workspace via an Ansible playbook.

**Note:**

When using this role in a playbook on a {{ site.data.product.title_short }} appliance with
Embedded Ansible activated, add an empty `roles` directory at the root
of the playbook. In the `roles` directory, include a `requirements.yml`
file with the following contents:

    ---
    - src: syncrou.manageiq-automate

{{ site.data.product.title_short }} will automatically install the role once it sees
the `requirements.yml` file in the playbook.

#### Role Variables

The `manageiq_automate` role employs the following variables when
implemented in a playbook run on a {{ site.data.product.title_short }} appliance.
Variables are defined in `defaults/main.yml` and `vars/main.yml`.

*auto\_commit*: By default is set to `True`. If set to False it will not
auto commit back to {{ site.data.product.title_short }} each call to a `set_` method
in the `manageiq_automate` module.

*manageiq\_validate\_certs*: By default is set to `True`. If passed in
via *extra\_vars* or assigned in the playbook variables then the lookup
will allow self-signed certificates to be used when using SSL REST API
connection URLs.

#### Example Playbook

The example below utilizes the `manageiq-automate` role. Using variable
substitution, playbook tasks retrieve method parameters which are then
used to modify object attributes. A final task uses the `set_retry`
module to update the retry interval.

    - name: Siphon Method Parameters into an object
      hosts: localhost
      connection: local
      vars:
      - auto_commit: True
      - object: root
      - interval: 600

      gather_facts: False
      roles:
      - syncrou.manageiq-automate

      tasks:
        - name: "Get the list of Method Parameters"
          manageiq_automate:
            workspace: "{{ workspace }}"
            get_method_parameters: yes
          register: method_params

        - name: "Set attributes"
          manageiq_automate:
            workspace: "{{ workspace }}"
            set_attributes:
              object: "{{ object }}"
              attributes: "{{ method_params.value }}"

        - name: Set Retry
          manageiq_automate:
            workspace: "{{ workspace }}"
            set_retry:
              interval: "{{ interval }}"
