### Applying SCAP Standards

The Security Content Automation Protocol (SCAP) is a set of standards to
assist with vulnerability management and policy compliance.
{{ site.data.product.title }} provides a set of SCAP standards to apply to your
appliance. View these SCAP rules in the
`/var/www/miq/vmdb/productization/appliance_console/config/scap_rules.yml`
file.

To apply the SCAP standards to your appliance’s server:

1.  Log in to the appliance as the `root` user.

2.  Enter the `appliance_console` command. The {{ site.data.product.title }} Appliance
    summary screen displays.

3.  Press `Enter` to manually configure settings.

4.  Select `Harden Appliance Using SCAP Configuration`.

5.  The appliance console displays the following:

        Harden Appliance Using SCAP Configuration

        Locking down the appliance for SCAP...

    The appliance applies the SCAP settings from the `scap_rules.yml`
    file.

6.  When complete, press any key to return to the summary screen.

The appliance now meets the SCAP standards set in the `scap_rules.yml`
file.
