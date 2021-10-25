The *chargeback* feature allows you to calculate monetary virtual
machine charges based on owner or company tag. To use this feature you
must be collecting capacity and utilization data. For information on
server control settings and capacity & utilization collection settings,
see [Capacity and Utilization Collection Settings](../general_configuration/index.html#capacity-and-utilization-collection).

### Creating Chargeback Rates

{{ site.data.product.title_short }} allows you to create your own set of computing and
storage costs to use for billing.

Chargeback rates can be configured at a single rate or in tiers, where
one rate is assigned to one usage range, and another rate is assigned to
a different usage range. You can also assign fixed and variable rates
per tier if desired.

1.  Navigate to menu:Overview\[Chargeback\].

2.  Click the **Rates** accordion and select **Compute** to create a CPU
    chargeback rate.

3.  Click ![1847](../images/1847.png) **(Configuration)** and
    ![1862](../images/1862.png) **(Add a new Chargeback Rate)**.

4.  Type in a **Description** for the chargeback rate.

5.  Select **Currency** and fill in the **Rate Details**.

    ![chargeback rate details](../images/chargeback-rate-details.png)

6.  Click **Add**.

### Assigning Chargeback Rates

After assigning a chargeback rate, assign it to a cloud provider.

1.  Navigate to menu:Overview\[Chargeback\].

2.  Click the **Assignments** accordion, and click either **Compute** or
    **Storage**.

3.  In the **Basic Info** area, select **Selected Cloud/Infrastrcture
    Providers**.

4.  Select the chargeback rate you created in [Creating Chargeback
    Rates](#_to_create_chargeback_rates).

5.  Click **Save**.

### Creating a Chargeback Report

{{ site.data.product.title_short }} allows you to create chargeback reports to monitor costs
you charged.

{% include chargeback-report-creation.md %}

The new report is created. To make the report accessible from the
**Report** menu, you must add it to a report menu.
