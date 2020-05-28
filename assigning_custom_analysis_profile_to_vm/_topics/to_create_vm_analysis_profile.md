## Creating a Virtual Machine Analysis Profile

1.  Log into the appliance as the **admin** user.

2.  Click **Configuration**.

3.  Expand the **Settings** accordion, then click **Analysis Profiles**.

4.  Click ![image](/images/1847.png) (**Configuration**), then
    ![image](/images/1862.png) (**Add VM Analysis Profile**).

5.  In **Basic Information**, enter **Name** and **Description** for the
    analysis profile.

6.  In the **Category** tab, select the categories you want to collect
    information for under **Category Selection**. The **Category** tab
    is available for virtual machine profiles only.

7.  In the **File** tab, click **\<New Entry\>** and specify the file to
    be scanned and if you want to collect contents for, then click
    **Save**. Repeat the step for adding multiple file name entries.

8.  In the **Registry** tab, enter the **Registry Key** and **Registry
    Value**, then click **Save**. To determine whether a registry key
    exists without providing a value, enter `  ` in \*Registry
    Value\</emphasis\>. The **Registry** tab is available for virtual
    machine profiles only.

9.  In the **Event Log** tab, specify the event log entries to collect.
    Enter a **Filter Message** to look for specific text in a message.
    Enter a **Level** (*info*, *warn* or *error*, for example) to
    specify the event level. Enter the **Source** for the event log
    entry and **\# (Number) of Days** to specify how far back to check.

10. Click **Add**.
