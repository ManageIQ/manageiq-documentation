## Configuring External Authentication to {{ site.data.product.title_short }}

After installing {{ site.data.product.title_short }}, configure external authentication by updating the `httpd-auth-configs` configuration map on the `httpd` pod to include all necessary configuration files and certificates.

Upon startup, the `httpd` pod overlays its files with the ones specified in the `auth-configuration.conf` file in the configuration map. This is done by the `initialize-httpd-auth` service that runs before `httpd`.

You can automatically generate an updated configuration map by running the `httpd-configmap-generator` tool in its own pod using the steps in [Configuring External Authentication Automatically](#automatic-defining-configmap) (recommended).
Alternatively, you can define the configuration map manually using the commands in [Defining the Configuration Map Manually](#manually-defining-configmap).

### Configuring External Authentication Automatically

To automatically generate an `authconfig` map, run the `httpd_configmap_generator` tool with your desired parameters:

    $ httpd_configmap_generator <command_or_authentication_type>

**Note:**

Run `httpd_configmap_generator --help` or see [External Authentication Configuration Map Settings](#configmap-settings)
for configuration map parameters.

#### Supported Authentication Types

The following authentication types can be configured with the `httpd_configmap_generator` tool to configure external authentication.

For usage, run:

    $ httpd_configmap_generator <auth-type> --help

|                  |                                                |
| ---------------- | ---------------------------------------------- |
| auth-type        | Identity Provider/Environment                  |
| active-directory | Active Directory domain realm join             |
| ipa              | IPA, IPA 2-factor authentication, IPA/AD Trust |
| ldap             | LDAP directories                               |
| saml             | Keycloak, Red Hat SSO                          |

Supported Authentication Types

#### Updating an `authconfig` Map

With the `update` subcommand, you can add file(s) to the configuration map to specify file ownership and permissions. The `--add-file` option can be specified multiple times (once per file) to add files to a configuration map.

Supported file specifications for the `--add-file` option are:

    --add-file=file-path
    --add-file=source-file-path,target-file-path
    --add-file=source-file-path,target-file-path,file-permission
    --add-file=file-url,target-file-path,file-permission

When entering file specifications, `file-url` is an HTTP URL and `file-permission` can be specified as `mode:owner:group`.

**Adding files by specifying paths.**

The file ownership and permissions are based on the files specified. For example:

    $ httpd_configmap_generator update \
    --input=/tmp/original-auth-configmap.yaml                \
    --add-file=/etc/openldap/cacerts/primary-directory-cert.pem  \
    --add-file=/etc/openldap/cacerts/seconday-directory-cert.pem \
    --output=/tmp/updated-auth-configmap.yaml

**Adding target files from different source directories.**

    $ httpd_configmap_generator update \
    --input=/tmp/original-auth-configmap.yaml                                        \
    --add-file=/tmp/uploaded-cert1,/etc/openldap/cacerts/primary-directory-cert.pem  \
    --add-file=/tmp/uploaded-cert2,/etc/openldap/cacerts/seconday-directory-cert.pem \
    --output=/tmp/updated-auth-configmap.yaml

The file ownership and permissions are based on the source files specified; in this case the ownership and permissions of the
`/tmp/uploaded-cert1` and `/tmp/uploaded-cert2` files will be used.

**Adding a target file with user-specified ownership and mode.**

    $ httpd_configmap_generator update \
    --input=/tmp/original-auth-configmap.yaml                          \
    --add-file=/tmp/secondary-keytab,/etc/http2.keytab,600:apache:root \
    --output=/tmp/updated-auth-configmap.yaml

**Adding files by URL.**

    $ httpd_configmap_generator update \
    --input=/tmp/original-auth-configmap.yaml \
    --add-file=http://aab-keycloak:8080/auth/realms/testrealm/protocol/saml/description,/etc/httpd/saml2/idp-metadata.xml,644:root:root \
    --output=/tmp/updated-auth-configmap.yaml

When downloading a file by URL, a target file path and file ownership and mode must be specified.

#### Exporting a File from an `authconfig` Map

With the `export` subcommand, you can export a file from the configuration map. For example, to extract the `sssd.conf` file from the `authconfig` map:

    $ httpd_configmap_generator export \
    --input=/tmp/external-ipa.yaml \
    --file=/etc/sssd/sssd.conf     \
    --output=/tmp/sssd.conf

#### Building the `httpd_configmap_generator` in a Container

The `httpd_configmap_generator` is the container for configuring external authentication for the `httpd` auth pod. It is based on the auth `httpd` container and generates the `httpd` `authconfig` map needed to enable external authentication.

Two templates are required to run the `httpd-configmap-generator` application (`httpd-configmap-generator-htmplate.yaml` and `httpd-scc-sysadmin.yaml`), which are available from the [Red Hat Container Catalog](https://access.redhat.com/containers/?tab=images&platform=openshift#/registry.access.redhat.com/cloudforms46/cfme-httpd-configmap-generator).

##### Preparing to Deploy the `httpd-configmap-generator` Application

1.  To obtain the latest `cfme-httpd-configmap-generator` image from the Red Hat Container Catalog, run:

        $ oc import-image my-cloudforms46/cfme-httpd-configmap-generator --from=registry.access.redhat.com/cloudforms46/cfme-httpd-configmap-generator --confirm

2.  The `httpd-configmap-generator` service account must be added to the `httpd-scc-sysadmin` security context constraints (SCC) before the `httpd-configmap-generator` can run. To edit the SCC, log in to OpenShift as an admin user:

        $ oc login -u <user> -p <password>

3.  Create the `httpd-scc-sysadmin` SCC:

        $ oc create -f templates/httpd-scc-sysadmin.yaml

4.  Add the `httpd-configmap-generator` service account to the `httpd-scc-sysadmin` SCC:

        $ oc adm policy add-scc-to-user httpd-scc-sysadmin system:serviceaccount:<your-namespace>:httpd-configmap-generator

5.  Verify that the `httpd-configmap-generator` service account is now included in the `httpd-scc-sysadmin` SCC:

        $ oc describe scc httpd-scc-sysadmin | grep Users
        Users:        system:serviceaccount:<your-namespace>:httpd-configmap-generator

##### Deploying the `httpd-configmap-generator` Application

1.  As a regular user, run:

        $ oc create -f httpd-configmap-generator-template.yaml

2.  Verify the template is available with your project:

        $ oc get templates
        NAME                        DESCRIPTION                                 PARAMETERS     OBJECTS
        httpd-configmap-generator   Httpd Configmap Generator                   6 (all set)    3

3.  Deploy the `httpd-configmap-generator`:

        $ oc new-app --template=httpd-configmap-generator

4.  Check the readiness of the `httpd-configmap-generator`:

        $ oc get pods
        NAME                                READY     STATUS    RESTARTS   AGE
        httpd-configmap-generator-1-txc34   1/1       Running   0          1h

##### Getting the Pod Name

To work with the `httpd-configmap-generator` script in the `httpd-configmap-generator` pod, it is necessary to get the pod name as
follows:

    $ CONFIGMAP_GENERATOR_POD=`oc get pods | grep "httpd-configmap-generator" | cut -f1 -d" "`

##### Example: Generating an `authconfig` Map for External Authentication Against IPA

The following example shows how to generate a configuration map for external authentication using IPA.

1.  To generate an `authconfig` map for external authentication using IPA, run:

        $ oc rsh $CONFIGMAP_GENERATOR_POD -- bash -c httpd_configmap_generator ipa \
        --host=appliance.example.com        \
        --ipa-server=ipaserver.example.com  \
        --ipa-domain=example.com            \
        --ipa-realm=EXAMPLE.COM             \
        --ipa-principal=admin               \
        --ipa-password=smartvm1             \
        -o /tmp/external-ipa.yaml

    **Note:**

    `--host` must be the DNS of the application exposing the `httpd` pod, for example ${APPLICATION\_DOMAIN}.

    
2.  Copy the new `authconfig` map back locally:

        $ oc cp $CONFIGMAP_GENERATOR_POD:/tmp/external-ipa.yaml ./external-ipa.yaml

3.  Apply the new configuration map to the `httpd` pod, and then redeploy it to take effect:

        $ oc replace configmaps httpd-auth-configs --filename ./external-ipa.yaml

To generate a new `authconfig` map, redeploy the `httpd-configmap-generator` pod first to get a clean environment before
running the `httpd-configmap-generator` tool.

If additional configuration is needed, you can configure the configuration map manually using the steps in [Defining the
Configuration Map Manually](#manually-defining-configmap). See [External Authentication Configuration Map Settings](#configmap-settings) for configuration map parameters.

##### Cleaning up

After generating an `authconfig` map, the `httpd-configmap-generator` pod can be scaled down, or deleted if no longer needed.

To scale down the pod, run:

    $ oc scale dc httpd-configmap-generator --replicas=0

To delete the pod, run:

    $ oc delete all  -l app=httpd-configmap-generator
    $ oc delete pods -l app=httpd-configmap-generator

### Defining the Configuration Map Manually

The `authconfig` map can be defined and customized in the `httpd` pod as follows:

    $ oc edit configmaps httpd-auth-configs

Alternatively, you can replace the `httpd-auth-configs` file with an externally generated and edited configuration file as follows:

    $ oc replace configmaps httpd-auth-configs --filename external-auth-configmap.yaml

After editing the configuration map, redeploy the `httpd` pod for the new authentication configuration to take effect.
