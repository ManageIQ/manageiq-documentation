## Updating a Highly Available {{ site.data.product.title_short }} Environment

Applying software package minor updates (referred to as *errata*) to
appliances in a high availability environment must be performed in a
specific order to avoid migrating your databases to the next major
{{ site.data.product.title_short }} version.

**Prerequisites.**

Ensure each appliance is registered to Red Hat Subscription Manager and
subscribed to the update channels required by {{ site.data.product.title_short }} in
order to access updates.

To verify if your appliance is registered and subscribed to the correct
update channels, run:

    # yum repolist

Appliances must be subscribed to the following channels:

  - {product-repo\_cfme}

  - {product-repo\_ansible}

  - {product-repo\_extras}

  - {product-repo\_optional}

  - {product-repo\_server}

If any appliance shows it is not registered or is missing a subscription
to any of these channels, see *Registering and Updating {{ site.data.product.title }}*
in [General
Configuration](https://access.redhat.com/documentation/en-us/red_hat_cloudforms/4.5/html-single/general_configuration/)
to register and subscribe the appliance.

**Updating the Appliances.**

Follow this procedure to update appliances in your environment without
migrating the database to the next major version of
{{ site.data.product.title_short }}. Note the appliance to perform each step on: some
steps are to be performed only on the database-only appliances, and
other steps only on the non-database {{ site.data.product.title_short }} appliances,
while some steps apply to all appliances.

1.  Power off the non-database {{ site.data.product.title_short }} appliances.

2.  Power off the database-only appliances.

3.  Back up each appliance:

    1.  Back up the database of your appliance. Take a snapshot if
        possible.

    2.  Back up the following files for disaster recovery, noting which
        appliance each comes from:

          - `/var/www/miq/vmdb/GUID`

          - `/var/www/miq/vmdb/REGION`

    3.  Note the hostnames and IP addresses of each appliance. This
        information is available on the summary screen of the appliance
        console.

4.  Start each database-only appliance.

5.  Start each non-database {{ site.data.product.title_short }} appliance again, and
    stop `evmserverd` on each just after boot:

        # systemctl stop evmserverd

6.  Apply updates by running the following on each appliance:

        # yum update

7.  On one of the non-database {{ site.data.product.title_short }} appliances, apply
    any database schema updates included in the errata, and reset the
    Red Hat and ManageIQ automation domains:

        # vmdb
        # rake db:migrate
        # rake evm:automate:reset

8.  Power off the non-database {{ site.data.product.title_short }} appliances.

9.  Reboot the database-only appliances.

10. Wait five minutes, then start the non-database
    {{ site.data.product.title_short }} appliances again.

The appliances in your high availability environment are now up to date.
