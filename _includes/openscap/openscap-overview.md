OpenSCAP is an auditing tool that is used for hardening the security of your enterprise. This tool is built upon the knowledge and resources that are provided by the many experienced security experts active in the upstream OpenSCAP ecosystem. For more information about OpenSCAP, see <https://www.open-scap.org/>.

{{ site.data.product.title_short }} supports OpenSCAP. It provides a built-in OpenSCAP policy profile for managing the security of your container images. These policies ensure that new container images from any provider within {{ site.data.product.title_short }} are scanned against the latest Common Vulnerabilities and Exposures (CVE) content that is distributed by Red Hat.

**Note**:

  - See Red Hat’s [Security Data](https://www.redhat.com/security/data/metrics/) page for more details about this content. In particular, the SCAP source data stream files index provides examples of security advisories that are used by the built-in OpenSCAP policy profile. Each of these security advisories has a severity that ranges from low to critical. With the built-in OpenSCAP policy profile, any image that fails a security check against an advisory with at least a high severity is marked as non-compliant.

  - For more information about control and compliance policies, and creating and assigning policy profiles in {{ site.data.product.title_short }}, see the [Policies and Profiles Guide](../policies_and_profiles_guide/index.html).


{{ site.data.product.title_short }} can initiate scanning of container images in the following ways:

  - Manual scanning of images by using SmartState analysis.

  - Scheduled scanning of images by using the OpenSCAP policy profile.

  - Scanning new images in the registry when an OpenShift Container Platform provider is added.

**Important**:

For image scanning to work, make sure that your {{ site.data.product.title_short }} appliance has the **SmartProxy** and **SmartState Analysis** roles enabled:

1. From the Settings menu, browse to menu: **Configuration > Server**.

2. Under Server Control, ensure **SmartState Analysis** and **SmartProxy** roles are enabled.
