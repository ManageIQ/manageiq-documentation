### Importing a Domain from a Git Repository

{{ site.data.product.title_short }} can import an Automate domain from a Git repository by
specifying a repository and branch, along with user details. Currently,
you can only add git domains via the **Import/Export** area of the user
interface.

![Import Datastore](../images/import-datastore.png)

1.  Navigate to menu:Automation\[Automate \> Import/Export\].

2.  In **Import Datastore via git**, enter the **Git URL**. Select the
    branch or tag to use.

3.  Optionally, enter a **Username** and **Password**.

4.  Select **Verify Peer Certificate** if desired.

5.  Click **Submit**.

The new domain is imported via Git repository. Note that the domain is
validated on import.
