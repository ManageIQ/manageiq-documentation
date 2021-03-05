#### CRUD Examples

The following examples show the basic CRUD operations (Create, Read,
Update, Delete) using the REST API.

The commands below use basic authentication via the `--user
admin:smartvm` credentials argument. For multiple API calls, it is
recommended to access the {{ site.data.product.title_short }} REST API via token-based
authentication. See [Authentication](#_sect_authentication) for details.

**Show a Collection of Resources.**

Get a collection of services: **GET /api/services**

    curl --user admin:smartvm
        -i -X GET -H "Accept: application/json"
        https://hostname/api/services

**Return a Single Resource.**

Return a single service: **GET /api/services/:id**

    curl --user admin:smartvm
        -i -X GET -H "Accept: application/json"
        https://hostname/api/services/1

**Create a Resource.**

Create a new provider: **POST /api/providers**

    curl --user admin:smartvm
          -i -X POST -H "Accept: application/json"
          -d '{
                "type"      : "ManageIQ::Providers::Redhat::InfraManager",
                "name"      : "RHEVM Provider",
                "hostname"  : "rhevm.local.com",
                "ipaddress" : "192.168.5.1",
                "credentials" : {
                  "userid"   : "admin",
                  "password" : "12345"
                }
          }'
          https://hostname/api/providers

**Update a Resource.**

Update the name of a service: **PUT /api/services/:id**

    curl --user admin:smartvm
          -i -X PUT -H "Accept: application/json"
          -d '{ "name" : "updated service name" }'
          https://hostname/api/services/1

**Delete a Resource.**

Delete a service: **DELETE /api/services/:id**

    curl --user admin:smartvm
        -i -X DELETE -H "Accept: application/json"
        https://hostname/api/services/1
