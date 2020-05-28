## Troubleshooting Deployment

Under normal circumstances, the deployment process takes approximately
10 minutes. If the deployment is unsuccessful, examining deployment
events and pod logs can help identify any issues.

1.  As a regular user, first retry the failed deployment:

        $ oc get pods
        NAME                 READY     STATUS    RESTARTS   AGE
        cloudforms-1-deploy  0/1       Error     0          25m
        memcached-1-yasfq    1/1       Running   0          24m
        postgresql-1-wfv59   1/1       Running   0          24m

        $ oc deploy cloudforms --retry
        Retried #1
        Use 'oc logs -f dc/cloudforms' to track its progress.

2.  Allow a few seconds for the failed pod to get re-scheduled, then
    check events and logs:

        $ oc describe pods <pod-name>
        ...
        Events:
          FirstSeen LastSeen    Count   From                            SubobjectPath           Type        Reason      Message
          --------- --------    -----   ----                            -------------           --------    ------      -------
        15m     15m     1   {kubelet ocp-eval-node-2.e2e.example.com}   spec.containers{cloudforms} Warning     Unhealthy   Readiness probe failed: Get http://10.1.1.5:80/: dial tcp 10.1.1.5:80: getsockopt: connection refused

    Liveness and readiness probe failures, like in the output above,
    indicate the pod is taking longer than expected to come online. In
    this case, check the pod logs.

3.  As the `cfme-app` container is `systemd` based, use `oc rsh` instead
    of `oc logs` to obtain journal dumps:

        $ oc rsh <pod-name> journalctl -x

4.  Transferring all logs from the `cfme-app` pod to a directory on the
    host for further examination can be useful for troubleshooting.
    Transfer the logs with the `oc rsync` command:

        $ oc rsync <pod-name>:/persistent/container-deploy/log \
        /tmp/fail-logs/
        receiving incremental file list
        log/
        log/appliance_initialize_1477272109.log
        log/restore_pv_data_1477272010.log
        log/sync_pv_data_1477272010.log

        sent 72 bytes  received 1881 bytes  1302.00 bytes/sec
        total size is 1585  speedup is 0.81
