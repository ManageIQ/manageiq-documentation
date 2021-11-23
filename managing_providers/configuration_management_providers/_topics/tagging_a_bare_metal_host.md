# Tagging a Bare Metal Host

{{ site.data.product.title_short }} can also control policy settings of bare metal systems
from Red Hat Satellite 6 through tagging. Tagging attaches levels of
metadata to help define the policy rules required for a set of systems.

1.  Navigate to menu:Configuration\[Management\].

2.  Select **Configured Systems** from the accordion menu on the left.
    This displays the system list.

3.  Select one or more hosts to tag.

4.  Select menu:Policy\[Edit Tags\].

5.  Under **Tag Assignment**, select a tag from **Select a customer tag
    to assign** and then choose a value from **Select a value to
    assign**. For example, you can tag this system as located in Chicago
    by selecting `Location` as the tag and `Chicago` as the value. Once
    selected, the user interface automatically adds this tag and value
    to the table below.

6.  Click **Save**.

The bare metal system is now configured with a set of policy tags.
