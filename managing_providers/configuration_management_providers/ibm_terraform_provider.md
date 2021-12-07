# IBM Terraform provider

{{ site.data.product.title_short }} includes an IBM Terraform provider that provides functionality to integrate with the [Managed Services component](https://www.ibm.com/support/knowledgecenter/SSFC4F_2.2.0/cam/cam_intro.html). Managed services uses open source Terraform to manage and deliver cloud infrastructure as code. Terraform is an Open Source software that is developed by HashiCorp that enables predictable and consistent provisioning of many cloud platforms, classic infrastructure, and virtual private cloud (VPC) infrastructure resources by using a high-level scripting language. You can use Terraform to automate your cloud resource provisioning, rapidly build complex, multi-tier cloud environments, and enable Infrastructure as Code (IaC).
{{ site.data.product.title_short }} provides functionality to integrate with Terraform and take advantage of features. This includes:

  - Discovering the inventory from Managed Services, including templates, stacks, and virtual machines provisioned using Terraform.

  - Providing traceability between VM resources provisioned by Terraform and discovered by {{ site.data.product.title_short }}.

  - Applying {{ site.data.product.title_short }} policy tags to hosts.

{% include_relative _topics/adding_a_terraform_provider.md %}

{% include_relative _topics/triggering_a_refresh_of_a_terraform_provider.md %}
