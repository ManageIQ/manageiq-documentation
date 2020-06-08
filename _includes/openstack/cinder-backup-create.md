1.  Navigate to menu:Storage\[Block Storage \> Volumes\].

2.  Click the volume you want to back up to open the volume’s summary
    page.

3.  Click ![Configuration](../images/1847.png) (**Configuration**), then
    click ![Create a Backup of this Cloud
    Volume](../images/volume-icon.png) (**Create a Backup of this Cloud
    Volume**).

4.  Enter a name for the backup in **Backup Name**.

5.  (Optional) Select **Incremental?** to take an incremental backup of
    the volume instead of a full backup.

    <div class="note">

    You can take an incremental backup of a volume if you have at least
    one existing full backup of the volume. An incremental volume saves
    resources by capturing only changes made to the volume since its
    last backup. See [Create an Incremental Volume
    Backup](https://access.redhat.com/documentation/en-us/red_hat_openstack_platform/11/html/storage_guide/ch-cinder#section-create-volume-backup-incremental)
    in the *Storage Guide* for more information.

    </div>

6.  (Optional) Select **Force?** to allow backup of a volume attached to
    an instance.

    <div class="note">

    Selecting the **Force** option will back up the volume whether its
    status is *available* or *in-use*. Backing up an *in-use* volume
    ensures data is crash-consistent.

    </div>

7.  Click **Save**.

View a volume’s backups by clicking **Cloud Volume Backups** on the
volume’s summary page.

<div class="note">

See [Back Up and Restore a
Volume](https://access.redhat.com/documentation/en-us/red_hat_openstack_platform/11/html/storage_guide/ch-cinder#section-volumes-advanced-backup)
in the *Storage Guide* for more information about backups.

</div>
