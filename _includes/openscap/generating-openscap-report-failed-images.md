You can output the results of an OpenSCAP scan of images to a report for an overview of the security risk level of images. The **Images by Failed OpenSCAP Rule Results are included with {{ site.data.product.title_short }} and shows whether the image passed or failed OpenSCAP policy criteria, and the security risk.


**Note**: You can also create a copy of this report and edit it to contain additional information, such as the project name where the image is used to produce more useful results. For more information, see [Editing a Report](../monitoring_alerts_and_reporting/index.html#editing-a-report) and [Reportable Fields in {{ site.data.product.title }}](../monitoring_alerts_and_reporting/index.html#reportable-fields-in-manageiq) in *Monitoring, Alerts, and Reporting* for instructions on customizing reports.

Steps to create a report to show image compliance:

1. Browse to menu: **Overview > Reports**.

2. Click the menu: **Reports > All Reports** accordion.

3. Browse to menu: **Configuration Management > Containers > Images by Failed OpenSCAP Rule Results** to run a report that shows which images failed the OpenSCAP compliance.

4. Click ![play arrow](../images/play_arrow.png) **Queue**.

5. The report generation is placed in the queue and its status shows in the reports page.

    ![failedimagescan](../images/failedimagescan.png)

6. Click ![reload](../images/reload.png) **(Refresh this page)** to update the status.

7. Browse to the **Saved Reports** accordion, and click the report when it completes.

8. Click the report download buttons for the type of export you want. The report is automatically named with the type of report and date.

      - Click ![textimage](../images/textimage.png) **Download this report in text format** to download as text.

      - Click ![textimage](../images/textimage.png) **Download this report in CSV format** to download as a comma-separated file.

      - Click ![2134](../images/2134.png) **Download this report in PDF format** to download as PDF.
