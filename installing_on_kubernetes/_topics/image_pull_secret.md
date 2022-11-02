## Configuring an image pull secret

If authentication is required in order to pull the images, a secret containing the credentials needs to be created.  The following is an example of creating the secret.

```bash
$ kubectl create secret docker-registry image-pull-secret --docker-username=<your registry username> --docker-password=<your registry password> --docker-server=<your registry server>
```

If you decide to use a secret name other than `image-pull-secret`, you need to specify that in the CR.

```yaml
imagePullSecret: <name of your pull secret>
```
