## Installing {{ site.data.product.title_short }}

Installing {{ site.data.product.title_short }} consists of the following steps:

1. Downloading the appliance for your environment as a virtual machine snapshot template.

2. Setting up a virtual machine based on the appliance.

3. Configuring the {{ site.data.product.title_short }} appliance.

After you have completed all the procedures in this guide, you will have a working environment on which additional customizations and configurations can be performed.

### Obtaining the appliance

### Requirements

Below are the two sets of requirements for installing {{ site.data.product.title_short }} on Amazon EC2.

### {{ site.data.product.title_short }} Requirements

  - 44 GB of space on the chosen datastore.

  - 12 GB RAM.

  - 4 vCPUs.

  - Check that there are inbound rules to access ports 443, 22, and 80.
#### Amazon EC2 Requirements

  - An Amazon S3 bucket to store the disk image that will be imported to AWS as a snapshot.

  - A VM import service role (IAM role) named `vmimport`.

For information on creating an Amazon S3 bucket and a VM Import Service Role, see the [Amazon EC2
documentation](https://docs.aws.amazon.com/vm-import/latest/userguide/vmimport-image-import.html).

### Uploading the Appliance to an Amazon S3 Bucket

From your local file system, you can now upload the {{ site.data.product.title_short }} appliance VHD image obtained in [Obtaining the appliance](#obtaining-the-appliance) to the Amazon S3 bucket, using your choice of tool, such as AWS client or directly upload the Appliance image from your S3 bucket on AWS Management Console.

### Configuring Amazon EC2 to Import the Appliance

**Important:**

These are the procedural steps as of the time of writing. For the latest information on importing a virtual machine as an image, see the [Amazon EC2 documentation](https://docs.aws.amazon.com/vm-import/latest/userguide/vmimport-image-import.html).

1. Install the AWS client on the computer you want to interact with the AWS API from.

        $ pip install awscli

2. Configure and download your AWS secret/access key by following the steps in the [Managing Access Keys for Your AWS Account](https://docs.aws.amazon.com/general/latest/gr/managing-aws-access-keys.html) documentation.

3. Configure the AWS client with your access/secret key. For example:

        $ aws configure
        AWS Access Key ID [******]: ACCESS_KEY
        AWS Secret Access Key [******]: SECRET_KEY
        Default region name [None]:
        Default output format [None]:

4. Create the `trust-policy.json` file for the **vmimport** role. For example:

        {
           "Version": "2012-10-17",
           "Statement": [
              {
                 "Effect": "Allow",
                 "Principal": { "Service": "vmie.amazonaws.com" },
                 "Action": "sts:AssumeRole",
                 "Condition": {
                    "StringEquals":{
                       "sts:Externalid": "vmimport"
                    }
                 }
              }
           ]
        }

5. Create the **vmimport** role using the `trust-policy.json` file that you just created.

        $ aws iam create-role --role-name vmimport --assume-role-policy-document file://trust-policy.json

    **Note:**

    This user must have permissions to create and modify IAM roles.

    
6. Create the `role-policy.json` file. Be sure to use the exact S3 bucket name. For example:

        {
          "Version": "2012-10-17",
         "Statement": [
           {
             "Effect": "Allow",
             "Action": [
               "s3:ListAllMyBuckets"
             ],
             "Resource": "*"
           },
           {
             "Effect": "Allow",
             "Action": [
               "s3:CreateBucket",
               "s3:DeleteBucket",
               "s3:DeleteObject",
               "s3:GetBucketLocation",
               "s3:GetObject",
               "s3:ListBucket",
               "s3:PutObject"
             ],
             "Resource": ["arn:aws:s3:::BUCKET_TO_UPLOAD_IMAGE","arn:aws:s3:::BUCKET_TO_UPLOAD_IMAGE/*"]
           },
           {
             "Effect": "Allow",
             "Action": [
               "iam:CreateRole",
               "iam:PutRolePolicy"
             ],
             "Resource": "*"
           },
           {
             "Effect": "Allow",
             "Action": [
               "ec2:CancelConversionTask",
               "ec2:CancelExportTask",
               "ec2:CreateImage",
               "ec2:CreateInstanceExportTask",
               "ec2:CreateTags",
               "ec2:DeleteTags",
               "ec2:DescribeConversionTasks",
               "ec2:DescribeExportTasks",
               "ec2:DescribeExportImageTasks",
               "ec2:DescribeInstanceAttribute",
               "ec2:DescribeInstanceStatus",
               "ec2:DescribeInstances",
               "ec2:DescribeTags",
               "ec2:ExportImage",
               "ec2:ImportInstance",
               "ec2:ImportVolume",
               "ec2:StartInstances",
               "ec2:StopInstances",
               "ec2:TerminateInstances",
               "ec2:ImportImage",
               "ec2:ImportSnapshot",
               "ec2:DescribeImportImageTasks",
               "ec2:DescribeImportSnapshotTasks",
               "ec2:CancelImportTask"
             ],
             "Resource": "*"
           }
         ]
        }

7. Apply the **vmimport** role to the {{ site.data.product.title_short }} appliance image you uploaded to the S3 bucket.

        $ aws iam put-role-policy --role-name vmimport --policy-name vmimport --policy-document file://role-policy.json

### Importing the Appliance to Amazon Elastic Compute Cloud (Amazon EC2)

To import the appliance:

1. Create a containers.json file:

        {
            "Description": "NAME OF IMPORTED SNAPSHOT IN AWS",
            "Format": "vhd",
            "UserBucket": {
                "S3Bucket": "BUCKET WITH UPLOADED .VHD IMAGE",
                "S3Key": "PATH OF .VHD IMAGE"
            }
        }

    See the [AWS documentation](https://docs.aws.amazon.com/) on VM import and
    export requirements, such as image formats, instances, volume and
    file system types, and using regions.

2. Use the AWS-CLI tools to import a disk as a snapshot. See the [AWS documentation](https://docs.aws.amazon.com/) on using VM Import/Export to import a disk as a snapshot.

    **Note:**

    You can either specify a region, or if not, ensure that the S3 bucket is in the same region where you want to import the snapshot.

    
        $ aws ec2 import-snapshot --disk-container file://containers.json

3.  Check the progress of your snapshot import by running the following command:

    ```
     $ aws ec2 describe-import-snapshot-tasks --import-task-ids SNAPSHOT_ID_GOT_FROM_RESPONSE
    ```

4.  Create an AMI from the snapshot. See the [AWS documentation](https://docs.aws.amazon.com/) on using options with the following command to create and register a Linux AMI from a snapshot.

    ```
     $ aws ec2 register-image
    ```
