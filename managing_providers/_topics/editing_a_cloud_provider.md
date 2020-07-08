# Editing a Cloud Provider

Edit information about a provider such as the name, IP address, and
login credentials.

<div class="note">

The **Type** value is unchangeable.

</div>

To use a different cloud provider, create a new one.

1.  Navigate to menu:Compute\[Clouds \> Providers\].

2.  Click the cloud provider to edit.

3.  Click ![Configuration](../images/1847.png) **(Configuration)**, and
    then ![Edit Selected Cloud Provider](../images/1851.png) **(Edit
    Selected Cloud Provider)**.

4.  Edit the **Basic Information**. This varies depending on the
    **Type** of provider.

5.  Fill out the **Credentials** by typing in a **Username**,
    **Password**, and a verification of this password (**Confirm
    Password**).

      - If selecting **Amazon EC2**, generate an **Access Key** in the
        **Security Credentials** of your Amazon AWS account. The
        **Access Key ID** acts as your **User ID**, and your **Secret
        Access Key** acts as your **Password**.

      - If selecting **OpenStack**, use the `Keystone User ID` and
        `Password` for your login credentials.

6.  If editing an OpenStack provider, use the **AMQP** subtab to provide
    credentials required for the Advanced Message Queuing Protocol
    service on your OpenStack Nova component.

7.  Click **Validate** and wait for notification of successful
    validation.

8.  Click **Save**.
