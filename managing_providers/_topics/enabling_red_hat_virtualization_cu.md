# Enabling Red Hat Virtualization Capacity and Utilization Data Collection

Configure the following to collect capacity and utilization data from a Red Hat Virtualization provider:

  - In {{ site.data.product.title_short }}, enable the capacity and utilization server roles from the settings menu, in menu:Configuration\[Server\> Server Control\]. For more information on capacity and utilization collection, see [Assigning the Capacity and Utilization Server Roles](../deployment_planning_guide/index.html#assigning-the-capacity-and-utilization-server-roles) in the *Deployment Planning Guide*.

  - For information on selecting clusters and datastores used to collect data, see [Capacity and Utilization Data Collected](../deployment_planning_guide/index.html#capacity-and-utilization-data-collected) in the *General Configuration Guide*.

  - In your Red Hat Virtualization environment, install the Data
    Warehouse and Reports components, and create a {{ site.data.product.title }} user in the Data Warehouse database:

      - To install the Data Warehouse and Reports components in a Red Hat Virtualization environment, see the [Data Warehouse Guide](https://access.redhat.com/documentation/en-us/red_hat_virtualization/4.1/html/data_warehouse_guide/).

      - To create a {{ site.data.product.title_short }} user in the Data Warehouse database, see [Data Collection for Red Hat Enterprise Virtualization](../deployment_planning_guide/#data_collection_for_rhev_33_34) in the *Deployment Planning Guide*.
