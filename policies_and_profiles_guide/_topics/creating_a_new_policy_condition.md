#### Creating a New Policy Condition

If you have not already created a condition to use with this policy, you
can create one directly from inside the policy. A condition can contain
two elements: a scope, and an expression. The expression is mandatory,
but the scope is optional. A scope is a general attribute that is
quickly checked before evaluating a more complex expression. You can
create a scope at either the policy or condition level.

1.  Navigate to menu:Control\[Explorer\].

2.  Click the **Policies** accordion, and select the policy you want to
    create a new condition for.

3.  Click ![image](/images/1847.png) (**Configuration**),
    ![image](/images/1862.png) (**Create a new Condition assigned to
    this Policy**).

4.  Type in a **Description** for the condition. It must be unique to
    all the conditions.

    ![image](/images/1864.png)

5.  Click ![image](/images/1851.png) (**Edit this Scope**) in the
    **Scope** area to create a general expression based on a simple
    attribute, such as operating system version. Based on what you
    choose, different options display. **Scope** is optional.

      - Click **Field** to create criteria based on field values.

        ![image](/images/1865.png)

      - Click **Count of** to create criteria based on the count of
        something, such as the number of snapshots for a virtual
        machine, or the number of virtual machines on a host.

        ![image](/images/1866.png)

      - Click **Tag** to create criteria based on tags assigned to your
        resources. For example, you can check the power state of a
        virtual machine or see if it is tagged as production.

        ![image](/images/1867.png)

      - Click **Find** to seek a particular value, and then check a
        property. For example, finding the Admin account and checking
        that it is enabled. Use the following check commands:

          - **Check Any**: The result is true if one or more of the find
            results satisfy the check condition.

          - **Check All**: All of the find results must match for a true
            result.

          - **Check Count**: If the result satisfies the expression in
            check count, the result is true.

            ![image](/images/1868.png)

      - Click **Registry** to create criteria based on registry values.
        For example, you can check if DCOM is enabled on a Windows
        System. Note that this applies only to Windows operating
        systems. Registry is only available if you are creating a VM
        Control Policy.

        ![image](/images/1869.png)

6.  Click ![image](/images/1863.png) (**Commit expression element
    changes**) to add the scope.

7.  Click ![image](/images/1851.png) (**Edit this Expression**) in the
    **Expression** area. Based on what you choose, options display as
    per the choices presented in the **Scope** area detailed above.

8.  Click ![image](/images/1863.png) (**Commit Expression Element
    Changes**) to add the expression.

9.  In **Notes**, type in a detailed explanation of the condition.

10. Click **Add**.

The condition is created and is assigned directly to the policy. Note
that the condition can be assigned to other policies.
