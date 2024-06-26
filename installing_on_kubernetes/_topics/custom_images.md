## Using your own images

If you built your own custom application images and want to deploy those you can specify the image names in the CR using the following example.

```yaml
applicationDomain: miqproject.apps-crc.testing
baseWorkerImage: docker.io/<your_username_or_organization>/<your_prefix>-base-worker:latest
httpdImage: docker.io/<your_username_or_organization>/<your_prefix>-httpd:latest
memcachedImage: docker.io/<your_username_or_organization>/<your_prefix>-memcached:latest
opentofuRunnerImage: docker.io/<your_username_or_organization>/<your_prefix>-opentofurunner:latest
orchestratorImage: docker.io/<your_username_or_organization>/<your_prefix>-orchestrator:latest
postgresqlImage: docker.io/<your_username_or_organization>/<your_prefix>-postgresql:latest
uiWorkerImage: docker.io/<your_username_or_organization>/<your_prefix>-ui-worker:latest
webserverWorkerImage: docker.io/<your_username_or_organization>/<your_prefix>-webserver-worker:latest
```

If you built your own operator image, you'll need to edit the operator deployment to specify that.
