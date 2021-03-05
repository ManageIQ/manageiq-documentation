## Overview

Cloud orchestration is a service that allows you to create, update, and
manage cloud resources and their software components as a single unit
and then deploy them in an automated, repeatable way through a template.
The deployed virtual machine instances and associated collection of
resources are referred to as stack. {{ site.data.product.title_short }} supports a number of
orchestration template types, including Amazon CloudFormation and
OpenStack Heat, that make deploying complex services easier in the
cloud.

In the following example workflow, you will create an orchestration
template, and add it as a catalog item to a service catalog. You can
then create an orchestration stack from the template, and launch the
stack from the catalog using a service dialog.
