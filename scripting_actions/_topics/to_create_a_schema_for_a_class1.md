### Creating a Schema for a Class

This procedure shows you how to create a schema.

1.  Navigate to menu:Automation\[Automate \> Explorer\], and click the
    class you want to define a schema for.

2.  Click on the **Schema** tab.

3.  Click ![image](../images/1847.png) (**Configuration**), then
    ![image](../images/1851.png) (**Edit selected Schema**).

4.  Click ![image](../images/2366.png) (**Click to add a new field**) to
    create a new field.

5.  Type in a **Name** for the new field.

6.  From **Type**, select **Assertion**, **Attribute**, **Method**,
    **Relationship**, or **State**.

7.  If applicable, select a **Data Type** and set a **Default Value**.

8.  Type in a user friendly **Display Name** and **Description**.

9.  Check **Sub** to enable the substitution syntax of `${}`. Uncheck it
    if you want to use that syntax as a regular string.

10. Fill in **Collect** and **Message** as required. **Collect** is used
    to roll up values from resolved relationships. For example, a
    relationship can resolve to a large object tree. Use **collect** to
    specify how to pull out data from those child objects into the
    current object. If you give **collect** a name value, it will store
    the method result in an attribute of the current object with that
    name.

11. **On Entry**, **On Exit**, **On Error**, **Max Retries**, and **Max
    Time** are fields used mostly for state machines. Leave blank if not
    applicable.

12. Click ![image](../images/1863.png) (**Add this entry**) to confirm the
    fields values.

13. For each new field, repeat steps 4 through 10.

14. When you have created all of the fields, click **Save**.

The class schema is created, and you can now add instances to it.

**Note:**

You may need to edit a class schema to reorder, add, edit, or remove a field. Classes define the order in which fields are processed and you may need to process some items before others.

