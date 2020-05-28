### Service (service)

| Method                          | Use                                                                         |
| ------------------------------- | --------------------------------------------------------------------------- |
| custom\_keys                    | Returns custom keys                                                         |
| custom\_get(key)                | Gets value for specified custom key                                         |
| custom\_set(attribute, value)   | Sets value for specified custom key                                         |
| display=(display)               | Set display option                                                          |
| group=(group)                   | Sets group that owns the service                                            |
| name=(new\_name)                | Sets name of service                                                        |
| owner=(owner)                   | Sets owner of the service                                                   |
| request\_retire                 | Retire Service immediately                                                  |
| retirement\_warn=(seconds)      | Sets when to send retirement warning                                        |
| retires\_on=(date)              | Sets retirement date                                                        |
| shutdown\_guest                 | Shuts downs guest operating system of the Service                           |
| start                           | Start the Service                                                           |
| stop                            | Stop the Service                                                            |
| suspend                         | Suspend the Service                                                         |
| vms                             | Show all virtual machines associated with this service                      |
| direct\_vms                     | Show virtual machines directly associated with this service                 |
| indirect\_vms                   | Show virtual machines associated with lower level services in the hierarchy |
| root\_service                   | Show the top level service in the hierarchy for the target service          |
| all\_service\_children          | Show all lower level services to the target service in the hierarchy        |
| direct\_service\_children       | Show direct services associated with the target service                     |
| indirect\_service\_children     | Show services associated with lower level services of the target service    |
| parent\_service                 | Show the parent service for the target service                              |
| description=(new\_description)  | Sets the service description                                                |
| remove\_from\_vmdb              | Delete the service from the database                                        |
| dialog\_options                 | Returns all dialog options                                                  |
| get\_dialog\_option(key)        | Returns a specific dialog option specified by key                           |
| set\_dialog\_option(key, value) | Sets value of a dialog option specified by key                              |
