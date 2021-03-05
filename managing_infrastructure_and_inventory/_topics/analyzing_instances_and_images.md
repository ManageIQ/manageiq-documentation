# Analyzing Instances and Images with SmartState Analysis

Analyze an instance to collect metadata such as user accounts,
applications, software patches, and other internal information. If
{{ site.data.product.title_short }} is not set up for automatic analysis, perform a manual
analysis of an instance. To perform a SmartState Analysis,
{{ site.data.product.title_short }} requires a running SmartProxy with visibility to the
instance’s storage location so that a snapshot can be created.

1.  Navigate to menu:Compute\[Clouds \> Instances\].

2.  Click the accordion for the items to analyze.

3.  Check the instances and images to analyze.

4.  Click ![1847](../images/1847.png) (**Configuration**), and then
    ![1942](../images/1942.png) (**Perform SmartState Analysis**) on the
    taskbar.

5.  Click **OK**.

**Note:**

## Restrictions on Displaying Files Collected

  - File size bigger than 20k characters

  - File with missing name

  - Non MIME .conf file, with non ascii characters

  - Non MIME .conf file, without content

  - MIME .exe binary file

<!-- end list -->

  - MIME .txt non binary file

  - Non MIME .conf ascii file

<div class="important">

SmartState Analysis for instances runs as a process independent from
providers. For example, a successful SmartState Analysis of a host does
not mean SmartState Analysis for instances will be successful. Ensure to
enter credentials for the provider that contains the instance for the
SmartState Analysis to work.

</div>
