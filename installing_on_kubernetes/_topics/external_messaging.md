## Configuring external messaging

It is possible to run with an external Kafka messaging server. To do this, create the required secret with the correct parameters using the folowing example and provide that secret name as `kafkaSecret` in the CR.

```bash
$ kubectl create secret generic kafka-secrets --from-literal=hostname=<your fqdn> --from-literal=username=<your username> --from-literal=password=<your password>
```

