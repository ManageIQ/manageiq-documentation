### Scheduling a Report

You can view historical data by creating reports on a scheduled basis.
In addition, scheduled reports can be emailed directly to users.

<div class="note">

You may need to disable, change the report filter, or change the
frequency of a schedule. To do this, you will need to edit the schedule.

</div>

There are two ways to schedule a report:

Add a new Schedule through the **Reports** accordion:

1.  Navigate to menu:Overview\[Reports\].

2.  Select a report from the **Reports** accordion and click
    ![1847](../images/1847.png) **Configuration**.

3.  Click ![1862](../images/1862.png) **Add a New Schedule** or click the
    Schedules accordion and click ![1847](../images/1847.png)
    **Configuration** \> ![1862](../images/1862.png) **Add a New
    Schedule**.

or

Add a new Schedule through the **Schedules** accordion:

1.  Navigate to menu:Overview\[Reports\].

2.  Click the **Schedules** accordion.

3.  Click ![1847](../images/1847.png) **Configuration**.

4.  Click ![1862](../images/1862.png) **Add a New Schedule**.

Adding new Schedule details.

1.  In the **Basic Information** area, type in a **Name** and
    **Description** for the schedule.

      - By default, **Active** is checked to enable the scan.

2.  The **Report Selection** area is pre-populated if you added the
    schedule directly from the report. If you are adding from the
    schedule according, use the **Filter** drop downs to select the
    report that you want to schedule.

3.  In the **Timer** area, click the **Run** drop down to specify how
    often you want the analysis to run. Your options after that will
    depend on which run option you choose.

      - Click **Once** to have the analysis run just one time.

      - Click **Daily** to run the analysis on a daily basis. You will
        be prompted to select how many days you want between each
        analysis.

      - Click **Hourly** to run the analysis hourly. You will be
        prompted to select how many hours you want between each
        analysis.

      - Type or select a date to begin the schedule in **Starting
        Date**.

      - Select a **Starting Time** based on a 24 hour clock in the
        {{ site.data.product.title }} appliance’s Time Zone.

4.  Use the **E-Mail after Running** feature to send an email after the
    report has been generated to selected users. The email will include
    a link to the report.

      - Check **Send an E-mail**.

      - In **From (leave blank for default)**, type in the sending
        email.

      - Use **Add a User**, to select a specific user. The user must
        have a valid email address entered under accounts.

      - Use **Add (enter manually)** to type in the address not
        registered to a User.

      - Then, click ![1862](../images/1862.png) **(Add)**.

5.  If you are sending an email after the report runs, then you can
    select further options under Email Options.

      - Check **Send if Report is Empty** if you want an email even if
        no records exist in the report.

      - Next to Attachments, check if you would like the report attached
        as a **Text**, **CSV**, or **PDF** file.

6.  Click **Add**.

<div class="note">

See
<https://www.manageiq.org/docs/reference/latest/general_configuration/index.html#outgoing-smtp-email-settings>
in the *General Configuration* guide, to learn how to verify the address
and validate outgoing email settings.

</div>
