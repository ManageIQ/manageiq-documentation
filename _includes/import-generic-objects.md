Procedure

1.  ssh to the {{ site.data.product.title_short }} appliance as `root`.

2.  Browse to `/var/www/miq/vmdb`:

        # cd /var/www/miq/vmdb

3.  Create a temporary directory to store the generic object
    definitions:

        # mkdir tmp/generic_object_definitions

4.  Copy the yaml file containing the generic object definitions to the
    temporary folder:

        # cp generic_objects.yaml tmp/generic_object_definitions

5.  Import the generic object definitions to the {{ site.data.product.title_short }}
    appliance using the following `bin/rake` command:

        # bin/rake evm:import:generic_object_definitions -- --source tmp/generic_object_definitions
