### Initiating Automate from an Event

You can also use a {{ site.data.product.title }} Policy Event to initiate automation.
You can either use the provided Raise Automation Event action or create
a custom automation action. The first case will start in the
`/System/Process` class, but then go to the Event that initiated the
Automate model in the `/System/Process/Event Class`. If you create your
own custom action, it will start from the `/System/Process` class and
then go to the `/System/Process/Request Class` instead.

For example, suppose that you always want the same Automate model to
occur when a virtual machine is created. You would use the Raise
Automation Event Action. There are instances in the
`/System/Process/Event Class` for the following Events that you can
select as part of a Policy:

![image](/images/2373.png)
