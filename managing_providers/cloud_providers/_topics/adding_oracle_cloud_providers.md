## Adding an Oracle Cloud Provider

Complete the following procedure to add an Oracle Cloud provider in {{ site.data.product.title_short }}.

1. Browse to menu: **Compute > Clouds > Providers**.

2. Click **Configuration**, then click
    ![1862](../../images/1862.png) **Add a New Cloud Provider**.

3. From the **Type** list, select **Oracle Cloud**.

4. Enter a **Name** for the provider.
5. Select the appropriate **Zone**.
6. Select the appropriate **Region**.
7. Enter your **Tenant ID** from https://cloud.oracle.com/tenancy, Copy the `OCID` on the `Tenancy Information` tab

8. Under **Endpoint**

    1. Enter your **User ID**.  You can use your primary user or create a new user with Administrator permissions.  Once you have your user Copy the OCID and paste it into the User ID field.

    2. Next you must create an API Key for the user that you have chosen to use.  From the user's details page under Resources select **API Keys** and **Add API Key**.

    3. Now select **Generate API Key Pair** and download the public key and private key

    4. Copy and paste the content of these downloaded keys into the **Private Key** and **Public Key** forms respectively


9. Click **Validate** to validate the credentials.

   **Note:** The connection uses port 443. Make sure the port 443 is opened on any firewalls.

10.  Click **Add**.
