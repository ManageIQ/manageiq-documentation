## Configuring {{ site.data.product.title_short }}

After installing {{ site.data.product.title_short }} and running it for the first
time, you must perform some basic configuration. You must complete these steps:

1.  Add a disk to the infrastructure that is hosting your appliance.

2.  Configure the database.

3.  Configure messaging

Configure the appliance by using the internal appliance console.

### Accessing the Appliance Console

1.  Start the appliance and open a terminal console.

2.  Enter the `appliance_console` command. The {{ site.data.product.title_short }} appliance
    summary screen displays.

3.  Press `Enter` to manually configure settings.

4.  Press the number for the item you want to change, and press `Enter`.
    The options for your selection are displayed.

5.  Follow the prompts to make the changes.

6.  Press `Enter` to accept a setting where applicable.

**Note:**

The {{ site.data.product.title_short }} appliance console automatically logs out
after five minutes of inactivity.

### Configuring a Database

{% include configuration-db.md %}

### Configure Messaging

Configuring messaging is required for appliance setup. It is recommended to configure the broker on the same appliance where your database is configured

**Note:** You can only have one kafka broker per region

1. You can either configure the current appliance as a kafka broker, or point the
   appliance to an existing external kafka broker.

   Select the appropriate option either
   **Configure this appliance as a messaging server** or
   **Connect to an external messaging system**
   to connect to an external kafka broker.  You will be asked to fill in the
   required **Message Client Parameters** like IP address and username/password.

2. Select **Proceed** and appliance_console will apply the configuration that you have
   requested then restart evmserverd to pick up the changes.

**Note:** It is recommended to use your internal Fully Qualified Domain Name (FQDN) as the messaging hostname rather than `localhost`

### Configuring a Worker Appliance

You can use multiple appliances to facilitate horizontal scaling, as
well as for dividing up work by roles. Accordingly, configure an
appliance to handle work for one or many roles, with workers within the
appliance carrying out the duties for which they are configured. You can
configure a worker appliance through the terminal. The following steps
demonstrate how to join a worker appliance to an appliance that already
has a region configured with a database and messaging.

1.  Start the appliance and open a terminal console.

2.  Enter the `appliance_console` command. The {{ site.data.product.title_short }} appliance
    summary screen displays.

3.  Press **Enter** to manually configure settings.

4.  Select **Configure Application** from the menu.

5.  You are prompted to create or fetch a security key. Since this is
    not the first {{ site.data.product.title_short }} appliance, choose **2) Fetch key from
    remote machine**. For worker and multi-region setups, use this
    option to copy the security key from another appliance.

    **Note:**

    All {{ site.data.product.title_short }} appliances in a multi-region deployment
    must use the same key.

6.  Choose **Join Region in External Database** for the database location.

7.  Enter the database hostname or IP address when prompted.

8.  Enter the port number or leave blank for the default (`5432`).

9.  Enter the database name or leave blank for the default
    (`vmdb_production`).

10. Enter the database username or leave blank for the default (`root`).

11. Enter the chosen database user’s password.

12. Confirm the configuration if prompted.

13. Choose **Connect to an external messaging system** to connect to the external kafka broker located on the appliance with the external database

    **Note:** You can only have one kafka broker per region

14. Enter the necessary **Message Client Parameters** such as the hostname/IP and username/password

15. Confirm the configuration if prompted.
