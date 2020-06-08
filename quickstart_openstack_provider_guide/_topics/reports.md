{{ site.data.product.title }} provides a large group of default reports organized into
categories. Each category has its own set of subfolders. These reports
have been constructed to help you view the most commonly requested and
significant data.

The categories of predefined reports available on {{ site.data.product.title }} are:

{% include reports-categories.md %}

For more detailed information on managing reports, see [Monitoring,
Alerts, and
Reporting](https://access.redhat.com/documentation/en/red-hat-cloudforms/4.7/single/monitoring-alerts-and-reporting/).

### Generating a Single Report

{% include reports-generate-single.md %}

### Scheduling a Report

You can view historical data by creating reports on a scheduled basis.
In addition, scheduled reports can be emailed directly to users:

1.  Navigate to menu:Overview\[Reports\]

2.  Click the **Reports** accordion and select the report you want to
    view.

3.  Click ![1847](../images/1847.png) (**Configuration**), then **Add a
    new Schedule**.

4.  Fill in the **Basic Information** section.

5.  Configure the **Report Selection**.

6.  Configure the report’s schedule and frequency in the **Timer**
    section.

7.  Click **Save**.

### Viewing Reports

Once you have created a schedule for a report, you can view it at any
time after the first scheduled time has occurred.

1.  Navigate to menu:Overview\[Reports\].

2.  Click the **Saved Reports** accordion or the **Reports** accordion.

3.  Click on the instance of the report you want to view.
