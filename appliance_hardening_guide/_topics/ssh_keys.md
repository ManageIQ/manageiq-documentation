### Setting SSH Keys on the Appliance

Another recommended practice is to use SSH keys to access the appliance
from a single machine. An SSH key provides access from one machine to
another through the SSH protocol. The following procedure shows how to
create an SSH key on your local machine and add it to the appliance.

1.  Check the `.ssh/` directory in your home directory for any existing
    key pairs:

        [user@localhost ~]$ ls ~/.ssh/

    A key pair usually consists of two files. One file is the private
    key, which stays on your local machine, and the other is the public
    key, which you copy to another machine. But files are named the same
    except the public key ends with a `.pub` extension.

    If a key pair already exists, you can use this key pair. Otherwise,
    use the next few steps to create your own.

2.  On your local machine, start the key pair generation process using
    the `ssh-keygen` command:

        [user@localhost ~]$ ssh-keygen -t rsa

3.  A prompt asks for the file and location to store these keys:

        Enter file in which to save the key (/home/user/.ssh/id_rsa):

    Accept the default path if you do not have a `id_rsa` key pair.

4.  Another prompt asks for a passphrase:

        Enter passphrase (empty for no passphrase):

    This encrypts the key pair with a password. This protects the key
    pair if it ever falls into the wrong hands. Alternatively, you can
    leave the passphrase empty, which provides an automatic login
    between your local machine and the remote machine.

5.  The `ssh-keygen` command generates two files:

      - The private key - the default is */home/user/.ssh/id\_rsa*

      - The public key - the default is */home/user/.ssh/id\_rsa.pub*

        Copy the public key to the appliance using the `ssh-copy-id`
        command:

            [user@localhost ~]$ ssh-copy-id ~/.ssh/id_rsa.pub root@10.1.1.205

        The command copies the public key to the appliance. You might
        receive a prompt for the password of the root user on the
        appliance.

6.  Test the SSH key authentication:

        [user@localhost ~]$ ssh root@10.1.1.205

    This authenticates using the SSH key pair. If you entered a
    passphrase for the key, the command prompts you for the passphrase.

7.  As an additional security measure, edit the `/etc/ssh/sshd_config`
    on the appliance and modify the following parameter:

        PermitRootLogin without-password

    This forces the `root` user account to use certificates instead of
    passwords for SSH login. This means only your local system can
    access the appliance.

The appliance now restricts access to only a single machine using the
SSH key.
