## Managing {{ site.data.product.title }} with OpenShift

This section includes common tasks to manage your {{ site.data.product.title }}
deployment from OpenShift.

### Configuring Custom SSL Certificates for {{ site.data.product.title_short }}

By default, the route that is deployed as part of the template uses edge
termination and the certificates that OpenShift is installed with. It is
possible to change this in the OpenShift UI with the following steps:

1.  Navigate to menu:Applications\[Routes\].

2.  Click on the route named **httpd**, then select
    menu:Actions\[Edit\].

3.  Scroll down to the **Certificates** section. Here you can upload or
    paste the required certificate files.

4.  Click **Save**.

### Scaling {{ site.data.product.title_short }} Appliances

StatefulSets in OpenShift manage the deployment and scaling of a set of
pods (in this case, {{ site.data.product.title_short }} appliances). StatefulSets
ensure ordering that applications will come up by providing unique
identities for pods.

<div class="important">

Each new replica (server) consumes a physical volume. Before scaling,
ensure you have enough physical volumes available to scale.

</div>

The following example shows scaling using StatefulSets:

**Example: Scaling to two replicas.**

    $ oc scale statefulset cloudforms --replicas=2
    statefulset "cloudforms" scaled
    $ oc get pods
    NAME                 READY     STATUS    RESTARTS   AGE
    cloudforms-0           1/1       Running   0          34m
    cloudforms-1           1/1       Running   0          5m
    memcached-1-mzeer    1/1       Running   0          1h
    postgresql-1-dufgp   1/1       Running   0          1h

The newly created replicas will join the existing {{ site.data.product.title_short }}
region. Each new pod is numbered in the order it is deployed, starting
with 0 and increasing sequentially. For example, replicas in a
StatefulSet will be numbered *cloudforms-0* *cloudforms-1*, and so on.

### Creating a Backup

Create a persistent volume for backups using the PV backup template
(`cfme-pv-backup-example.yaml`) in case you need to restore to a
previous version.

1.  Create the persistent volume for the backup:

        $ oc create -f cfme-pv-backup-example.yaml

2.  Create the backup persistent volume claim (PVC):

        $ oc create -f cfme-backup-pvc.yaml

3.  Verify the persistent volume claim was created:

        $ oc get pvc

4.  Back up secrets, such as database encryption keys and credentials.

    <div class="important">

    Be careful to back up secrets in a secure location.

    </div>

        $ oc get secret -o yaml --export=true > secrets.yaml
        $ oc get pvc -o yaml --export=true > pvc.yaml

5.  Initiate the database backup:

        $ oc create -f cfme-backup-job.yaml

This step creates a container, and connects to the database pod,
`pg_basebackup`.

### Restoring to a Backup

You can restore to a database backup created in [Creating a
Backup](#creating-backups) using the restore template,
`cfme-restore-job.yaml`.

The restore job will look for `cfme-backup` and `cfme-postgresql` PVs by
default, and the latest successful backup will be restored by default.
If existing data is found on the `cfme-postgresql` volume, it will be
renamed and left on the volume.

<div class="important">

You must perform a database restore on an offline environment. All pods
must be scaled down to 0, and not running.

</div>

1.  Shut down all pods:

        $ oc scale dc --all --replicas=0
        $ oc scale statefulset --all --replicas=0

2.  To initiate the database restore, create the restore template:

        $ oc create -f cfme-restore-job.yaml

After the restore job is complete, you can scale the pods back up.

### Updating {{ site.data.product.title_short }}

Apply package updates to your {{ site.data.product.title_short }} appliance from
OpenShift Container Platform by deleting the pods and redeploying them
using updated {{ site.data.product.title_short }} container images. To update your
environment with a new template, follow the steps in [Updating the
{{ site.data.product.title_short }} Container Images and
Template](#modified-template-update).

#### Updating the {{ site.data.product.title_short }} Container Images

To deploy new container images for {{ site.data.product.title_short }}, delete the
pods, update the images, then redeploy the updated pods:

1.  Delete the pods by scaling the application StatefulSets to 0
    replicas:

        $ oc scale statefulset cloudforms --replicas=0
        $ oc scale statefulset cloudforms-backend --replicas=0

2.  Patch in the new version of the images:

        $ oc patch statefulset cloudforms -p '{"spec": {"template": {"spec": {"containers": [{"name": "cloudforms", "image": "registry.redhat.io/cloudforms46/cfme-openshift-app-ui:<new-version-tag>"}]}}}}'
        $ oc patch statefulset cloudforms-backend -p '{"spec": {"template": {"spec": {"containers": [{"name": "cloudforms", "image": "registry.redhat.io/cloudforms46/cfme-openshift-app:<new-version-tag>"}]}}}}'

3.  Scale the StatefulSets back to your previous values to redeploy the
    pods:

        $ oc scale statefulset cloudforms --replicas=<old-value>
        $ oc scale statefulset cloudforms-backend --replicas=<old-value>

Your {{ site.data.product.title_short }} environment is now updated to use the new
container images.

#### Updating the {{ site.data.product.title_short }} Container Images and Template

To update a {{ site.data.product.title_short }} deployment with a new template,
update the container images and the template using the following steps:

1.  Back up secrets, such as database encryption keys and credentials:

    <div class="important">

    Be careful to back up secrets in a secure location.

    </div>

        $ oc export secret cloudforms-secrets > my_secrets.yml

2.  Delete the pods by scaling the application StatefulSets to 0
    replicas:

        $ oc scale statefulset cloudforms --replicas=0
        $ oc scale statefulset cloudforms-backend --replicas=0

3.  Apply the changes to the project, specifying the template
    appropriate to your environment’s database configuration.

    <div class="important">

    If you customized any parameters when originally deploying the
    application (parameters used with the `oc new-app` command in
    [???](#deploying-the-appliance)), you must set the same values in
    the `oc process` command here.

    </div>

      - For environments using a database stored on a pod within the
        cluster (the default configuration), specify the
        {{ site.data.product.title_short }} template:

            $ oc process -p APPLICATION_REPLICA_COUNT=0 -l app=cloudforms,template=cloudforms -f cfme-template.yaml | oc replace -f -

      - For environments using a database external to the OpenShift
        cluster, specify the {{ site.data.product.title_short }} external database
        template:

            $ oc process -p APPLICATION_REPLICA_COUNT=0 -l app=cloudforms,template=cloudforms-ext-db -f cfme-template-ext-db.yaml | oc replace -f -

4.  Replace the secret with the `my_secrets.yml` file you created
    earlier:

        $ oc replace -f my_secrets.yml

5.  Redeploy the `postgresql` pod to ensure the password from the old
    secret is used:

        $ oc rollout latest postgresql

6.  Scale the StatefulSets back to your previous values to redeploy the
    pods:

        $ oc scale statefulset cloudforms --replicas=<old-value>
        $ oc scale statefulset cloudforms-backend --replicas=<old-value>

Your {{ site.data.product.title_short }} environment is now updated to use the new
template and container images.

### Uninstalling {{ site.data.product.title }} from a Project

If no longer needed, you can uninstall the {{ site.data.product.title }} pod from your
project. Note the following commands do not remove SCC permissions, or
the project itself.

<div class="important">

Use this procedure if only {{ site.data.product.title }} exists in the project.

</div>

1.  Inside the project, run the following as a regular user:

        $ oc delete all --all

2.  Wait approximately 30 seconds for the command to process, then run:

        $ oc delete pvc --all
