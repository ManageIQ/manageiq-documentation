# Configuring Metrics Collection for the IBM Cloud VPC Provider

1. On IBM Cloud, navigate to the `Overview` page for the instance in which metrics will be collected

2. Navigate to the `Monitoring` tab and click on `Add Monitoring`

3. Create the IBM Cloud Monitoring instance

**Note:** An IBM Cloud Monitoring instance with 'platform metrics' enabled can be used to collect metrics for all VM instances in the deployed region

In order to enable metrics functionality on ManageIQ, the instance GUID is required when adding the VPC cloud provider. This can be obtained using the IBM Cloud CLI:

1. Log in to IBM Cloud CLI i.e. `ibmcloud login -sso`

2. Use the following command: `ibmcloud resource service-instance <INSTANCE_NAME> --output json | jq -r '.[].guid'`