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
