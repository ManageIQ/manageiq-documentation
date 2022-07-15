### Podified Logging

When running in podified all logs are output to the container's stdout which is picked up by Kubernetes/OpenShift and made available via `kubectl logs`/`oc logs`.

The log output format is in JSON and includes extra metadata like the log-level, timestamp:
```json
{
  "@timestamp":"2020-01-01T12:34:56.789012",
  "pid":12345,
  "tid":"6789abcdef01",
  "level":"info",
  "message":"MIQ(Class#method) Example message"
}
```

You can also pass a label selector to `oc logs` with `-l` so for example to tail all generic pods: `oc logs -f -l name=1-generic`

If you prefer to view the container JSON logs in the standard MIQ format you can use the `unjson_logs` utility.  This utility is in `/var/www/miq/vmdb/tools/unjson_logs`

```bash
oc logs -l name=1-ui | tools/unjson_logs
[----] I, [2022-06-16T15:40:21.095098 #7:b4e4c]  INFO -- production: Started GET "/ems_infra/56?display=vms" for 127.0.0.1 at 2022-06-16 15:40:21 +0000
[----] I, [2022-06-16T15:40:21.100999 #7:b4e4c]  INFO -- production: Processing by EmsInfraController#show as HTML
[----] I, [2022-06-16T15:40:21.101242 #7:b4e4c]  INFO -- production:   Parameters: {"display"=>"vms", "id"=>"56"}
```
