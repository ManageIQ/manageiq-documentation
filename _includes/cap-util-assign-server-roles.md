1.  Click **Configuration**, then select the server to configure from
    menu: **Settings > Zone** in the accordion menu on the left.

2.  Browse to the **Server Roles** list in the menu: **Server > Server Control** section. From there, set the required capacity and
    utilization roles to **ON**, namely:

    1.  **Capacity & Utilization Coordinator**

    2.  **Capacity & Utilization Data Collector**

    3.  **Capacity & Utilization Data Processor**

3.  Click **Save**.

Data collection is enabled immediately. However, the first collection
begins 5 minutes after the server is started, and every 10 minutes after
that. Therefore, the longest the collection takes after enabling the
Capacity & Utilization Collector role is 10 minutes. The first
collection from a particular provider may take a few minutes since
{{ site.data.product.title_short }} is gathering data points going one month back in time.
