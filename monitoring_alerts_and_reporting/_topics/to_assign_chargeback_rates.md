### Assigning Chargeback Rates

{{ site.data.product.title_short }} allows you to assign chargeback rates by choosing from
**Compute** and **Storage**. You can assign either a custom chargeback
rate, or a default rate for Compute, Storage, or Container Images.

**Note:**

The **Default Container Image Rate** can be useful when applied to a
containers provider with multiple images, where only some of the images
have a chargeback rate assigned; the images without a custom rate will
then use the default rate.

1.  Navigate to menu:Overview\[Chargeback\].

2.  Click the **Assignments** accordion, and click either **Compute** or
    **Storage**.

#### Configuring Chargeback for Compute

Use **Compute** to assign a compute chargeback rate. You can assign
chargeback rates to **The Enterprise**, **Selected Cloud/Infrastructure
Providers**, **Selected Clusters/Deployment Roles**, **Selected
Containers Providers**, **Tagged VMs and Instances**, **Tagged Images**,
**Labeled Images**, or **Tenants**.

1.  From the **Basic Info** area, use the **Assign To** list to select a
    type of assignee to assign the rate set to.

2.  For **Tagged VMs and Instances** and **Tagged Images** select a
    **Tag Category**.

3.  For each item to set, select the chargeback rate to use. The options
    displayed vary based on the type you select.

4.  Click **Save**.

#### Configuring Chargeback for Storage

Use **Storage** to assign a storage chargeback rate. You can assign
chargeback rates to **The Enterprise**, **Selected Datastores**,
**Tagged Datastores**, or **Tenants**.

1.  From the **Basic Info** area, use the **Assign To** list to select a
    type of assignee to assign the rate set to.

2.  For **Tagged Datastores** select a **Tag Category**.

3.  For each item to set, select the chargeback rate to use. The options
    displayed vary based on the type you select.

4.  Click **Save**.

The rate is assigned. The next time you generate a chargeback report,
these values will be used.

**Note:**

When viewing chargeback, there is a rate for a virtual machine for the
number of the CPUs. The chargeback for this parameter is calculated
based on when the virtual machine is running. If the virtual machine is
not running, then it is not charged for CPU allocation.

