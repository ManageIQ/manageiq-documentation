#### Queries

Query all virtual machines:

    GET /api/vms

Query a specific virtual machine:

    GET /api/vms/1386

Query all virtual machines, but return only the name and vendor:

    GET /api/vms?expand=resources&attributes=name,vendor

Query all virtual machines named sample\*, and return the name and
vendor:

    GET /api/vms?expand=resources&attributes=name,vendor&filter[]="name='sample%'"

Query all virtual machines, but only return the first 500 results:

    GET /api/vms?offset=0&limit=500

Query all virtual machines, but return the second 500 results:

    GET /api/vms?offset=500&limit=500

Query the first 1000 virtual machines named test\*, get the name,
vendor, and guid, and sort by name in ascending order:

    GET /api/vms?offset=0&limit=1000&filter[]="name='test%'"&expand=resources&attributes=name,vendor,guid&sort_by=name&sort_order=asc

Query services tagged for the finance department:

    GET /api/services?by_tag=/department/finance

Get the details of tags for the first service:

    GET /api/services/1/tags?expand=resources

Get the details of the first service catalog and related details on the
assigned service templates:

    GET /api/service_catalogs/1?expand=service_templates

    GET /api/service_templates/25/service_requests?expand=resources,request_tasks

Get a specific provision request with expanded details on the associated
provision request tasks:

    GET /api/provision_requests/120?expand=tasks

Query infrastructure provider information:

    GET /api/providers/120?expand=resources,lans,networks,folders
