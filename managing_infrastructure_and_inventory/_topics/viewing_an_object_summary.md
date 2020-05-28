## Viewing a Container Entity Summary

Container entity (object) summaries are found at
menu:Compute\[Containers \> *Entity*\], where you can view information
about container entities and their components.

  - Viewing a Containers Provider Summary
    Navigate to menu:Compute\[Containers \> Providers\] to view
    information on different aspects of a containers provider. The
    summary includes:

      - The status of the provider and its components.

      - The relationships between different entities of the containers
        provider. These relationships are summarized in the
        **Relationships** box on the right-hand side of the summary
        page.

        ![Entity Relationships](/images/entity-relationships.png)

      - Additional information on aggregated capacity of all CPU cores
        of all nodes, and aggregated capacity of all memory of all
        nodes.

<!-- end list -->

  - Viewing a Container Nodes Summary
    Navigate to menu:Compute\[Containers \> Container Nodes\] to view
    information on different aspects of a container node. The summary
    includes:

      - The number of entities on a node.

      - A node’s capacity and utilization.

      - The version of the underlying operating system and software.

To view the timeline of events for a node from a container nodes summary
page, click ![Monitoring](/images/1994.png) (**Monitoring**), and then
![Timelines](/images/1995.png) (**Timelines**).

  - Viewing a Containers Summary
    Navigate to menu:Compute\[Containers \> Containers\] to view
    information on different aspects of a container. The summary
    includes:

      - The relationships of the container to a related node, pod, or
        image.

      - The node the container runs on.

      - The container ID.

      - Properties of the container image, such as name, tag, etc.

<!-- end list -->

  - Viewing a Container Images Summary
    Navigate to menu:Compute\[Containers \> Container Images\] to view
    information on different aspects of a container image. The summary
    includes:

      - The containers currently using the images.

      - The image registry the image is from.

<!-- end list -->

  - Viewing an Image Registries Summary
    Navigate to menu:Compute\[Containers \> Image Registries\] to view
    information on different aspects of an image registry. The summary
    includes:

      - Which images are from the registry.

      - The number of images that come from that registry.

      - Which containers use images from that registry.

      - The host and port of the registry.

<!-- end list -->

  - Viewing a Pods Summary
    Navigate to menu:Compute\[Containers \> Pods\] to view information
    on different aspects of a pod. The summary includes:

      - The containers that are part of the pod.

      - The services that reference the pod.

      - The node the pod runs on.

      - If the pod controlled by a replicator.

      - The IP address of the pod.

<!-- end list -->

  - Viewing a Replicators Summary
    Navigate to menu:Compute\[Containers \>Replicators\] to view
    information on different aspects of a replicator. The summary
    includes:

      - The number of requested pods.

      - The number of current pods.

      - The labels and selector for the replicator.

<!-- end list -->

  - Viewing a Container Services Summary
    Navigate to menu:Compute\[Containers \> Container Services\] to view
    information on different aspects of a container service. The summary
    includes:

      - The pods that the container service provide traffic to.

      - The port configurations for the container service.

      - The labels and selector for the container service.

<!-- end list -->

  - Viewing a Volumes Summary
    Navigate to menu:Compute\[Containers \> Volumes\] to view
    information on the persistent volumes of a container provider. The
    summary includes:

      - The pods the volume is connected to.

      - The volume’s connection parameters.

      - The volume’s storage capacity.

      - The volume’s iSCSI target details (if applicable).

<!-- end list -->

  - Viewing a Container Builds Summary
    Navigate to menu:Compute\[Containers \> Container Builds\] to view
    different aspects of a container build. The summary includes:

      - The build configuration the container build is based on.

      - Which build instances have been created.

      - Which phase in the build process the instance has completed.

      - Which pod a build instance reside in.

<!-- end list -->

  - Viewing a Container Templates Summary
    Navigate to menu:Compute\[Containers \> Container Templates\] to
    view different aspects of a container template. The summary
    includes:

      - The project the template is associated with.

      - The objects the template contains.

      - The parameters that can be used with the template’s objects.

      - The template’s version number.
