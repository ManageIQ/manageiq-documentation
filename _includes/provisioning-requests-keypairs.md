Key pairs allow you to manage SSH access between a user and provisioned
instance. For more information about key pairs in OpenStack, see [Manage
Key
Pairs](https://access.redhat.com/documentation/en-us/red_hat_openstack_platform/11/html/instances_and_images_guide/ch-manage_instances#section-manage-keypair)
in the *Instances and Images Guide*.

To manage key pairs, browse to menu: **Compute > Clouds > Key Pairs**.
From there, you can view a list of available key pairs. Click on a key
pair to view its details.

To create a new key pair:

1.  Browse to menu: **Compute > Clouds > Key Pairs**.

2.  Click **Configuration**,
    ![2345](../images/2345.png)(**Add a new Key Pair**).

3.  Enter a **Name** for the key pair.

4.  If you want to use a public key, copy its contents into the **Public
    Key (optional)** field.

    **Note**: You must have a public key value for the IBM POWER VS provider to create the key pair.
    An error message is returned if you fail to add a public key value and can be viewed in **Settings > Tasks**.

5.  Select which cloud provider on which to create the key pair. The key
    pair will then be available for use by instances in that provider.

6.  Click **Add**.
