To eliminate the need to assign *Admin* group privileges to the Amazon
EC2 provider, create an IAM role following the procedure described in
[Creating a Role for an AWS Service
(Console)](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles_create_for-service.html)
in the Amazon Web Services documentation.

Use the following parameters:

1.  Select **EC2** as the service the role will use.

2.  Attach the following permissions:

    1.  `AmazonEC2FullAccess`

    2.  `AmazonS3FullAccess`

    3.  `AmazonSQSFullAccess`

3.  Enter `smartstate` for the **Role name**.

Once the IAM role is created, assign the provider *Power User* privileges as described in [Permissions for Amazon EC2 Providers](../managing_providers/cloud_providers#amazon-provider-permissions).
