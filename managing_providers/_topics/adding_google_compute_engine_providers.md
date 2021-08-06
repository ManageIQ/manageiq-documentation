# Adding Google Compute Engine Providers

After initial installation and creation of a {{ site.data.product.title_short }} environment, add a
Google Compute Engine provider by following this procedure.

**Prerequisites.**

To add a Google Compute Engine provider to {{ site.data.product.title_short }}, you need:

- A Google Cloud Platform account

- A Google Compute Engine project with the Google Compute Engine API enabled

- A service account JSON key for your project

    **Note:**

    You can generate a private JSON key for your project in menu:
    **IAM & Admin > Service Accounts** in Google Cloud Platform. This key is used to authenticate
    against your provider.

    For additional information, see the
    [Google Cloud Platform](https://cloud.google.com/storage/docs/authentication) documentation.

<!-- end list -->

1. Browse to menu: **Compute > Clouds > Providers**.

2. Click **Configuration**, then click ![1862](../images/1862.png) **Add a New Cloud Provider**.

3. Enter a **Name** for the provider.

4. From the **Type** list, select **Google Compute Engine**.

5. Select your **Preferred Region** from the list.

6. Enter your Google Compute Engine Project ID for **Project**.

7. Select the appropriate **Zone** if you have more than one available. Red Hat recommends creating
   a new zone for your Google Compute Engine provider.

8. Copy your project’s **Service Account** JSON key contents to the **Service Account JSON** field.

9. Click **Validate** to validate the credentials.

10. Click **Add**.

**Note:**

Make sure that NTP synchronization is enabled and working. When clocks are not synchronized, the
following error will be raised:

`Credential validation was not successful: Authorization failed. Server message: { "error" : "invalid_grant", "error_description" : "Invalid JWT: Token must be a short-lived token and in a reasonable timeframe" }`
