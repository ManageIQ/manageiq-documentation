## Integration with AWS CloudFormation and OpenStack Heat

{{ site.data.product.title }} integration with AWS CloudFormation and OpenStack Heat
provides an ability to:

  - Inventory all **AWS CloudFormation** and **OpenStack Heat** stacks
    and elements into **CFME’s VMDB**.

  - Model the relationships of instances to their stacks, inclusive of
    the UI. Example, selecting an instance within a region that is
    within a stack, the UI shows this on the standard instance view.

  - Model the stack and its elements in the UI.

**Note:**

When importing a template into {{ site.data.product.title }}, the selected elements are converted according to their type. For example, lists convert to list boxes, and single items convert to text boxes.
