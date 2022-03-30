## Configuring an image pull secret

If authentication is required in order to pull the images, a secret containing the credentials needs to be created.
If your secret is named `image-pull-secret`, no additional changes are required to the custom resource.
If you use a different name for the secret, that will need to be defined in the custom resource as `imagePullSecret: your-secret-name`
