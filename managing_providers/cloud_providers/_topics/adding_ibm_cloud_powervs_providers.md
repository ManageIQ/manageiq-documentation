## Adding IBM Power Systems Virtual Servers Providers

Complete the following procedure to add an IBM Power Systems Virtual Servers
cloud provider in {{ site.data.product.title_short }}.

1.  Browse to menu: **Compute > Clouds > Providers**.

2.  Click **Configuration**, then click
    ![1862](../../images/1862.png) (**Add a New Cloud Provider**).

3.  From the **Type** list, select **IBM Power Systems Virtual Servers**.

4.  Enter a **Name** for the provider.

6.  Select the appropriate **Zone**.

7.  Under **Endpoints**, in the **Default** tab.

    1.  Enter your **IBM Cloud API Key**.

        For more information on managing IBM Cloud API keys, including how to
        create one, refer to IBM Cloud Docs:
        [Managing user API keys](https://cloud.ibm.com/docs/account?topic=account-userapikey)

    2.  Enter the **PowerVS Service GUID** of the IBM Power Systems Virtual
        Servers service instance you want to add.

        You can easily copy the GUID from the
        [IBM Cloud Resources](https://cloud.ibm.com/resources) page, by selecting
        "Services" and clicking on the whitespace of a PowerVS instance row.

        ![Power Systems Virtual Server GUID](../../images/ibm_cloud_powervs_guid.png)

    3.  Click **Validate** to validate the credentials.

9.  Click **Add**.
