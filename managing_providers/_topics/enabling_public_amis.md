# Enabling Public AMIs from Amazon EC2

By default, public AMIs from an Amazon EC2 provider are not viewable in
{{ site.data.product.title }}. To make these images viewable, you must edit the main
configuration file for the appliance.

<div class="note">

Syncing all public images may require additional memory resources. Also,
bear in mind that syncing happens in each configured Amazon EC2
provider, which will require a similar amount of total memory resources.

</div>

1.  Navigate to the settings menu, then menu:Configuration\[Zone \>
    Advanced\].

2.  Select the configuration file to edit from the **File** list. If not
    already automatically selected, select **EVM Server Main
    Configuration**.

3.  Set the **get\_public\_images** parameter:

    1.  Set the parameter to **get\_public\_images: true** to make
        public images viewable.

    2.  Set the parameter to **get\_public\_images: false** to make
        public images not viewable.

4.  Optionally, configure an array of filters in
    **public\_images\_filters** to restrict which images are synced. See
    <http://docs.aws.amazon.com/sdkforruby/api/Aws/EC2/Client.html#describe_images-instance_method>
    for more details.
