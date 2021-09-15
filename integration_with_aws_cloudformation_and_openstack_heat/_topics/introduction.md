## Introduction

AWS CloudFormation enables users to orchestrate the instantiation of
multi-instance services via templates. You can use CloudFormation’s
sample templates or create your own templates to describe the AWS
resources, and any associated dependencies or runtime parameters,
required to run your applications. Similarly, you can configure and
monitor cloud resources in Red Hat Enterprise Linux OpenStack Platform
using the Orchestration service. The Orchestration service provides a
framework through which you can define an instance’s resource parameters
(for example, floating IPs, volumes, or security groups) and properties
(for example, key pairs, image to be used, or flavor) using OpenStack
Heat templates.

Instances deployed using templates through the orchestration service are
known as stacks. A user can author the stack templates, or can upload
them from other sources. {{ site.data.product.title_short }} has enabled CloudFormation and
Heat integration, and now allows you to launch, delete, and update
stacks using the dashboard.
