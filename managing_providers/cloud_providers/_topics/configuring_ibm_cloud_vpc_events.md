# Configuring Event Handling for the IBM Cloud VPC Provider

1. On IBM Cloud, create an IBM Cloud Activity Tracker service instance
**Note:** Export API will be used therefore `Lite` plan cannot be used

2. Open the dashboard for the instance and navigate to `Settings -> Organization -> API Keys`

3. Copy the service key or generate a new one

4. On ManageIQ, when creating an IBM Cloud VPC provider, place the service key in the field under the `Events` tab on the provider creation form

For further information, see https://cloud.ibm.com/docs/activity-tracker?topic=activity-tracker-service_keys