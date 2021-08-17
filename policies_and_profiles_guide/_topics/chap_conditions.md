# Chap Conditions

Conditions are tests that are performed on attributes
of virtual machines. A condition can contain two
elements, a scope, and an expression. The expression
is mandatory, but the scope is optional. A scope is a
general attribute that is quickly checked before
evaluating a more complex expression. For example, you
might use a scope to check the operating system, and
use an expression to check for a specific set of
applications or security patches that only apply to
the operating system referenced in the scope. If no
conditions, scope, or expression, are defined for a
policy, the policy is considered unconditional and
returns a true value.

{% include_relative _topics/creating_a_condition.md %}

{% include_relative _topics/editing_a_condition.md %}

{% include_relative _topics/copying_a_condition.md %}

{% include_relative _topics/deleting_a_condition.md %}
