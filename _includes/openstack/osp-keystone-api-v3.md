  - With Keystone API v3, domains are used to determine administrative boundaries of service
    entities in OpenStack. Domains allow you to group users together for various purposes, such as
    setting domain-specific configuration or security options. For more information, see
    [OpenStack Identity(keystone)](https://access.redhat.com/documentation/en-us/red_hat_openstack_platform/11/html-single/architecture_guide/#comp-identity)
    in the Red Hat OpenStack Platform *Architecture Guide*.

  - The provider you are creating will be able to see projects for the given domain only. To see
    projects for other domains, add it as another cloud provider. For more information on domain management in
    OpenStack, see [Domain Management](https://access.redhat.com/documentation/en-us/red_hat_openstack_platform/11/html-single/users_and_identity_management_guide/#Domains)
    in the Red Hat OpenStack Platform *Users and Identity Management Guide*.
