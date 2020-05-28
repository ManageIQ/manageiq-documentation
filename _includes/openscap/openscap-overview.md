OpenSCAP is an auditing tool used for hardening the security of your
enterprise. This tool is built upon the knowledge and resources provided
by the many experienced security experts active in the upstream OpenSCAP
ecosystem. For more information about OpenSCAP, see
<https://www.open-scap.org/>.

{{ site.data.product.title }} supports OpenSCAP. It provides a built-in OpenSCAP
policy profile for managing the security of your container images. These
policies ensure that new container images from any provider within
{{ site.data.product.title_short }} are scanned against the latest Common
Vulnerabilities and Exposures (CVE) content distributed by Red Hat.

<div class="note">

  - See Red Hat’s [Security
    Data](https://www.redhat.com/security/data/metrics/) page for more
    details about this content. In particular, the SCAP source data
    stream files index provides examples of security advisories used by
    the built-in OpenSCAP policy profile. Each of these security
    advisories have a severity ranging from low to critical. With the
    built-in OpenSCAP policy profile, any image that fails a security
    check against an advisory with at least a high severity is marked as
    non-compliant.

  - For more information about control and compliance policies, and
    creating and assigning policy profiles in {{ site.data.product.title_short }},
    see the [Policies and Profiles
    Guide](https://access.redhat.com/documentation/en-us/red_hat_cloudforms/4.7/html-single/policies_and_profiles_guide/).

</div>

{{ site.data.product.title_short }} can initiate scanning of container images in the
following ways:

  - Manual scanning of images via SmartState analysis.

  - Scheduled scanning of images using the OpenSCAP policy profile.

  - Scanning new images in the registry when an OpenShift Container
    Platform provider is added.

<div class="important">

For image scanning to work, make sure your {{ site.data.product.title_short }}
appliance has the **SmartProxy** and **SmartState Analysis** roles
enabled:

1.  From the Settings menu, navigate to menu:Configuration\[Server\].

2.  Under Server Control, ensure **SmartState Analysis** and
    **SmartProxy** roles are enabled.

</div>
