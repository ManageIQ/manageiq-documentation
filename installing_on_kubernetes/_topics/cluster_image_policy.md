## Allow docker.io/manageiq images in kubernetes

Depending on your cluster's configuration, kubernetes may not allow deployment of images from `docker.io/manageiq`.  If so, deploying the operator may raise an error:

```
Error from server: error when creating "deploy/operator.yaml": admission webhook "trust.hooks.securityenforcement.admission.xxx" denied the request:
Deny "docker.io/manageiq/manageiq-operator:latest", no matching repositories in ClusterImagePolicy and no ImagePolicies in the "YYY" namespace
```

To allow images from `docker.io/manageiq`, edit the clusterimagepolicies and add `docker.io/manageiq/*` to the list of allowed repositories:

```bash
kubectl edit clusterimagepolicies $(kubectl get clusterimagepolicies --no-headers | awk ‘{print $1}’)
````

For example:

```yaml
...
spec:
  repositories:
  ...
  - name: docker.io/icpdashdb/*
  - name: docker.io/istio/proxyv2:*
  - name: docker.io/library/busybox:*
  - name: docker.io/manageiq/*
  ...
```

After saving this change, `docker.io/manageiq` image deployment should now be allowed.
