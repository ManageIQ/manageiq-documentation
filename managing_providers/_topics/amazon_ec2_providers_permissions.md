# Permissions for Amazon EC2 Providers

Further limiting API access limitations can limit Automate capabilities,
as Automate scripts directly access the AWS SDK to create brand new
application functionality.

The AWS services primarily accessed by the {{ site.data.product.title_short }} API
include:

  - Elastic Compute Cloud (EC2)

  - CloudFormation

  - CloudWatch

  - Elastic Load Balancing

  - Simple Notification Service (SNS)

  - Simple Queue Service (SQS)

## Manually Creating an Amazon EC2 Role

{% include_relative _topics/amazon_ec2_manual_role_creation.md %}
