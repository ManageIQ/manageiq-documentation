### Setting the Root Password on the Appliance

The {{ site.data.product.title_short }} appliance is a virtual machine image that runs on a
Red Hat Enterprise Linux-based operating system. This means users can
access the base operating system through SSH. This is why it is
advisable to change the default password. Continuing to use the default
password leaves the appliance vulnerable to any user attempting to gain
root access.

Changing the `root` password on the appliance 'uses' `the` same process
as changing any user password on a Linux-based system.

1.  Access your appliance through SSH as the `root` user:

        [user@localhost ~]$ ssh root@10.1.1.205

    Substitute `10.1.1.205` with the address of your appliance.

2.  Enter the `passwd` command, which changes the password for the
    current user:

        [root@ ~]# passwd

3.  Enter and Confirm and new password for the `root` user.

        Changing password for user root.
        New password: ************
        Confirm password: ************

4.  Log out of the appliance.

The {{ site.data.product.title_short }} appliance now has a non-default `root` password.
This prevents unauthorized access to your appliance through SSH.
