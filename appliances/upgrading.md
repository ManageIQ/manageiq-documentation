---
---

# Upgrading Appliances

In the tal release, we moved to CentOS Stream 10 bootc appliances.  Upgrading to tal requires a replacement of the appliances.  Once you have a tal appliance, the new upgrade mechanism uses bootc to pull and boot container images rather than dnf/rpm.

1. If your container registry requires authentication, create a container registry auth file in /etc/ostree/auth.json

2. Pull and prepare to run the newer release.  i.e. docker.io/manageiq/manageiq-appliance-libvirt:latest

```bash
bootc switch <new image>
```

3. Reboot into the new image

```bash
reboot
```

4. Stop evmserverd, migrate the database, and re-start the application

```bash
systemctl stop evmserverd
systemctl status evmserverd
cd /var/www/miq/vmdb/
bundle exec rake db:migrate
systemctl start evmserverd
```

## Update automation engine

In the UI navigate to <strong> Automation > Embedded Automate > Import/Export</strong> and click the Reset option <strong>(<img width="21" height="19" alt="image" src="https://github.com/user-attachments/assets/0b81f390-9ed0-4996-aad8-3a3db8a5b809"/> Reset all components in the built-in domains)</strong>.
Always be sure to export the current datastore before importing or resetting.

## Upgrading podified to tal with postgresql 16

In this section we will upgrade an existing podified installation and upgrade the database server from PostgreSQL 13 to 16.
1. Switch to the namespace where the application is installed.

```bash
# oc project <your_namespace>
```

2. Upgrade the operator changing .spec.template.spec.containers[0].image to the new image

```bash
# oc edit deployment {{ title_short_l }}-operator
```

3. Update httpd, memcached, base-worker, orchestrator, ui-worker and webserver-worker image references

```bash
# oc edit {{ site.data.product.operator_custom_resource_definition_name_plural }}
```

4. Stop all of the worker pods by putting the orchestrator to sleep

```bash
# oc patch deployment orchestrator -p '{"spec":{"template":{"spec":{"containers":[{"name":"orchestrator","command":["sleep", "1d"]}]}}}}'
```

5. Back up the postgresql 13 database to a file on the PV

```bash
# oc rsh deploy/postgresql
#   sh-5.2$ pg_dumpall -c --if-exists | gzip > /var/lib/pgsql/data/vmdb.pg.gz
#   sh-5.2$ exit
```

6. Copy the database backup locally

```bash
# oc get pod -l name=postgresql
# oc cp <name of postgresql-xxx pod>:/var/lib/pgsql/data/vmdb.pg.gz vmdb.pg.gz
```

7. Upgrade the postgresql deployment from 13 to 16 by switching the image tag from "13-el9" to "16-el10"

```bash
# oc edit {{ site.data.product.operator_custom_resource_definition_name_plural }}
```

8. The new postgresql pod will get deployed, but stuck in CrashLoopBackOff because of incompatible data directory

```bash
# oc delete pvc/postgresql deployment/postgresql
```

9. Copy the database backup to the new pvc

```bash
# oc get pod -l name=postgresql
# oc cp vmdb.pg.gz <name of new postgresql-xxx pod>:/var/lib/pgsql/data/vmdb.pg.gz
```

10. Restore the database backup to the postgresql 16 formatted userdata directory

```bash
# oc rsh deploy/postgresql
  # gunzip < /var/lib/pgsql/data/vmdb.pg.gz | psql postgres
  # rm -rf /var/lib/pgsql/data/vmdb.pg.gz
  # exit
```

11.  Restart the orchestrator

```bash
# oc delete deployment orchestrator
```

12. Delete the old network policies

```bash
# oc delete networkpolicy -l app=ibm-infra-management-application
```

The new orchestrator and network policies will get created and after a few minutes the worker pods will be deployed.  Once the UI pods are up, log into the web-UI and verify that the restore was successful.
