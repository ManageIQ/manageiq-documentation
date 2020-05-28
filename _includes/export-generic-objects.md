Procedure

1.  ssh to the {{ site.data.product.title_short }} appliance as `root`.

2.  Navigate to `/var/www/miq/vmdb`:

        # cd /var/www/miq/vmdb

3.  Create a temporary directory to store the generic object
    definitions:

        # mkdir tmp/generic_object_definitions

4.  Export the generic object definitions using the following `bin/rake`
    command:

        # bin/rake evm:export:generic_object_definitions -- --directory tmp/generic_object_definitions
