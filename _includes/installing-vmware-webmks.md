## Installing VMware WebMKS on appliances

VMware vSphere Virtual Machine Remote console access requires the installation of the VMware WebMKS SDK.
Due to license restrictions this SDK cannot be built in to {{ site.data.product.title_short }}

1.  Log in to the {{ site.data.product.title_short }} user interface appliance
    console as the root user.

2.  On the {{ site.data.product.title_short }} user interface appliances, create a
    folder titled `webmks` in the `/var/www/miq/vmdb/public/` directory.

        /var/www/miq/vmdb/public/webmks

3.  Download and extract the contents of [VMware WebMKS
    SDK](https://www.vmware.com/support/developer/html-console/) into
    the `webmks` folder.
