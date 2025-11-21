## Importing OpenTofu image on an appliance

**Note**: Follow this section if you have {{ site.data.product.title_short }} that is deployed as a virtual appliance. These steps are not applicable to a containerized deployment (podified) of {{ site.data.product.title_short }}.

Use the following command to import the OpenTofu image on your appliance server.

```bash
{{ site.data.product.import_opentofu }}
```

Where `{{ site.data.product.opentofu_image_name }}` is the name of your OpenTofu image.

You also need to set the docker image name in advanced settings before enabling the server role. Navigate to the **Settings** > **Application Settings** in {{ site.data.product.title_short }} UI and set the value for `workers/worker_base/opentofu_worker/container_image` field.

An example value of this field is `container_image: {{ site.data.product.container_image }}`.
