## Installing the VMware-vix-disklib (VDDK) on containers

To install the VDDK on containers we can take an existing container and create another layer on top of it.  Once built, this image will need to be pushed to a registry and the CR updated to reflect that.

1. Fetch the VDDK linux tar file from VMware. (`VMware-vix-disklib-[version].x86_64.tar.gz`)
    **Note:**

      - If you do not already have a login ID to VMware, then you will
        need to create one. At the time of this writing, the file can be
        found by navigating to menu:Downloads\[vSphere\]. Select the
        version from the drop-down list, then click the **Drivers &
        Tools** tab. Expand **Automation Tools and SDKs**, and click
        **Go to Downloads** next to the **VMware vSphere Virtual Disk
        Development Kit** version. Alternatively, find the file by
        searching for it using the **Search** on the VMware site.

      - See VMware documentation for information about their policy
        concerning backward and forward compatibility for VDDK.

2. Set up a temporary directory where we will build the image
```bash
$ mkdir -p /tmp/vddk_container/container-assets
```

3. Copy the tar file into the container-assets directory.  For Example:
```bash
$ cp ~/Downloads/VMware-vix-disklib-*.tar.gz /tmp/vddk_container/container-assets
```

4. Add the following Dockerfile as `/tmp/vddk_container/Dockerfile` and substitute the second `FROM` based on the image and version that you're running.
```dockerfile
FROM registry.access.redhat.com/ubi8/ubi as vddk

COPY container-assets/ /vddk/

RUN cd /vddk && \
    filename=$(find . -name VMware-*) && \
    if [[ -f $filename ]] ; then tar -zxvf VMware-* ; fi && \
    mkdir -p vmware-vix-disklib-distrib && \
    touch /vddk/vmware-vix-disklib-distrib/.keep

################################################################################

### IMPORTANT: Modify the following image and tag as necessary to reflect the version that you're running
FROM your_registry.example.com/namespace/manageiq-base-worker:latest

COPY --from=vddk /vddk/vmware-vix-disklib-distrib/ /usr/lib/vmware-vix-disklib/

RUN /tmp/install-vmware-vddk
```

5. Build the image and tag it appropriately for your registry, then push it to the registry.
```bash
$ cd /tmp/vddk_container/
$ docker build . -t your_registry.example.com/namespace/manageiq-base-worker:latest_vddk
$ docker push your_registry.example.com/namespace/manageiq-base-worker:latest_vddk
```

6. Update the CR to use the base worker image you just pushed to the registry.
```yaml
baseWorkerImage: your_registry.example.com/namespace/manageiq-base-worker:latest_vddk
```

The operator will now update the orchestrator and worker deployments to reflect this change.
