### Assertions

An **Assertion** is a schema field type that evaluates a Ruby expression
after all `${}` substitutions have been resolved. If the expression evaluates
to a falsy value (`false` or `nil`), the engine raises an
`AssertionFailure` and stops processing that path. Assertions are
typically used as guard conditions to prevent further execution when a
prerequisite is not met.

#### Allowed expression syntax

Assertion expressions are validated against a strict allowlist before
evaluation. Only the following constructs are permitted:

| Construct | Examples |
| --- | --- |
| Boolean literals | `true`, `false` |
| `nil` | `nil` |
| Integer and float literals | `42`, `3.14` |
| String literals (no interpolation) | `'vmware'`, `"vmware"` |
| Symbol literals | `:ok` |
| Comparison operators | `==`, `!=`, `<`, `>`, `<=`, `>=`, `<=>`, `===` |
| Arithmetic operators | `+`, `-`, `*`, `/`, `%` |
| Logical operators and grouping | `&&`, `\|\|`, `!`, `(...)` |
| `Array#include?` with a literal receiver and literal argument | `%w(vmware kvm).include? 'vmware'` |
| `String#include?` with a literal receiver and literal argument | `'foobar'.include?('foo')` |

The substitution mechanism resolves all `${}` tokens to literal values
before the expression reaches the validator, so a typical assertion
compares those resolved literals:

```ruby
# After substitution, the expression seen by the validator might be:
'vmware' == 'vmware'
```

#### Disallowed constructs

The following constructs are rejected and cause an `AssertionFailure`
before any evaluation takes place:

- Bare method calls with no receiver — for example `system('ls')`, `exit!`
- Constant-qualified calls — for example `File.read('/path/to/file')`
- Backtick strings — for example `` `id` ``
- String interpolation — for example `"value is #{some_var}"`
- Assignments of any kind
