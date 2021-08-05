## Configuring Image Scanning

{{ site.data.product.title_short }} manages vulnerability scanning of container images. When an
OpenShift provider is added, OpenShift images from the internal registry are discovered. To enable
image scanning, perform the following configuration steps:

1.  Browse to menu: **Compute > Containers > Providers**.

2.  Select the checkboxes of the OpenShift providers on which to enable scanning.

3.  From the **Policy** pull-down menu, click **Manage Policies**.

4.  Select the **OpenSCAP profile** checkbox.

5.  Click **Save**.

This action will trigger a SmartState analysis, or scan, of all images referenced by the OpenShift
provider. The initial scan may take several hours to complete, depending on the number and size of
images. The scan occurs in the OpenShift provider, which {{ site.data.product.title_short }}
receives and records in the database. OpenShift limits the number of scanning
pods; only three images can be scanned simultaneously.

## Scheduling A Recurring Scan

Software vulnerability databases are updated frequently. To apply these updates, a rescan is
required. To schedule a recurring scan of container images:

![:schedule openscap scan](../images/:schedule_openscap_scan.png)

1.  Click **Configuration**.

2.  From menu: **Settings > Zones** in the left pane of the appliance, select **Schedules**.

3.  From the drop-down menu, click menu: **Configuration > Add a new Schedule**.

4.  Type an arbitrary **Name**.

5.  Type an arbitrary **Description**.

6.  Ensure the **Active** checkbox is selected.

7.  In **Action**, select **Container Image Analysis**.

8.  In **Filter**, select **All Container Images for Containers Provider**, **OpenShift**.

9.  In **Run**, set the schedule as desired.

10. Set the **Time Zone**, **Starting Date**, and **Starting Time**.

11. Click **Add**.

## Working with Images

### Viewing Results

Image scanning results are displayed in each image summary page.

1.  Select menu: **Compute > Containers > Container Images**.

2.  Click the desired image.

For an OpenSCAP HTML report, locate the **Configuration** section and
select **OpenSCAP HTML**.

![:container configuration](../images/:container_configuration.png)

For compliance and scanning history information, locate the **Compliance** section and note the
**Status** field or select **Available** from the **History** field.

![:container scan history](../images/:container_scan_history.png)

### Manual Scanning

SmartState analysis scanning may be initiated manually for images. From an image summary page,
select menu: **Configuration > Perform SmartState Analysis**. Refreshing the image page will
reflect the latest scan results and compliance history.

### Evaluating Compliance

If the image scan policy has been updated since the last scan, compliance conditions may be
re-evaluated. From an image summary page, select menu:
**Policy > Check Compliance of Last Known Configuration**.
Refreshing the image page will reflect the latest compliance history.

### Generating a Report on Images

{% include openscap/generating-openscap-report-failed-images.md %}

## OpenSCAP Policy Profile

{{ site.data.product.title_short }} is pre-configured with a default scanning policy profile. This
includes conditions to scan and identify compliance, as well as annotate compliance failure.
SmartState analysis is performed when new images are added to OpenShift.

### Customizing the Scanning Policy Profile

{% include openscap/creating-custom-openscap-policy-profile.md %}

## Controlling OpenShift Pod Execution

Through the default policy profile, non-compliant images receive the control policy action
**Mark as Non-Compliant**. This action annotates the **image** object (not to be confused with the
**imagestream** object) with *images.openshift.io/deny-execution=true*. This annotation
may be used to prevent nodes from running non-compliant images.

## Reference

More information about OpenSCAP, see visit the [OpenSCAP web site](https://www.open-scap.org/).
