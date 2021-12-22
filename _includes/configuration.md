## Configuring {{ site.data.product.title_short }}

After you install {{ site.data.product.title_short }} and run it for the first time, you must perform some basic configuration. To configure {{ site.data.product.title_short }}, you must complete these steps:

- Add a disk to the infrastructure that is hosting your appliance.

Configure the {{ site.data.product.title_short }} appliance by using the internal appliance console.

### Accessing the Appliance Console

1. Start the appliance and open a terminal console.

2. Enter the `appliance_console` command. The {{ site.data.product.title_short }} appliance summary screen displays.

3. Press `Enter` to manually configure settings.

4. Press the number for the item you want to change, and press `Enter`. The options for your selection are displayed.

5. Follow the prompts to make the changes.

6. Press `Enter` to accept a setting where applicable.

**Note:**

The {{ site.data.product.title_short }} appliance console automatically logs out after 5 minutes of inactivity.

### Configuring a Worker Appliance

You can use multiple appliances to facilitate horizontal scaling, and also for dividing up work by roles. Configure an appliance to handle work for one or many roles, with workers within the appliance that are carrying out the duties for which they are configured. You can configure a worker appliance through the terminal. The following steps demonstrate how to join a worker appliance to an appliance that already has a region that is configured with a database.

1. Start the appliance and open a terminal console.

2. Enter the `appliance_console` command. The {{ site.data.product.title_short }} appliance summary screen displays.

3. Press **Enter** to manually configure settings.

4. Select **Configure Application** from the menu.

5. You are prompted to create or fetch a security key. Since this is not the first {{ site.data.product.title_short }} appliance, choose **2) Fetch key from
    remote machine**. For worker and multi-region setups, use this option to copy the security key from another appliance.

    **Note:**

    All {{ site.data.product.title_short }} appliances in a multi-region deployment must use the same key.

6.  Choose **Join Region in External Database** for the database location.

7.  Enter the database hostname or IP address when prompted.

8.  Enter the port number or leave blank for the default (`5432`).

9.  Enter the database name or leave blank for the default
    (`vmdb_production`).

10. Enter the database username or leave blank for the default (`root`).

11. Enter the chosen database user’s password.

12. Confirm the configuration if prompted.
