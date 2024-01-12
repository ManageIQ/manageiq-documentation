---
---

# Encrypted Input Parameters

The parameters passed to a playbook method are often encrypted, either by definition as a “password” data type in the list of input parameters, or by being encrypted elsewhere in a workflow.

## Encrypted Input Parameters

An input parameter can be defined as being of type “password”, for example:

Input Parameters

|                           |                           |                              |
| ------------------------- | ------------------------- |----------------------------- |
| **Input Name**            | **Data Type**             | **Default value**            |
| this                      | string                    | that                         |
| manageiq_validate_certs   | boolean                   | false                        |
| scrambled_this            | password                  | ********                     |

{: caption="Table. Input Paramaters" caption-side="bottom"}


A parameter of this type is decrypted automatically and is available to the playbook as the named extra variable, for example *{{ scrambled_this }}*. Note that an input parameter that has the text string “password” anywhere in the name cannot be passed as a method parameter, and hence cannot appear in the list of method parameters that are returned by the `get_method_parameters` function. The variable will however be available as an extra_var with the password value decrypted correctly.

## Password Defined Earlier in Workflow

A variable encrypted earlier in the workflow (for example when input into a service dialog) can generally be identified as a name prefixed by the string “password::”. This signifies that the object is of type *MiqPassword*.

A password object of this type can be used as an input parameter if it is passed as a *string* data type, also prefixed by the string “password::”. The encrypted value is automatically decrypted and is usable by the playbook as the named extra variable.

For example, to inject the *root_password* value from the previous service dialog by using substitution syntax, an input parameter must be defined with a *string* data type and the following input parameter value:

``` sh
password::${/#miq_provision.miq_provision_request.get_option(:dialog).fetch(password::dialog_option_0_root_password)}
```


See the following table for the illustration of input parameters:

Input Parameters

|                           |                           |                                                                                                                                |
| ------------------------- | ------------------------- |------------------------------------------------------------------------------------------------------------------------------- |
| **Input Name**            | **Data Type**             | **Default value**                                                                                                              |
| manageiq_validate_certs   | boolean                   | false                                                                                                                          |
| cores_per_socket          | string                    | ${/#miq_provision.miq_provision_request.get_option(:dialog).fetch(dialog_option_0_cores_per_socket)}                           |
| root_password             | string                    | password::${/#miq_provision.miq_provision_request.get_option(:dialog).fetch(password::dialog_option_0_root_password)}          |

{: caption="Table. Input Paramaters" caption-side="bottom"}