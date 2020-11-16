## Scaling a Highly Available {{ site.data.product.title_short }} Environment

After creating high availability for the database tier and the user interface tier, the rest of the infrastructure should be sized appropriately for the roles and the environments that they manage. These
roles and tiers use built-in high availability mechanisms like primary, secondary, and tertiary failover.

You can configure additional worker appliances as needed using the steps in [Installing Additional Appliances](#installing-additional-manageiq-appliances), and then assign zones and server roles. The non-database {{ site.data.product.title_short }} appliances and
roles can be configured in any order.

The following diagram shows an example of a highly available database configuration that contains worker appliances, providers, and the HAProxy load balancer configured in [Configuring the HAProxy Load Balancer](#configuring-the-haproxy-load-balancer).

The worker appliances in the diagram are labeled by server role (**User Interface**, **Management**, and **Database Ops**) and corresponding zone to show how a highly available environment might be scaled with
server roles and zones.

![ha architecture 431939 0917 ece 02](../images/ha_architecture_431939_0917_ece-02.png)

See [Regions](../general_configuration/index.html#regions)
and [Servers](../general_configuration/index.html#servers)
in *General Configuration* for more information on configuring servers and roles.

[//]: <This needs a replacement topic created. See [Deploying CloudForms at Scale](https://access.redhat.com/documentation/en-us/reference_architectures/2017/html/deploying_cloudforms_at_scale/) for further recommendations on scaling your {{ site.data.product.title_short }} environment.>
