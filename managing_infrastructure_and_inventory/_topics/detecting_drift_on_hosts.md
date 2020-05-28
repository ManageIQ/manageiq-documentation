# Detecting Drift on Hosts

Over time, the configuration of a host might change. Drift is the
comparison of a host to itself at different points in time. The host
requires analysis at least twice to collect information. Detecting drift
provides you the following benefits:

  - See the difference between the last known state of a host and its
    current state.

  - Review the configuration changes that happen to a particular host
    between multiple points in time.

  - Capture the configuration drifts for a single host across a time
    period.

Detect drift on hosts:

1.  Navigate to menu:Compute\[Infrastructure \> Hosts\].

2.  Click on the host to view drift.

3.  Click **Relationships** in the host accordion.

4.  Click **Drift History**.

5.  Check the analyses to compare.

6.  Click ![1946](/images/1946.png) (**Drift**) at the top of the
    screen. The results display.

7.  Check the **Comparison** sections on the left to view in your
    comparison.

8.  Click **Apply**.

9.  Click the plus sign next to the sections name to expand it.

      - An item displayed on red text shows a change from the base
        analysis. An item displayed in black text shows no change from
        the base analysis.

      - A ![2177](/images/2177.png) (**Changed from previous**) shows a
        change since the last analysis.

      - A ![2150](/images/2150.png) (**Same as previous**) means no
        change since the last analysis.

      - Click ![1861](/images/1861.png) (**Remove from drift**) at the
        bottom of a column to remove a specific analysis. The drift
        recalculates and the new results display.

10. Click ![2023](/images/2023.png) (**Expanded View**) to see the
    expanded view. Click ![2024](/images/2024.png) (**Compressed View**)
    to compress the information.

11. Click the minus sign next to the sections name to collapse it.

12. To limit the type of views, you have three buttons in the taskbar:

      - Click ![2178](/images/2178.png) (**All attributes**) to see all
        attributes of the sections you selected.

      - Click ![2204](/images/2204.png) (**Attributes with different
        values**) to see only the attributes that are different across
        the drifts.

      - Click ![2148](/images/2148.png) (**Attributes with the same
        values**) to see only the attributes that are the same across
        drifts.

The drift comparison displays. Download the data or create a report from
your drift for analysis using external tools.
