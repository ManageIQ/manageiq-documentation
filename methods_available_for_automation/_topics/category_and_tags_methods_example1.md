#### Category and Tags Methods Example

In this example, the VMDB is checked to see if the **Department**
category exists. If it does, then a message is logged. If not, the
category is created and a message is logged. Values are then added to
the category.

``` ruby
if $evm.execute('category_exists?', "department")
  $evm.log("info", "Classification department exists")
else
  $evm.log("info", "Classification department doesn't exist, creating category")
  $evm.execute('category_create', :name => "department", :single_value => false, :description => "Department")
  $evm.log("info", "Adding new tag in Department Category")
  $evm.execute('tag_create', "department", :name => "finance", :description => "Finance")
```
