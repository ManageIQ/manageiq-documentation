### Creating Chargeback Rates

{{ site.data.product.title_short }} allows you to create your own set of computing and
storage costs to use for billing.

Chargeback rates can be configured at a single rate or in tiers, where
one rate is assigned to one usage range, and another rate is assigned to
a different usage range. You can also assign fixed and variable rates
per tier if desired.

There are three methods to create a chargeback rate: editing or copying
an existing rate, or creating a new rate.

#### Editing a Chargeback Rate

1.  Browse to menu: **Overview > Chargeback**.

2.  Click the **Rates** accordion and select an existing rate from under
    **Compute** or **Storage**.

3.  Click **Configuration** and
    ![1851](../images/1851.png) (**Edit this Chargeback Rate**).

4.  Edit the rate as desired.

5.  Click **Save** at the bottom of the screen to save the chargeback
    rate.

#### Copying a Chargeback Rate

1.  Browse to menu: **Overview > Chargeback**.

2.  Click the **Rates** accordion and select an existing rate from under
    **Compute** or **Storage**.

3.  Click **Configuration** and
    ![1859](../images/1859.png) (**Copy this Chargeback Rate**).

4.  Edit the rate as desired.

5.  Click **Add** at the bottom of the screen to save the chargeback
    rate.

#### Adding a Chargeback Rate

The following example shows a scenario to create a new chargeback rate
for allocated CPU usage in Euro per week measured by the following
tiers, calculating both fixed and variable costs:

  - Tier 1: 0-2 CPU = 1 Euro fixed + 0.5 Euro variable

  - Tier 2: 2-4 CPU = 0.8 Euro fixed + 0.4 Euro variable

  - Tier 3: 4 CPU and above = 0.6 Euro fixed + 0.2 Euro variable

To configure this rate:

1.  Browse to menu: **Overview > Chargeback**.

2.  Click the **Rates** accordion and select **Compute** to create a CPU
    chargeback rate.

    1.  Click **Configuration** and
        ![1862](../images/1862.png) (**Add a new Chargeback Rate**).

3.  Type in a **Description** for the chargeback rate.

4.  Select **Euro** for currency.

5.  In **Rate Details**, select the time, and fill in the range and
    rates for each tier. Alternatively, a single chargeback rate can be
    configured by using only one tier. For this example, in **Allocated
    CPU Count**, configure:

    1.  For tier 1, set:

        1.  In **Per Time**, select **Hourly**.

        2.  In **Range**, specify the CPU range: **Start** remains as
            `0.0` and **Finish** is `2`.

        3.  In **Rate**, specify `1` for the **Fixed** rate, and `0.5`
            for the **Variable** rate.

        4.  Click **Add** under **Actions** to create a new, blank
            **Allocated CPU Count** line for tier 2.

    2.  For tier 2, set:

        1.  In the new line in **Range**, specify the CPU range:
            **Start** is `2` and **Finish** is `4`.

        2.  In **Rate**, specify `0.8` for the **Fixed** rate, and `0.4`
            for the **Variable** rate.

        3.  Click **Add** under **Actions** to create another new, blank
            **Allocated CPU Count** line for tier 3.

    3.  For tier 3, set:

        1.  In the new line in **Range**, specify the CPU range:
            **Start** is `4` and leave **Finish** as `Infinity`.

        2.  In **Rate**, specify `0.6` for the **Fixed** rate, and `0.2`
            for **Variable**.

            ![tiered chargeback](../images/tiered_chargeback.png)

6.  Click **Add** at the bottom of the screen to save the chargeback
    rate.

The rate can now be assigned.
