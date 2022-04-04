## Migrating from Appliances

### Notes

- Multi-server / multi-zone:
  Current architecture in podified limits us to running a single server and zone in a Kubernetes namespace.
  Therefore, when migrating from a multi-appliance and/or multi-zone appliance architecture, you will need to choose a single server to assume the identity of.
  This server should have the UI and web service roles enabled before taking the database backup to ensure that those workers will start when deployed in the podified environment.
  All desired roles and settings will need to be configured on this server.

- Multi-region:
  Multi-region deployments are slightly more complicated in a podified environment since postgres isn't as easily exposed outside the project / cluster.
  If all of the region databases are running outside of the cluster or all of the remote region databases are running outside of the cluster and the global database is in the cluster, everything is configured in the same way as appliances.
  If the global region database is migrated from an appliance to a pod, the replication subscriptions will need to be recreated.
  If any of the remote region databases are running in the cluster, the `postgresql` service for those databases will need to be exposed using a [node port](https://kubernetes.io/docs/concepts/services-networking/service/#nodeport).
  To publish the postgresql service on a node port, patch the service using `$ kubectl patch service/postgresql --patch '{"spec": {"type": "NodePort"}}'`.
  Now you will see the node port listed (31871 in this example) as well as the internal service port (5432).  This node port can be used along with the IP address of any node in the cluster to access the postgresql service.
```bash
$ oc get service/postgresql
NAME         TYPE       CLUSTER-IP   EXTERNAL-IP   PORT(S)          AGE
postgresql   NodePort   192.0.2.1    <none>        5432:31871/TCP   2m
```
### Collect data from the appliance
1. Take a backup of the database
```bash
$ pg_dump -Fc -d vmdb_production > /root/pg_dump
```
2. Export the encryption key and Base64 encode it for the Kubernetes Secret.
```bash
$ vmdb && rails r "puts Base64.encode64(ManageIQ::Password.v2_key.to_s)"
```
3. Get the region number
```bash
$ vmdb && rails r "puts MiqRegion.my_region.region"
```
4. Get the GUID of the server that you want to run as.
```bash
$ vmdb && cat GUID
```
### Restore the backup into the kubernetes environment
1. Create a YAML file defining the Custom Resource (CR). Minimally you'll need the following:
```yaml
apiVersion: {{ site.data.product.operator_namespace }}/{{ site.data.product.operator_api_version }}
kind: {{ site.data.product.operator_custom_resource_kind }}
metadata:
  name: <friendly name for you CR instance>
spec:
  applicationDomain: <your application domain name>
  databaseRegion: <region number from the appliance above>
  serverGuid: <GUID value from appliance above>
```
2. Create the CR in your namespace. Once created, the operator will create several additional resources and start deploying the app.
```bash
$ oc create -f <file name from above>
```
3. Edit the app secret inserting the encryption key from the appliance. Replace the "encryption-key" value with the value we exported from the appliance above.
```bash
$ oc edit secret app-secrets
```
4. Temporarily hijack the orchestrator by adding the following to the deployment:
```bash
$ kubectl patch deployment orchestrator -p '{"spec":{"template":{"spec":{"containers":[{"name":"orchestrator","command":["sleep", "1d"]}]}}}}'
```
5. Shell into the orchestrator container:
```bash
$ oc rsh deploy/orchestrator

$ cd /var/www/miq/vmdb
$ source ./container_env
$ DISABLE_DATABASE_ENVIRONMENT_CHECK=1 rake db:drop db:create
```
6. `oc rsh` into the database pod and restore the database backup
```bash
$ cd /var/lib/pgsql
# --- download your backup here ---
$ pg_restore -v -d vmdb_production <your_backup_file>
$ rm -f <your_backup_file>
$ exit
```
7. Back in orchestrator pod from step 5:
```bash
$ rake db:migrate
$ exit
```
8. Delete the orchestrator deployment to remove the command override that we added above:
```bash
$ kubectl delete deployment orchestrator
```
Done! The orchestrator will start deploying the rest of the pods required to run the application.
