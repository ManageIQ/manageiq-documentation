---
---

# Embedded Ansible Providers

Ansible integrates with {{ site.data.product.title_short }} to provide automation solutions, using playbooks, for Service, Policy and Alert actions. Ansible playbooks consist of series of *plays* or tasks that define automation across a set of hosts, which is known as the inventory.

Ranging from simple to complex tasks, Ansible playbooks can support cloud management:

- **Services** - allow a playbook to back a {{ site.data.product.title_short }} service catalog item.

- **Control Actions** - {{ site.data.product.title_short }} policies can execute playbooks as actions based on events from providers.

- **Control Alerts** - set a playbook to launch prompted by a {{ site.data.product.title_short }} alert.

Ansible is built into {{ site.data.product.title_short }} so there is nothing to install. The basic workflow when using Ansible in {{ site.data.product.title_short }} is as follows:

1. Enable the **Embedded Ansible** server role.

2. Add a source control repository that contains your playbooks.

3. Establish credentials with your inventory.

4. Back your services, alerts, and policies using available playbooks.

### Enabling the Embedded Ansible Server Role

In {{ site.data.product.title_short }}, the **Embedded Ansible** role is disabled by default. Enable this server role to utilize Ansible Automation Inside.

**Note:** Configure your {{ site.data.product.title_short }} appliance network identity (hostname/IP address) before enabling the Embedded Ansible server role. Restart the `evmserverd` service on the appliance with the enabled Embedded Ansible server role after making any changes to the hostname or IP address.

1. Browse to the settings menu, then **Configuration > Settings**.

2. Select the desired server under **Zones**.

3. Set the **Server Role** for **Embedded Ansible** to **On**.

### Verifying the Embedded Ansible Worker State

Verify that the Embedded Ansible worker has started to utilize its features.

1. Browse to the settings menu, then **Configuration > Diagnostics** and click on the desired server.

2. Click on the **Roles by Servers** tab.

A table of all workers and current status will appear from which you can confirm the state of your embedded Ansible worker.

### Adding a Playbook Repository

Add a repository so that {{ site.data.product.title_short }} can discover and make available your playbooks.

1. Browse to menu: **Automation > Ansible > Repositories**.

2. Click **Configuration**, then ![Add New Repository](../images/1862.png) (**Add New Repository**).

3. Provide a Repository Name in the **Name** field.

4. Add a description for the repository in the **Description** field.

5. Add a **URL** or IP Address for the repository.

6. Select the appropriate **SCM Credentials** from the drop-down menu.

7. Provide a branch name in the **SCM Branch** field.

8. Click **Save**.

Once you have synced a repository, its playbooks will become available to {{ site.data.product.title_short }}.

### Refreshing Repositories

{{ site.data.product.title_short }} allows you to refresh a targeted playbook repository or all repositories in your inventory to ensure your playbooks are current.

Refresh a targeted repository:

1. Browse to menu: **Automation > Ansible > Repositories**.

2. Click on a repository.

3. Click **Configuration**, then ![Refresh this Repository](../images/2003.png) (**Refresh this Repository**).

Alternately, you can refresh some or all repositories from the list view:

1. Browse to menu: **Automation > Ansible > Repositories**.

2. Check those repositories to refresh. Click **Check All** to select all repositories.

3. Click **Configuration**, then ![Refresh Selected Ansible Repositories](../images/2003.png) (**Refresh Selected Ansible Repositories**).

{% include_relative _topics/ansible_credentials.md %}

{% include_relative _topics/tagging_ansible_elements.md %}

{% include_relative _topics/optimizing_playbooks.md %}
