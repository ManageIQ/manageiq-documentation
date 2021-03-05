# Enabling Google Compute Engine Events

After adding Google Compute Engine as a provider in {{ site.data.product.title_short }},
enable events for the provider so that you can monitor the system from
{{ site.data.product.title_short }}.

Events are set up on a per-project basis by using Google Stackdriver
logging combined with Google Pub/Sub. Stackdriver logging is a service
that aggregates and exposes log events from Google services and
applications. Stackdriver exports the log events to Google Pub/Sub, a
messaging service. This section describes how to export activity log
entries for a Google Compute Engine project so that events are captured
in {{ site.data.product.title_short }}.

  - You must have owner permission on the project you are exporting.

  - The Google Cloud Pub/Sub API must be enabled for your project. To
    enable the API:

<!-- end list -->

1.  In Google Cloud Platform, select your project from the top menu bar.

2.  Click ![gce products services](../images/gce-products-services.png) to
    show the **Products and Services** menu. Click **API Manager** to go
    to <https://console.cloud.google.com/apis/library/>.

3.  In the API Manager **Overview** tab, search for `Pub/Sub` in the
    **Google APIs** search bar and select **Google Cloud Pub/Sub API**
    from the results. Click the **Enable** button.

4.  If Google Cloud Pub/Sub API is already enabled, the **Enable**
    button will not show, and instead **Google Cloud Pub/Sub API** will
    be listed under **Enabled APIs**.

<!-- end list -->

  - The Stackdriver logging service must have permission to publish to
    your project’s Pub/Sub service. To add the required permissions:

<!-- end list -->

1.  In Google Cloud Platform, select your project and navigate to ![gce
    products services](../images/gce-products-services.png) menu:Products
    and Services\[IAM & Admin \> IAM\] to go to
    <https://console.cloud.google.com/iam-admin/iam/>.

2.  Assign **Logs Configuration Writer** permissions to your project:

    1.  If the `cloud-logs@system.gserviceaccount.com` account is
        already listed under **Members**, ensure **Logs Configuration
        Writer** is selected under **Role(s)**.

    2.  If the `cloud-logs@system.gserviceaccount.com` account is not
        listed under **Members**:

        1.  Click **Add** to add the permissions.

        2.  In the dialog box, enter
            `cloud-logs@system.gserviceaccount.com` in **Members** to
            add the Google APIs service account to the permissions list.

        3.  In the **Select a Role** dropdown, select menu:Logging\[Logs
            Configuration Writer\] and click **Add**.

## Configuring Google Compute Engine to Export Events

After you have completed the steps from
[itemizedlist\_title](#GCE_event_prerequisites), set up your Google
Compute Engine project to export events to {{ site.data.product.title_short }} with the
following steps:

1.  In Google Cloud Platform, click ![gce products
    services](../images/gce-products-services.png) to show the **Products
    and Services** menu, and click **Logging** to go to
    <https://console.cloud.google.com/logs/>.

2.  Select your project from the top menu bar.

3.  Click **Exports** from the **Logging** menu.

4.  In the **Select service** list, select **Compute Engine**.

5.  Under **Export these sources**, click **Add item**, and select
    `compute.googleapis.com/activity_log` from the list.

6.  Under **Select export destinations**, click the **Publish to Cloud
    Pub/Sub topic** dropdown and click **Add new topic…​**

7.  In the **Create Cloud Pub/Sub Topic** dialog, enter
    `manageiq-activity-log` as the **Name**. Click **Create**.

    ![gce exports](../images/gce-exports.png)

8.  Click **Save**.

When changes occur to Google Compute Engine instances, {{ site.data.product.title_short }}
is now notified and reports these changes as events.

**Note:**

For additional information about Google Compute Engine, see the Google
Cloud Platform documentation:

  - For information on setting up a cloud logging export on Google Cloud
    Platform, see
    <https://cloud.google.com/logging/docs/export/configure_export>.

  - For information on Google Cloud Pub/Sub API operations and costs,
    see <https://cloud.google.com/pubsub/>.

## Viewing Google Compute Engine Events in {{ site.data.product.title_short }}

In {{ site.data.product.title_short }}, view events for your Google Compute Engine project
by following these steps:

1.  Navigate to menu:Compute\[Clouds \> Providers\] and select your
    Google Compute Engine project.

2.  Click menu:Monitoring\[Timelines\] on the provider summary page to
    see an events timeline for the project.
