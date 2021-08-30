### Creating Custom Encryption Keys

To avoid storing passwords in plain text, {{ site.data.product.title_short }} appliances use
an encryption key to encode and decode passwords. Each appliance stores
the key in the `/var/www/miq/vmdb/certs/v2_key`. Changing the encryption
key is recommended during setting up new {{ site.data.product.title_short }} appliances
only.

<div class="important">

Red Hat does not recommend changing the encryption key for an existing
appliance as the ability to decrypt the password will be lost, affecting
all stored passwords in {{ site.data.product.title_short }}.

</div>

To generate a new encryption key:

1.  Log in to the console of your master appliance as the `root` user.

2.  Run the `appliance_console` command. The {{ site.data.product.title_short }} appliance
    information screen appears.

3.  Press any key to view the appliance menu.

4.  Select **Generate Custom Encryption Key**.

5.  A prompt asks if for confirmation to overwrite the existing key.
    Enter `Y`.

6.  Enter `1` for `1) Create key`.

7.  The appliance generates the new key. Press any key to complete this
    procedure.

This completes the procedure for generating the new key. If you have
external {{ site.data.product.title_short }} appliances, you must share this key to ensure
your whole {{ site.data.product.title_short }} infrastructure is using consistent
encryption. Failure to use the same key results in encryption and
decryption problems.

To copy an encryption key:

1.  Log in to the console of an external appliance as the `root` user.

2.  Run the `appliance_console` command. The {{ site.data.product.title_short }} appliance
    information screen appears.

3.  Press any key to view the appliance menu.

4.  Select **Generate Custom Encryption Key**.

5.  A prompt asks if for confirmation to overwrite the existing key.
    Enter `Y`.

6.  Select `Fetch key from remote machine`.

7.  Enter the hostname or IP address of the master appliance.

8.  Enter the username for SSH access to the master appliance. Use the
    default `root` user.

9.  Enter the password for SSH access to the master appliance.

10. Enter the location of the remote key. Accept the default as
    `/var/www/miq/vmdb/certs/v2_key`.

11. The appliance copies the new key from the remote server. Press any
    key to complete this procedure.

After distributing the new key, all appliances require an update to the
database configuration. For all appliances, log in as the `root` user
and run the following commands replacing `dbpassword` with your database
password:

    [root@{productname_short_l} ~]# fix_auth --databaseyml --hostname localhost --password dbpassword
    [root@{productname_short_l} ~]# systemctl restart manageiq

This completes the new encryption key generation for your
{{ site.data.product.title_short }} infrastructure.
