# Configuring AWS Identity and Access Management (IAM) Authentication

If you choose Amazon AWS Identity and Access Management (IAM) as your
authentication mode, required parameters are exposed under **Amazon
Primary AWS Account Settings for IAM** (Identity and Access Management).
Be sure to validate your settings before saving them.

<div class="note">

For further information on AWS Identity and Access Management settings,
see the [AWS
documentation](https://docs.aws.amazon.com/IAM/latest/UserGuide/introduction.html).

</div>

To configure {{ site.data.product.title_short }} to use AWS IAM authentication:

1.  Click ![config gear](../images/config-gear.png) (**Configuration**).

2.  Select your server in the **Settings** accordion.

3.  Select the **Authentication** tab.

4.  Use **Session Timeout** to set the period of inactivity before a
    user is logged out of the console.

5.  Select **Amazon** as the authentication method in the **Mode** list.

6.  Type in an **Access Key** provided by your Amazon account.

7.  Type in a **Secret Key** provided by your Amazon account.

8.  Optionally, select **Get User Groups from Amazon** to retrieve the
    user’s group membership from Amazon. This is used for mapping a
    user’s authorization to a {{ site.data.product.title_short }} role.

9.  Click **Validate** to verify your settings.

10. Click **Save**.

Users logging into {{ site.data.product.title_short }} with Amazon authentication
enter their own IAM access key as the username and IAM secret access key
as the password.

Amazon users must be added as a {{ site.data.product.title_short }} user or belong to
an IAM user group added to the list of {{ site.data.product.title_short }} groups.
