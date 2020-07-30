After enabling the required server roles, enable SmartState analysis.
See [Smart State Analysis
Support](https://access.redhat.com/documentation/en-us/red_hat_cloudforms/4.7/html-single/support_matrix/#smart_state_analysis_support)
from the Support Matrix and [Running a SmartState
Analysis](https://access.redhat.com/documentation/en-us/red_hat_cloudforms/4.7/html-single/managing_providers/#running-a-smartstate-analysis)
in the *Managing Providers* guide for more information.

Enabling SmartState analysis is similar to [Assigning the Capacity and Utilization Server Roles](../deployment_planning_guide/index#assigning-the-capacity-and-utilization-server-roles), in that the procedure also involves enabling server roles on a specific server.
To do so:

1.  Click i\*Configuration\*.

2.  Select the server to configure from menu:Settings\[Zone\] in the
    left pane of the appliance.

3.  Navigate to the **Server Roles** list in the menu:Server\[Server
    Control\] section. From there, set the appropriate SmartState roles
    to **ON**. Namely:

    1.  **SmartProxy**

    2.  **SmartState Analysis**

4.  Click **Save**.
