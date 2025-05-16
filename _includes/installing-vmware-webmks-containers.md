### Installing VMware WebMKS on containers

VMware vSphere Virtual Machine Remote console access requires the installation of the VMware WebMKS SDK.
Due to license restrictions this SDK cannot be built in to {{ site.data.product.title_short }}

To install the WebMKS SDK on containers we can take an existing container and create another layer on top of it.  Once built, this image will need to be pushed to a registry and the CR updated to reflect that.

1. Download the latest WebMKS version (e.g. `WebMKS_SDK_{version}.zip`) from the VMware website.

2. Set up a temporary directory where we will build the image

   ```bash
   $ mkdir -p /tmp/webmks_container/container-assets
   ```

3. Copy the tar file into the container-assets directory.  For example,

   ```bash
   $ unzip ~/Downloads/WebMKS_SDK_*.zip -d /tmp/webmks_container/container-assets
   ```

4. Add the following Dockerfile as `/tmp/webmks_container/Dockerfile` and substitute the second `FROM` based on the image and version that you're running.

   ```dockerfile
   FROM registry.access.redhat.com/ubi8/ubi as webmks

   COPY container-assets/ /webmks/

   ################################################################################

   ### IMPORTANT: Modify the following image and tag as necessary to reflect the version that you're running
   FROM your_registry.example.com/namespace/manageiq-ui-worker:latest

   COPY --from=webmks /webmks/ /var/www/miq/vmdb/public/webmks
   ```

5. Build the image and tag it appropriately for your registry, then push it to the registry.

   ```bash
   $ cd /tmp/webmks_container/
   $ docker build . -t your_registry.example.com/namespace/manageiq-ui-worker:latest_webmks
   $ docker push your_registry.example.com/namespace/manageiq-ui-worker:latest_webmks
   ```

6. Update the CR to use the UI worker image you just pushed to the registry.

   ```yaml
   uiWorkerImage: your_registry.example.com/namespace/manageiq-ui-worker:latest_webmks
   ```

The operator will now update the orchestrator and worker deployments to reflect this change.
