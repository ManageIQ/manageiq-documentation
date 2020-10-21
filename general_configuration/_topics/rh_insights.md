## Red Hat Insights

**Red Hat Insights** is a service that uses the collective knowledge of
Red Hat Certified Engineers to help users proactively diagnose systems
and avoid critical downtime situations. Red Hat Insights does this by
having systems periodically check in, similar to Red Hat Subscription
Management.

Red Hat Insights provides an easy to use dashboard that enables system
administrators and IT operations managers to quickly identify key risks
to stability, security, or performance. A glance at the display allows
users to sort by category, view details of the impact and resolution,
and then quickly determine what systems are affected.

**Note:**

  - To use Red Hat Insights, the {{ site.data.product.title_short }} appliance must
    be registered to Red Hat Subscription Management or Satellite
    (version 6.1 or newer).

  - Red Hat Insights is available as a technology preview in this
    release of {{ site.data.product.title }}. For more information on the support
    scope for features marked as technology previews, see [Technology
    Preview Features Support
    Scope](https://access.redhat.com/support/offerings/techpreview/).

The Red Hat Insights plugin has the following options:

  - Actions

  - Overview

  - Rules

  - Inventory

The following sections describe each of these tabs in more detail.

### Overview Tab

The Overview tab provides summary information on the following:

  - Current service release information for Red Hat Insights - view a
    synopsis of the latest updates as well as links to related
    information.

  - Actions Summary - View a assessment of issues, ranked by severity
    affecting your deployment. Click through to view available actions.

  - Newest Systems - Review the most recently registered systems in your
    deployment, and click through to view your inventory.

  - Optimize Your Experience - View a categorization of issues and the
    number of systems affected. Issues fall under performance, security,
    stability, and availability. Click through on reported issues to
    view more information.

### Actions Tab

The Actions tab offers a quick visual indication of the number of
vulnerabilities associated with your systems, as well as the category
and severity risks. A **Featured Topics** section provides detailed
overviews of associated risks facing a system, as well as actions to
take to resolve the issue.

#### Actions Detail

Users can click on a issue type in the Actions tab to view a detailed
list of systems at risk. The action detail page further provides A list
of rules applicable to each vulnerable system. Rules are additionally
assessed for the **Likelihood**, **Impact** and **Total Risk** to
monitored systems.

### Rules Tab

Rules enable easy addition of rules which operate on customer uploaded
archives. It allows developers to focus on a single archive at a time
while being able to process large amounts of data.

The Rules tab provides tools to search and filter for rules and
associated systems. Each rule displays visual information for
**Impact**, **Likelihood**, **Total Risk**, and the assessed **Risk of
Change** as well as linking through to impacted systems. Enable or
disable rules from this view.

#### States

For management purposes, rules may be placed under one of four active
states:

  - **Active** - Rules which have been pushed to the master branch, are
    in prod and the content has been approved. This is the only state
    where the rules are displayed to customers.

  - **Needs Content** - Plugins that the system has identified are in
    our master branch, hits have been found but do not have an entry /
    content written for them.

  - **Inactive** - Once a rule is created from Needs Content, it will by
    default move to Inactive. Inactive can be used as a staging area as
    rules are written or to temporarily remove an active rule from the
    customer’s view if further work needs to be completed. Rules can be
    deleted in this state

  - **Retired** - Plugins or error info entries which are no longer in
    use. - Rules can be deleted in this state

#### Info Listed

You will find the following information available for each rule on the
list

  - **Error Key** - The returned key the plugin provides to alert
    detection.

  - **Plugin** - Name of the plugin located in the master branch, ex:
    plugin.swappiness == plugins/swappiness.py

  - **Description** - The 50 character "title" the customer sees during
    the drill down of issues.

  - **Category** - Security, Stability, Performance.

  - **Severity** - Warn, Error, Info.

  - **Count** - The current amount of hosts the plugin has been detected
    by when the rules last ran.

### Inventory Tab

The Inventory tab helps you discover the issues within your system. This
tab lists the hostname of the system, the system type, the time of last
check in and the status. You can filter the list by using
![image](../images/rh-access-insights-action.png) (**Actions**) for all
systems that require actions and
![image](../images/rh-access-insights-no-action.png) (**No Actions**) for
all systems that are working without issues and require no actions.
Filter the list by **System Status** and **System Health** attributes or
use the search tool to find a system in your inventory.
