#### Configuring an External Database

Based on your setup, you will choose to configure the appliance to use
an external PostgreSQL database. For example, we can only have one
database in a single region. However, a region can be segmented into
multiple zones, such as database zone, user interface zone, and
reporting zone, where each zone provides a specific function. The
appliances in these zones must be configured to use an external
database.

The `postgresql.conf` file used with {{ site.data.product.title_short }} databases requires
specific settings for correct operation. For example, it must correctly
reclaim table space, control session timeouts, and format the PostgreSQL
server log for improved system support. It is recommended that external databases use a
`postgresql.conf` file based on the standard file used by the
{{ site.data.product.title_short }} appliance.

Ensure you configure the settings in the `postgresql.conf` to suit your
system. For example, customize the `shared_buffers` setting according to
the amount of real storage available in the external system hosting the
PostgreSQL instance. In addition, depending on the aggregate number of
appliances expected to connect to the PostgreSQL instance, it may be
necessary to alter the `max_connections` setting.

**Note:**

  - {{ site.data.product.title_short }} requires PostgreSQL version 10.

  - Because the `postgresql.conf` file controls the operation of all
    databases managed by a single instance of PostgreSQL, do not mix
    {{ site.data.product.title_short }} databases with other types of databases in a single
    PostgreSQL instance.

1.  Start the appliance and open a terminal console.

2.  Enter the `appliance_console` command. The {{ site.data.product.title_short }} appliance
    summary screen displays.

3.  Press **Enter** to manually configure settings.

4.  Select **Configure Application** from the menu.

5.  Choose **Create Region in External Database** for the database location.

6.  Enter the database hostname or IP address when prompted.

7.  Enter the database name or leave blank for the default
    (`vmdb_production`).

8.  Enter the database username or leave blank for the default (`root`).

9. Enter the chosen database user’s password.

10. Confirm the configuration if prompted.

{{ site.data.product.title_short }} will then configure the external database.
