### Expression Methods

{{ site.data.product.title_short }} additionally provides support for Expression
Methods, that allow you to use advance search filters as Automate
Methods, substituting the user input from Automate Objects. Expression
methods have several distinct advantages, including: running directly in
the worker appliance; removing the overhead of forking a DRb process to
run the Automate Methods; no Ruby code required; and prebuilt for
Dynamic Dialogs.

#### Input Parameters

Expression methods allow for substitution of user input through input
parameters,

| Input Parameter | Explanation                                                                                                                                                                                                                                  |
| --------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **arg**         | The argument used in the expression. Each argument should employ the prefix **arg**. Example: **arg1**: the first argument in the expression; **arg2**: the second argument in the expression; **argn**: the nth argument in the expression. |

##### Optional Input Parameters

<div class="note">

If attributes and distinct are not specified we try to store the result
in a variable called values with a hash consisting of id and name. This
makes it compatible with our existing dynamic dialog result set.

</div>

| Optional Input Parameter | Explanation                                                                                                                                               |
| ------------------------ | --------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **attributes**           | A comma delimited list of attributes to select from the resultant objects. This should me marked as an Array Type in the Input Parameters field.          |
| **distinct**             | A comma delimited list of attributes which are distinct in the resultant objects.This should me marked as an Array Type in the Input Parameters field.    |
| **result\_obj**          | The object where the result data should be stored. (default: current object)                                                                              |
| **result\_attr**         | The name of the attribute which stores the result. (default: values)                                                                                      |
| **result\_type**         | The result type hash or array (default: dialog\_hash which matches to our dynamic dialog hash. Valid values are 'hash', 'dialog\_hash', 'array', 'simple' |
| **on\_empty**            | The method behavior when the search returns an empty list.                                                                                                |
| **error**                | Abort. (default: error)                                                                                                                                   |
| **default**              | The default value in case the result is empty and you select warn.                                                                                        |

{% include_relative _topics/expression_method.md %}
