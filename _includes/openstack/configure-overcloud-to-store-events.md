# Configuring Overcloud to Store Events

By default, the Telemetry service does not store events emitted by other services in a
Red Hat OpenStack Platform environment. The following procedure outlines how to enable
the Telemetry service on your OpenStack cloud provider to store such events. This
ensures that events are exposed to {{ site.data.product.title_short }} when a Red Hat
OpenStack Platform environment is added as a cloud provider.

1. Log in to the undercloud host.

2. Create an environment file called *ceilometer.yaml*, and add the following contents:

        parameter_defaults:
          CeilometerStoreEvents: true

3. Please see the below **NOTE**.

If your OpenStack cloud provider was not deployed through the undercloud, you can also
set this manually. To do so:

1. Log in to your Controller node.

2. Edit */etc/ceilometer/ceilometer.conf*, and specify the following option:

        store_events = True

**Note:**

Passing the newly created environment file to the overcloud deployment is environment
specific and requires executing commands in particular order depending on use of
variables. For further information please see
[*Director Installation and Usage*](https://access.redhat.com/documentation/en-us/red_hat_openstack_platform/11/html/director_installation_and_usage/)
in the Red Hat OpenStack Platform documentation.
