### Adding a Report

Add reports if the default reports do not include what you need or you
want to narrow the scope of a report. For example, you may want a report
that shows only Windows virtual machines.

1.  Navigate to **Overview > Reports**.

2.  Click the **Reports > All Reports** accordion.

3.  Click ![1847](../images/1847.png) **(Configuration)**, then click
    ![1862](../images/1862.png) **(Add a New Report)**.

4.  In the **Columns** tab, edit the **Basic Report Info** area.

    ![2287](../images/2287.png)

      - Type a unique name in **Menu Name** for how you want the report
        described in the menu list.

      - Type the **Title** you want displayed on the report in title.

5.  Add fields in the **Configure Report Columns** area.

    ![2288](../images/2288.png)

      - Use the **Base the report on** table dropdown to choose a table
        to get fields from.

        **Note:**

        If you change the report base or the interval, all selections
        below will be reset.

      - Select fields that you want in the report from **Available Fields**, and then click ![2289](../images/2289.png) `(Move selected fields down)`. In addition to the fields, you can also select any tags that you have created and assigned.

      - Change the order of the fields in the report by clicking
        ![2290](../images/2290.png) `(Move selected fields up)` or
        ![2289](../images/2289.png) `(Move selected fields down)`.

6.  Click on the **Consolidation** tab to consolidate and aggregate data
    points into maximum, minimum, average, and total. Specifically, this
    would be useful for analyzing performance data over a specific
    period of time.

    **Note:**

    Please note that if you do this, you will not see individual
    records, but rather the calculation as a column header.

    ![2291](../images/2291.png)

      - Select the columns to group by.

        ![2292](../images/2292.png)

      - For each numeric field selected in the report, you can click the
        dropdown under **Calculations**. Check the calculations you want
        to use.

7.  Click on the **Formatting** tab to set the size of paper for a PDF
    and column header format.

      - From the **PDF Output** area, select the page size from the
        dropdown.

        ![2293](../images/2293.png)

      - From **Specify Column Headers and Formats**, type the text you
        want displayed for each field. For each numeric field, you can
        also set the numeric format.

        ![2294](../images/2294.png)

8.  Click on the **Styling** tab to change the color of the text or the
    background for a row based on a condition.

    ![2295](../images/2295.png)

      - Use **Style** to select the format for the value. You can choose
        to change the text color or the background.

      - Use **If** to create a conditional statement for the style.

9.  Click on the **Filter** tab to set filters for the data displayed in
    the report. There are two types of filters: the first is the
    **Record Filter** which is the primary filter of the main tables
    records, the second is also a **Display Filter**, which is a
    secondary filter of rows based on the fields of the child table.
    Click ![1851](../images/1851.png) in the appropriate area to use the
    expression editor to choose the appropriate options for your
    criteria. Based on what you choose, different options will show.

      - Click **Field** to create criteria based on field values.

        ![2296](../images/2296.png)

      - Click **Count of** to create criteria based on the count of
        something, such as the number of snapshots for a virtual
        machine, or the number of virtual machines on a host.

        ![2297](../images/2297.png)

      - Click **Tag** to create criteria based on tags assigned to your
        resources. For example, you may want to check the power state of
        a virtual machine or see if it is tagged as production.

        ![2298](../images/2298.png)

      - Click **Registry** to create criteria based on registry values.
        For example, you may want to check if DCOM is enabled on a
        Windows system. (Note that this applies only to Windows
        operating systems.)

        ![2299](../images/2299.png)

      - Click **Find** to seek a particular value, and then check a
        property. For example, finding the `Admin` account and checking
        that it is enabled.

        ![2300](../images/2300.png)

      - Click ![1863](../images/1863.png) `(Commit Expression Element
        Changes)` to add the expression.

        **Note:**

        The filters that you apply will show at the bottom of the report
        so that you know which filters have been applied.

10. Click on the **Summary** tab to select sort order, sort type,
    groupings, and group calculations for the report. **Summary** groups
    rows of data based on the sort breaks. You can only sort by fields
    that display in the report.

    ![2301](../images/2301.png)

      - Set the primary sort in **Sort the Report by**.

      - Set the next sorts in **Within Above Field, Sort By**.

      - Select the type of sort, ascending or descending, in **Sort
        order**.

      - In **Show Sort breaks**, select **Yes** to show the sort breaks,
        **Counts** to show sort breaks with the count, or **No** for no
        sort breaks.

        ![2302](../images/2302.png)

      - For any numeric field, you can select to show minimum, average,
        maximum, and total in the sort break.

11. Click on the **Charts** tab to create a chart for the report. This
    is not required.

    ![chartsscreen](../images/chartsscreen.png)

      - Use **Choose a chart type** to select a type of chart. Note that
        some charts may not produce the result you are looking for based
        on the types of fields in the report and its sort order.

      - If you only want to see the top values, select the number of top
        values from **Top values to show**.

      - If you want to see the total number of values that are not
        categorized or evaluated against others, check **Sum 'Other'
        values**.

12. Click on the **Timeline** tab to select a timeline for the report.
    You must have a field of time or date format to use this feature.

    ![2304](../images/2304.png)

      - Use **Base Timeline on** to select a column in date or time
        format for the report.

      - Select a unit of time for the first band in **First band unit**.

      - Select a unit of time for the second band in **Second band
        unit**.

      - Select a unit of time for the third band in **Third band unit**.

      - Select an **Event to position at**.

      - Select the range for the event to position from **Show events
        from last**.

13. Click the **Previews** tab to see a sample of your report.

14. When you have the report that you want, click **Add** to create the
    new report.

**Note:**

After the new report is created, to make the report accessible from the
report menu, you must add it to a report menu.
