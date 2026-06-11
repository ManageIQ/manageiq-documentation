---
---

# Upgrading Appliances

In this example, we will update from jansa to kasparov.

1. Ensure that the appliance is up to date on the current branch

        # dnf update

2. Install the new manageiq-release RPM for the version that you want to upgrade to. Refer to the [release directory](https://rpm.manageiq.org/?prefix=release) in our RPM repository to find the latest manageiq-release rpm. Navigate to the non-nightly directory, el, then noarch directory for the version that you want to upgrade to, and get the URL for the manageiq-release rpm.

        # dnf install https://rpm.manageiq.org/release/11-kasparov/el8/noarch/manageiq-release-11.0-1.el8.noarch.rpm

3. Stop evmserverd if running

        # systemctl stop evmserverd
        # systemctl status evmserverd

4. Update the RPMs from the new repo

        # dnf update

5. Migrate the database

        # cd /var/www/miq/vmdb/
        # bundle exec rake db:migrate

6. Reboot the appliance

        # reboot

## Update automation engine

In the UI navigate to <strong> Automation > Embedded Automate > Import/Export</strong> and click the Reset option <strong>(<img width="21" height="19" alt="image" src="https://github.com/user-attachments/assets/0b81f390-9ed0-4996-aad8-3a3db8a5b809"/> Reset all components in the built-in domains)</strong>.
Always be sure to export the current datastore before importing or resetting.

## Upgrading podified to tal with postgresql 16

In this section we will upgrade an existing podified installation and upgrade the database server from PostgreSQL 13 to 16.
1. Switch to the namespace where the application is installed.

        # oc project <your_namespace>

2. Upgrade the operator (and image references other than postgresqlVersion)

        # oc edit deployment {{ title_short_l }}-operator
          # Change .spec.template.spec.containers[0].image to the new image
        # oc edit {{ site.data.product.operator_custom_resource_definition_name_plural }}
          # Update all of the image tags except for postgresql

3. Stop all of the worker pods by putting the orchestrator to sleep

        # oc patch deployment orchestrator -p '{"spec":{"template":{"spec":{"containers":[{"name":"orchestrator","command":["sleep", "1d"]}]}}}}'

4. Back up the postgresql 13 database to a file on the PV

        # oc rsh deploy/postgresql
        #   sh-5.2$ pg_dumpall -c --if-exists | gzip > /var/lib/pgsql/data/vmdb.pg.gz
        #   sh-5.2$ exit

5. Copy the database backup locally

        # oc get pod -l name=postgresql
        # oc cp <name of postgresql-xxx pod>:/var/lib/pgsql/data/vmdb.pg.gz vmdb.pg.gz

6. Switch the postgresql deployment from 13 to 16 using the following:

        # oc edit {{ site.data.product.operator_custom_resource_definition_name_plural }}
          # Change the .spec.postgresqlImage tag from "13-el9" to "16-el10"

7. The new postgresql pod will get deployed, but stuck in CrashLoopBackOff because of incompatible data directory

        # oc delete pvc/postgresql deployment/postgresql

8. Copy the database backup to the new pvc

        # oc get pod -l name=postgresql
        # oc cp vmdb.pg.gz <name of new postgresql-xxx pod>:/var/lib/pgsql/data/vmdb.pg.gz

9. Restore the database backup to the postgresql 16 formatted userdata directory

        # oc rsh deploy/postgresql
          # gunzip < /var/lib/pgsql/data/vmdb.pg.gz | psql postgres
          # rm -rf /var/lib/pgsql/data/vmdb.pg.gz
          # exit

10.  Restart the orchestrator

        # oc delete deployment orchestrator

11. Delete the old network policies

        # oc delete networkpolicy -l app=ibm-infra-management-application

The new orchestrator and network policies will get created and after a few minutes the worker pods will be deployed.  Once the UI pods are up, log into the web-UI and verify that the restore was successful.
