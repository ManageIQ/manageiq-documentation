### Exporting and Importing Analysis Profiles

{{ site.data.product.title_short }} SmartState analysis requires an analysis profile to select the files to be scanned by a compliance policy. {{ site.data.product.title_short }} allows the export and import of SmartState analysis profiles by using the command line and rake commands. As a result, approved configurations can be easily imported into customer environments, without having to manually recreate the profile through the user interface.

1. Change to the `vmdb` directory:

        cd /var/www/miq/vmdb

2. Create an export directory:

        $ mkdir exports

3. To export an analysis profile, run:

        bundle exec rake evm:export:scan_profiles -- --directory exports

4. To import the default analysis profile, run:

        bundle exec rake evm:import:scan_profiles -- --source exports/host_default.yaml

    <div class="note">

    If the default profile exists in {{ site.data.product.title_short }}, the new profile does not overwrite the old profile. Instead, it duplicates the file items in the default profile.

    </div>
