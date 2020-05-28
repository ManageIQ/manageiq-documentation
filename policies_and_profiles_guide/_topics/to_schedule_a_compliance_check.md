##### Scheduling a Compliance Check

{% include_relative _topics/steps_schedule-compliance-check.md %}

1.  From the **Action** dropdown, select the type of compliance check
    you want to schedule. Depending on the type of analysis you choose,
    you are presented with one of the following group boxes:

      - If you choose **VM Compliance Check**, you are presented with
        **VM Selection** where you can choose to check all VMs, all VMs
        for a specific provider, all VMs for a cluster, all VMs for a
        specific host, a single VM, or you can select VMs using a global
        filter.

        ![image](/images/1939.png)

      - If you choose **Host Compliance Check**, you are presented with
        **Host Selection** where you can choose to analyze all hosts,
        all hosts for a specific provider, all hosts for a cluster, a
        single host, or you can select hosts using a global filter.

      - If you choose **Container Image Compliance Check**, you are
        presented with **Image Selection** where you can choose to
        analyze all images, all images for a specific provider, or a
        single image.

<div class="note">

You can only schedule a host analysis for connected virtual machines,
not repository virtual machines that were discovered through that host.
Since repository virtual machines do not retain a relationship with the
host that discovered them, there is no current way to scan them through
the scheduling feature. The host is shown because it may have connected
virtual machines in the future when the schedule is set to run.

</div>

{% include_relative _topics/compliance_check_timer.md %}
