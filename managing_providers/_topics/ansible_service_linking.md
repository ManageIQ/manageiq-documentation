## Ansible Service Linking

{{ site.data.product.title }} provides a module allowing inventoried resources such as
virtual machines created using Ansible playbooks to link back to the
services used to generate them. During service ordering of a playbook
the `add_provider_vms` module will allow the playbook to connect back to
the worker appliance and identify the provider resources it was
responsible for generating. Once linked, the newly generated resources
are available to {{ site.data.product.title_short }}'s life cycle management
features.

Linking VMs back to the service that created it requires implementing
the following tasks in the playbook used for provisioning:

1.  Create a resource and register it.

2.  Link the service using the `add_provider_vms` method to the newly
    created resource.

### Example: Linking a virtual machine to a service

In the following playbook task examples, a virtual machine is deployed
to Amazon EC2 and linked back to the service. Examples are provided for
linking the resource to its service by both an *href slug* and as an
object.

**Note:**

  - This example utilizes the \`syncrou.manageiq-vmdb\`role. This role
    allows {{ site.data.product.title_short }} users to modify and/or change VMDB
    objects using an Ansible playbook. For information on implementing
    and utilizing roles when writing Ansible playbooks for
    {{ site.data.product.title_short }}, see [???](#installing-ansible-roles).

  - For more information on Ansible Galaxy and roles, see the [Ansible
    Galaxy
    documentation](http://docs.ansible.com/ansible/latest/galaxy.html).

  - Note the provider ID in order to successfully link to the service.

</div>

1.  Create and register the resource.

        - name: Create Ec2 Instance
          ec2:
            key_name: "{{ key }}"
            instance_tags: {Name: "{{ name }}"}
            group_id: "{{ security_group }}"
            instance_type: "{{ instance_type }}"
            region: "{{ region }}"
            image: "{{ image }}"
            wait: yes
            count: 1
            vpc_subnet_id: "{{ subnet }}"
            assign_public_ip: yes
          register: ec2

2.  Call the `add_provider_vms` method as an action to link to the
    service via an *href slug* or an object.

        - name: Service Linking via an href slug
          manageiq_vmdb:
            href: "href_slug::services/80"
            action: add_provider_vms
            data:
              uid_ems:
                - "{{ ec2.instances[0].id }}"
              provider:
                id: 24

        - name: Service Linking via an object
          manageiq_vmdb:
            vmdb: "{{ vmdb_object }}"
            action: add_provider_vms
            data:
              uid_ems:
                - "{{ ec2.instances[0].id }}"
              provider:
                id: 24
