## Installing {{ site.data.product.title }}

{{ site.data.product.title }} can be installed on OpenShift Container Platform in a
few steps.

This procedure uses a template to deploy a multi-pod
{{ site.data.product.title_short }} appliance with the database stored in a
persistent volume on OpenShift Container Platform. It provides a
step-by-step setup, including cluster administrative tasks as well as
information and commands for the application developer using the
deployment.

The ultimate goal of the deployment is to be able to deconstruct the
{{ site.data.product.title_short }} appliance into several containers running on a
pod or a series of pods.

Running the {{ site.data.product.title_short }} appliance in a series of pods has
several advantages. For example, running each worker in a separate pod
allows OpenShift Container Platform to manage worker processes and
reduce worker memory consumption. OpenShift can also easily scale
workers by adding or removing pods, and perform upgrades by using
images.

There are two options for installing {{ site.data.product.title_short }} on
OpenShift:

  - During OpenShift Container Platform 3.7 installation:

      - When you install OpenShift Container Platform 3.7, you have the
        option to install {{ site.data.product.title_short }} inside OpenShift at the
        time. This method leverages the Ansible installer to run and
        deploy the {{ site.data.product.title_short }} template, instead of building
        the environment manually. See the [OpenShift Container
        Platform 3.7 Release
        Notes](https://access.redhat.com/documentation/en-us/openshift_container_platform/3.7/html-single/release_notes/index#ocp-37-installation)
        for details.

  - Manual install on an existing OpenShift Container Platform
    environment:

      - Deploy {{ site.data.product.title_short }} pods using the
        {{ site.data.product.title_short }} template (*.yaml* file). This is the
        method described in this guide.

After deployment, you can configure the {{ site.data.product.title_short }}
environment to use any external authentication configurations supported
by {{ site.data.product.title_short }}.

### Prerequisites

To successfully deploy a {{ site.data.product.title_short }} appliance on OpenShift
Container Platform, you need a functioning **OpenShift Container
Platform 3.7** install with the following configured:

  - NFS or other compatible volume provider

  - A `cluster-admin` user

  - A regular user (such as an application developer)

<div class="important">

OpenShift Container Platform 3.7 is required for this installation. Red
Hat has not tested this procedure with earlier versions of OpenShift
Container Platform.

</div>

#### Cluster Sizing

To avoid deployment failures due to resource starvation, Red Hat
recommends the following minimum cluster size for a test environment:

  - 1 master node with at least 8 vCPUs and 12GB RAM

  - 2 schedulable nodes with at least 4 vCPUs and 8GB RAM

  - 25GB storage for {{ site.data.product.title_short }} physical volume use

These recommendations assume {{ site.data.product.title_short }} is the only
application running on this cluster. Alternatively, you can provision an
infrastructure node to run registry, metrics, router, and logging pods.

Each {{ site.data.product.title_short }} application pod will consume at least 3GB
RAM on initial deployment (without providers added). RAM consumption
increases depending on the appliance use. For example, after adding
providers, expect higher resource consumption.

#### Limitations

The following limitations exist when deploying this version of
{{ site.data.product.title_short }} on OpenShift Container Platform 3.7:

  - This configuration cannot run on public OpenShift (OpenShift.io and
    OpenShift Dedicated environments) because of necessary privileges

  - The Embedded Ansible pod must run as a privileged pod

  - OpenShift cannot independently scale workers

  - A highly available database is not supported in PostgreSQL pods

#### Templates and Images

### Preparing to Deploy {{ site.data.product.title_short }}

To prepare for deploying the {{ site.data.product.title_short }} appliance to
OpenShift Container Platform, create a project, configure security
contexts, and create persistent storage.

1.  As a regular user, log in to OpenShift:

        $ oc login -u <user> -p <password>

2.  Create a project with your desired parameters. The project name
    (`<your_project>` in this example) is mandatory, but `<description>`
    and `<display_name>` are optional:

        $ oc new-project <your_project> \
        --description="<description>" \
        --display-name="<display_name>"

3.  As the admin user, configure security context constraints (SCCs) for
    your OpenShift service accounts:

    1.  Add the `cfme-anyuid` service account to the `anyuid` SCC:

            $ oc adm policy add-scc-to-user anyuid system:serviceaccount:<your-project>:cfme-anyuid

    2.  Add the `cfme-orchestrator` service account to the `anyuid` SCC:

            $ oc adm policy add-scc-to-user anyuid system:serviceaccount:<your-project>:cfme-orchestrator

    3.  Add the `cfme-httpd` service account to the `anyuid` SCC:

            $ oc adm policy add-scc-to-user anyuid system:serviceaccount:<your-project>:cfme-httpd

    4.  Add the `cfme-privileged` service account to the `privileged`
        SCC:

            $ oc adm policy add-scc-to-user privileged system:serviceaccount:<your-project>:cfme-privileged

4.  Verify the SCCs are added correctly to the service accounts and
    project:

        $ oc describe scc anyuid | grep Users
        Users:                  system:serviceaccount:<your-project>:cfme-anyuid,system:serviceaccount:<your-project>:cfme-httpd,system:serviceaccount:<your-project>:cfme-orchestrator
        $ oc describe scc privileged | grep Users
        Users:                  system:admin,system:serviceaccount:openshift-infra:build-controller,system:serviceaccount:management-infra:management-admin,system:serviceaccount:management-infra:inspector-admin,system:serviceaccount:logging:aggregated-logging-fluentd,system:serviceaccount:<your-project>:cfme-privileged

    **Note:**

    For more information on SCCs, see the [OpenShift
    documentation](https://docs.openshift.com/container-platform/3.7/admin_guide/manage_scc.html).

    </div>

5.  As the admin user, add the `httpd-configmap-generator` service
    account to the `httpd-scc-sysadmin` SCC before the Httpd Configmap
    Generator can run.

        Users:        system:serviceaccount:<your-namespace>:httpd-configmap-generator

6.  Add the `view` and `edit` roles to the `cfme-orchestrator` service
    account:

        $ oc policy add-role-to-user view system:serviceaccount:<your-project>:cfme-orchestrator -n <your-project>
        $ oc policy add-role-to-user edit system:serviceaccount:<your-project>:cfme-orchestrator -n <your-project>

7.  As the admin user, prepare persistent storage for the deployment.
    (Skip this step if you have already configured persistent storage.)

    A basic {{ site.data.product.title_short }} deployment needs at least two
    persistent volumes (PVs) to store {{ site.data.product.title_short }} data. As
    the admin user, create two persistent volumes: one to host the
    {{ site.data.product.title_short }} PostgreSQL database, and one to host the
    application data.

    Example NFS-backed volume templates are provided by
    `cfme-pv-db-example.yaml` and `cfme-pv-server-example.yaml`,
    available from the image stream or repository configured in
    [Templates and Images](#templates-images).

    **Note:**

    For NFS-backed volumes, ensure your NFS server firewall is
    configured to allow traffic on port 2049 (TCP) from the OpenShift
    cluster.

    Red Hat recommends setting permissions for the pv-app (privileged
    pod volume) as 777, uid/gid 0 (owned by root). For more information
    on configuring persistent storage in OpenShift Container Platform,
    see the [OpenShift Container Platform Installation and
    Configuration](https://access.redhat.com/documentation/en-us/openshift_container_platform/3.7/html-single/installation_and_configuration/#configuring-persistent-storage)
    guide.

    </div>

    1.  Configure your NFS server host details within these files, and
        edit any other settings needed to match your environment.

    2.  Create the two persistent volumes:

            $ oc create -f cfme-pv-db-example.yaml
            $ oc create -f cfme-pv-server-example.yaml

    3.  Process the templates, editing the NFS\_HOST parameter
        (mandatory) and any other parameters:

            $ oc process cfme-pv-db-example.yaml -p NFS_HOST=nfs.example.com | oc create -f -

        Alternatively, you can create the two persistent volumes and
        process the templates in a single command:

            $ oc process cfme-pv-server-example.yaml -p NFS_HOST=nfs.example.com | oc create -f -

        **Note:**

        There are three parameters required to process the template.
        Only NFS\_HOST is required, PV\_SIZE and BASE\_PATH contain
        defaults that do not need editing unless desired:

          - PV\_SIZE - Defaults to the recommended PV size for the
            App/DB template (5Gi/15Gi respectively)

          - BASE\_PATH - Defaults to /exports

          - NFS\_HOST - No Default - Hostname or IP address of the NFS
            server

        </div>

    4.  Verify the persistent volumes were created successfully:

            $ oc get pv
            NAME                CAPACITY   ACCESSMODES   RECLAIMPOLICY   STATUS      CLAIM         STORAGECLASS   REASON    AGE
            cfme-app            5Gi        RWO           Retain          Available                                          16s

            cfme-db             15Gi       RWO           Retain          Available                                          49s

        **Note:**

        Red Hat recommends validating NFS share connectivity from an
        OpenShift node before attempting a deployment.

        </div>

8.  Increase the maximum number of imported images on ImageStream.

    By default, OpenShift Container Platform can import five tags per
    image stream, but the {{ site.data.product.title_short }} repositories contain
    more than five images for deployments.

    You can modify this setting on the master node at
    `/etc/origin/master/master-config.yaml` so OpenShift can import
    additional images.

    1.  Add the following at the end of the
        `/etc/origin/master/master-config.yaml` file:

            ...
            imagePolicyConfig:
              maxImagesBulkImportedPerRepository: 100

    2.  Restart the master service:

            $ systemctl restart atomic-openshift-master

9.  On each OpenShift node, persistently enable the
    `container_manage_cgroup` SELinux boolean to allow container
    processes to make changes to the *cgroup* configuration:

        # setsebool -P container_manage_cgroup on

### Deploying the {{ site.data.product.title_short }} Appliance

To deploy the appliance on OpenShift Container Platform, create the
{{ site.data.product.title_short }} template and verify it is available in your
project.

1.  As a regular user, create the {{ site.data.product.title_short }} template:

        $ oc create -f cfme-template.yaml
        template "cloudforms" created

2.  Verify the template is available with your project:

        $ oc get templates
        NAME         DESCRIPTION                                    PARAMETERS        OBJECTS
        cloudforms   CloudForms appliance with persistent storage   18 (1 blank)      12

3.  (Optional) Customize the template’s deployment parameters. Use the
    following command to see the available parameters and descriptions:

        $ oc process --parameters -n <your-project> cloudforms

    To customize the deployment configuration parameters, run:

        $ oc edit dc/<deployconfig_name>

4.  To deploy {{ site.data.product.title_short }} from template using default
    settings, run:

        $ oc new-app --template=cloudforms

    Alternatively, to deploy {{ site.data.product.title_short }} from a template
    using customized settings, add the `-p` option and the desired
    parameters to the command. For example:

        $ oc new-app --template=cloudforms -p DATABASE_VOLUME_CAPACITY=2Gi,POSTGRESQL_MEM_LIMIT=4Gi,APPLICATION_DOMAIN=hostname

    **Important:**

    The `APPLICATION_DOMAIN` parameter specifies the hostname used to
    reach the {{ site.data.product.title_short }} application, which eventually
    constructs the route to the {{ site.data.product.title_short }} pod. If you do
    not specify the `APPLICATION_DOMAIN` parameter, the
    {{ site.data.product.title_short }} application will not be accessible after the
    deployment; however, this can be fixed by changing the route. For
    more information on OpenShift template parameters, see the
    [OpenShift Container Platform Developer Guide](https://access.redhat.com/documentation/en-us/openshift_container_platform/3.7/html-single/developer_guide/#dev-guide-templates).

#### Deploying the {{ site.data.product.title_short }} Appliance Using an External Database

Before attempting to deploy {{ site.data.product.title_short }} using an external
database deployment, ensure the following conditions are satisfied:

  - Your OpenShift cluster can access the external PostgreSQL server

  - The {{ site.data.product.title_short }} user, password, and role have been
    created on the external PostgreSQL server

  - The intended {{ site.data.product.title_short }} database is created, and
    ownership has been assigned to the {{ site.data.product.title_short }} user

To deploy the appliance:

1.  Import the {{ site.data.product.title_short }} external database template:

        $ oc create -f templates/cfme-template-ext-db.yaml

2.  Launch the deployment with the following command. The database
    server IP address is required, and the other settings must match
    your remote PostgreSQL server.

        $ oc new-app --template=cloudforms-ext-db -p DATABASE_IP=<server_ip> -p DATABASE_USER=<user> -p DATABASE_PASSWORD=<password> -p DATABASE_NAME=<database_name>

### Verifying the Configuration

Verify the deployment was successful by running the following commands
as a regular user under the {{ site.data.product.title_short }} project:

**Note:**

The first deployment can take several minutes to complete while
OpenShift downloads the necessary images.

</div>

1.  Confirm the {{ site.data.product.title_short }} pod is bound to the correct
    security context constraints:

    1.  List and obtain the name of the `cfme-app` pod:

            $ oc get pod
            NAME                 READY     STATUS    RESTARTS   AGE
            cloudforms-0         1/1       Running   0          4m
            httpd-1-w486v        1/1       Running   0          4m
            memcached-1-4xtjc    1/1       Running   0          4m
            postgresql-1-n5tm6   1/1       Running   0          4m

    2.  Export the configuration of the pod:

            $ oc export pod <cfme_pod_name>

    3.  Examine the output to verify that `openshift.io/scc` has the
        value `anyuid`:

            ...
            metadata:
              annotations:
                openshift.io/scc: anyuid
            ...

2.  Verify the persistent volumes are attached to the `postgresql` and
    `cfme-app` pods:

        $ oc volume pods --all
        pods/postgresql-1-437jg
          pvc/cfme-pgdb-claim (allocated 2GiB) as cfme-pgdb-volume
            mounted at /var/lib/pgsql/data
          secret/default-token-2se06 as default-token-2se06
            mounted at /var/run/secrets/kubernetes.io/serviceaccount
        pods/cfme-1-s3bnp
          pvc/cfme (allocated 2GiB) as cfme-app-volume
            mounted at /persistent
          secret/default-token-9q4ge as default-token-9q4ge
            mounted at /var/run/secrets/kubernetes.io/serviceaccount

3.  Check the readiness of the {{ site.data.product.title_short }} pod:

    **Note:**

    Allow approximately five minutes once pods are in running state for
    {{ site.data.product.title_short }} to start responding on HTTPS.

    </div>

        $ oc describe pods <cfme_pod_name>
        ...
        Conditions:
          Type      Status
          Ready     True
        Volumes:
        ...

4.  After you have successfully validated your {{ site.data.product.title_short }}
    deployment, disable automatic image change triggers to prevent
    unintended upgrades.

    By default, on initial deployments the automatic image change
    trigger is enabled. This could potentially start an unintended
    upgrade on a deployment if a newer image is found in the
    ImageStream.

    Disable the automatic image change triggers for
    {{ site.data.product.title_short }} deployment configurations (DCs) on each
    project with the following commands:

        $ oc set triggers dc --manual -l app=cloudforms
        deploymentconfig "memcached" updated
        deploymentconfig "postgresql" updated

        $ oc set triggers dc --from-config --auto -l app=cloudforms
        deploymentconfig "memcached" updated
        deploymentconfig "postgresql" updated

    **Note:**

    The configuration change trigger is kept enabled; to have full
    control of your deployments, you can alternatively turn it off. See
    the [OpenShift Container Platform Developer
    Guide](https://access.redhat.com/documentation/en-us/openshift_container_platform/3.7/html-single/developer_guide/#dev-guide-triggering-builds)
    for more information on deployment triggers.

    </div>

### Logging into {{ site.data.product.title_short }}

As part of the deployment, a route to the {{ site.data.product.title_short }}
appliance is created for HTTPS access. Once the pods have been
successfully deployed, you can log into {{ site.data.product.title_short }}.

You can obtain the {{ site.data.product.title_short }} host address from the project
in the OpenShift user interface, or by opening a shell on the pod and
getting the route information.

1.  To open a shell on the pod, run:

        $ oc rsh <pod_name> bash -l

2.  Get the route information:

        $ oc get routes
        NAME         HOST/PORT                   PATH                SERVICE      TERMINATION   LABELS
        cloudforms   cfme.apps.e2e.example.com  cloudforms:443-tcp   passthrough                app=cloudforms

3.  Navigate to the reported URL/host on a web browser (in this example,
    `cfme.apps.e2e.example.com`).

4.  Enter the default {{ site.data.product.title_short }} credentials (Username:
    **admin** | Password: **smartvm**) for the initial login.

5.  Click **Login**.
