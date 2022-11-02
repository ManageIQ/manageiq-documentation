## Check readiness of the pods

**Note:** Please allow a few minutes for the application to start.  Initial install and upgrades take extra time due to database initialization.  HTTPS traffic will not be served until pods are running and ready.  The READY column denotes the number of replicas and their readiness state.  The operator deploys the following pods:

```bash
$ oc get pods
NAME                                     READY     STATUS    RESTARTS   AGE
httpd-754985464b-4dzzx                   1/1       Running   0          37s
orchestrator-5997776478-vx4v9            1/1       Running   0          37s
memcached-696479b955-67fs6               1/1       Running   0          37s
postgresql-5f954fdbd5-tnlmf              1/1       Running   0          37s
```

The orchestrator waits for memcached and postgresql to be ready, migrates and seeds the database, then it will begin to start worker pods.
After a few minutes you can see the initial set of worker pods has been deployed and the user interface should be accessible.

```bash
$ oc get pods
NAME                                     READY     STATUS    RESTARTS   AGE
event-handler-747574c54c-xpcvf           1/1       Running   0          32m
generic-55cc84f79d-gwf5v                 1/1       Running   0          32m
generic-55cc84f79d-w4vzs                 1/1       Running   0          32m
httpd-754985464b-4dzzx                   1/1       Running   0          37m
orchestrator-5997776478-vx4v9            1/1       Running   0          37m
memcached-696479b955-67fs6               1/1       Running   0          37m
postgresql-5f954fdbd5-tnlmf              1/1       Running   0          37m
priority-7b6666cdcd-5hkkm                1/1       Running   0          32m
priority-7b6666cdcd-rcf7l                1/1       Running   0          32m
remote-console-6958c4cc7b-5kmmj          1/1       Running   0          32m
reporting-85c8488848-p5fb6               1/1       Running   0          32m
reporting-85c8488848-z7kjp               1/1       Running   0          32m
schedule-6fd7bc5688-ptsxp                1/1       Running   0          32m
ui-5b8c86f6f9-jhd9w                      1/1       Running   0          32m
web-service-858f55f55d-5tmcr             1/1       Running   0          32m
```

Under normal circumstances the entire first time deployment process should take around ~10 minutes.  Any issues can be seen by examining the deployment events and pod logs.  The time can vary significantly based on performance of the environment, however, subsequent boots should be much faster.  Version upgrades can also be time consuming depending on the size of the database and the number and difficulty of migrations that need to be applied.  Progress can be monitored in the orchestrator logs.
