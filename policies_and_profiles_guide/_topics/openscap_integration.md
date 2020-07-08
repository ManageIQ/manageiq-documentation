OpenSCAP is an auditing tool that is used for hardening the security of your enterprise. This tool is built upon the knowledge and resources that are provided by the many experienced security experts active in the upstream OpenSCAP ecosystem. For more information about OpenSCAP, see <https://www.open-scap.org/>.

{{ site.data.product.title }} now supports OpenSCAP. By default, {{ site.data.product.title }} provides a built-in *OpenSCAP policy profile*, which provides policies for managing the security of your *container images*.

These policies ensure that new container images from any provider within {{ site.data.product.title }} are scanned against the latest CVE content from Red Hat. For more information, see Red Hat’s [Security Data](https://www.redhat.com/security/data/metrics/) page about this content. In particular, the [SCAP source data stream files index](https://www.redhat.com/security/data/metrics/ds) provides examples of security advisories that are used by the built-in OpenSCAP policy profile.

Each of these security advisories has a severity ranging from **Low** to **Critical**. With the built-in OpenSCAP policy profile, any image that fails a security check against an advisory with at least a **High** severity is marked as non-compliant.

The built-in OpenSCAP policy profile cannot be edited. However, you can edit copies of its policies and assign those copies to a new profile. For more information, see [Creating a Customized OpenSCAP Policy Profile](#openscap-custom) for more information.

#### Assigning the Built-In OpenSCAP Policy Profile

The OpenSCAP policy profile included with {{ site.data.product.title }} is not automatically assigned. You still need to assign it to a container provider. The method for doing so is similar to that of any normal policy profile. For more information, see [Assigning Policy Profiles](#assigning-policy-profiles).

1. Browse to menu: **Compute > Containers > Providers**, check the providers that you need to assign the OpenSCAP policy profile to.

2. Click ![image](../images/1941.png)**Policy**, and then click ![image](../images/1851.png)**Manage Policies**.

3. From the **Select Policy Profiles** area, click the triangle next to **OpenSCAP profile** to expand it and see its member policies.

4. Check **OpenSCAP profile**. It turns blue to show that its assignment state changed.

5. Click **Save**.

#### Scheduling an OpenSCAP Compliance Check on Container Images

Once you assign the built-in OpenSCAP policy profile to a container provider, you can schedule a compliance check against the policy profile. The method for doing is similar to that of scheduling a normal compliance check ([Scheduling a Compliance Check](#scheduling-a-compliance-check)):

{% include_relative _topics/steps_schedule-compliance-check.md %}

1. From the **Action** dropdown, select **Container Image Analysis**.

2. From the **Filter** dropdown, select **All Container Images for Containers Provider**, and a new dropdown appears. From this dropdown, choose the provider where you enabled the OpenSCAP policy profile.

{% include_relative _topics/compliance_check_timer.md %}

### Creating a Customized OpenSCAP Policy Profile

The built-in OpenSCAP policy profile cannot be edited. However, you can assign *edited* copies of its policies to a new policy profile. This allows you to create a *customized* version of the built-in OpenSCAP policy profile.

To do so, you must first copy the policy that you want to customize:

{% include_relative _topics/copying_a_policy-steps.md %}

You can now edit the copied policy. For instructions on how to edit policies, see:

  - [Editing Basic Information, Scope, and Notes for a Policy](#editing-basic-information-scope-and-notes-for-a-policy)

  - [Editing Policy Condition Assignments](#editing-policy-condition-assignments)

  - [Editing Policy Event Assignments](#editing-policy-event-assignments)

After editing copied policies, you can now add them to a new policy profile. For instructions on how to create a new policy profile (and add policies to it), see [Creating Policy Profiles](#creating-policy-profiles).

Once you have a customized policy profile, you can assign it to a container provider. For instructions, see [Assigning Policy Profiles](#assigning-policy-profiles).
