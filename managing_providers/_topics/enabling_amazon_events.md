# Enabling Amazon EC2 Events

After adding an Amazon EC2 provider and configuring an SNS topic in
[???](#amazon-provider-aws-config-notifications), create a CloudTrail,
then configure CloudWatch rules on your EC2 provider to automatically
get events in {{ site.data.product.title_short }} for monitoring the provider.

**Note:**

The following procedures are accurate at time of publishing. See the
[Amazon AWS
documentation](https://docs.aws.amazon.com/awscloudtrail/latest/userguide/)
for further details on these steps.

</div>

## Creating a CloudTrail

In the CloudTrail area of the AWS Management Console, create a trail and
an S3 bucket:

1.  Create a **Trail** with a custom name.

2.  (Optional) If you want to apply the trail to all of your
    {{ site.data.product.title_short }} regions, select **Yes** for **Apply trail to
    all regions**.

3.  For **Management Events**, select **Read/Write events: All**.

4.  Create a new S3 bucket.

## Creating CloudWatch Rules Based on Event Patterns

In the CloudWatch area of the AWS Management Console, create three
rules: one rule each for EC2, volumes, and snapshots.

<div class="important">

When an SNS topic is deleted and recreated (manually or by
{{ site.data.product.title_short }}), CloudWatch rules must be recreated as well,
even though the SNS target topic for CloudWatch rules appears to be
assigned to these rules. The CloudWatch rule does not send events to
this recreated topic until it is recreated too.

</div>

To create a CloudWatch rule for EC2:

1.  Navigate to menu:Events\[Rules\] and click **Create rule**.

2.  Select the **Event Pattern** radio button to specify the event
    source.

3.  Edit the **Event Pattern Preview** box, and paste and save the
    following code to create a rule based on a custom event pattern:

        {
          "source": [
            "aws.ec2"
          ],
          "detail-type": [
            "AWS API Call via CloudTrail"
          ],
          "detail": {
            "eventSource": [
              "ec2.amazonaws.com"
            ]
          }
        }

4.  Click **Add target** and specify the following attributes:

      - **Type**: `SNS Topic`

      - **Topic**: `AWSConfig_topic`

      - **Input**: `Matched event`

5.  Click **Configure Details** to save these details.

6.  Configure a name and description for the rule if desired. Ensure the
    **Enabled** checkbox is selected for **State**.

7.  Click **Create rule** to save the CloudWatch rule.

Repeat the same procedure to create a CloudWatch rule for volumes,
pasting the code snippet below to the **Event Pattern Preview** box:

1.  Navigate to menu:Events\[Rules\] and click **Create rule**.

2.  Select the **Event Pattern** radio button to specify the event
    source.

3.  Edit the **Event Pattern Preview** box, and paste and save the
    following code to create a rule based on a custom event pattern:

        {
          "source": [
            "aws.ec2"
          ],
          "detail-type": [
            "EBS Volume Notification"
          ]
        }

4.  Click **Add target** and specify the following attributes:

      - **Type**: `SNS Topic`

      - **Topic**: `AWSConfig_topic`

      - **Input**: `Matched event`

5.  Click **Configure Details** to save these details.

6.  Configure a name and description for the rule if desired. Ensure the
    **Enabled** checkbox is selected for **State**.

7.  Click **Create rule** to save the CloudWatch rule.

Repeat the same procedure to create a CloudWatch rule for snapshots,
pasting the code snippet below to the **Event Pattern Preview** box:

1.  Navigate to menu:Events\[Rules\] and click **Create rule**.

2.  Select the **Event Pattern** radio button to specify the event
    source.

3.  Edit the **Event Pattern Preview** box, and paste and save the
    following code to create a rule based on a custom event pattern:

        {
          "source": [
            "aws.ec2"
          ],
          "detail-type": [
            "EBS Snapshot Notification"
          ]
        }

4.  Click **Add target** and specify the following attributes:

      - **Type**: `SNS Topic`

      - **Topic**: `AWSConfig_topic`

      - **Input**: `Matched event`

5.  Click **Configure Details** to save these details.

6.  Configure a name and description for the rule if desired. Ensure the
    **Enabled** checkbox is selected for **State**.

7.  Click **Create rule** to save the CloudWatch rule.

EC2 can now automatically refresh events in {{ site.data.product.title_short }}.
